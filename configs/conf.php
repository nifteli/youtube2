<?php
$hostname = 'localhost';
$port = '3306';
$database = 'youtube';
$username = 'root';
$password = '';

$minPasswordLength=5;
$defaultLang="az";
$limit = 28;
$langs = array("az","en","ru");
$langIds = array("az"=>5,"en"=>19,"ru"=>67);

define('DB_DSN',"mysql:host=$hostname;dbname=$database");
define('DB_USER', $username);     // Your MySQL username
define('DB_PASSWORD', ''); // ...and password
define('DB_DATABASE', $database); // ...and password

define('ABSPATH', './');
// Form settings
$SERVER_HOST = "";        // the host name
$SELF_PATH = "";    // the web path to the project without http
$CODE_PATH = "./classes/php/PHPSuito/"; // the physical path to the php files
?>