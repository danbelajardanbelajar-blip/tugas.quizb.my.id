<?php
/**
 * controllers/SoalController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/SoalModel.php';

class SoalController extends BaseController
{
    private SoalModel $soalModel;

    public function __construct()
    {
        $this->soalModel = new SoalModel();
    }

    public function handle(): void
    {
        $this->requireAuth();

        $id     = (int) $this->param('id', 0);
        $temaId = (int) $this->param('tema_id', 0);

        match ($this->method()) {
            'GET'    => $temaId ? $this->getByTema($temaId) : $this->error('tema_id diperlukan'),
            'POST'   => $this->create(),
            'PUT'    => $this->updateOne($id),
            'DELETE' => $this->deleteOne($id),
            default  => $this->error('Method not allowed', 405),
        };
    }

    private function getByTema(int $temaId): never
    {
        $this->success($this->soalModel->getByTemaId($temaId));
    }

    private function create(): never
    {
        $this->requireRole('admin');
        $data = $this->getBody();
        if (empty($data['tema_id']) || empty($data['pertanyaan'])) {
            $this->error('tema_id dan pertanyaan wajib diisi');
        }
        $id = $this->soalModel->create($data);
        $this->success(['id' => $id], 'Soal berhasil ditambahkan');
    }

    private function updateOne(int $id): never
    {
        $this->requireRole('admin');
        if (!$id) $this->error('ID wajib diisi');
        $this->soalModel->update($id, $this->getBody());
        $this->success(null, 'Soal berhasil diperbarui');
    }

    private function deleteOne(int $id): never
    {
        $this->requireRole('admin');
        if (!$id) $this->error('ID wajib diisi');
        $this->soalModel->delete($id);
        $this->success(null, 'Soal berhasil dihapus');
    }
}
