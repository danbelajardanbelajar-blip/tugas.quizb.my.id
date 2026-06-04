<?php
ob_start();
session_start();

if (!isset($_SESSION['status']) || $_SESSION['status'] != "login" || $_SESSION['role'] != 'admin') {
    header("location:login.php");
    exit();
}

$host = 'localhost';
$user = 'quic1934_zenhkm';
$pass = '03Maret1990';
$db   = 'quic1934_tugas';

// Nonaktifkan exception mode agar query gagal tidak crash halaman
mysqli_report(MYSQLI_REPORT_OFF);

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi Database Gagal: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

$pesan = "";

// Pastikan AUTO_INCREMENT pada tb_daftar_soal (dibungkus try-catch agar aman)
try {
    $checkPK = $conn->query("SHOW KEYS FROM tb_daftar_soal WHERE Key_name = 'PRIMARY'");
    if (!$checkPK || $checkPK->num_rows === 0) {
        $conn->query("DELETE FROM tb_daftar_soal WHERE id = 0");
        $conn->query("ALTER TABLE tb_daftar_soal MODIFY id INT(11) NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id)");
    } else {
        $checkAI = $conn->query("SELECT EXTRA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'tb_daftar_soal' AND COLUMN_NAME = 'id' AND EXTRA LIKE '%auto_increment%'");
        if (!$checkAI || $checkAI->num_rows === 0) {
            $conn->query("ALTER TABLE tb_daftar_soal MODIFY id INT(11) NOT NULL AUTO_INCREMENT");
        }
    }
} catch (Exception $e) {
    // Abaikan error ALTER TABLE, tidak kritis
}

// Muat semua tema
$temaList = [];
$temaMap  = [];
$temaRes  = $conn->query("SELECT id_tema, kelas, kelompok, nama_tema FROM tema_masalah ORDER BY kelas ASC, kelompok ASC, nama_tema ASC");
if ($temaRes) {
    while ($temaRow = $temaRes->fetch_assoc()) {
        $temaList[] = $temaRow;
        $temaMap[$temaRow['id_tema']] = $temaRow['kelas'] . ' | ' . $temaRow['kelompok'] . ' | ' . $temaRow['nama_tema'];
    }
}

// Ambil semua soal per tema (untuk modal jawaban)
$soalPerTema = [];
$resSoal = $conn->query("SELECT tema_id, teks_soal FROM tb_daftar_soal ORDER BY tema_id ASC, id ASC");
if ($resSoal) {
    while ($rs = $resSoal->fetch_assoc()) {
        $soalPerTema[$rs['tema_id']][] = $rs['teks_soal'];
    }
}

// Ambil semua jawaban mahasiswa (tanpa filter tema_id karena bisa NULL)
$semuaJawaban = [];
$resJwb = $conn->query("
    SELECT ts.id, ts.nama_mahasiswa, ts.tema_id, ts.waktu_submit,
           ts.jawaban_1,  ts.jawaban_2,  ts.jawaban_3,  ts.jawaban_4,  ts.jawaban_5,
           ts.jawaban_6,  ts.jawaban_7,  ts.jawaban_8,  ts.jawaban_9,  ts.jawaban_10,
           ts.jawaban_11, ts.jawaban_12, ts.jawaban_13, ts.jawaban_14, ts.jawaban_15,
           ts.jawaban_16, ts.jawaban_17,
           u.nama_lengkap, u.kelas AS kelas_user,
           tm.nama_tema, tm.kelompok AS kelompok_tema, tm.kelas AS kelas_tema
    FROM tb_soal ts
    LEFT JOIN `user` u ON u.username = ts.nama_mahasiswa
    LEFT JOIN tema_masalah tm ON tm.id_tema = ts.tema_id
    ORDER BY ts.waktu_submit DESC
");
if ($resJwb) {
    while ($rj = $resJwb->fetch_assoc()) {
        $semuaJawaban[] = $rj;
    }
} elseif ($conn->errno) {
    // Fallback: query tanpa JOIN jika ada masalah kolom
    $resJwb2 = $conn->query("SELECT * FROM tb_soal ORDER BY waktu_submit DESC");
    if ($resJwb2) {
        while ($rj = $resJwb2->fetch_assoc()) {
            $rj['nama_lengkap'] = '';
            $rj['kelas_user']   = '';
            $rj['nama_tema']    = '';
            $rj['kelompok_tema']= '';
            $rj['kelas_tema']   = '';
            $semuaJawaban[] = $rj;
        }
    }
}

// active theme
$active_theme_id    = null;
$active_theme_label = null;
if (isset($_GET['theme']) && intval($_GET['theme']) > 0) {
    $active_theme_id = intval($_GET['theme']);
} elseif (isset($_POST['theme']) && intval($_POST['theme']) > 0) {
    $active_theme_id = intval($_POST['theme']);
}
if ($active_theme_id && isset($temaMap[$active_theme_id])) {
    $active_theme_label = $temaMap[$active_theme_id];
}

// ---- PROSES FORM ----

// Hapus jawaban
if (isset($_GET['delete_jawaban'])) {
    $del = intval($_GET['delete_jawaban']);
    if ($conn->query("DELETE FROM tb_soal WHERE id = $del")) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Jawaban berhasil dihapus! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Gagal menghapus jawaban.</div>";
    }
}

