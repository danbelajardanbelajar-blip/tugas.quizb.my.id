<?php
session_start();
// Proteksi: Jika belum login, tendang ke login.php
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login") {
    header("location:login.php");
    exit();
}

include 'koneksi.php';

// Ambil data kelas mahasiswa yang sedang login
$user_sekarang = $_SESSION['username'];
$query_user = mysqli_query($conn, "SELECT kelas FROM user WHERE username = '$user_sekarang'");
$data_user  = mysqli_fetch_assoc($query_user);
$kelas_mhs  = $data_user['kelas'];

// --- PROSES HAPUS TUGAS ---
if (isset($_GET['hapus'])) {
    $id_tugas = mysqli_real_escape_string($conn, $_GET['hapus']);
    $username = $_SESSION['username'];

    $cek_file = mysqli_query($conn, "SELECT file_upload FROM tugas WHERE id_tugas = '$id_tugas' AND username = '$username'");
    if (mysqli_num_rows($cek_file) > 0) {
        $data_file = mysqli_fetch_assoc($cek_file);
        $path = "uploads/" . $data_file['file_upload'];
        
        if (file_exists($path)) { unlink($path); }
        
        mysqli_query($conn, "DELETE FROM tugas WHERE id_tugas = '$id_tugas'");
        $msg = "<div class='alert alert-warning'>Tugas berhasil dihapus.</div>";
    }
}

