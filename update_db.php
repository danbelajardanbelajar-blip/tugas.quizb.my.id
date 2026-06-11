<?php
require 'config/database.php';
$pdo = getDB();
try {
    $sql = file_get_contents('update_schema.sql');
    $pdo->exec($sql);
    echo "Database updated successfully.\n";
} catch (Exception $e) {
    echo "Error updating database: " . $e->getMessage() . "\n";
}
