<?php
session_start();

// Proteksi login (Sesuaikan dengan session admin Anda jika ada)
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login") {
    header("location:login.php");
    exit();
}

// Konfigurasi Database
$host = 'localhost';
$user = 'quic1934_zenhkm';
$pass = '03Maret1990';
$db   = 'quic1934_tugas';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi Database Gagal: " . $conn->connect_error);
}

$pesan = "";

// PROSES UPDATE SOAL
if (isset($_POST['update_soal'])) {
    $berhasil = true;
    for ($i = 1; $i <= 17; $i++) {
        $teks_baru = mysqli_real_escape_string($conn, $_POST['soal_' . $i]);
        $query_update = "UPDATE tb_daftar_soal SET teks_soal = '$teks_baru' WHERE id = $i";
        if (!$conn->query($query_update)) {
            $berhasil = false;
        }
    }
    
    if ($berhasil) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Daftar soal berhasil diperbarui! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Terjadi kesalahan saat mengupdate soal.</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kelola Soal & Jawaban Mahasiswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .jawaban-box { background: #f1f2f6; padding: 10px; border-radius: 5px; margin-bottom: 10px; border-left: 4px solid #3498db;}
        .soal-title { font-weight: bold; color: #2c3e50; font-size: 0.9em;}
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark mb-4 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">Panel Admin - Kelola Soal</a>
        <a href="admin.php" class="btn btn-outline-light btn-sm">Kembali ke Admin</a>
    </div>
</nav>

<div class="container">
    <?= $pesan; ?>

    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active fw-bold" id="jawaban-tab" data-bs-toggle="tab" data-bs-target="#jawaban" type="button" role="tab">Daftar Jawaban Mahasiswa</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold text-primary" id="soal-tab" data-bs-toggle="tab" data-bs-target="#soal" type="button" role="tab"><i class="bi bi-pencil-square"></i> Edit Pertanyaan Soal</button>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        
        <!-- TAB 1: DAFTAR JAWABAN MAHASISWA -->
        <div class="tab-pane fade show active" id="jawaban" role="tabpanel">
            <div class="card shadow-sm border-dark">
                <div class="card-header bg-dark text-white font-weight-bold">Data Rekapitulasi Jawaban</div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Nama / NIM</th>
                                    <th>Waktu Terakhir Disimpan</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                $query_jawaban = $conn->query("SELECT * FROM tb_soal ORDER BY waktu_submit DESC");
                                if ($query_jawaban->num_rows > 0) {
                                    while ($r = $query_jawaban->fetch_assoc()) {
                                ?>
                                <tr>
                                    <td class="text-center"><?= $no++; ?></td>
                                    <td class="fw-bold"><?= htmlspecialchars($r['nama_mahasiswa']); ?></td>
                                    <td><?= date('d M Y - H:i', strtotime($r['waktu_submit'])); ?></td>
                                    <td class="text-center">
                                        <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalJawaban<?= $r['id']; ?>">Lihat Jawaban</button>
                                    </td>
                                </tr>

                                <!-- Modal Detail Jawaban untuk masing-masing Mahasiswa -->
                                <div class="modal fade" id="modalJawaban<?= $r['id']; ?>" tabindex="-1">
                                    <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header bg-primary text-white">
                                                <h5 class="modal-title">Jawaban: <?= htmlspecialchars($r['nama_mahasiswa']); ?></h5>
                                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body">
                                                <?php for($i=1; $i<=17; $i++): ?>
                                                    <div class="jawaban-box">
                                                        <div class="soal-title">Soal <?= $i; ?></div>
                                                        <div><?= nl2br(htmlspecialchars($r['jawaban_'.$i] ?? '-')); ?></div>
                                                    </div>
                                                <?php endfor; ?>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php 
                                    }
                                } else {
                                    echo "<tr><td colspan='4' class='text-center py-4 text-muted'>Belum ada mahasiswa yang mengumpulkan jawaban.</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- TAB 2: EDIT PERTANYAAN SOAL -->
        <div class="tab-pane fade" id="soal" role="tabpanel">
            <div class="card shadow-sm border-primary">
                <div class="card-header bg-primary text-white font-weight-bold">Ubah Teks Pertanyaan</div>
                <div class="card-body">
                    <form action="" method="POST">
                        <?php
                        $query_soal = $conn->query("SELECT * FROM tb_daftar_soal ORDER BY id ASC");
                        while ($s = $query_soal->fetch_assoc()) {
                        ?>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Pertanyaan Nomor <?= $s['id']; ?></label>
                                <textarea name="soal_<?= $s['id']; ?>" class="form-control" rows="2" required><?= htmlspecialchars($s['teks_soal']); ?></textarea>
                            </div>
                        <?php } ?>
                        <hr>
                        <button type="submit" name="update_soal" class="btn btn-success w-100 py-2 fw-bold">Simpan Perubahan Soal</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>