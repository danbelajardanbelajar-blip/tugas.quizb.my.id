<?php
/**
 * api/komentar.php
 */
require_once __DIR__ . '/../controllers/KomentarController.php';

$controller = new KomentarController();
$controller->handle();
