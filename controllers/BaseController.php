<?php
/**
 * controllers/BaseController.php
 */

abstract class BaseController
{
    // ----------------------------------------------------------------
    // HTTP / JSON helpers
    // ----------------------------------------------------------------
    protected function json(array $data, int $code = 200): never
    {
        http_response_code($code);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    protected function success(mixed $data = null, string $message = 'Berhasil'): never
    {
        $this->json(['success' => true, 'message' => $message, 'data' => $data]);
    }

    protected function error(string $message = 'Error', int $code = 400): never
    {
        $this->json(['success' => false, 'message' => $message], $code);
    }

    // ----------------------------------------------------------------
    // Auth helpers
    // ----------------------------------------------------------------
    protected function startSession(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    protected function requireAuth(): array
    {
        $this->startSession();
        if (empty($_SESSION['user_id'])) {
            $this->error('Anda harus login terlebih dahulu', 401);
        }
        return $_SESSION;
    }

    protected function requireRole(string $role): array
    {
        $session = $this->requireAuth();
        if ($session['role'] !== $role) {
            $this->error('Akses ditolak', 403);
        }
        return $session;
    }

    // ----------------------------------------------------------------
    // Request helpers
    // ----------------------------------------------------------------
    protected function getBody(): array
    {
        $raw = file_get_contents('php://input');
        return json_decode($raw, true) ?? [];
    }

    protected function method(): string
    {
        return $_SERVER['REQUEST_METHOD'];
    }

    protected function param(string $key, mixed $default = null): mixed
    {
        return $_GET[$key] ?? $default;
    }
}
