<?php
require_once __DIR__ . '/config/database.php';

try {
    $pdo = getDB();
    
    // 1. Cek apakah kelas "PAI-DN" sudah ada, jika belum buat baru
    $stmt = $pdo->prepare("SELECT id FROM kelas WHERE nama = 'PAI-DN'");
    $stmt->execute();
    $kelasId = $stmt->fetchColumn();
    
    if (!$kelasId) {
        $pdo->exec("INSERT INTO kelas (nama) VALUES ('PAI-DN')");
        $kelasId = $pdo->lastInsertId();
        echo "✅ Kelas baru 'PAI-DN' berhasil ditambahkan ke database (ID: $kelasId).<br>";
    } else {
        echo "ℹ️ Kelas 'PAI-DN' sudah ada (ID: $kelasId).<br>";
    }

    // 2. Cek apakah database sudah migrasi ke kelas_id atau belum
    $stmtCheck = $pdo->query("SHOW COLUMNS FROM users LIKE 'kelas_id'");
    $hasKelasId = $stmtCheck->rowCount() > 0;

    if ($hasKelasId) {
        // Jika sudah migrasi, gunakan kelas_id
        $update = $pdo->prepare("UPDATE users SET kelas_id = ? WHERE kelas_id IS NULL AND role = 'mahasiswa'");
        $update->execute([$kelasId]);
        echo "✅ Berhasil mengisi kelas 'PAI-DN' pada " . $update->rowCount() . " mahasiswa yang kelasnya kosong.";
    } else {
        // Jika belum migrasi (masih pakai kolom VARCHAR kelas lama)
        $update = $pdo->prepare("UPDATE users SET kelas = 'PAI-DN' WHERE (kelas IS NULL OR kelas = '') AND role = 'mahasiswa'");
        $update->execute();
        echo "✅ Berhasil mengisi kelas 'PAI-DN' pada " . $update->rowCount() . " mahasiswa yang kelasnya kosong (menggunakan sistem lama).";
    }
    
} catch (Exception $e) {
    echo "❌ Terjadi kesalahan: " . $e->getMessage();
}
