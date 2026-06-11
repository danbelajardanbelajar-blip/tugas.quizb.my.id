<?php
require_once __DIR__ . '/common.php';
require_once __DIR__ . '/../controllers/AuthController.php';
(new AuthController())->handle();
