<?php
/**
 * controllers/AuthController.php
 */

require_once __DIR__ . '/BaseController.php';
require_once __DIR__ . '/../models/UserModel.php';

class AuthController extends BaseController
{
    private UserModel $userModel;

    public function __construct()
    {
        $this->userModel = new UserModel();
    }

    public function handle(): void
    {
        $action = $this->param('action', '');

        match ($action) {
            'login'  => $this->login(),
            'logout' => $this->logout(),
            'check'  => $this->check(),
            default  => $this->error('Action tidak valid'),
        };
    }

    private function login(): never
    {
        if ($this->method() !== 'POST') $this->error('Method not allowed', 405);

        $body     = $this->getBody();
        $username = trim($body['username'] ?? '');
        $password = $body['password'] ?? '';

        if (!$username || !$password) {
            $this->error('Username dan password wajib diisi');
        }

        $user = $this->userModel->findByUsername($username);

        if (!$user || !password_verify($password, $user['password'])) {
            $this->error('Username atau password salah');
        }

        $this->startSession();
        $_SESSION['user_id']  = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role']     = $user['role'];
        $_SESSION['nama']     = $user['nama'];

        $this->success([
            'id'       => $user['id'],
            'username' => $user['username'],
            'role'     => $user['role'],
            'nama'     => $user['nama'],
        ], 'Login berhasil');
    }

    private function logout(): never
    {
        $this->startSession();
        session_unset();
        session_destroy();
        $this->success(null, 'Logout berhasil');
    }

    private function check(): never
    {
        $this->startSession();
        if (!empty($_SESSION['user_id'])) {
            $this->success([
                'id'       => $_SESSION['user_id'],
                'username' => $_SESSION['username'],
                'role'     => $_SESSION['role'],
                'nama'     => $_SESSION['nama'],
            ]);
        }
        $this->error('Belum login', 401);
    }
}
