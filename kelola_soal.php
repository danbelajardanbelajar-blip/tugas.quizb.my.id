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

// Cek apakah kolom tema_id sudah ada di tb_daftar_soal
$temaIdExists = false;
$checkTemaId = $conn->query("SHOW COLUMNS FROM tb_daftar_soal LIKE 'tema_id'");
if ($checkTemaId && $checkTemaId->num_rows > 0) {
    $temaIdExists = true;
}

// Muat semua tema dari tabel tema_masalah
$temaList = [];
$temaRes = $conn->query("SELECT id_tema, kelas, kelompok, nama_tema FROM tema_masalah ORDER BY kelas ASC, kelompok ASC, nama_tema ASC");
if ($temaRes) {
    while ($temaRow = $temaRes->fetch_assoc()) {
        $temaList[] = $temaRow;
    }
}

// PROSES HAPUS JAWABAN MAHASISWA
if (isset($_GET['delete_jawaban'])) {
    $deleteId = intval($_GET['delete_jawaban']);
    if ($conn->query("DELETE FROM tb_soal WHERE id = $deleteId")) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Jawaban mahasiswa berhasil dihapus! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Gagal menghapus jawaban mahasiswa.</div>";
    }
}

// PROSES HAPUS SOAL
if (isset($_GET['delete_soal'])) {
    $deleteSoal = intval($_GET['delete_soal']);
    if ($conn->query("DELETE FROM tb_daftar_soal WHERE id = $deleteSoal")) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Soal berhasil dihapus! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Gagal menghapus soal.</div>";
    }
}

// PROSES TAMBAH TEMA
if (isset($_POST['add_tema'])) {
    $kelas      = mysqli_real_escape_string($conn, trim($_POST['kelas']));
    $kelompok   = mysqli_real_escape_string($conn, trim($_POST['kelompok']));
    $nama_tema  = mysqli_real_escape_string($conn, trim($_POST['nama_tema']));

    if ($kelas === '' || $kelompok === '' || $nama_tema === '') {
        $pesan = "<div class='alert alert-danger'>Semua field tema harus diisi.</div>";
    } else {
        $insert = "INSERT INTO tema_masalah (kelas, kelompok, nama_tema) VALUES ('$kelas', '$kelompok', '$nama_tema')";
        if ($conn->query($insert)) {
            $pesan = "<div class='alert alert-success alert-dismissible fade show'>Tema berhasil ditambahkan! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
        } else {
            $pesan = "<div class='alert alert-danger'>Gagal menambahkan tema: " . htmlspecialchars($conn->error) . "</div>";
        }
    }
}

// PROSES EDIT TEMA
if (isset($_POST['edit_tema'])) {
    $temaId     = intval($_POST['tema_id']);
    $kelas      = mysqli_real_escape_string($conn, trim($_POST['kelas']));
    $kelompok   = mysqli_real_escape_string($conn, trim($_POST['kelompok']));
    $nama_tema  = mysqli_real_escape_string($conn, trim($_POST['nama_tema']));

    if ($kelas === '' || $kelompok === '' || $nama_tema === '') {
        $pesan = "<div class='alert alert-danger'>Semua field tema harus diisi.</div>";
    } else {
        $update = "UPDATE tema_masalah SET kelas = '$kelas', kelompok = '$kelompok', nama_tema = '$nama_tema' WHERE id_tema = $temaId";
        if ($conn->query($update)) {
            $pesan = "<div class='alert alert-success alert-dismissible fade show'>Tema berhasil diperbarui! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
        } else {
            $pesan = "<div class='alert alert-danger'>Gagal memperbarui tema: " . htmlspecialchars($conn->error) . "</div>";
        }
    }
}

// PROSES HAPUS TEMA
if (isset($_GET['delete_tema'])) {
    $deleteTema = intval($_GET['delete_tema']);
    if ($conn->query("DELETE FROM tema_masalah WHERE id_tema = $deleteTema")) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Tema berhasil dihapus! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Gagal menghapus tema.</div>";
    }
}