// Hapus soal
if (isset($_GET['delete_soal'])) {
    $del = intval($_GET['delete_soal']);
    if ($conn->query("DELETE FROM tb_daftar_soal WHERE id = $del")) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Soal berhasil dihapus! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Gagal menghapus soal.</div>";
    }
}

// Tambah soal
if (isset($_POST['add_soal'])) {
    if (!$active_theme_id) {
        $pesan = "<div class='alert alert-danger'>Pilih tema terlebih dahulu.</div>";
    } else {
        $txt = mysqli_real_escape_string($conn, 'Tulis pertanyaan baru di sini...');
        if ($conn->query("INSERT INTO tb_daftar_soal (teks_soal, tema_id) VALUES ('$txt', $active_theme_id)")) {
            ob_end_clean();
            header("Location: kelola_soal.php?theme={$active_theme_id}#soal");
            exit();
        } else {
            $pesan = "<div class='alert alert-danger'>Gagal menambahkan soal.</div>";
        }
    }
}

// Tambah tema
if (isset($_POST['add_tema'])) {
    $kelas     = mysqli_real_escape_string($conn, trim($_POST['kelas']));
    $kelompok  = mysqli_real_escape_string($conn, trim($_POST['kelompok']));
    $nama_tema = mysqli_real_escape_string($conn, trim($_POST['nama_tema']));
    if ($kelas === '' || $kelompok === '' || $nama_tema === '') {
        $pesan = "<div class='alert alert-danger'>Semua field harus diisi.</div>";
    } else {
        if ($conn->query("INSERT INTO tema_masalah (kelas, kelompok, nama_tema) VALUES ('$kelas', '$kelompok', '$nama_tema')")) {
            $pesan = "<div class='alert alert-success alert-dismissible fade show'>Tema berhasil ditambahkan! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
        } else {
            $pesan = "<div class='alert alert-danger'>Gagal menambahkan tema.</div>";
        }
    }
}

// Edit tema
if (isset($_POST['edit_tema'])) {
    $temaId    = intval($_POST['tema_id']);
    $kelas     = mysqli_real_escape_string($conn, trim($_POST['kelas']));
    $kelompok  = mysqli_real_escape_string($conn, trim($_POST['kelompok']));
    $nama_tema = mysqli_real_escape_string($conn, trim($_POST['nama_tema']));
    if ($kelas === '' || $kelompok === '' || $nama_tema === '') {
        $pesan = "<div class='alert alert-danger'>Semua field harus diisi.</div>";
    } else {
        if ($conn->query("UPDATE tema_masalah SET kelas='$kelas', kelompok='$kelompok', nama_tema='$nama_tema' WHERE id_tema=$temaId")) {
            $pesan = "<div class='alert alert-success alert-dismissible fade show'>Tema berhasil diperbarui! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
        } else {
            $pesan = "<div class='alert alert-danger'>Gagal memperbarui tema.</div>";
        }
    }
}

