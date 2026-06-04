<?php
ob_start();
session_start();

// Proteksi: Jika belum login, tendang ke login.php
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login") {
    header("location:login.php");
    exit();
}

// Redirect admin ke halaman admin
if (isset($_SESSION['role']) && $_SESSION['role'] == 'admin') {
    ob_end_clean();
    header("location:admin.php");
    exit();
}

include 'koneksi.php';

// Ambil data mahasiswa yang sedang login
$user_sekarang = $_SESSION['username'];
$query_user    = mysqli_query($conn, "SELECT kelas, nama_lengkap FROM user WHERE username = '$user_sekarang'");
$data_user     = $query_user ? mysqli_fetch_assoc($query_user) : null;
$kelas_mhs     = $data_user['kelas'] ?? '';
$nama_mhs      = !empty($data_user['nama_lengkap']) ? $data_user['nama_lengkap'] : $user_sekarang;

// Cek apakah mahasiswa ini sudah pernah mengerjakan soal (tb_soal)
$cek_tb_soal   = mysqli_query($conn, "SELECT id, waktu_submit FROM tb_soal WHERE nama_mahasiswa = '$user_sekarang' LIMIT 1");
$sudah_tb_soal = mysqli_num_rows($cek_tb_soal) > 0;
$waktu_tb_soal = '';
if ($sudah_tb_soal) {
    $row_tb       = mysqli_fetch_assoc($cek_tb_soal);
    $waktu_tb_soal = date('d M Y, H:i', strtotime($row_tb['waktu_submit']));
}

