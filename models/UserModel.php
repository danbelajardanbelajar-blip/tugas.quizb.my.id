<?php
/**
 * models/UserModel.php — Model untuk tabel users
 */

require_once __DIR__ . '/BaseModel.php';

class UserModel extends BaseModel
{
    protected string $table = 'users';

    // ------------------------------------------------------------------
    // Auth
    // ------------------------------------------------------------------
    public function findByUsername(string $username): array|false
    {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->execute([$username]);
        return $stmt->fetch();
    }

    // ------------------------------------------------------------------
    // Mahasiswa CRUD
    // ------------------------------------------------------------------
    public function getAllMahasiswa(): array
    {
        $stmt = $this->pdo->query("
            SELECT u.*, k.nama as kelas_nama 
            FROM users u 
            LEFT JOIN kelas k ON u.kelas_id = k.id 
            WHERE u.role = 'mahasiswa' 
            ORDER BY u.nama ASC
        ");
        return $stmt->fetchAll();
    }

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO users (username, password, role, nama, kelas_id)
            VALUES (:username, :password, :role, :nama, :kelas_id)
        ");
        $stmt->execute([
            ':username' => $data['username'],
            ':password' => password_hash($data['password'], PASSWORD_DEFAULT),
            ':role'     => $data['role'] ?? 'mahasiswa',
            ':nama'     => $data['nama'],
            ':kelas_id' => !empty($data['kelas_id']) ? (int)$data['kelas_id'] : null,
        ]);
        return (int) $this->pdo->lastInsertId();
    }

    public function update(int $id, array $data): bool
    {
        $fields = [];
        $params = [];

        if (!empty($data['nama'])) {
            $fields[] = 'nama = ?';
            $params[] = $data['nama'];
        }
        if (array_key_exists('kelas_id', $data)) {
            $fields[] = 'kelas_id = ?';
            $params[] = !empty($data['kelas_id']) ? (int)$data['kelas_id'] : null;
        }
        if (!empty($data['username'])) {
            $fields[] = 'username = ?';
            $params[] = $data['username'];
        }
        if (!empty($data['password'])) {
            $fields[] = 'password = ?';
            $params[] = password_hash($data['password'], PASSWORD_DEFAULT);
        }

        if (empty($fields)) return false;

        $params[] = $id;
        $sql  = 'UPDATE users SET ' . implode(', ', $fields) . ' WHERE id = ?';
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute($params);
    }

    // ------------------------------------------------------------------
    // Bulk import dari Excel (dikirim sebagai JSON array dari frontend)
    // ------------------------------------------------------------------
    public function importBatch(array $rows): int
    {
        // To handle class matching from excel string (e.g., '6B') to ID, we need to map them first
        $stmtKelas = $this->pdo->query("SELECT id, nama FROM kelas");
        $kelasMap = [];
        foreach ($stmtKelas->fetchAll() as $k) {
            $kelasMap[strtolower(trim($k['nama']))] = $k['id'];
        }

        $stmt = $this->pdo->prepare("
            INSERT INTO users (username, password, role, nama, kelas_id)
            VALUES (:username, :password, 'mahasiswa', :nama, :kelas_id)
            ON DUPLICATE KEY UPDATE nama = VALUES(nama), kelas_id = VALUES(kelas_id)
        ");

        $count = 0;
        foreach ($rows as $row) {
            $nim   = trim((string)($row['id'] ?? $row['nim'] ?? ''));
            $nama  = trim((string)($row['nama']  ?? ''));
            $kelasStr = trim((string)($row['kelas'] ?? ''));
            
            $kelasId = null;
            if ($kelasStr !== '' && isset($kelasMap[strtolower($kelasStr)])) {
                $kelasId = $kelasMap[strtolower($kelasStr)];
            }

            if (!$nim || !$nama) continue;

            $stmt->execute([
                ':username' => $nim,
                ':password' => password_hash($nim, PASSWORD_DEFAULT),
                ':nama'     => $nama,
                ':kelas_id' => $kelasId,
            ]);
            $count++;
        }
        return $count;
    }
}
