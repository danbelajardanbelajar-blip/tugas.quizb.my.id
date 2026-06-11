<?php
/**
 * install.php — Jalankan SEKALI untuk setup admin default.
 * Akses: http://domain.anda/install.php
 * Hapus file ini setelah berhasil!
 */

require_once __DIR__ . '/config/database.php';

$pdo = getDB();

// Buat admin default (admin / admin123)
$hash = password_hash('admin123', PASSWORD_DEFAULT);

$stmt = $pdo->prepare("
    INSERT INTO users (username, password, role, nama)
    VALUES ('admin', :hash, 'admin', 'Administrator')
    ON DUPLICATE KEY UPDATE password = :hash2
");
$stmt->execute([':hash' => $hash, ':hash2' => $hash]);

echo '<h2>✅ Setup berhasil!</h2>';
echo '<p>Akun admin berhasil dibuat:</p>';
echo '<ul><li>Username: <strong>admin</strong></li><li>Password: <strong>admin123</strong></li></ul>';
echo '<p style="color:red"><strong>⚠️ Hapus file install.php ini sekarang!</strong></p>';
echo '<a href="/">Kembali ke aplikasi</a>';