// Ambil semua tema yang punya soal di tb_daftar_soal, filter sesuai kelas mahasiswa
// tb_daftar_soal terhubung ke tema_masalah via tema_id
$query_tema_soal = mysqli_query($conn, "
    SELECT 
        tm.id_tema,
        tm.nama_tema,
        tm.kelompok,
        tm.kelas,
        COUNT(ds.id) AS jumlah_soal
    FROM tema_masalah tm
    INNER JOIN tb_daftar_soal ds ON ds.tema_id = tm.id_tema
    WHERE tm.kelas = '$kelas_mhs'
    GROUP BY tm.id_tema
    ORDER BY tm.kelompok ASC, tm.nama_tema ASC
");

?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Mahasiswa - Mashailul Fiqhiyah</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }
        .navbar-custom {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .navbar-brand-text { color: #fff; font-weight: 700; font-size: 1.1rem; letter-spacing: 0.5px; }
        .user-chip {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 50px;
            padding: 6px 16px;
            color: #e0e0ff;
            font-size: 0.85rem;
        }
        .page-title {
            color: #fff;
            font-weight: 800;
            font-size: 1.6rem;
            text-shadow: 0 2px 8px rgba(0,0,0,0.4);
        }
        .page-subtitle { color: rgba(255,255,255,0.6); font-size: 0.9rem; }
        /* Card soal */
        .soal-card {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 16px;
            transition: transform 0.2s, box-shadow 0.2s, background 0.2s;
            overflow: hidden;
        }
        .soal-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.35);
            background: rgba(255,255,255,0.1);
        }
        .soal-card .card-body { padding: 1.3rem 1.5rem; }
        .tema-title { color: #fff; font-weight: 600; font-size: 0.95rem; line-height: 1.4; }
        .tema-kelompok {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-radius: 50px;
            padding: 3px 10px;
        }
        .kelompok-utama   { background: rgba(99,179,237,0.18); color: #63b3ed; border: 1px solid rgba(99,179,237,0.3); }
        .kelompok-kontemporer { background: rgba(154,106,255,0.18); color: #c084fc; border: 1px solid rgba(154,106,255,0.3); }
        /* Status badge */
        .badge-done {
            background: rgba(72,199,142,0.18);
            color: #48c78e;
            border: 1px solid rgba(72,199,142,0.35);
            border-radius: 50px;
            padding: 4px 12px;
            font-size: 0.75rem;
            font-weight: 700;
        }
        .badge-pending {
            background: rgba(255,183,77,0.15);
            color: #ffd166;
            border: 1px solid rgba(255,183,77,0.3);
            border-radius: 50px;
            padding: 4px 12px;
            font-size: 0.75rem;
            font-weight: 700;
        }
        .soal-count {
            color: rgba(255,255,255,0.4);
            font-size: 0.78rem;
        }
        .btn-kerjakan {
            background: linear-gradient(135deg, #3b82f6, #6366f1);
            border: none;
            border-radius: 50px;
            color: #fff;
            font-weight: 600;
            font-size: 0.82rem;
            padding: 7px 18px;
            transition: opacity 0.2s, transform 0.15s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-kerjakan:hover { opacity: 0.9; transform: scale(1.03); color: #fff; }
        .btn-lihat {
            background: rgba(72,199,142,0.15);
            border: 1px solid rgba(72,199,142,0.35);
            border-radius: 50px;
            color: #48c78e;
            font-weight: 600;
            font-size: 0.82rem;
            padding: 6px 16px;
            transition: opacity 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-lihat:hover { opacity: 0.8; color: #48c78e; }
        /* Stats bar */
        .stats-bar {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 16px;
            padding: 1.2rem 1.5rem;
        }
        .stat-item .stat-num { color: #fff; font-size: 1.6rem; font-weight: 800; line-height: 1; }
        .stat-item .stat-label { color: rgba(255,255,255,0.5); font-size: 0.75rem; margin-top: 2px; }
        .stat-divider { width: 1px; background: rgba(255,255,255,0.12); margin: 0 1.5rem; }
        /* Empty state */
        .empty-state { color: rgba(255,255,255,0.35); text-align: center; padding: 3rem 1rem; }
        .empty-state i { font-size: 3rem; opacity: 0.4; }
        /* Section header */
        .section-header { color: rgba(255,255,255,0.8); font-weight: 700; font-size: 0.85rem; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 1rem; }
        .section-header::after { content: ''; display: block; width: 30px; height: 2px; background: #6366f1; margin-top: 4px; border-radius: 2px; }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-custom py-3 mb-5">
    <div class="container d-flex justify-content-between align-items-center">
        <span class="navbar-brand-text">
            <i class="bi bi-mortarboard-fill me-2 text-primary"></i>Mashailul Fiqhiyah
        </span>
        <div class="d-flex align-items-center gap-2">
            <span class="user-chip">
                <i class="bi bi-person-circle me-1"></i>
                <?= htmlspecialchars($nama_mhs, ENT_QUOTES, 'UTF-8'); ?>
                <?php if ($kelas_mhs): ?>
                    &nbsp;·&nbsp; Kelas <?= htmlspecialchars($kelas_mhs, ENT_QUOTES, 'UTF-8'); ?>
                <?php endif; ?>
            </span>
            <a href="logout.php" class="btn btn-sm btn-outline-danger rounded-pill">
                <i class="bi bi-box-arrow-right me-1"></i>Logout
            </a>
        </div>
    </div>
</nav>

<div class="container pb-5">

    <!-- PAGE HEADER -->
    <div class="mb-4">
        <h1 class="page-title mb-1">
            <i class="bi bi-journal-bookmark-fill me-2 text-primary"></i>Tugas Saya
        </h1>
        <p class="page-subtitle">Pilih tema soal di bawah untuk mulai mengerjakan tugas analisis fiqih Anda.</p>
    </div>

    <!-- STATS BAR -->
    <?php
    $total_tema  = mysqli_num_rows($query_tema_soal);
    // Hitung tema yang sudah dikerjakan: tema yang punya soal, dan mahasiswa sudah punya jawaban di tb_soal
    // Karena tb_soal menyimpan per-mahasiswa (satu baris semua jawaban), kita cek $sudah_tb_soal
    // Namun karena soal bisa dari berbagai tema, kita perlu tahu tema mana yang sudah dijawab
    // Sederhananya: jika sudah ada data di tb_soal, semua soal dianggap sudah pernah dikerjakan
    $sudah_count  = $sudah_tb_soal ? $total_tema : 0;
    $belum_count  = $total_tema - $sudah_count;
    ?>
    <div class="stats-bar d-flex align-items-center mb-4">
        <div class="stat-item text-center">
            <div class="stat-num"><?= $total_tema; ?></div>
            <div class="stat-label">Total Tema</div>
        </div>
        <div class="stat-divider align-self-stretch"></div>
        <div class="stat-item text-center">
            <div class="stat-num" style="color:#48c78e"><?= $sudah_count; ?></div>
            <div class="stat-label">Sudah Dikerjakan</div>
        </div>
        <div class="stat-divider align-self-stretch"></div>
        <div class="stat-item text-center">
            <div class="stat-num" style="color:#ffd166"><?= $belum_count; ?></div>
            <div class="stat-label">Belum Dikerjakan</div>
        </div>
        <?php if ($sudah_tb_soal && $waktu_tb_soal): ?>
        <div class="ms-auto text-end">
            <div style="color:#48c78e; font-size:0.8rem;"><i class="bi bi-check-circle-fill me-1"></i>Terakhir dikerjakan</div>
            <div style="color:rgba(255,255,255,0.5); font-size:0.75rem;"><?= $waktu_tb_soal; ?></div>
        </div>
        <?php endif; ?>
    </div>

    <!-- DAFTAR TEMA SOAL -->
    <?php if ($total_tema > 0):
        // Kelompokkan per kelompok (Masalah Utama / Masalah Kontemporer)
        mysqli_data_seek($query_tema_soal, 0);
        $grouped = [];
        while ($row = mysqli_fetch_assoc($query_tema_soal)) {
            $grouped[$row['kelompok']][] = $row;
        }
        foreach ($grouped as $kelompok => $temas):
            $isUtama = str_contains($kelompok, 'Utama');
    ?>
    <div class="section-header"><?= htmlspecialchars($kelompok, ENT_QUOTES, 'UTF-8'); ?></div>
    <div class="row g-3 mb-4">
        <?php foreach ($temas as $tema):
            $tema_id      = $tema['id_tema'];
            $nama_tema    = $tema['nama_tema'];
            $jml_soal     = $tema['jumlah_soal'];
            // Cek apakah mahasiswa sudah mengerjakan soal untuk tema ini
            // tb_soal menyimpan satu baris per mahasiswa (bukan per tema)
            // Kita anggap sudah dikerjakan jika ada record di tb_soal
            $sudah        = $sudah_tb_soal;
        ?>
        <div class="col-md-6 col-lg-4">
            <div class="soal-card h-100">
                <div class="card-body d-flex flex-column gap-3">
                    <!-- Kelompok chip -->
                    <div>
                        <span class="tema-kelompok <?= $isUtama ? 'kelompok-utama' : 'kelompok-kontemporer'; ?>">
                            <?= htmlspecialchars($kelompok, ENT_QUOTES, 'UTF-8'); ?>
                        </span>
                    </div>
                    <!-- Judul tema -->
                    <p class="tema-title mb-0"><?= htmlspecialchars($nama_tema, ENT_QUOTES, 'UTF-8'); ?></p>
                    <!-- Info & Status -->
                    <div class="d-flex justify-content-between align-items-center mt-auto">
                        <span class="soal-count"><i class="bi bi-list-task me-1"></i><?= $jml_soal; ?> soal</span>
                        <?php if ($sudah): ?>
                            <span class="badge-done"><i class="bi bi-check-circle-fill me-1"></i>Sudah Dikerjakan</span>
                        <?php else: ?>
                            <span class="badge-pending"><i class="bi bi-clock me-1"></i>Belum Dikerjakan</span>
                        <?php endif; ?>
                    </div>
                    <!-- Tombol aksi -->
                    <div class="d-flex gap-2">
                        <?php if ($sudah): ?>
                            <a href="soal.php?tema=<?= $tema_id; ?>" class="btn-lihat flex-grow-1 justify-content-center">
                                <i class="bi bi-eye"></i> Lihat / Edit
                            </a>
                        <?php else: ?>
                            <a href="soal.php?tema=<?= $tema_id; ?>" class="btn-kerjakan flex-grow-1 justify-content-center">
                                <i class="bi bi-pencil-square"></i> Kerjakan Sekarang
                            </a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
    <?php endforeach; ?>

    <?php else: ?>
    <div class="empty-state">
        <i class="bi bi-journal-x d-block mb-3"></i>
        <p class="mb-0">Belum ada soal yang tersedia untuk kelas <strong><?= htmlspecialchars($kelas_mhs ?: 'Anda', ENT_QUOTES, 'UTF-8'); ?></strong>.<br>
        Silakan hubungi dosen untuk informasi lebih lanjut.</p>
    </div>
    <?php endif; ?>

</div>

<footer class="text-center pb-4" style="color:rgba(255,255,255,0.25); font-size:0.8rem;">
    &copy; 2026 UNISDA &mdash; Pak Zainul Hakim
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>