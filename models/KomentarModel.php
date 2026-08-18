<?php
/**
 * models/KomentarModel.php
 */

require_once __DIR__ . '/BaseModel.php';

class KomentarModel extends BaseModel
{
    protected string $table = 'komentar';

    public function __construct()
    {
        parent::__construct();
        $this->migrate();
    }

    /** Auto-migrate table */
    private function migrate(): void
    {
        $this->pdo->exec("
            CREATE TABLE IF NOT EXISTS `komentar` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `tema_id` INT NOT NULL,
                `mahasiswa_id` INT NOT NULL,
                `user_id` INT NOT NULL COMMENT 'Pengirim komentar',
                `isi` TEXT NOT NULL,
                `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (`tema_id`) REFERENCES `tema`(`id`) ON DELETE CASCADE,
                FOREIGN KEY (`mahasiswa_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
                FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ");
    }

    public function getKomentar(int $temaId, int $mahasiswaId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT k.*, u.nama as pengirim_nama, u.role as pengirim_role 
            FROM komentar k
            JOIN users u ON k.user_id = u.id
            WHERE k.tema_id = ? AND k.mahasiswa_id = ?
            ORDER BY k.created_at ASC
        ");
        $stmt->execute([$temaId, $mahasiswaId]);
        return $stmt->fetchAll();
    }

    public function addKomentar(int $temaId, int $mahasiswaId, int $userId, string $isi): bool
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO komentar (tema_id, mahasiswa_id, user_id, isi)
            VALUES (?, ?, ?, ?)
        ");
        return $stmt->execute([$temaId, $mahasiswaId, $userId, $isi]);
    }
}
