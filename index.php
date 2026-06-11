<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portal Tugas Perkuliahan — kelola dan kerjakan tugas secara online">
    <title>Portal Tugas Perkuliahan</title>
    <link rel="icon" type="image/png" href="favicon.png">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- SheetJS (Excel parser) -->
    <script src="https://cdn.sheetjs.com/xlsx-0.20.1/package/dist/xlsx.full.min.js"></script>

    <!-- App CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<!-- =========================================================
     APP SHELL
     ========================================================= -->
<div id="app">
    <!-- Rendered by JavaScript -->
    <div id="app-loader" class="app-loader">
        <div class="loader-ring"></div>
        <p>Memuat aplikasi…</p>
    </div>
</div>

<!-- =========================================================
     TOAST CONTAINER
     ========================================================= -->
<div id="toast-container" aria-live="polite"></div>

<!-- =========================================================
     MODAL CONTAINER
     ========================================================= -->
<div id="modal-backdrop" class="modal-backdrop hidden" role="dialog" aria-modal="true">
    <div id="modal-box" class="modal-box"></div>
</div>

<!-- =========================================================
     JAVASCRIPT — MODELS / SERVICES
     ========================================================= -->
<script src="assets/js/api.js"></script>
<script src="assets/js/utils.js"></script>

<!-- =========================================================
     JAVASCRIPT — VIEWS
     ========================================================= -->
<script src="assets/js/views/LoginView.js"></script>
<script src="assets/js/views/admin/MahasiswaView.js"></script>
<script src="assets/js/views/admin/TugasView.js"></script>
<script src="assets/js/views/admin/RekapView.js"></script>
<script src="assets/js/views/mahasiswa/TugasListView.js"></script>
<script src="assets/js/views/mahasiswa/KerjakanView.js"></script>

<!-- =========================================================
     JAVASCRIPT — ROUTER / BOOTSTRAP
     ========================================================= -->
<script src="assets/js/app.js"></script>

</body>
</html>
