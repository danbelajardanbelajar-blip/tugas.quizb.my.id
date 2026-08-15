<?php
/**
 * models/KelasModel.php — Model untuk tabel kelas
 */

require_once __DIR__ . '/BaseModel.php';

class KelasModel extends BaseModel
{
    protected string $table = 'kelas';

    public function getAllKelas(): array
    {
        return $this->findAll("1", [], 'nama ASC');
    }

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO kelas (nama)
            VALUES (:nama)
        ");
        $stmt->execute([
            ':nama' => $data['nama']
        ]);
        return (int) $this->pdo->lastInsertId();
    }

    public function update(int $id, array $data): bool
    {
        if (empty($data['nama'])) return false;

        $stmt = $this->pdo->prepare('UPDATE kelas SET nama = ? WHERE id = ?');
        return $stmt->execute([$data['nama'], $id]);
    }
}