// PROSES UPDATE SOAL
if (isset($_POST['update_soal'])) {
    $berhasil = true;
    for ($i = 1; $i <= 17; $i++) {
        $teks_baru = mysqli_real_escape_string($conn, $_POST['soal_' . $i]);
        $tema_id = $temaIdExists && isset($_POST['tema_id_' . $i]) ? intval($_POST['tema_id_' . $i]) : null;

        if ($temaIdExists) {
            $query_update = "UPDATE tb_daftar_soal SET teks_soal = '$teks_baru', tema_id = " . ($tema_id !== null ? $tema_id : 'NULL') . " WHERE id = $i";
        } else {
            $query_update = "UPDATE tb_daftar_soal SET teks_soal = '$teks_baru' WHERE id = $i";
        }

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
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold text-success" id="tema-tab" data-bs-toggle="tab" data-bs-target="#tema" type="button" role="tab"><i class="bi bi-tags"></i> Kelola Tema</button>
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
                                        <div class="btn-group" role="group">
                                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalJawaban<?= $r['id']; ?>">Lihat Jawaban</button>
                                            <a href="?delete_jawaban=<?= $r['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Hapus semua jawaban <?= htmlspecialchars($r['nama_mahasiswa'], ENT_QUOTES, 'UTF-8'); ?>?')">Hapus</a>
                                        </div>
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
                            $selectedTemaId = $temaIdExists ? ($s['tema_id'] ?? '') : '';
                        ?>
                            <div class="mb-3 d-flex gap-2 align-items-start">
                                <div class="flex-grow-1">
                                    <label class="form-label fw-bold">Pertanyaan Nomor <?= $s['id']; ?></label>
                                    <?php if ($temaIdExists && count($temaList) > 0) : ?>
                                        <select name="tema_id_<?= $s['id']; ?>" class="form-select mb-2" required>
                                            <option value="">-- Pilih Tema Soal --</option>
                                            <?php foreach ($temaList as $temaOption) : ?>
                                                <option value="<?= $temaOption['id_tema']; ?>" <?= $temaOption['id_tema'] == $selectedTemaId ? 'selected' : ''; ?>>
                                                    <?= htmlspecialchars($temaOption['kelas'] . ' | ' . $temaOption['kelompok'] . ' | ' . $temaOption['nama_tema'], ENT_QUOTES, 'UTF-8'); ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    <?php elseif ($temaIdExists) : ?>
                                        <div class="alert alert-warning p-2">Tidak ada tema tersedia. Tambahkan tema terlebih dahulu.</div>
                                    <?php else : ?>
                                        <div class="alert alert-info p-2">Jalankan script SQL untuk menambahkan kolom tema_id pada tb_daftar_soal agar pertanyaan dapat dikaitkan dengan tema.</div>
                                    <?php endif; ?>
                                    <textarea name="soal_<?= $s['id']; ?>" class="form-control" rows="2" required><?= htmlspecialchars($s['teks_soal']); ?></textarea>
                                </div>
                                <div class="align-self-end">
                                    <a href="?delete_soal=<?= $s['id']; ?>#soal" class="btn btn-danger btn-sm" onclick="return confirm('Hapus soal nomor <?= $s['id']; ?>?')">Delete</a>
                                </div>
                            </div>
                        <?php } ?>
                        <hr>
                        <button type="submit" name="update_soal" class="btn btn-success w-100 py-2 fw-bold">Simpan Perubahan Soal</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- TAB 3: KELOLA TEMA -->
        <div class="tab-pane fade" id="tema" role="tabpanel">
            <div class="card shadow-sm border-success mb-4">
                <div class="card-header bg-success text-white font-weight-bold">Tambah Tema Soal Baru</div>
                <div class="card-body">
                    <form action="" method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Kelas</label>
                            <input type="text" name="kelas" class="form-control" placeholder="Contoh: XII-A" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Kelompok Tema</label>
                            <input type="text" name="kelompok" class="form-control" placeholder="Contoh: Fiqih Bayi" required>
                        </div>
                        <div class="col-md-5">
                            <label class="form-label">Nama Tema</label>
                            <input type="text" name="nama_tema" class="form-control" placeholder="Contoh: Analisis Bayi Tabung" required>
                        </div>
                        <div class="col-12">
                            <button type="submit" name="add_tema" class="btn btn-success">Simpan Tema Baru</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card shadow-sm border-secondary">
                <div class="card-header bg-secondary text-white font-weight-bold">Daftar Tema</div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Kelas</th>
                                    <th>Kelompok</th>
                                    <th>Nama Tema</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $noTema = 1;
                                $query_tema = $conn->query("SELECT * FROM tema_masalah ORDER BY kelas ASC, kelompok ASC, nama_tema ASC");
                                if ($query_tema && $query_tema->num_rows > 0) {
                                    while ($tema = $query_tema->fetch_assoc()) {
                                ?>
                                <tr>
                                    <td class="text-center"><?= $noTema++; ?></td>
                                    <td><?= htmlspecialchars($tema['kelas']); ?></td>
                                    <td><?= htmlspecialchars($tema['kelompok']); ?></td>
                                    <td><?= htmlspecialchars($tema['nama_tema']); ?></td>
                                    <td class="text-center">
                                        <form action="" method="POST" class="d-inline-flex gap-1 align-items-center">
                                            <input type="hidden" name="tema_id" value="<?= $tema['id_tema']; ?>">
                                            <input type="hidden" name="kelas" value="<?= htmlspecialchars($tema['kelas'], ENT_QUOTES, 'UTF-8'); ?>">
                                            <input type="hidden" name="kelompok" value="<?= htmlspecialchars($tema['kelompok'], ENT_QUOTES, 'UTF-8'); ?>">
                                            <input type="hidden" name="nama_tema" value="<?= htmlspecialchars($tema['nama_tema'], ENT_QUOTES, 'UTF-8'); ?>">
                                            <button type="button" class="btn btn-sm btn-warning" onclick="toggleEdit(<?= $tema['id_tema']; ?>)">Edit</button>
                                        </form>
                                        <a href="?delete_tema=<?= $tema['id_tema']; ?>#tema" class="btn btn-sm btn-danger" onclick="return confirm('Hapus tema ini?')">Hapus</a>
                                    </td>
                                </tr>
                                <tr id="editRow<?= $tema['id_tema']; ?>" class="collapse-row" style="display:none;">
                                    <td colspan="5">
                                        <form action="" method="POST" class="row g-3 align-items-end">
                                            <input type="hidden" name="tema_id" value="<?= $tema['id_tema']; ?>">
                                            <div class="col-md-2">
                                                <label class="form-label">Kelas</label>
                                                <input type="text" name="kelas" class="form-control" value="<?= htmlspecialchars($tema['kelas'], ENT_QUOTES, 'UTF-8'); ?>" required>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label">Kelompok</label>
                                                <input type="text" name="kelompok" class="form-control" value="<?= htmlspecialchars($tema['kelompok'], ENT_QUOTES, 'UTF-8'); ?>" required>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="form-label">Nama Tema</label>
                                                <input type="text" name="nama_tema" class="form-control" value="<?= htmlspecialchars($tema['nama_tema'], ENT_QUOTES, 'UTF-8'); ?>" required>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" name="edit_tema" class="btn btn-success w-100">Simpan</button>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                                <?php
                                    }
                                } else {
                                    echo "<tr><td colspan='5' class='text-center py-4 text-muted'>Belum ada tema.</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleEdit(id) {
        var row = document.getElementById('editRow' + id);
        if (!row) return;
        row.style.display = row.style.display === 'table-row' ? 'none' : 'table-row';
    }
</script>
</body>
</html>