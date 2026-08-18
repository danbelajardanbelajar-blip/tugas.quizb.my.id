<?php
/**
 * controllers/KomentarController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/KomentarModel.php';

class KomentarController extends BaseController
{
    private KomentarModel $komentarModel;

    public function __construct()
    {
        $this->komentarModel = new KomentarModel();
    }

    public function handle(): void
    {
        $session = $this->requireAuth();
        $action  = $this->param('action', 'list');

        match ($action) {
            'list' => $this->listKomentar($session),
            'send' => $this->sendKomentar($session),
            default => $this->error('Action tidak valid'),
        };
    }

    private function listKomentar(array $session): never
    {
        $temaId = (int) $this->param('tema_id', 0);
        $mahasiswaId = (int) $this->param('mahasiswa_id', 0);

        if ($session['role'] === 'mahasiswa') {
            $mahasiswaId = $session['user_id'];
        }

        if (!$temaId || !$mahasiswaId) {
            $this->error('tema_id dan mahasiswa_id diperlukan');
        }

        // Jika mahasiswa, hanya boleh melihat komentarnya sendiri
        if ($session['role'] === 'mahasiswa' && $session['user_id'] != $mahasiswaId) {
            $this->error('Tidak diizinkan melihat komentar orang lain', 403);
        }

        $data = $this->komentarModel->getKomentar($temaId, $mahasiswaId);
        $this->success($data);
    }

    private function sendKomentar(array $session): never
    {
        if ($this->method() !== 'POST') $this->error('Method not allowed', 405);
        
        $data = $this->getBody();
        $temaId = (int) ($data['tema_id'] ?? 0);
        $mahasiswaId = (int) ($data['mahasiswa_id'] ?? 0);
        $isi = trim((string) ($data['isi'] ?? ''));

        if ($session['role'] === 'mahasiswa') {
            $mahasiswaId = $session['user_id'];
        }

        if (!$temaId || !$mahasiswaId || !$isi) {
            $this->error('tema_id, mahasiswa_id, dan isi komentar diperlukan');
        }

        // Jika mahasiswa, hanya boleh komentar di miliknya sendiri
        if ($session['role'] === 'mahasiswa' && $session['user_id'] != $mahasiswaId) {
            $this->error('Tidak diizinkan', 403);
        }

        if ($this->komentarModel->addKomentar($temaId, $mahasiswaId, $session['user_id'], $isi)) {
            $this->success(null, 'Komentar terkirim');
        } else {
            $this->error('Gagal mengirim komentar');
        }
    }
}
