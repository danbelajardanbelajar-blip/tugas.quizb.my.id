<?php
/**
 * controllers/KelasController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/KelasModel.php';

class KelasController extends BaseController
{
    private KelasModel $kelasModel;

    public function __construct()
    {
        parent::__construct();
        $this->requireAdmin(); // Only admin can manage classes
        $this->kelasModel = new KelasModel();
    }

    public function handle()
    {
        $action = $_GET['action'] ?? '';

        try {
            switch ($action) {
                case 'list':
                    $this->listKelas();
                    break;
                case 'create':
                    $this->createKelas();
                    break;
                case 'update':
                    $this->updateKelas();
                    break;
                case 'delete':
                    $this->deleteKelas();
                    break;
                default:
                    $this->jsonResponse(false, 'Aksi tidak valid');
            }
        } catch (Exception $e) {
            $this->jsonResponse(false, 'Terjadi kesalahan: ' . $e->getMessage());
        }
    }

    private function listKelas()
    {
        $data = $this->kelasModel->getAllKelas();
        $this->jsonResponse(true, 'Data kelas', $data);
    }

    private function createKelas()
    {
        $input = $this->getJsonInput();
        if (empty($input['nama'])) {
            $this->jsonResponse(false, 'Nama kelas harus diisi');
        }

        $this->kelasModel->create($input);
        $this->jsonResponse(true, 'Kelas berhasil ditambahkan');
    }

    private function updateKelas()
    {
        $input = $this->getJsonInput();
        $id = $input['id'] ?? 0;
        if (empty($id) || empty($input['nama'])) {
            $this->jsonResponse(false, 'ID dan Nama kelas harus diisi');
        }

        $this->kelasModel->update((int)$id, $input);
        $this->jsonResponse(true, 'Kelas berhasil diperbarui');
    }

    private function deleteKelas()
    {
        $input = $this->getJsonInput();
        $id = $input['id'] ?? 0;
        if (empty($id)) {
            $this->jsonResponse(false, 'ID harus diisi');
        }

        $this->kelasModel->delete((int)$id);
        $this->jsonResponse(true, 'Kelas berhasil dihapus');
    }
}
