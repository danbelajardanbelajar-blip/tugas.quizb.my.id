<?php
/**
 * models/TemaModel.php
 */

require_once __DIR__ . '/BaseModel.php';

class TemaModel extends BaseModel
{
    protected string $table = 'tema';

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO tema (tugas_id, nama, urutan)
            VALUES (:tugas_id, :nama, :urutan)
        ");
        $stmt->execute([
            ':tugas_id' => $data['tugas_id'],
            ':nama'     => $data['nama'],
            ':urutan'   => $data['urutan'] ?? 0,
        ]);
        return (int) $this->pdo->lastInsertId();
    }

    public function update(int $id, array $data): bool
    {
        $stmt = $this->pdo->prepare("
            UPDATE tema SET nama = :nama, urutan = :urutan WHERE id = :id
        ");
        return $stmt->execute([
            ':nama'   => $data['nama'],
            ':urutan' => $data['urutan'] ?? 0,
            ':id'     => $id,
        ]);
    }

    public function getByTugasId(int $tugasId): array
    {
        return $this->findAll('tugas_id = ?', [$tugasId], 'urutan, id');
    }

    /** Semua tema beserta info tugas dan jumlah soal (untuk rekap) */
    public function getAllWithTugasInfo(): array
    {
        return $this->pdo->query("
            SELECT tm.*,
                   t.judul   AS tugas_judul,
                   t.deadline,
                   COUNT(s.id) AS soal_count
            FROM tema tm
            JOIN tugas t ON t.id = tm.tugas_id
            LEFT JOIN soal s ON s.tema_id = tm.id
            GROUP BY tm.id
            ORDER BY t.id, tm.urutan, tm.id
        ")->fetchAll();
    }
}
