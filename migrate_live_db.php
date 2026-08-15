<?php
require_once __DIR__ . '/config/database.php';

try {
    $pdo = getDB();
    
    // 1. Add kelas_id column
    $pdo->exec("ALTER TABLE `users` ADD `kelas_id` INT(11) NULL AFTER `nama`");
    echo "Column kelas_id added.\n";
    
    // 2. Map existing classes to ID
    $stmt = $pdo->query("SELECT id, nama FROM kelas");
    $classes = $stmt->fetchAll(PDO::FETCH_KEY_PAIR);
    
    foreach ($classes as $id => $nama) {
        $updateStmt = $pdo->prepare("UPDATE `users` SET `kelas_id` = ? WHERE `kelas` = ?");
        $updateStmt->execute([$id, $nama]);
        echo "Mapped class '$nama' to ID $id for " . $updateStmt->rowCount() . " users.\n";
    }
    
    // 3. Drop old kelas column
    $pdo->exec("ALTER TABLE `users` DROP COLUMN `kelas`");
    echo "Old column 'kelas' dropped.\n";
    
    // 4. Add foreign key constraint
    $pdo->exec("ALTER TABLE `users` ADD CONSTRAINT `fk_users_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas`(`id`) ON DELETE SET NULL");
    echo "Foreign key constraint added.\n";
    
    echo "Migration completed successfully!\n";
    
} catch (Exception $e) {
    echo "Error during migration: " . $e->getMessage() . "\n";
}
