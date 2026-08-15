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

$sqlInsert = "
INSERT IGNORE INTO `kelas` (`nama`) VALUES
('6B'),
('6C');
";

try {
    $pdo->exec($sql);
    $pdo->exec($sqlInsert);
    echo "Tabel 'kelas' berhasil dibuat dan diisi data default.\n";
} catch (Exception $e) {
    echo "Error membuat tabel 'kelas': " . $e->getMessage() . "\n";
}
