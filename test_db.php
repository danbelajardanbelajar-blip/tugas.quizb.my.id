<?php
session_start();
include 'koneksi.php';

echo "<h2>Database Debug Info</h2>";
echo "<p><strong>Session Status:</strong> " . (isset($_SESSION['status']) ? $_SESSION['status'] : 'NOT SET') . "</p>";
echo "<p><strong>Session Role:</strong> " . (isset($_SESSION['role']) ? $_SESSION['role'] : 'NOT SET') . "</p>";
echo "<p><strong>Session Username:</strong> " . (isset($_SESSION['username']) ? $_SESSION['username'] : 'NOT SET') . "</p>";

echo "<hr>";

// Test tema_masalah table
echo "<h3>1. Tabel: tema_masalah</h3>";
$result = $conn->query("SELECT COUNT(*) as count FROM tema_masalah");
if ($result) {
    $row = $result->fetch_assoc();
    echo "<p>✅ Query berhasil | Jumlah data: <strong>" . $row['count'] . "</strong></p>";
    
    if ($row['count'] > 0) {
        echo "<p><strong>Data Sample:</strong></p>";
        $sample = $conn->query("SELECT * FROM tema_masalah LIMIT 5");
        echo "<table border='1' cellpadding='5'><tr><th>ID</th><th>Kelas</th><th>Kelompok</th><th>Nama Tema</th></tr>";
        while ($s = $sample->fetch_assoc()) {
            echo "<tr><td>{$s['id_tema']}</td><td>{$s['kelas']}</td><td>{$s['kelompok']}</td><td>{$s['nama_tema']}</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p>❌ Query gagal: " . $conn->error . "</p>";
}

echo "<hr>";

// Test tb_soal table
echo "<h3>2. Tabel: tb_soal</h3>";
$result = $conn->query("SELECT COUNT(*) as count FROM tb_soal");
if ($result) {
    $row = $result->fetch_assoc();
    echo "<p>✅ Query berhasil | Jumlah data: <strong>" . $row['count'] . "</strong></p>";
    
    if ($row['count'] > 0) {
        echo "<p><strong>Data Sample (5 terakhir):</strong></p>";
        $sample = $conn->query("SELECT id, nama_mahasiswa, waktu_submit FROM tb_soal ORDER BY id DESC LIMIT 5");
        echo "<table border='1' cellpadding='5'><tr><th>ID</th><th>NIM Mahasiswa</th><th>Waktu Submit</th></tr>";
        while ($s = $sample->fetch_assoc()) {
            echo "<tr><td>{$s['id']}</td><td>{$s['nama_mahasiswa']}</td><td>{$s['waktu_submit']}</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p>❌ Query gagal: " . $conn->error . "</p>";
}

echo "<hr>";

// Test tb_daftar_soal table
echo "<h3>3. Tabel: tb_daftar_soal</h3>";
$result = $conn->query("SELECT COUNT(*) as count FROM tb_daftar_soal");
if ($result) {
    $row = $result->fetch_assoc();
    echo "<p>✅ Query berhasil | Jumlah data: <strong>" . $row['count'] . "</strong></p>";
    
    if ($row['count'] > 0) {
        echo "<p><strong>Data Sample:</strong></p>";
        $sample = $conn->query("SELECT id, tema_id, LEFT(teks_soal, 50) as teks FROM tb_daftar_soal LIMIT 5");
        echo "<table border='1' cellpadding='5'><tr><th>ID</th><th>Tema ID</th><th>Teks Soal (preview)</th></tr>";
        while ($s = $sample->fetch_assoc()) {
            echo "<tr><td>{$s['id']}</td><td>{$s['tema_id']}</td><td>{$s['teks']}...</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p>❌ Query gagal: " . $conn->error . "</p>";
}

echo "<hr>";

// Test user table
echo "<h3>4. Tabel: user</h3>";
$result = $conn->query("SELECT COUNT(*) as count FROM user");
if ($result) {
    $row = $result->fetch_assoc();
    echo "<p>✅ Query berhasil | Jumlah data: <strong>" . $row['count'] . "</strong></p>";
    
    if ($row['count'] > 0) {
        echo "<p><strong>Data Sample (5 user pertama):</strong></p>";
        $sample = $conn->query("SELECT username, nama_lengkap, kelas, role FROM user LIMIT 5");
        echo "<table border='1' cellpadding='5'><tr><th>Username</th><th>Nama</th><th>Kelas</th><th>Role</th></tr>";
        while ($s = $sample->fetch_assoc()) {
            echo "<tr><td>{$s['username']}</td><td>{$s['nama_lengkap']}</td><td>{$s['kelas']}</td><td>{$s['role']}</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p>❌ Query gagal: " . $conn->error . "</p>";
}

echo "<hr>";
echo "<p><a href='kelola_soal.php'>Kembali ke kelola_soal.php</a></p>";
?>
