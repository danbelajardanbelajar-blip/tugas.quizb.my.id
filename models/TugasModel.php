<?php
/**
 * models/TugasModel.php
 */

require_once __DIR__ . '/BaseModel.php';

class TugasModel extends BaseModel
{
    protected string $table = 'tugas';

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO tugas (judul, deskripsi, deadline)
            VALUES (:judul, :deskripsi, :deadline)
        ");
        $stmt->execute([
            ':judul'     => $data['judul'],
            ':deskripsi' => $data['deskripsi'] ?? null,
            ':deadline'  => $data['deadline']  ?? null,
        ]);
        return (int) $this->pdo->lastInsertId();
    }

    public function update(int $id, array $data): bool
    {
        $stmt = $this->pdo->prepare("
            UPDATE tugas SET judul = :judul, deskripsi = :deskripsi, deadline = :deadline
            WHERE id = :id
        ");
        return $stmt->execute([
            ':judul'     => $data['judul'],
            ':deskripsi' => $data['deskripsi'] ?? null,
            ':deadline'  => $data['deadline']  ?? null,
            ':id'        => $id,
        ]);
    }

    /** Semua tugas dengan jumlah tema */
    public function getAllWithCount(): array
    {
        return $this->pdo->query("
            SELECT t.*,
                   COUNT(DISTINCT tm.id) AS tema_count
            FROM tugas t
            LEFT JOIN tema tm ON tm.tugas_id = t.id
            GROUP BY t.id
            ORDER BY t.created_at DESC
        ")->fetchAll();
    }

    /** Satu tugas lengkap dengan tema dan soal (nested) */
    public function getWithTemaAndSoal(int $id): array|false
    {
        $tugas = $this->findById($id);
        if (!$tugas) return false;

        $stmtTema = $this->pdo->prepare(
            "SELECT * FROM tema WHERE tugas_id = ? ORDER BY urutan, id"
        );
        $stmtTema->execute([$id]);
        $temas = $stmtTema->fetchAll();

        $stmtSoal = $this->pdo->prepare(
            "SELECT * FROM soal WHERE tema_id = ? ORDER BY urutan, id"
        );
        foreach ($temas as &$tema) {
            $stmtSoal->execute([$tema['id']]);
            $tema['soals'] = $stmtSoal->fetchAll();
        }

        $tugas['temas'] = $temas;
        return $tugas;
    }
}
