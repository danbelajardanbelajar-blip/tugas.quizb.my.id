<?php
/**
 * controllers/MahasiswaController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/UserModel.php';

class MahasiswaController extends BaseController
{
    private UserModel $userModel;

    public function __construct()
    {
        $this->userModel = new UserModel();
    }

    public function handle(): void
    {
        $this->requireRole('admin');

        $action = $this->param('action', '');
        $id     = (int) $this->param('id', 0);

        if ($action === 'import') {
            $this->import();
            return;
        }

        match ($this->method()) {
            'GET'    => $this->getAll(),
            'POST'   => $this->create(),
            'PUT'    => $this->update($id),
            'DELETE' => $this->deleteOne($id),
            default  => $this->error('Method not allowed', 405),
        };
    }

    private function getAll(): never
    {
        $this->success($this->userModel->getAllMahasiswa());
    }

    private function create(): never
    {
        $data  = $this->getBody();
        $nim   = trim($data['nim']   ?? '');
        $nama  = trim($data['nama']  ?? '');
        $kelas = trim($data['kelas'] ?? '');

        if (!$nim || !$nama) $this->error('NIM dan nama wajib diisi');
        if ($this->userModel->findByUsername($nim)) $this->error('NIM sudah terdaftar');

        $id = $this->userModel->create([
            'username' => $nim,
            'password' => $nim,
            'role'     => 'mahasiswa',
            'nama'     => $nama,
            'kelas'    => $kelas,
        ]);
        $this->success(['id' => $id], 'Mahasiswa berhasil ditambahkan');
    }

    private function update(int $id): never
    {
        if (!$id) $this->error('ID wajib diisi');
        $data = $this->getBody();

        // Cek apakah NIM baru sudah dipakai user lain
        if (!empty($data['nim'])) {
            $existing = $this->userModel->findByUsername($data['nim']);
            if ($existing && (int)$existing['id'] !== $id) {
                $this->error('NIM sudah digunakan mahasiswa lain');
            }
        }

        $this->userModel->update($id, [
            'username' => $data['nim']   ?? null,
            'nama'     => $data['nama']  ?? null,
            'kelas'    => $data['kelas'] ?? null,
        ]);
        $this->success(null, 'Data mahasiswa berhasil diperbarui');
    }

    private function deleteOne(int $id): never
    {
        if (!$id) $this->error('ID wajib diisi');
        $this->userModel->delete($id);
        $this->success(null, 'Mahasiswa berhasil dihapus');
    }

    private function import(): never
    {
        if ($this->method() !== 'POST') $this->error('Method not allowed', 405);

        $data     = $this->getBody();
        $students = $data['students'] ?? [];

        if (empty($students)) $this->error('Data mahasiswa kosong');

        $imported = $this->userModel->importBatch($students);
        $this->success(['imported' => $imported], "{$imported} mahasiswa berhasil diimport");
    }
}
