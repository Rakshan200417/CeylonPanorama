<?php
$servername = $_ENV['MYSQLHOST'] ?? getenv('MYSQLHOST');
$username   = $_ENV['MYSQLUSER'] ?? getenv('MYSQLUSER');
$password   = $_ENV['MYSQLPASSWORD'] ?? getenv('MYSQLPASSWORD');
$dbname     = $_ENV['MYSQLDATABASE'] ?? getenv('MYSQLDATABASE');
$port       = (int)($_ENV['MYSQLPORT'] ?? getenv('MYSQLPORT'));

if (!$servername) {
    die("Environment variables not loaded. MYSQLHOST is empty.");
}

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
