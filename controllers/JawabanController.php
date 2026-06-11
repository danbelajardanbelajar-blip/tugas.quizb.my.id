<?php
/**
 * controllers/JawabanController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/JawabanModel.php';

class JawabanController extends BaseController
{
    private JawabanModel $jawabanModel;

    public function __construct()
    {
        $this->jawabanModel = new JawabanModel();
    }

    public function handle(): void
    {
        $session = $this->requireAuth();
        $action  = $this->param('action', '');

        match ($action) {
            'rekap-tema'       => $this->rekapTema(),
            'detail-mahasiswa' => $this->detailMahasiswa(),
            'mahasiswa-tugas'  => $this->getMahasiswaTugas($session),
            'submit'           => $this->submit($session),
            'progress'         => $this->getProgress($session),
            default            => $this->error('Action tidak valid'),
        };
    }

    /** Admin: daftar mahasiswa yang mengerjakan satu tema */
    private function rekapTema(): never
    {
        $this->requireRole('admin');
        $temaId = (int) $this->param('tema_id', 0);
        if (!$temaId) $this->error('tema_id diperlukan');
        $this->success($this->jawabanModel->getMahasiswaYangMengerjakan($temaId));
    }

    /** Admin: jawaban satu mahasiswa pada satu tema */
    private function detailMahasiswa(): never
    {
        $this->requireRole('admin');
        $mahasiswaId = (int) $this->param('mahasiswa_id', 0);
        $temaId      = (int) $this->param('tema_id', 0);
        if (!$mahasiswaId || !$temaId) $this->error('mahasiswa_id dan tema_id diperlukan');
        $this->success($this->jawabanModel->getJawabanByMahasiswaAndTema($mahasiswaId, $temaId));
    }

    /** Mahasiswa: ambil semua jawabannya untuk satu tugas */
    private function getMahasiswaTugas(array $session): never
    {
        $tugasId = (int) $this->param('tugas_id', 0);
        if (!$tugasId) $this->error('tugas_id diperlukan');
        $this->success($this->jawabanModel->getByMahasiswaAndTugas($session['user_id'], $tugasId));
    }

    /** Mahasiswa: simpan/update satu jawaban */
    private function submit(array $session): never
    {
        if ($this->method() !== 'POST') $this->error('Method not allowed', 405);
        $data   = $this->getBody();
        $soalId = (int) ($data['soal_id'] ?? $_POST['soal_id'] ?? 0);
        $isi    = (string) ($data['isi'] ?? $_POST['isi'] ?? '');

        if (!$soalId) $this->error('soal_id diperlukan');

        if (!empty($_FILES['file']['name']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
            $uploadDir = __DIR__ . '/../uploads/jawaban/';
            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0755, true);
            }
            $fileName = time() . '_' . preg_replace('/[^a-zA-Z0-9.\-_]/', '', $_FILES['file']['name']);
            $target   = $uploadDir . $fileName;
            if (move_uploaded_file($_FILES['file']['tmp_name'], $target)) {
                $isi = 'uploads/jawaban/' . $fileName;
            } else {
                $this->error('Gagal mengupload file');
            }
        }

        $this->jawabanModel->saveOrUpdate($session['user_id'], $soalId, $isi);
        $this->success(null, 'Jawaban tersimpan');
    }

    /** Mahasiswa: progress pengerjaan (soal selesai / total) */
    private function getProgress(array $session): never
    {
        $tugasId = (int) $this->param('tugas_id', 0);
        if (!$tugasId) $this->error('tugas_id diperlukan');
        $this->success($this->jawabanModel->getProgress($session['user_id'], $tugasId));
    }
}
