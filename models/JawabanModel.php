<?php
/**
 * models/JawabanModel.php
 */

require_once __DIR__ . '/BaseModel.php';

class JawabanModel extends BaseModel
{
    protected string $table = 'jawaban';

    /** Insert atau update jawaban (upsert) */
    public function saveOrUpdate(int $mahasiswaId, int $soalId, string $isi): bool
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO jawaban (mahasiswa_id, soal_id, isi)
            VALUES (:mahasiswa_id, :soal_id, :isi)
            ON DUPLICATE KEY UPDATE isi = VALUES(isi), updated_at = CURRENT_TIMESTAMP
        ");
        return $stmt->execute([
            ':mahasiswa_id' => $mahasiswaId,
            ':soal_id'      => $soalId,
            ':isi'          => $isi,
        ]);
    }

    /** Semua jawaban satu mahasiswa untuk satu tugas */
    public function getByMahasiswaAndTugas(int $mahasiswaId, int $tugasId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT j.*, s.pertanyaan, s.tema_id, s.urutan as soal_urutan, s.jenis, s.opsi,
                   tm.nama AS tema_nama
            FROM jawaban j
            JOIN soal s  ON s.id  = j.soal_id
            JOIN tema tm ON tm.id = s.tema_id
            WHERE j.mahasiswa_id = ? AND tm.tugas_id = ?
            ORDER BY tm.urutan, s.urutan
        ");
        $stmt->execute([$mahasiswaId, $tugasId]);
        return $stmt->fetchAll();
    }

    /** Daftar mahasiswa yang sudah mengerjakan tema tertentu */
    public function getMahasiswaYangMengerjakan(int $temaId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT u.id, u.nama, u.username AS nim, u.kelas,
                   COUNT(j.id)         AS jumlah_jawaban,
                   MAX(j.updated_at)   AS last_submit
            FROM jawaban j
            JOIN users u ON u.id  = j.mahasiswa_id
            JOIN soal  s ON s.id  = j.soal_id
            WHERE s.tema_id = ?
            GROUP BY u.id
            ORDER BY u.nama
        ");
        $stmt->execute([$temaId]);
        return $stmt->fetchAll();
    }

    /** Jawaban satu mahasiswa untuk satu tema */
    public function getJawabanByMahasiswaAndTema(int $mahasiswaId, int $temaId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT j.*, s.pertanyaan, s.urutan, s.jenis, s.opsi
            FROM jawaban j
            JOIN soal s ON s.id = j.soal_id
            WHERE j.mahasiswa_id = ? AND s.tema_id = ?
            ORDER BY s.urutan, s.id
        ");
        $stmt->execute([$mahasiswaId, $temaId]);
        return $stmt->fetchAll();
    }

    /** Progress pengerjaan mahasiswa untuk satu tugas */
    public function getProgress(int $mahasiswaId, int $tugasId): array
    {
        $stmtTotal = $this->pdo->prepare("
            SELECT COUNT(s.id) AS total
            FROM soal s
            JOIN tema tm ON tm.id = s.tema_id
            WHERE tm.tugas_id = ?
        ");
        $stmtTotal->execute([$tugasId]);
        $total = (int) $stmtTotal->fetch()['total'];

        $stmtDone = $this->pdo->prepare("
            SELECT COUNT(j.id) AS answered
            FROM jawaban j
            JOIN soal s  ON s.id  = j.soal_id
            JOIN tema tm ON tm.id = s.tema_id
            WHERE j.mahasiswa_id = ? AND tm.tugas_id = ?
              AND j.isi IS NOT NULL AND j.isi != ''
        ");
        $stmtDone->execute([$mahasiswaId, $tugasId]);
        $answered = (int) $stmtDone->fetch()['answered'];

        return ['total' => $total, 'answered' => $answered];
    }
}