// Hapus tema
if (isset($_GET['delete_tema'])) {
    $del = intval($_GET['delete_tema']);
    if ($conn->query("DELETE FROM tema_masalah WHERE id_tema = $del")) {
        $pesan = "<div class='alert alert-success alert-dismissible fade show'>Tema berhasil dihapus! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    } else {
        $pesan = "<div class='alert alert-danger'>Gagal menghapus tema.</div>";
    }
}

// Update soal
if (isset($_POST['update_soal'])) {
    $berhasil = false;
    if ($active_theme_id) {
        $qSoalUpd = $conn->query("SELECT id FROM tb_daftar_soal WHERE tema_id = $active_theme_id ORDER BY id ASC");
        if ($qSoalUpd && $qSoalUpd->num_rows > 0) {
            $berhasil = true;
            while ($su = $qSoalUpd->fetch_assoc()) {
                $sid  = intval($su['id']);
                $teks = mysqli_real_escape_string($conn, $_POST['soal_' . $sid] ?? '');
                if (!$conn->query("UPDATE tb_daftar_soal SET teks_soal='$teks' WHERE id=$sid")) {
                    $berhasil = false;
                }
            }
        }
    }
    $pesan = $berhasil
        ? "<div class='alert alert-success alert-dismissible fade show'>Soal berhasil diperbarui! <button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>"
        : "<div class='alert alert-danger'>Gagal memperbarui soal.</div>";
}

// Riwayat tugas - filter
$fKelas  = mysqli_real_escape_string($conn, $_GET['f_kelas']  ?? '');
$fType   = mysqli_real_escape_string($conn, $_GET['f_type']   ?? '');
$fSearch = mysqli_real_escape_string($conn, $_GET['f_search'] ?? '');

$whereArr = [];
if ($fKelas  !== '') $whereArr[] = "u.kelas = '$fKelas'";
if ($fType   !== '') $whereArr[] = "t.type_tugas = '$fType'";
if ($fSearch !== '') $whereArr[] = "(u.nama_lengkap LIKE '%$fSearch%' OR t.username LIKE '%$fSearch%' OR t.tema_masalah LIKE '%$fSearch%')";
$whereSQL = $whereArr ? 'WHERE ' . implode(' AND ', $whereArr) : '';