// --- PROSES UPLOAD TUGAS ---
if (isset($_POST['submit'])) {
    $username     = $_SESSION['username'];
    $tema_masalah = mysqli_real_escape_string($conn, $_POST['tema_masalah']);
    $type_tugas   = mysqli_real_escape_string($conn, $_POST['type_tugas']);
    
    // PERBAIKAN: Bersihkan nama file dari karakter berbahaya seperti tanda petik
    $original_name = $_FILES['file_upload']['name'];
    $clean_name    = preg_replace("/[^a-zA-Z0-9._-]/", "_", $original_name);
    $filename      = time() . "_" . $clean_name;
    
    $tmp_name = $_FILES['file_upload']['tmp_name'];
    $folder   = "uploads/";

    if (!is_dir($folder)) { mkdir($folder, 0777, true); }

    if (move_uploaded_file($tmp_name, $folder . $filename)) {
        $safe_filename = mysqli_real_escape_string($conn, $filename);
        
        // Simpan tugas dengan menyertakan kolom kelas otomatis
        $query = "INSERT INTO tugas (username, tema_masalah, type_tugas, kelas, file_upload) 
                  VALUES ('$username', '$tema_masalah', '$type_tugas', '$kelas_mhs', '$safe_filename')";
        
        if (mysqli_query($conn, $query)) {
            $msg = "<div class='alert alert-success'>Tugas berhasil diunggah!</div>";
        } else {
            $msg = "<div class='alert alert-danger'>Gagal simpan database: " . mysqli_error($conn) . "</div>";
        }
    } else {
        $msg = "<div class='alert alert-danger'>Gagal memindahkan file ke server.</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Mahasiswa - UNISDA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .navbar { background-color: #2c3e50; }
    </style>
</head>
<body>

<nav class="navbar navbar-dark mb-4 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">Dashboard Tugas</a>
        <div class="navbar-nav ms-auto">
            <span class="text-white me-3">Halo, <b><?php echo $_SESSION['username']; ?></b> (Kelas <?php echo $kelas_mhs; ?>)</span>
            <a href="logout.php" class="btn btn-sm btn-outline-danger">Logout</a>
        </div>
    </div>
</nav>

<div class="container">
    <?php if(isset($msg)) echo $msg; ?>

    <!-- ========================================== -->
    <!-- TAMBAHAN: LINK MENUJU TUGAS SOAL.PHP       -->
    <!-- ========================================== -->
    <div class="alert alert-info shadow-sm border-info d-flex justify-content-between align-items-center mb-4">
        <div>
            <h5 class="mb-1 text-info-emphasis"><i class="bi bi-journal-text me-2"></i>Tugas Khusus: Analisis Hukum Bayi Tabung</h5>
            <p class="mb-0 small text-dark">Silakan kerjakan soal analisis fiqih secara langsung melalui form yang telah disediakan.</p>
        </div>
        <div>
            <a href="soal.php" class="btn btn-primary text-nowrap shadow-sm fw-bold">Kerjakan Tugas <i class="bi bi-arrow-right ms-1"></i></a>
        </div>
    </div>
    <!-- ========================================== -->

    <div class="row">
        <div class="col-md-5">
            <div class="card shadow-sm mb-4 border-primary">
                <div class="card-header bg-primary text-white font-weight-bold">Form Upload Tugas</div>
                <div class="card-body">
                    <form action="" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label">Tema Masalah Fiqih (Khusus Kelas <?php echo $kelas_mhs; ?>)</label>
                            <select name="tema_masalah" class="form-select" required>
                                <option value="">-- Pilih Judul Masalah --</option>
                                <?php
                                // FILTER TEMA: Hanya ambil tema yang kolom kelas-nya cocok dengan kelas mahasiswa
                                $kelompok_res = mysqli_query($conn, "SELECT DISTINCT kelompok FROM tema_masalah WHERE kelas = '$kelas_mhs'");
                                while($k = mysqli_fetch_assoc($kelompok_res)) {
                                    echo '<optgroup label="'.$k['kelompok'].'">';
                                    $tema_res = mysqli_query($conn, "SELECT nama_tema FROM tema_masalah WHERE kelompok='".$k['kelompok']."' AND kelas = '$kelas_mhs'");
                                    while($t = mysqli_fetch_assoc($tema_res)) {
                                        echo '<option value="'.$t['nama_tema'].'">'.$t['nama_tema'].'</option>';
                                    }
                                    echo '</optgroup>';
                                }
                                ?>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Type Tugas</label>
                            <select name="type_tugas" class="form-select" required>
                                <option value="Table">Table</option>
                                <option value="Pendahuluan">Pendahuluan</option>
                                <option value="Pembahasan">Pembahasan</option>
                                <option value="Kesimpulan">Kesimpulan</option>
                                <option value="Lengkap">Lengkap</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Pilih File</label>
                            <input type="file" name="file_upload" class="form-control" required>
                        </div>

                        <button type="submit" name="submit" class="btn btn-success w-100 shadow-sm">Kirim Tugas Sekarang</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card shadow-sm border-dark">
                <div class="card-header bg-dark text-white font-weight-bold">Riwayat Tugas Saya</div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-light">
                                <tr class="small text-center">
                                    <th>No</th>
                                    <th>Tema Masalah</th>
                                    <th>Type</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                $query_tampil = mysqli_query($conn, "SELECT * FROM tugas WHERE username = '$user_sekarang' ORDER BY id_tugas DESC");
                                
                                if (mysqli_num_rows($query_tampil) > 0) {
                                    while ($r = mysqli_fetch_assoc($query_tampil)) {
                                        echo "<tr class='small'>";
                                        echo "<td class='text-center'>$no</td>";
                                        echo "<td>{$r['tema_masalah']}</td>";
                                        echo "<td class='text-center'><span class='badge bg-info text-dark'>{$r['type_tugas']}</span></td>";
                                        echo "<td class='text-center'>";
                                        echo "<a href='uploads/{$r['file_upload']}' class='btn btn-xs btn-primary py-0 me-1' style='font-size: 10px;' target='_blank'>Lihat</a> ";
                                        echo "<a href='?hapus={$r['id_tugas']}' class='btn btn-xs btn-danger py-0' style='font-size: 10px;' onclick='return confirm(\"Hapus tugas ini?\")'>Hapus</a>";
                                        echo "</td>";
                                        echo "</tr>";
                                        $no++;
                                    }
                                } else {
                                    echo "<tr><td colspan='4' class='text-center py-3 text-muted'>Belum ada tugas.</td></tr>";
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

<footer class="text-center mt-5 mb-3 text-muted">
    <small>&copy; 2026 UNISDA - Pak Zainul Hakim</small>
</footer>

<!-- Tambahan JS Bootstrap jika diperlukan -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>