<?php
/**
 * controllers/TemaController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/TemaModel.php';

class TemaController extends BaseController
{
    private TemaModel $temaModel;

    public function __construct()
    {
        $this->temaModel = new TemaModel();
    }

    public function handle(): void
    {
        $this->requireAuth();

        $id      = (int) $this->param('id', 0);
        $tugasId = (int) $this->param('tugas_id', 0);
        $all     = $this->param('all') !== null;

        match ($this->method()) {
            'GET'    => $tugasId
                            ? $this->getByTugas($tugasId)
                            : ($all ? $this->getAllWithInfo() : $this->error('Parameter diperlukan')),
            'POST'   => $this->create(),
            'PUT'    => $this->updateOne($id),
            'DELETE' => $this->deleteOne($id),
            default  => $this->error('Method not allowed', 405),
        };
    }

    private function getByTugas(int $tugasId): never
    {
        $this->success($this->temaModel->getByTugasId($tugasId));
    }

    private function getAllWithInfo(): never
    {
        $this->success($this->temaModel->getAllWithTugasInfo());
    }

    private function create(): never
    {
        $this->requireRole('admin');
        $data = $this->getBody();
        if (empty($data['tugas_id']) || empty($data['nama'])) {
            $this->error('tugas_id dan nama tema wajib diisi');
        }
        $id = $this->temaModel->create($data);
        $this->success(['id' => $id], 'Tema berhasil ditambahkan');
    }

    private function updateOne(int $id): never
    {
        $this->requireRole('admin');
        if (!$id) $this->error('ID wajib diisi');
        $this->temaModel->update($id, $this->getBody());
        $this->success(null, 'Tema berhasil diperbarui');
    }

    private function deleteOne(int $id): never
    {
        $this->requireRole('admin');
        if (!$id) $this->error('ID wajib diisi');
        $this->temaModel->delete($id);
        $this->success(null, 'Tema berhasil dihapus');
    }
}
