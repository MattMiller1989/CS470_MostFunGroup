-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: earthquake_data
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `earthquake`
--

DROP TABLE IF EXISTS `earthquake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earthquake` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `mag` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earthquake`
--

LOCK TABLES `earthquake` WRITE;
/*!40000 ALTER TABLE `earthquake` DISABLE KEYS */;
INSERT INTO `earthquake` VALUES (1,'2020-11-10 10:04:44',-18.0047,-174.943,4.6),(2,'2020-11-10 09:19:28',-12.7841,45.5457,4.8),(3,'2020-11-10 04:41:51',12.2105,140.26,4.8),(4,'2020-11-10 01:51:54',12.1646,140.113,4.8),(5,'2020-11-10 00:52:33',-6.3022,104.066,5),(6,'2020-11-09 23:18:25',35.4249,45.0833,4.8),(7,'2020-11-09 16:45:33',-3.7939,153.343,5.5),(8,'2020-11-09 15:22:57',0.8805,125.277,4.5),(9,'2020-11-09 07:42:42',-52.3669,160.862,4.6),(10,'2020-11-09 06:11:24',-3.5136,131.313,4.5),(11,'2020-11-09 03:18:20',15.6702,-103.652,4.5),(12,'2020-11-08 16:37:28',-3.5093,135.484,4.5),(13,'2020-11-08 13:29:23',52.946,142.784,4.6),(14,'2020-11-08 12:19:02',37.3731,71.937,4.6),(15,'2020-11-08 12:08:09',-46.659,42.3237,4.7),(16,'2020-11-08 10:46:03',-5.7191,-76.6854,4.7),(17,'2020-11-08 06:31:15',0.9512,-28.2147,5.1),(18,'2020-11-08 04:56:03',-20.7062,-70.8608,4.6),(19,'2020-11-08 03:34:29',-27.7808,-71.1478,4.7),(20,'2020-11-08 02:59:38',32.3478,141.633,4.6),(21,'2020-11-08 01:23:27',13.8292,-91.2238,4.5),(22,'2020-11-08 00:39:04',-11.6348,164.99,5.3),(23,'2020-11-07 22:47:31',-35.245,54.1304,4.8),(24,'2020-11-07 21:30:44',32.4574,141.87,5.2),(25,'2020-11-07 20:37:28',-5.0925,152.969,4.9),(26,'2020-11-07 17:17:05',-20.8809,-176.655,4.9),(27,'2020-11-07 12:56:04',-62.283,-58.3277,4.7),(28,'2020-11-07 12:23:12',61.5218,-149.91,5),(29,'2020-11-07 12:15:42',51.3766,-179.05,4.7),(30,'2020-11-07 09:27:05',-15.2741,-173.561,6.1),(31,'2020-11-07 08:06:55',32.3975,141.569,4.8),(32,'2020-11-07 05:43:18',15.1948,-104.412,4.5),(33,'2020-11-07 05:19:04',8.0438,-83.0057,4.7),(34,'2020-11-07 01:10:32',25.6893,143.627,5.8),(35,'2020-11-07 00:23:30',28.3169,104.992,4.6),(36,'2020-11-06 23:49:18',-62.2779,-58.0593,6),(37,'2020-11-06 23:41:47',-1.9522,119.332,4.9),(38,'2020-11-06 17:16:54',40.9118,143.353,5.2),(39,'2020-11-06 16:50:53',-21.1693,-68.0364,4.7),(40,'2020-11-06 16:14:28',40.9427,143.346,4.6),(41,'2020-11-06 09:17:07',40.9587,143.181,4.9),(42,'2020-11-06 09:05:27',54.0373,-159.657,4.5),(43,'2020-11-06 08:56:39',40.9928,143.25,5.5),(44,'2020-11-06 07:38:55',40.1506,71.6484,5.2),(45,'2020-11-06 06:20:08',-7.4682,128.401,5.2),(46,'2020-11-06 01:40:18',23.1417,122.055,4.8),(47,'2020-11-06 01:39:37',10.6585,-86.4583,4.6),(48,'2020-11-05 22:16:27',39.9258,23.9866,4.9),(49,'2020-11-05 21:57:04',-6.5998,146.965,5.2),(50,'2020-11-05 18:36:14',22.6465,121.358,4.9),(51,'2020-11-05 16:17:45',54.5049,-165.33,4.5),(52,'2020-11-05 12:56:33',54.1803,-159.801,5.1),(53,'2020-11-05 10:39:30',31.8773,49.063,4.7),(54,'2020-11-05 03:34:11',-23.5257,-114.875,4.8),(55,'2020-11-05 03:01:32',49.6532,108.792,4.9),(56,'2020-11-05 00:32:03',-7.4358,126.094,4.7),(57,'2020-11-04 22:21:50',-7.4116,106.105,5),(58,'2020-11-04 18:47:33',14.868,-61.5296,4.5),(59,'2020-11-04 18:27:51',9.9776,126.022,5),(60,'2020-11-04 17:51:56',40.1872,48.4078,4.5),(61,'2020-11-04 12:28:43',-35.5486,-103.951,5.3),(62,'2020-11-04 12:23:46',53.578,-164.819,5),(63,'2020-11-04 09:38:13',-17.7126,-178.361,4.5),(64,'2020-11-04 06:20:50',-62.2887,-58.1289,4.7),(65,'2020-11-04 03:27:24',52.5913,-162.587,4.9),(66,'2020-11-04 02:54:51',-34.9779,-107.59,4.9),(67,'2020-11-04 01:35:33',-55.884,-27.0226,5.2),(68,'2020-11-03 23:07:55',-23.9117,-179.895,4.5),(69,'2020-11-03 20:22:23',71.4096,-3.5463,4.9),(70,'2020-11-03 19:47:34',-44.446,-79.7722,4.8),(71,'2020-11-03 19:05:45',-3.2297,-104.799,4.5),(72,'2020-11-03 18:17:46',-17.9283,168.384,4.9),(73,'2020-11-03 17:59:06',21.1062,121.741,4.6),(74,'2020-11-03 16:52:29',0.1745,97.7686,4.8),(75,'2020-11-03 15:20:15',16.1104,145.403,4.6),(76,'2020-11-03 15:18:59',14.9071,147.213,4.8),(77,'2020-11-03 15:02:25',-62.3213,-58.1524,4.7);
/*!40000 ALTER TABLE `earthquake` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-15 16:36:20