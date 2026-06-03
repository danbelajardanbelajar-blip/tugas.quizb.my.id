<?php
$host = "localhost";
$user = "quic1934_zenhkm"; 
$pass = "03Maret1990";     
$db   = "quic1934_tugas";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

mysqli_set_charset($conn, "utf8mb4");
?>