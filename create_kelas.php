<?php
require 'config/database.php';
$pdo = getDB();

$sql = "
CREATE TABLE IF NOT EXISTS `kelas` (
    `id`         INT          NOT NULL AUTO_INCREMENT,
    `nama`       VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_nama` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
";

try {
    $pdo->exec($sql);
    echo "Tabel 'kelas' berhasil dibuat.\n";
} catch (Exception $e) {
    echo "Error membuat tabel 'kelas': " . $e->getMessage() . "\n";
}
