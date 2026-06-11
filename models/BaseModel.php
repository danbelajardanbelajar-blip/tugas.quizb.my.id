<?php
/**
 * models/BaseModel.php — Kelas dasar semua Model
 */

require_once __DIR__ . '/../config/database.php';

abstract class BaseModel
{
    protected PDO $pdo;
    protected string $table;

    public function __construct()
    {
        $this->pdo = getDB();
    }

    public function findAll(string $where = '', array $params = [], string $orderBy = ''): array
    {
        $sql = "SELECT * FROM `{$this->table}`";
        if ($where)   $sql .= " WHERE $where";
        if ($orderBy) $sql .= " ORDER BY $orderBy";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    public function findById(int $id): array|false
    {
        $stmt = $this->pdo->prepare("SELECT * FROM `{$this->table}` WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM `{$this->table}` WHERE id = ?");
        return $stmt->execute([$id]);
    }
}