$semuaRiwayat = [];
$resRiwayat = $conn->query("
    SELECT t.*, u.nama_lengkap, u.kelas AS kelas_user
    FROM tugas t
    LEFT JOIN `user` u ON u.username = t.username
    $whereSQL
    ORDER BY t.stamp DESC
");
if ($resRiwayat) {
    while ($rr = $resRiwayat->fetch_assoc()) {
        $semuaRiwayat[] = $rr;
    }
}

// Opsi filter kelas & tipe untuk dropdown
$opsiKelas = [];
$rk = $conn->query("SELECT DISTINCT kelas FROM `user` WHERE kelas IS NOT NULL AND kelas != '' ORDER BY kelas ASC");
if ($rk) { while ($rw = $rk->fetch_assoc()) { $opsiKelas[] = $rw['kelas']; } }

$opsiType = [];
$rt = $conn->query("SELECT DISTINCT type_tugas FROM tugas WHERE type_tugas IS NOT NULL ORDER BY type_tugas ASC");
if ($rt) { while ($rw = $rt->fetch_assoc()) { $opsiType[] = $rw['type_tugas']; } }
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kelola Soal - Panel Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .jawaban-box { background: #f1f2f6; padding: 10px; border-radius: 5px; margin-bottom: 10px; border-left: 4px solid #3498db; }
        .soal-title { font-weight: bold; color: #2c3e50; font-size: 0.9em; }
        .jawaban-box div { unicode-bidi: plaintext; text-align: start; }
        .jawaban-arabic { direction: rtl; text-align: right; font-family: 'Traditional Arabic', 'Amiri', Arial, sans-serif; font-size: 1.1em; line-height: 1.9; }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark mb-4 shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">Panel Admin - Kelola Soal</a>
        <a href="admin.php" class="btn btn-outline-light btn-sm">Kembali ke Admin</a>
    </div>
</nav>

<div class="container pb-5">
    <?= $pesan; ?>

    <ul class="nav nav-tabs mb-4" id="mainTab" role="tablist">
        <?php if ($active_theme_id && $active_theme_label): ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold" id="soal-tab" data-bs-toggle="tab" data-bs-target="#soal" type="button" role="tab">
                <i class="bi bi-pencil-square"></i> Edit Soal
            </button>
        </li>
        <?php endif; ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link active fw-bold" id="tema-tab" data-bs-toggle="tab" data-bs-target="#tema" type="button" role="tab">
                <i class="bi bi-tags"></i> Kelola Tema
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold" id="riwayat-tab" data-bs-toggle="tab" data-bs-target="#riwayat" type="button" role="tab">
                <i class="bi bi-clock-history"></i> Riwayat Tugas
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link fw-bold" id="jawaban-tab" data-bs-toggle="tab" data-bs-target="#jawaban" type="button" role="tab">
                <i class="bi bi-chat-left-text"></i> Lihat Jawaban
                <span class="badge bg-secondary ms-1"><?= count($semuaJawaban); ?></span>
            </button>
        </li>
    </ul>

    <div class="tab-content" id="mainTabContent">

        <!-- ===== TAB: EDIT SOAL ===== -->
        <div class="tab-pane fade" id="soal" role="tabpanel">
            <div class="card shadow-sm border-primary">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <span class="fw-bold">Edit Soal<?php if ($active_theme_label) echo ' &mdash; ' . htmlspecialchars($active_theme_label); ?></span>
                    <?php if ($active_theme_id): ?>
                    <form action="kelola_soal.php" method="POST" class="mb-0">
                        <input type="hidden" name="theme" value="<?= $active_theme_id; ?>">
                        <button type="submit" name="add_soal" class="btn btn-light btn-sm">+ Tambah Soal</button>
                    </form>
                    <?php endif; ?>
                </div>
                <div class="card-body">
                    <form action="kelola_soal.php" method="POST">
                        <input type="hidden" name="theme" value="<?= $active_theme_id; ?>">
                        <?php
                        $qSoal = $active_theme_id
                            ? $conn->query("SELECT * FROM tb_daftar_soal WHERE tema_id = $active_theme_id ORDER BY id ASC")
                            : false;
                        if ($qSoal && $qSoal->num_rows > 0):
                            $noSoal = 1;
                            while ($s = $qSoal->fetch_assoc()):
                        ?>
                        <div class="mb-3 d-flex gap-2 align-items-start">
                            <div class="flex-grow-1">
                                <label class="form-label fw-bold">Pertanyaan Nomor <?= $noSoal; ?></label>
                                <textarea name="soal_<?= $s['id']; ?>" class="form-control" rows="2" required><?= htmlspecialchars($s['teks_soal']); ?></textarea>
                            </div>
                            <div class="align-self-end">
                                <a href="?delete_soal=<?= $s['id']; ?>&theme=<?= $active_theme_id; ?>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Hapus soal nomor <?= $noSoal; ?>?')">Hapus</a>
                            </div>
                        </div>
                        <?php
                                $noSoal++;
                            endwhile;
                        else:
                        ?>
                        <div class="alert alert-info">Pilih tema dari tab Kelola Tema untuk mulai mengedit soal.</div>
                        <?php endif; ?>
                        <hr>
                        <button type="submit" name="update_soal" class="btn btn-success w-100 py-2 fw-bold" <?= $active_theme_id ? '' : 'disabled'; ?>>
                            Simpan Perubahan Soal
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- ===== TAB: KELOLA TEMA ===== -->
        <div class="tab-pane fade show active" id="tema" role="tabpanel">
            <div class="card shadow-sm border-success mb-4">
                <div class="card-header bg-success text-white fw-bold">Tambah Tema Soal Baru</div>
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
                <div class="card-header bg-secondary text-white fw-bold">Daftar Tema</div>
                <div class="card-body p-0">
                    <?php if (empty($temaList)): ?>
                        <div class="alert alert-warning m-3">Belum ada tema. Tambahkan tema baru di form di atas.</div>
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
                            <?php foreach ($temaList as $noT => $tema): ?>
                                <tr>
                                    <td class="text-center"><?= $noT + 1; ?></td>
                                    <td><?= htmlspecialchars($tema['kelas']); ?></td>
                                    <td><?= htmlspecialchars($tema['kelompok']); ?></td>
                                    <td><?= htmlspecialchars($tema['nama_tema']); ?></td>
                                    <td class="text-center">
                                        <div class="d-flex flex-wrap gap-1 justify-content-center">
                                            <button type="button" class="btn btn-sm btn-warning"
                                                onclick="toggleEdit(<?= $tema['id_tema']; ?>)">Edit</button>
                                            <a href="kelola_soal.php?theme=<?= $tema['id_tema']; ?>#soal"
                                               class="btn btn-sm btn-info">Edit Soal</a>
                                            <a href="?delete_tema=<?= $tema['id_tema']; ?>"
                                               class="btn btn-sm btn-danger"
                                               onclick="return confirm('Hapus tema ini?')">Hapus</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="editRow<?= $tema['id_tema']; ?>" style="display:none;">
                                    <td colspan="5">
                                        <form action="" method="POST" class="row g-3 align-items-end">
                                            <input type="hidden" name="tema_id" value="<?= $tema['id_tema']; ?>">
                                            <div class="col-md-2">
                                                <label class="form-label">Kelas</label>
                                                <input type="text" name="kelas" class="form-control"
                                                    value="<?= htmlspecialchars($tema['kelas'], ENT_QUOTES); ?>" required>
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
                                                <input type="text" name="nama_tema" class="form-control"
                                                    value="<?= htmlspecialchars($tema['nama_tema'], ENT_QUOTES); ?>" required>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" name="edit_tema" class="btn btn-success w-100">Simpan</button>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <!-- ===== TAB: RIWAYAT TUGAS ===== -->
        <div class="tab-pane fade" id="riwayat" role="tabpanel">
            <div class="card shadow-sm border-warning">
                <div class="card-header bg-warning text-dark fw-bold">
                    <i class="bi bi-clock-history"></i> Riwayat Pengumpulan Tugas (File Upload)
                </div>
                <div class="card-body">
                    <form method="GET" class="row g-2 mb-3">
                        <input type="hidden" name="tab" value="riwayat">
                        <div class="col-md-3">
                            <select name="f_kelas" class="form-select form-select-sm">
                                <option value="">-- Semua Kelas --</option>
                                <?php foreach ($opsiKelas as $ok): ?>
                                <option value="<?= htmlspecialchars($ok); ?>" <?= ($fKelas === $ok ? 'selected' : ''); ?>>
                                    <?= htmlspecialchars($ok); ?>
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select name="f_type" class="form-select form-select-sm">
                                <option value="">-- Semua Tipe --</option>
                                <?php foreach ($opsiType as $ot): ?>
                                <option value="<?= htmlspecialchars($ot); ?>" <?= ($fType === $ot ? 'selected' : ''); ?>>
                                    <?= htmlspecialchars($ot); ?>
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="text" name="f_search" class="form-control form-control-sm"
                                placeholder="Cari nama / NIM / tema..."
                                value="<?= htmlspecialchars($_GET['f_search'] ?? ''); ?>">
                        </div>
                        <div class="col-md-2 d-flex gap-1">
                            <button type="submit" class="btn btn-warning btn-sm w-100">Filter</button>
                            <a href="kelola_soal.php#riwayat" class="btn btn-outline-secondary btn-sm">Reset</a>
                        </div>
                    </form>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-sm mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Nama / NIM</th>
                                    <th>Kelas</th>
                                    <th>Tema Masalah</th>
                                    <th>Tipe</th>
                                    <th>File</th>
                                    <th>Waktu</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php if (empty($semuaRiwayat)): ?>
                                <tr><td colspan="7" class="text-center py-4 text-muted">Belum ada data riwayat tugas.</td></tr>
                            <?php else: ?>
                                <?php foreach ($semuaRiwayat as $noR => $rw):
                                    $namaR   = $rw['nama_lengkap'] ?: $rw['username'];
                                    $ext     = strtolower(pathinfo($rw['file_upload'], PATHINFO_EXTENSION));
                                    $extBadge = ['pdf' => 'bg-danger', 'docx' => 'bg-primary', 'doc' => 'bg-primary',
                                                 'xlsx' => 'bg-success', 'xls' => 'bg-success',
                                                 'png' => 'bg-info', 'jpg' => 'bg-info', 'jpeg' => 'bg-info'];
                                    $badgeCls = $extBadge[$ext] ?? 'bg-secondary';
                                ?>
                                <tr>
                                    <td class="text-center"><?= $noR + 1; ?></td>
                                    <td>
                                        <span class="fw-bold"><?= htmlspecialchars($namaR); ?></span><br>
                                        <small class="text-muted"><?= htmlspecialchars($rw['username']); ?></small>
                                    </td>
                                    <td><small><?= htmlspecialchars($rw['kelas_user'] ?? $rw['kelas'] ?? '-'); ?></small></td>
                                    <td><small><?= htmlspecialchars($rw['tema_masalah'] ?? '-'); ?></small></td>
                                    <td><span class="badge bg-secondary"><?= htmlspecialchars($rw['type_tugas'] ?? '-'); ?></span></td>
                                    <td>
                                        <span class="badge <?= $badgeCls; ?>"><?= strtoupper($ext); ?></span>
                                        <a href="uploads/<?= htmlspecialchars($rw['file_upload']); ?>"
                                           target="_blank" class="ms-1 small text-decoration-none">
                                            <?= htmlspecialchars(substr($rw['file_upload'], 11)); ?>
                                        </a>
                                    </td>
                                    <td><small><?= date('d M Y H:i', strtotime($rw['stamp'])); ?></small></td>
                                </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-end text-muted small mt-2">Total: <?= count($semuaRiwayat); ?> entri</div>
                </div>
            </div>
        </div>

        <!-- ===== TAB: LIHAT JAWABAN MAHASISWA ===== -->
        <div class="tab-pane fade" id="jawaban" role="tabpanel">
            <div class="card shadow-sm border-dark">
                <div class="card-header bg-dark text-white fw-bold d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-chat-left-text"></i> Jawaban Mahasiswa</span>
                    <span class="badge bg-secondary"><?= count($semuaJawaban); ?> mahasiswa</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center" style="width:50px">No</th>
                                    <th>Nama / NIM</th>
                                    <th>Tema</th>
                                    <th>Waktu Simpan</th>
                                    <th class="text-center" style="width:100px">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php if (empty($semuaJawaban)): ?>
                                <tr><td colspan="5" class="text-center py-4 text-muted">Belum ada mahasiswa yang mengumpulkan jawaban.</td></tr>
                            <?php else: ?>
                                <?php foreach ($semuaJawaban as $noJ => $r): ?>
                                <tr>
                                    <td class="text-center"><?= $noJ + 1; ?></td>
                                    <td>
                                        <span class="fw-bold"><?= htmlspecialchars($r['nama_lengkap'] ?: $r['nama_mahasiswa']); ?></span><br>
                                        <small class="text-muted"><?= htmlspecialchars($r['nama_mahasiswa']); ?></small>
                                        <?php if (!empty($r['kelas_user'])): ?>
                                            <span class="badge bg-secondary ms-1"><?= htmlspecialchars($r['kelas_user']); ?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if (!empty($r['nama_tema'])): ?>
                                            <?= htmlspecialchars($r['nama_tema']); ?><br>
                                            <small class="text-muted">
                                                <?= htmlspecialchars($r['kelas_tema'] . ' &middot; ' . $r['kelompok_tema']); ?>
                                            </small>
                                        <?php else: ?>
                                            <span class="text-muted fst-italic">Tidak tercatat</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><small><?= date('d M Y H:i', strtotime($r['waktu_submit'])); ?></small></td>
                                    <td class="text-center">
                                        <button class="btn btn-primary btn-sm"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalJwb<?= $r['id']; ?>">
                                            <i class="bi bi-eye"></i> Lihat
                                        </button>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- end tab-content -->
</div><!-- end container -->

<?php
// ===== MODAL JAWABAN — di luar container agar HTML valid =====
foreach ($semuaJawaban as $r):
    $namaDisplay = $r['nama_lengkap'] ?: $r['nama_mahasiswa'];
    // Karena tema_id sering NULL, gunakan soal dari tema apapun yang tersedia sebagai fallback
    if (!empty($r['tema_id']) && isset($soalPerTema[$r['tema_id']])) {
        $soalList = $soalPerTema[$r['tema_id']];
    } elseif (!empty($soalPerTema)) {
        // Abaikan id_theme — pakai soal pertama yang tersedia
        $soalList = reset($soalPerTema);
    } else {
        $soalList = [];
    }
?>
<div class="modal fade" id="modalJwb<?= $r['id']; ?>" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title">
                    <i class="bi bi-person-circle me-1"></i>
                    <?= htmlspecialchars($namaDisplay); ?>
                    <small class="fw-normal opacity-75 fs-6 ms-1">(<?= htmlspecialchars($r['nama_mahasiswa']); ?>)</small>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <?php if (!empty($r['nama_tema'])): ?>
                <div class="alert alert-info py-2 mb-3">
                    <strong>Tema:</strong> <?= htmlspecialchars($r['nama_tema']); ?>
                    <?php if (!empty($r['kelas_tema']) || !empty($r['kelompok_tema'])): ?>
                        &nbsp;&middot;&nbsp;<small>Kelas <?= htmlspecialchars($r['kelas_tema']); ?> &middot; <?= htmlspecialchars($r['kelompok_tema']); ?></small>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <?php
                $adaIsi = false;
                for ($i = 1; $i <= 17; $i++):
                    $jawaban  = trim($r['jawaban_' . $i] ?? '');
                    $soalTeks = $soalList[$i - 1] ?? null;
                    if ($jawaban === '') { continue; } // Hanya skip jika jawaban benar-benar kosong
                    $adaIsi = true;
                ?>
                <div class="jawaban-box">
                    <div class="soal-title">
                        <?php if ($soalTeks): ?>
                            <?= $i . '. ' . htmlspecialchars($soalTeks); ?>
                        <?php else: ?>
                            Pertanyaan <?= $i; ?>
                        <?php endif; ?>
                    </div>
                    <div>
                        <?= nl2br(htmlspecialchars($jawaban)); ?>
                    </div>
                </div>
                <?php endfor; ?>
                <?php if (!$adaIsi): ?>
                    <p class="text-muted text-center py-3">Belum ada jawaban yang diisi.</p>
                <?php endif; ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>
<?php endforeach; ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Auto-detect teks Arab di modal
    const arabicRegex = /[؀-ۿݐ-ݿﭐ-﷿ﹰ-﻿]/;
    document.addEventListener('show.bs.modal', function() {
        setTimeout(function() {
            document.querySelectorAll('.jawaban-box div:not(.soal-title)').forEach(function(el) {
                if (arabicRegex.test(el.textContent)) {
                    el.classList.add('jawaban-arabic');
                }
            });
        }, 50);
    });

    function toggleEdit(id) {
        var row = document.getElementById('editRow' + id);
        if (!row) return;
        row.style.display = row.style.display === 'table-row' ? 'none' : 'table-row';
    }

    document.addEventListener('DOMContentLoaded', function() {
        var hash     = window.location.hash.replace('#', '');
        var params   = new URLSearchParams(window.location.search);
        var validTabs = ['soal', 'tema', 'riwayat', 'jawaban'];

        var target = '';
        if (hash && validTabs.includes(hash)) {
            target = hash;
        } else if (params.get('tab') === 'riwayat') {
            target = 'riwayat';
        } else if (params.get('theme')) {
            target = 'soal';
        }

        if (target) {
            var el = document.querySelector('#' + target + '-tab');
            if (el) { new bootstrap.Tab(el).show(); }
        }
    });
</script>
</body>
</html>
