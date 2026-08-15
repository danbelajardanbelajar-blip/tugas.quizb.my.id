<?php
require_once __DIR__ . '/config/database.php';

try {
    $pdo = getDB();
    
    // 1. Cek apakah kelas_id sudah ada di tabel tugas
    $stmtCheck = $pdo->query("SHOW COLUMNS FROM tugas LIKE 'kelas_id'");
    $hasKelasId = $stmtCheck->rowCount() > 0;
    
    if (!$hasKelasId) {
        $pdo->exec("ALTER TABLE `tugas` ADD `kelas_id` INT(11) NULL DEFAULT NULL AFTER `deadline`");
        echo "Kolom kelas_id berhasil ditambahkan ke tabel tugas.<br>";
        
        $pdo->exec("ALTER TABLE `tugas` ADD CONSTRAINT `fk_tugas_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas`(`id`) ON DELETE SET NULL");
        echo "Foreign key constraint fk_tugas_kelas berhasil ditambahkan.<br>";
    } else {
        echo "Tabel tugas sudah memiliki kolom kelas_id.<br>";
    }
    
} catch (Exception $e) {
    echo "Terjadi kesalahan: " . $e->getMessage();
}
