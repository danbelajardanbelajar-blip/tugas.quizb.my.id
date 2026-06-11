<?php
/**
 * models/SoalModel.php
 */

require_once __DIR__ . '/BaseModel.php';

class SoalModel extends BaseModel
{
    protected string $table = 'soal';

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO soal (tema_id, pertanyaan, urutan)
            VALUES (:tema_id, :pertanyaan, :urutan)
        ");
        $stmt->execute([
            ':tema_id'    => $data['tema_id'],
            ':pertanyaan' => $data['pertanyaan'],
            ':urutan'     => $data['urutan'] ?? 0,
        ]);
        return (int) $this->pdo->lastInsertId();
    }

    public function update(int $id, array $data): bool
    {
        $stmt = $this->pdo->prepare("
            UPDATE soal SET pertanyaan = :pertanyaan, urutan = :urutan WHERE id = :id
        ");
        return $stmt->execute([
            ':pertanyaan' => $data['pertanyaan'],
            ':urutan'     => $data['urutan'] ?? 0,
            ':id'         => $id,
        ]);
    }

    public function getByTemaId(int $temaId): array
    {
        return $this->findAll('tema_id = ?', [$temaId], 'urutan, id');
    }
}
