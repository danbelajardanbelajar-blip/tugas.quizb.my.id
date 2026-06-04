<?php
ob_start(); // Cegah 'headers already sent' agar redirect header() selalu berhasil
session_start();

// Proteksi login - HANYA ADMIN yang bisa akses
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login" || $_SESSION['role'] != 'admin') {
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

// Set charset untuk mendukung teks Arab
$conn->set_charset("utf8mb4");

$pesan = "";

// Cek apakah kolom tema_id sudah ada di tb_daftar_soal
$temaIdExists = false;
$checkTemaId = $conn->query("SHOW COLUMNS FROM tb_daftar_soal LIKE 'tema_id'");
if ($checkTemaId && $checkTemaId->num_rows > 0) {
    $temaIdExists = true;
}

// Pastikan kolom tema_id ada di tb_soal (untuk merekam tema mahasiswa)
$checkTemaIdSoal = $conn->query("SHOW COLUMNS FROM tb_soal LIKE 'tema_id'");
if (!$checkTemaIdSoal || $checkTemaIdSoal->num_rows === 0) {
    $conn->query("ALTER TABLE tb_soal ADD COLUMN tema_id INT(11) DEFAULT NULL AFTER nama_mahasiswa");
}

// Pastikan kolom id punya PRIMARY KEY dan AUTO_INCREMENT agar INSERT berfungsi
$checkPK = $conn->query("SHOW KEYS FROM tb_daftar_soal WHERE Key_name = 'PRIMARY'");
if (!$checkPK || $checkPK->num_rows === 0) {
    // Tidak ada primary key: hapus data id=0 duplikat jika ada, lalu tambah PK + AUTO_INCREMENT
    $conn->query("DELETE FROM tb_daftar_soal WHERE id = 0");
    $conn->query("ALTER TABLE tb_daftar_soal MODIFY id INT(11) NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id)");
} else {
    // Sudah ada PK, pastikan ada AUTO_INCREMENT
    $checkAI = $conn->query("SELECT EXTRA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'tb_daftar_soal' AND COLUMN_NAME = 'id' AND EXTRA LIKE '%auto_increment%'");
    if (!$checkAI || $checkAI->num_rows === 0) {
        $conn->query("ALTER TABLE tb_daftar_soal MODIFY id INT(11) NOT NULL AUTO_INCREMENT");
    }
}

// Muat semua tema dari tabel tema_masalah
$temaList = [];
$temaMap = [];
$temaRes = $conn->query("SELECT id_tema, kelas, kelompok, nama_tema FROM tema_masalah ORDER BY kelas ASC, kelompok ASC, nama_tema ASC");
if (!$temaRes) {
    $pesan = "<div class='alert alert-danger'>Error loading themes: " . htmlspecialchars($conn->error) . "</div>";
} else {
    while ($temaRow = $temaRes->fetch_assoc()) {
        $temaList[] = $temaRow;
        $temaMap[$temaRow['id_tema']] = $temaRow['kelas'] . ' | ' . $temaRow['kelompok'] . ' | ' . $temaRow['nama_tema'];
    }
}


$active_theme_id = null;
if (isset($_GET['theme']) && intval($_GET['theme']) > 0) {
    $active_theme_id = intval($_GET['theme']);
} elseif (isset($_POST['theme']) && intval($_POST['theme']) > 0) {
    $active_theme_id = intval($_POST['theme']);
}
$active_theme_label = $active_theme_id && isset($temaMap[$active_theme_id]) ? $temaMap[$active_theme_id] : null;

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

