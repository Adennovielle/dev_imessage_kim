<?php 

$date_format = date("Y/m/d");

echo $date_format;


session_start();
echo '<pre>';
var_dump($_SESSION);
echo '</pre>';

echo $_SESSION['appname'];

echo password_hash("nopassword", PASSWORD_DEFAULT);;