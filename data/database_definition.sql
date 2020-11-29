/* This file contains the SQL to create the database from scratch. You will need to modify the GRANT
   privileges line to include your username/host (if not using root), and you will also need to modify
   the location of the files for the earthquake and city CSVs. */

CREATE DATABASE earthquake_data;
GRANT ALL PRIVILEGES ON earthquake_data.* TO 'username'@'localhost';
USE earthquake_data;

CREATE TABLE earthquake (
    id        INT NOT NULL auto_increment,
    time      DATETIME NOT NULL,
    latitude  FLOAT,
    longitude FLOAT,
    mag       FLOAT,

    PRIMARY KEY(id)
);

CREATE TABLE damage (
    earthquake_id INT NOT NULL,
    costs INT unsigned DEFAULT NULL,
    injuries INT unsigned DEFAULT NULL,
    fatalities INT unsigned DEFAULT NULL,
    tsunami BOOLEAN DEFAULT NULL,

    FOREIGN KEY (earthquake_id) REFERENCES earthquake(id)
);

CREATE TABLE city (
    id         INT NOT NULL auto_increment,
    name       VARCHAR(50) NOT NULL,
    latitude   FLOAT,
    longitude  FLOAT,
    country    VARCHAR(50),
    population INT DEFAULT NULL,

    PRIMARY KEY(id)
);

DROP PROCEDURE IF EXISTS GenerateRandomDamage;

DELIMITER $$

CREATE PROCEDURE GenerateRandomDamage(
	IN e_id INT,
    IN magnitude FLOAT,
    IN earthquakeLatitude FLOAT,
    IN earthquakeLongitude FLOAT
)

BEGIN
    DECLARE radius FLOAT DEFAULT 0;
    DECLARE populationInRadius INT DEFAULT 0;
    DECLARE economicDamage INT DEFAULT 0;
    DECLARE injuries INT DEFAULT 0;
    DECLARE fatalities INT DEFAULT 0;

    /* There is a 75% chance that there is no damage if an earthquake
     * has a magnitude of smaller than 5. */
    IF magnitude >= 5 || RAND() > 0.75 THEN
        /* Calculate the radius of the earthquake. */
        SET radius = 2 * magnitude * magnitude;

        /* Find the total population within the radius generated. Earthquakes in
         * areas with a lot of people means more injuries, bigger buildings, etc. */
        SELECT Sum(population)
            INTO populationInRadius
            FROM city
            WHERE St_distance_sphere(Point(earthquakeLongitude, earthquakeLatitude),
                Point(longitude, latitude)) * .000621371192 < radius;

        IF(populationInRadius IS NULL) THEN
            SET populationInRadius = 0;
        END IF;

        /* Generate the damage. 5^magnitude * Constant * Population Bias * Skew
         * Generate random number between 1 and 32 and pass through LOG().
         * This results in a left skewed dataset with a low of 0% (log1)
         * and a high of 150% (log32).
         * You can not combine the constants or you will get overflow/rounding problems. */
        SET economicDamage = POWER(5, magnitude) * 10    * populationInRadius / 1000000 * LOG(10, RAND()*31+1);
        SET injuries = POWER(5, magnitude)       / 1000  * populationInRadius / 1000000 * LOG(10, RAND()*31+1);
        SET fatalities = POWER(5, magnitude)     / 20000 * populationInRadius / 1000000 * LOG(10, RAND()*31+1);

        /* Return the values. */
        INSERT INTO damage (earthquake_id, costs, injuries, fatalities) VALUES (e_id, economicDamage, injuries, fatalities);
    END IF;
END$$

DROP TRIGGER IF EXISTS ProduceDamage$$ 

CREATE TRIGGER ProduceDamage
AFTER INSERT
ON `earthquake` FOR EACH ROW
BEGIN
	CALL GenerateRandomDamage(
        NEW.id,
        NEW.mag,
        NEW.latitude,
        NEW.longitude
	);
END $$

    
DELIMITER ;

-- Matt
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/eqdata.csv'
INTO TABLE earthquake
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(time, latitude, longitude, mag);

/* Zach
LOAD DATA LOCAL INFILE '/var/lib/mysql/cs470_earthquakes/eqdata.csv'
INTO TABLE earthquake
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(time, latitude, longitude, mag); */

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/worldcities2.csv'
INTO TABLE city
-- CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;