// PROSES TAMBAH SOAL
if (isset($_POST['add_soal'])) {
    if (!$active_theme_id || !$active_theme_label) {
        $pesan = "<div class='alert alert-danger'>Pilih tema yang valid terlebih dahulu sebelum menambahkan soal.</div>";
    } else {
        $defaultText = mysqli_real_escape_string($conn, 'Tulis pertanyaan baru di sini...');
        $insertSoal = $conn->query("INSERT INTO tb_daftar_soal (teks_soal, tema_id) VALUES ('{$defaultText}', {$active_theme_id})");
        if ($insertSoal) {
            ob_end_clean();
            header("Location: kelola_soal.php?theme={$active_theme_id}");
            exit();
        } else {
            $pesan = "<div class='alert alert-danger'>Gagal menambahkan soal: " . htmlspecialchars($conn->error) . "</div>";
        }
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

    if ($active_theme_id && $active_theme_label) {
        $query_soal_update = $conn->query("SELECT id FROM tb_daftar_soal WHERE tema_id = {$active_theme_id} ORDER BY id ASC");
        if ($query_soal_update && $query_soal_update->num_rows > 0) {
            while ($soal_update = $query_soal_update->fetch_assoc()) {
                $soalId = intval($soal_update['id']);
                $teks_baru = mysqli_real_escape_string($conn, $_POST['soal_' . $soalId] ?? '');
                $query_update = "UPDATE tb_daftar_soal SET teks_soal = '$teks_baru' WHERE id = $soalId";
                if (!$conn->query($query_update)) {
                    $berhasil = false;
                }
            }
        } else {
            $berhasil = false;
        }
    } else {
        $berhasil = false;
    }

    if ($berhasil) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Daftar soal berhasil diperbarui! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Terjadi kesalahan saat mengupdate soal. Pastikan tema masih tersedia dan halaman sudah dimuat ulang.</div>";
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .jawaban-box { background: #f1f2f6; padding: 10px; border-radius: 5px; margin-bottom: 10px; border-left: 4px solid #3498db;}
        .soal-title { font-weight: bold; color: #2c3e50; font-size: 0.9em;}

        /* ====== DUKUNGAN TEKS ARAB (RTL) ====== */
        .jawaban-box div {
            unicode-bidi: plaintext;
            text-align: start;
        }
        .jawaban-box div:has-arabic,
        .jawaban-arabic {
            direction: rtl;
            text-align: right;
            font-family: 'Traditional Arabic', 'Amiri', 'Scheherazade New', Arial, sans-serif;
            font-size: 1.1em;
            line-height: 1.9;
        }
        /* ======================================= */
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
        <?php if ($active_theme_id && $active_theme_label) : ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold text-primary" id="soal-tab" data-bs-toggle="tab" data-bs-target="#soal" type="button" role="tab"><i class="bi bi-pencil-square"></i> Edit Soal</button>
        </li>
        <?php endif; ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link active fw-bold text-success" id="tema-tab" data-bs-toggle="tab" data-bs-target="#tema" type="button" role="tab"><i class="bi bi-tags"></i> Kelola Tema</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold text-warning" id="riwayat-tab" data-bs-toggle="tab" data-bs-target="#riwayat" type="button" role="tab"><i class="bi bi-clock-history"></i> Riwayat Tugas</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold text-dark" id="jawaban-tab" data-bs-toggle="tab" data-bs-target="#jawaban" type="button" role="tab"><i class="bi bi-chat-left-text"></i> Lihat Jawaban</button>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        
        <!-- TAB: EDIT SOAL -->
        <div class="tab-pane fade" id="soal" role="tabpanel">
            <div class="card shadow-sm border-primary">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <span class="font-weight-bold">Edit Soal<?php if ($active_theme_label) echo ' - ' . htmlspecialchars($active_theme_label, ENT_QUOTES, 'UTF-8'); ?></span>
                    <?php if ($active_theme_id) : ?>
                    <form action="kelola_soal.php#soal" method="POST" class="mb-0">
                        <input type="hidden" name="theme" value="<?= $active_theme_id; ?>">
                        <button type="submit" name="add_soal" class="btn btn-light btn-sm">Tambahkan Soal</button>
                    </form>
                    <?php endif; ?>
                </div>
                <div class="card-body">
                    <form action="kelola_soal.php#soal" method="POST">
                        <input type="hidden" name="theme" value="<?= $active_theme_id; ?>">
                        <?php
                        if ($active_theme_id) {
                            $query_soal = $conn->query("SELECT * FROM tb_daftar_soal WHERE tema_id = {$active_theme_id} ORDER BY id ASC");
                        } else {
                            $query_soal = false;
                        }

                        if ($query_soal && $query_soal->num_rows > 0) {
                            $soalNo = 1; // Penomoran urut tampilan (bukan ID database)
                            while ($s = $query_soal->fetch_assoc()) {
                                $selectedTemaId = $temaIdExists ? ($s['tema_id'] ?? '') : '';
                                $selectedTemaLabel = ($temaIdExists && $selectedTemaId && isset($temaMap[$selectedTemaId])) ? htmlspecialchars($temaMap[$selectedTemaId], ENT_QUOTES, 'UTF-8') : 'Tema belum terhubung';
                        ?>
                            <div class="mb-3 d-flex gap-2 align-items-start">
                                <div class="flex-grow-1">
                                    <label class="form-label fw-bold">Pertanyaan Nomor <?= $soalNo; ?></label>
                                    <?php if ($temaIdExists) : ?>
                                        <input type="hidden" name="tema_id_<?= $s['id']; ?>" value="<?= htmlspecialchars($selectedTemaId, ENT_QUOTES, 'UTF-8'); ?>">
                                    <?php endif; ?>
                                    <textarea name="soal_<?= $s['id']; ?>" class="form-control" rows="2" required><?= htmlspecialchars($s['teks_soal']); ?></textarea>
                                </div>
                                <div class="align-self-end">
                                    <a href="?delete_soal=<?= $s['id']; ?>&theme=<?= $active_theme_id; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Hapus soal nomor <?= $soalNo; ?>?')">Delete</a>
                                </div>
                            </div>
                        <?php
                            $soalNo++;
                            }
                        } else {
                            echo '<div class="alert alert-info">Pilih tema dari tab Kelola Tema untuk mulai mengedit soal.</div>';
                        }
                        ?>
                        <hr>
                        <button type="submit" name="update_soal" class="btn btn-success w-100 py-2 fw-bold" <?= $active_theme_id ? '' : 'disabled'; ?>>Simpan Perubahan Soal</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- TAB: KELOLA TEMA -->
        <div class="tab-pane fade show active" id="tema" role="tabpanel">
            <div class="card shadow-sm border-success mb-4">
                <div class="card-header bg-success text-white font-weight-bold">Tambah Tema Soal Baru</div>
                <div class="card-body">
                    <form action="" method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Kelas</label>
                            <input type="text" name="kelas" class="form-control" placeholder="Contoh: 6B" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Kelompok Tema</label>
                            <select name="kelompok" class="form-select" required>
                                <option value="">-- Pilih Kelompok --</option>
                                <option value="Masalah Utama">Masalah Utama</option>
                                <option value="Masalah Kontemporer">Masalah Kontemporer</option>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <label class="form-label">Nama Tema</label>
                            <input type="text" name="nama_tema" class="form-control" placeholder="Contoh: Hukum Bayi Tabung" required>
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
                    <?php if (empty($temaList)): ?>
                        <div class="alert alert-warning m-3">
                            <strong>⚠️ Tidak ada tema ditemukan!</strong><br>
                            Database query berhasil tetapi tabel <code>tema_masalah</code> kosong.<br>
                            Silakan tambahkan tema baru di form di atas.
                        </div>
                    <?php else: ?>
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
                                        <div class="d-flex flex-wrap gap-2 justify-content-center">
                                            <form action="" method="POST" class="m-0">
                                                <input type="hidden" name="tema_id" value="<?= $tema['id_tema']; ?>">
                                                <input type="hidden" name="kelas" value="<?= htmlspecialchars($tema['kelas'], ENT_QUOTES, 'UTF-8'); ?>">
                                                <input type="hidden" name="kelompok" value="<?= htmlspecialchars($tema['kelompok'], ENT_QUOTES, 'UTF-8'); ?>">
                                                <input type="hidden" name="nama_tema" value="<?= htmlspecialchars($tema['nama_tema'], ENT_QUOTES, 'UTF-8'); ?>">
                                                <button type="button" class="btn btn-sm btn-warning" onclick="toggleEdit(<?= $tema['id_tema']; ?>)">Edit</button>
                                            </form>
                                            <a href="kelola_soal.php?theme=<?= $tema['id_tema']; ?>#soal" class="btn btn-sm btn-info">Edit Soal</a>
                                            <a href="?delete_tema=<?= $tema['id_tema']; ?>#tema" class="btn btn-sm btn-danger" onclick="return confirm('Hapus tema ini?')">Hapus</a>
                                        </div>
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
                                                <select name="kelompok" class="form-select" required>
                                                    <option value="Masalah Utama" <?= $tema['kelompok'] === 'Masalah Utama' ? 'selected' : ''; ?>>Masalah Utama</option>
                                                    <option value="Masalah Kontemporer" <?= $tema['kelompok'] === 'Masalah Kontemporer' ? 'selected' : ''; ?>>Masalah Kontemporer</option>
                                                </select>
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
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <!-- TAB 4: RIWAYAT TUGAS USER -->
        <div class="tab-pane fade" id="riwayat" role="tabpanel">
            <div class="card shadow-sm border-warning mb-3">
                <div class="card-header bg-warning text-dark fw-bold">
                    <i class="bi bi-clock-history"></i> Riwayat Pengumpulan Tugas (File Upload)
                </div>
                <div class="card-body p-2">
                    <!-- Filter -->
                    <form method="GET" class="row g-2 mb-3">
                        <input type="hidden" name="tab" value="riwayat">
                        <div class="col-md-3">
                            <select name="f_kelas" class="form-select form-select-sm">
                                <option value="">-- Semua Kelas --</option>
                                <?php
                                $kelasOpts = $conn->query("SELECT DISTINCT kelas FROM user WHERE kelas IS NOT NULL AND kelas != '' ORDER BY kelas ASC");
                                $fKelas = $_GET['f_kelas'] ?? '';
                                if ($kelasOpts) while ($ko = $kelasOpts->fetch_assoc()):
                                ?>
                                <option value="<?= htmlspecialchars($ko['kelas']); ?>" <?= $fKelas === $ko['kelas'] ? 'selected' : ''; ?>><?= htmlspecialchars($ko['kelas']); ?></option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select name="f_type" class="form-select form-select-sm">
                                <option value="">-- Semua Tipe --</option>
                                <?php
                                $typeOpts = $conn->query("SELECT DISTINCT type_tugas FROM tugas WHERE type_tugas IS NOT NULL ORDER BY type_tugas ASC");
                                $fType = $_GET['f_type'] ?? '';
                                if ($typeOpts) while ($to = $typeOpts->fetch_assoc()):
                                ?>
                                <option value="<?= htmlspecialchars($to['type_tugas']); ?>" <?= $fType === $to['type_tugas'] ? 'selected' : ''; ?>><?= htmlspecialchars($to['type_tugas']); ?></option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="text" name="f_search" class="form-control form-control-sm" placeholder="Cari nama / NIM / tema..." value="<?= htmlspecialchars($_GET['f_search'] ?? ''); ?>">
                        </div>
                        <div class="col-md-2 d-flex gap-1">
                            <button type="submit" class="btn btn-warning btn-sm w-100">Filter</button>
                            <a href="kelola_soal.php#riwayat" class="btn btn-outline-secondary btn-sm">Reset</a>
                        </div>
                    </form>

                    <?php
                    // Build query riwayat tugas
                    $fKelas  = mysqli_real_escape_string($conn, $_GET['f_kelas'] ?? '');
                    $fType   = mysqli_real_escape_string($conn, $_GET['f_type'] ?? '');
                    $fSearch = mysqli_real_escape_string($conn, $_GET['f_search'] ?? '');

                    $whereRiwayat = [];
                    if ($fKelas !== '')  $whereRiwayat[] = "u.kelas = '$fKelas'";
                    if ($fType !== '')   $whereRiwayat[] = "t.type_tugas = '$fType'";
                    if ($fSearch !== '') $whereRiwayat[] = "(u.nama_lengkap LIKE '%$fSearch%' OR t.username LIKE '%$fSearch%' OR t.tema_masalah LIKE '%$fSearch%')";
                    $whereSQL = $whereRiwayat ? 'WHERE ' . implode(' AND ', $whereRiwayat) : '';

                    $queryRiwayat = $conn->query("
                        SELECT t.*, u.nama_lengkap, u.kelas AS kelas_user
                        FROM tugas t
                        LEFT JOIN user u ON u.username = t.username
                        $whereSQL
                        ORDER BY t.stamp DESC
                    ");
                    ?>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-sm mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Nama / NIM</th>
                                    <th>Kelas</th>
                                    <th>Tema Masalah</th>
                                    <th>Tipe Tugas</th>
                                    <th>File</th>
                                    <th>Waktu</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                            if ($queryRiwayat && $queryRiwayat->num_rows > 0):
                                $noR = 1;
                                while ($rw = $queryRiwayat->fetch_assoc()):
                                    $namaLengkap = $rw['nama_lengkap'] ?: $rw['username'];
                                    $fileExt = strtolower(pathinfo($rw['file_upload'], PATHINFO_EXTENSION));
                                    $badgeClass = match($fileExt) {
                                        'pdf' => 'bg-danger',
                                        'docx', 'doc' => 'bg-primary',
                                        'xlsx', 'xls' => 'bg-success',
                                        'png', 'jpg', 'jpeg' => 'bg-info',
                                        default => 'bg-secondary'
                                    };
                            ?>
                                <tr>
                                    <td class="text-center"><?= $noR++; ?></td>
                                    <td>
                                        <span class="fw-bold"><?= htmlspecialchars($namaLengkap); ?></span><br>
                                        <small class="text-muted"><?= htmlspecialchars($rw['username']); ?></small>
                                    </td>
                                    <td><small><?= htmlspecialchars($rw['kelas_user'] ?? $rw['kelas'] ?? '-'); ?></small></td>
                                    <td><small><?= htmlspecialchars($rw['tema_masalah'] ?? '-'); ?></small></td>
                                    <td><span class="badge bg-secondary"><?= htmlspecialchars($rw['type_tugas'] ?? '-'); ?></span></td>
                                    <td>
                                        <span class="badge <?= $badgeClass; ?>"><?= strtoupper($fileExt); ?></span>
                                        <a href="uploads/<?= htmlspecialchars($rw['file_upload']); ?>" target="_blank" class="ms-1 text-decoration-none small">
                                            <?= htmlspecialchars(substr($rw['file_upload'], 11)); // hapus prefix timestamp ?>
                                        </a>
                                    </td>
                                    <td><small><?= date('d M Y H:i', strtotime($rw['stamp'])); ?></small></td>
                                </tr>
                            <?php
                                endwhile;
                            else:
                            ?>
                                <tr><td colspan="7" class="text-center py-4 text-muted">Belum ada data riwayat tugas.</td></tr>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                    <?php if ($queryRiwayat): ?>
                        <div class="text-end text-muted small mt-2 pe-2">Total: <?= $queryRiwayat->num_rows; ?> entri</div>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <!-- TAB: LIHAT JAWABAN MAHASISWA -->
        <div class="tab-pane fade" id="jawaban" role="tabpanel">
            <?php
            // Pre-fetch soal per tema untuk modal
            $soalPerTema = [];
            $resSoalAll = $conn->query("SELECT tema_id, teks_soal FROM tb_daftar_soal ORDER BY tema_id ASC, id ASC");
            if ($resSoalAll) {
                while ($rowSoal = $resSoalAll->fetch_assoc()) {
                    $soalPerTema[$rowSoal['tema_id']][] = $rowSoal['teks_soal'];
                }
            }

            $query_jawaban = $conn->query("
                SELECT ts.*, u.nama_lengkap, u.kelas AS kelas_user,
                       tm.nama_tema, tm.kelompok AS kelompok_tema, tm.kelas AS kelas_tema
                FROM tb_soal ts
                LEFT JOIN user u ON u.username = ts.nama_mahasiswa
                LEFT JOIN tema_masalah tm ON tm.id_tema = ts.tema_id
                ORDER BY ts.waktu_submit DESC
            ");
            if ($query_jawaban === false) {
                $query_jawaban = $conn->query("SELECT * FROM tb_soal ORDER BY waktu_submit DESC");
            }
            ?>
            <div class="card shadow-sm border-dark">
                <div class="card-header bg-dark text-white fw-bold d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-chat-left-text"></i> Data Rekapitulasi Jawaban</span>
                    <?php if ($query_jawaban): ?>
                        <span class="badge bg-secondary"><?= $query_jawaban->num_rows; ?> mahasiswa</span>
                    <?php endif; ?>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Nama / NIM</th>
                                    <th>Tema</th>
                                    <th>Waktu Simpan</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                            $modalBuf = '';
                            $noJ = 1;
                            if ($query_jawaban && $query_jawaban->num_rows > 0):
                                while ($r = $query_jawaban->fetch_assoc()):
                                    $namaLengkap  = $r['nama_lengkap'] ?: $r['nama_mahasiswa'];
                                    $temaLabel    = $r['nama_tema'] ? htmlspecialchars($r['nama_tema']) : '<span class="text-muted fst-italic">Tidak tercatat</span>';
                                    $temaKelompok = $r['kelompok_tema'] ?? '';
                                    $temaKelas    = $r['kelas_tema'] ?? '';
                                    $soalList     = ($r['tema_id'] && isset($soalPerTema[$r['tema_id']])) ? $soalPerTema[$r['tema_id']] : [];
                            ?>
                                <tr>
                                    <td class="text-center"><?= $noJ++; ?></td>
                                    <td>
                                        <span class="fw-bold"><?= htmlspecialchars($namaLengkap); ?></span><br>
                                        <small class="text-muted"><?= htmlspecialchars($r['nama_mahasiswa']); ?></small>
                                        <?php if ($r['kelas_user']): ?>
                                            <small class="badge bg-secondary"><?= htmlspecialchars($r['kelas_user']); ?></small>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?= $temaLabel; ?>
                                        <?php if ($temaKelompok || $temaKelas): ?>
                                            <br><small class="text-muted"><?= htmlspecialchars("$temaKelas $temaKelompok"); ?></small>
                                        <?php endif; ?>
                                    </td>
                                    <td><small><?= date('d M Y - H:i', strtotime($r['waktu_submit'])); ?></small></td>
                                    <td class="text-center">
                                        <div class="btn-group" role="group">
                                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mJawaban<?= $r['id']; ?>">
                                                <i class="bi bi-eye"></i> Lihat
                                            </button>
                                            <a href="?delete_jawaban=<?= $r['id']; ?>#jawaban" class="btn btn-danger btn-sm"
                                               onclick="return confirm('Hapus jawaban <?= htmlspecialchars($namaLengkap, ENT_QUOTES, 'UTF-8'); ?>?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                                    // Buffer modal — JANGAN taruh di dalam <tbody>
                                    ob_start(); ?>
                                <div class="modal fade" id="mJawaban<?= $r['id']; ?>" tabindex="-1">
                                    <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header bg-dark text-white">
                                                <h5 class="modal-title">
                                                    <i class="bi bi-person-circle"></i>
                                                    <?= htmlspecialchars($namaLengkap); ?>
                                                    <small class="fw-normal opacity-75 fs-6">(<?= htmlspecialchars($r['nama_mahasiswa']); ?>)</small>
                                                </h5>
                                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body">
                                                <?php if ($r['nama_tema']): ?>
                                                    <div class="alert alert-info py-2 mb-3">
                                                        <strong>Tema:</strong> <?= htmlspecialchars($r['nama_tema']); ?>
                                                        <?php if ($temaKelompok || $temaKelas): ?>
                                                            &nbsp;·&nbsp;<small><?= htmlspecialchars("Kelas $temaKelas · $temaKelompok"); ?></small>
                                                        <?php endif; ?>
                                                    </div>
                                                <?php endif; ?>
                                                <?php for ($i = 1; $i <= 17; $i++):
                                                    $jawaban  = $r['jawaban_' . $i] ?? '';
                                                    $soalTeks = $soalList[$i - 1] ?? null;
                                                    if ($jawaban === '' && $soalTeks === null) continue;
                                                ?>
                                                    <div class="jawaban-box">
                                                        <div class="soal-title">
                                                            <?= $soalTeks ? $i . '. ' . htmlspecialchars($soalTeks) : 'Pertanyaan ' . $i; ?>
                                                        </div>
                                                        <div><?= $jawaban !== '' ? nl2br(htmlspecialchars($jawaban)) : '<em class="text-muted">Belum dijawab</em>'; ?></div>
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
                                    $modalBuf .= ob_get_clean();
                                endwhile;
                            else: ?>
                                <tr><td colspan="5" class="text-center py-4 text-muted">Belum ada mahasiswa yang mengumpulkan jawaban.</td></tr>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Modal dikeluarkan di luar tabel agar HTML valid -->
            <?= $modalBuf; ?>
        </div>

    </div><!-- end tab-content -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // ============================================================
    // DUKUNGAN TEKS ARAB - AUTO DETEKSI RTL (di modal jawaban)
    // ============================================================
    const arabicRegex = /[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]/;

    function applyArabicRTL() {
        document.querySelectorAll('.jawaban-box div:not(.soal-title)').forEach(function(el) {
            if (arabicRegex.test(el.textContent)) {
                el.classList.add('jawaban-arabic');
            }
        });
    }

    // Jalankan saat modal dibuka
    document.addEventListener('show.bs.modal', function() {
        setTimeout(applyArabicRTL, 50);
    });

    function toggleEdit(id) {
        var row = document.getElementById('editRow' + id);
        if (!row) return;
        row.style.display = row.style.display === 'table-row' ? 'none' : 'table-row';
    }

    function showTab(tabKey) {
        var tabEl = document.querySelector('#' + tabKey + '-tab');
        if (!tabEl) return;
        var tab = new bootstrap.Tab(tabEl);
        tab.show();
        window.location.hash = tabKey;
    }

    document.addEventListener('DOMContentLoaded', function() {
        var hash = window.location.hash.substring(1);
        var urlParams = new URLSearchParams(window.location.search);
        if (hash && ['soal','tema','riwayat','jawaban'].includes(hash)) {
            var tabEl = document.querySelector('#' + hash + '-tab');
            if (tabEl) new bootstrap.Tab(tabEl).show();
        } else if (urlParams.get('tab') === 'riwayat') {
            var tabEl = document.querySelector('#riwayat-tab');
            if (tabEl) new bootstrap.Tab(tabEl).show();
        } else if (urlParams.get('theme')) {
            var tabEl = document.querySelector('#soal-tab');
            if (tabEl) new bootstrap.Tab(tabEl).show();
        }
    });
</script>
</body>
</html>