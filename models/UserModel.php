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
        return $this->findAll("role = 'mahasiswa'", [], 'nama ASC');
    }

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO users (username, password, role, nama, kelas)
            VALUES (:username, :password, :role, :nama, :kelas)
        ");
        $stmt->execute([
            ':username' => $data['username'],
            ':password' => password_hash($data['password'], PASSWORD_DEFAULT),
            ':role'     => $data['role'] ?? 'mahasiswa',
            ':nama'     => $data['nama'],
            ':kelas'    => $data['kelas'] ?? null,
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
        if (array_key_exists('kelas', $data)) {
            $fields[] = 'kelas = ?';
            $params[] = $data['kelas'];
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
        $stmt = $this->pdo->prepare("
            INSERT INTO users (username, password, role, nama, kelas)
            VALUES (:username, :password, 'mahasiswa', :nama, :kelas)
            ON DUPLICATE KEY UPDATE nama = VALUES(nama), kelas = VALUES(kelas)
        ");

        $count = 0;
        foreach ($rows as $row) {
            $nim   = trim((string)($row['id'] ?? $row['nim'] ?? ''));
            $nama  = trim((string)($row['nama']  ?? ''));
            $kelas = trim((string)($row['kelas'] ?? ''));

            if (!$nim || !$nama) continue;

            $stmt->execute([
                ':username' => $nim,
                ':password' => password_hash($nim, PASSWORD_DEFAULT),
                ':nama'     => $nama,
                ':kelas'    => $kelas,
            ]);
            $count++;
        }
        return $count;
    }
}
