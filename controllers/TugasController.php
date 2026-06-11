<?php
/**
 * controllers/TugasController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/TugasModel.php';

class TugasController extends BaseController
{
    private TugasModel $tugasModel;

    public function __construct()
    {
        $this->tugasModel = new TugasModel();
    }

    public function handle(): void
    {
        $this->requireAuth();

        $id     = (int) $this->param('id', 0);
        $detail = $this->param('detail') !== null;

        match ($this->method()) {
            'GET'    => $id
                            ? ($detail ? $this->getDetail($id) : $this->getOne($id))
                            : $this->getAll(),
            'POST'   => $this->create(),
            'PUT'    => $this->updateOne($id),
            'DELETE' => $this->deleteOne($id),
            default  => $this->error('Method not allowed', 405),
        };
    }

    private function getAll(): never
    {
        $this->success($this->tugasModel->getAllWithCount());
    }

    private function getOne(int $id): never
    {
        $tugas = $this->tugasModel->findById($id);
        if (!$tugas) $this->error('Tugas tidak ditemukan', 404);
        $this->success($tugas);
    }

    private function getDetail(int $id): never
    {
        $tugas = $this->tugasModel->getWithTemaAndSoal($id);
        if (!$tugas) $this->error('Tugas tidak ditemukan', 404);
        $this->success($tugas);
    }

    private function create(): never
    {
        $this->requireRole('admin');
        $data = $this->getBody();
        if (empty($data['judul'])) $this->error('Judul tugas wajib diisi');
        $id = $this->tugasModel->create($data);
        $this->success(['id' => $id], 'Tugas berhasil dibuat');
    }

    private function updateOne(int $id): never
    {
        $this->requireRole('admin');
        if (!$id) $this->error('ID wajib diisi');
        $data = $this->getBody();
        $this->tugasModel->update($id, $data);
        $this->success(null, 'Tugas berhasil diperbarui');
    }

    private function deleteOne(int $id): never
    {
        $this->requireRole('admin');
        if (!$id) $this->error('ID wajib diisi');
        $this->tugasModel->delete($id);
        $this->success(null, 'Tugas berhasil dihapus');
    }
}
