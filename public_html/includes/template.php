<!DOCTYPE html>
<html lang="eng">
    <head>
        <meta charset ="utf-8">
        <link rel="stylesheet" href="css/main.css">
        <title>EarthquakeDB: <?php print($title); ?></title>
    </head>

    <body>
        <h1><a href="index.php">CS470 MFG Earthquake DB</a></h1>
        <div class="nav_menu">
            <a href="earthquakes.php">Earthquakes</a>
            <a href="">Tsunamis</a>
            <a href="">Clusters</a>
            <a href="">Insurance Policies</a>
            <a href="search.php">Search</a>
           <input type="text" placeholder="Search by city name...">
        </div>

        <?php print($content); ?>

    </body>
</html>
