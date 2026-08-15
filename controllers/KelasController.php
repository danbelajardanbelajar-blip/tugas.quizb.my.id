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
        $this->kelasModel = new KelasModel();
    }

    public function handle(): void
    {
        $this->requireRole('admin'); // Only admin can manage classes

        $action = $this->param('action', '');
        
        // Either route by 'action' query param or by HTTP method.
        // For backwards compatibility with the JS I wrote, I'll keep checking action 
        // if JS was hitting '?action=list', '?action=create', etc.
        
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
                    $this->error('Aksi tidak valid');
            }
        } catch (Throwable $e) {
            $this->error($e->getMessage() . ' in ' . $e->getFile() . ':' . $e->getLine(), 500);
        }
    }

    private function listKelas(): never
    {
        $data = $this->kelasModel->getAllKelas();
        $this->success($data, 'Data kelas');
    }

    private function createKelas(): never
    {
        $input = $this->getBody();
        if (empty($input['nama'])) {
            $this->error('Nama kelas harus diisi');
        }

        $this->kelasModel->create($input);
        $this->success(null, 'Kelas berhasil ditambahkan');
    }

    private function updateKelas(): never
    {
        $input = $this->getBody();
        $id = $input['id'] ?? 0;
        if (empty($id) || empty($input['nama'])) {
            $this->error('ID dan Nama kelas harus diisi');
        }

        $this->kelasModel->update((int)$id, $input);
        $this->success(null, 'Kelas berhasil diperbarui');
    }

    private function deleteKelas(): never
    {
        $input = $this->getBody();
        $id = $input['id'] ?? 0;
        if (empty($id)) {
            $this->error('ID harus diisi');
        }

        $this->kelasModel->delete((int)$id);
        $this->success(null, 'Kelas berhasil dihapus');
    }
}
