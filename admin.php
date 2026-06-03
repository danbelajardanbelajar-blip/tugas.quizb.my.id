<?php
session_start();
include 'koneksi.php';

if (!isset($_SESSION['status']) || $_SESSION['role'] != 'admin') {
    header("location:login.php");
    exit();
}

// Logika Import CSV (Urutan: NIM; Password; Nama; Kelas)
if (isset($_POST['import'])) {
    if (!isset($_FILES['file_csv']) || !is_uploaded_file($_FILES['file_csv']['tmp_name'])) {
        $msg_import = "File CSV tidak ditemukan atau belum diunggah.";
    } else {
        $file = $_FILES['file_csv']['tmp_name'];
        $handle = fopen($file, "r");

        if ($handle !== false) {
            $firstLine = fgets($handle);
            $separator = (strpos($firstLine, ';') !== false) ? ";" : ",";
            rewind($handle);
            fgetcsv($handle, 1000, $separator);

            $success = 0;
            while (($data = fgetcsv($handle, 1000, $separator)) !== FALSE) {
                if (empty($data[0])) continue;
                $username = mysqli_real_escape_string($conn, trim($data[0])); 
                $password = mysqli_real_escape_string($conn, trim($data[1])); 
                $nama     = mysqli_real_escape_string($conn, trim($data[2])); 
                $kelas    = mysqli_real_escape_string($conn, isset($data[3]) ? trim($data[3]) : ''); 
                
                $query = "INSERT INTO user (username, password, nama_lengkap, kelas, role) 
                          VALUES ('$username', '$password', '$nama', '$kelas', 'user')
                          ON DUPLICATE KEY UPDATE password = '$password', nama_lengkap = '$nama', kelas = '$kelas'";
                if(mysqli_query($conn, $query)) { $success++; }
            }
            fclose($handle);
            $msg_import = "Berhasil mengimpor $success data mahasiswa.";
        } else {
            $msg_import = "Tidak dapat membuka file CSV.";
        }
    }
}

// Ambil nilai filter
$filter_tema  = isset($_GET['filter_tema']) ? mysqli_real_escape_string($conn, $_GET['filter_tema']) : '';
$filter_type  = isset($_GET['filter_type']) ? mysqli_real_escape_string($conn, $_GET['filter_type']) : '';
$filter_kelas = isset($_GET['filter_kelas']) ? mysqli_real_escape_string($conn, $_GET['filter_kelas']) : '';
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Monitoring Tugas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-danger mb-4 shadow">
    <div class="container">
        <a class="navbar-brand" href="#">Admin Panel UNISDA</a>
        <a href="logout.php" class="btn btn-sm btn-light">Logout</a>
    </div>
</nav>

<div class="container">
    <div class="card shadow-sm mb-4 border-primary">
        <div class="card-header bg-primary text-white"><strong>Filter Monitoring Tugas</strong></div>
        <div class="card-body">
            <form method="GET" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label small fw-bold">Kelas</label>
                    <select name="filter_kelas" class="form-select form-select-sm">
                        <option value="">-- Semua Kelas --</option>
                        <?php
                        $q_kelas = mysqli_query($conn, "SELECT DISTINCT kelas FROM user WHERE role='user' AND kelas IS NOT NULL AND kelas != ''");
                        while($k = mysqli_fetch_assoc($q_kelas)) {
                            $kelasOption = htmlspecialchars($k['kelas'], ENT_QUOTES, 'UTF-8');
                            $sel = ($filter_kelas == $k['kelas']) ? 'selected' : '';
                            echo "<option value='$kelasOption' $sel>$kelasOption</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label small fw-bold">Tema Masalah</label>
                    <select name="filter_tema" class="form-select form-select-sm">
                        <option value="">-- Semua Tema --</option>
                        <?php
                        $kelompok_res = mysqli_query($conn, "SELECT DISTINCT kelompok FROM tema_masalah");
                        while($k = mysqli_fetch_assoc($kelompok_res)) {
                            $kelompokLabel = htmlspecialchars($k['kelompok'], ENT_QUOTES, 'UTF-8');
                            echo '<optgroup label="'.$kelompokLabel.'">';
                            $tema_res = mysqli_query($conn, "SELECT nama_tema FROM tema_masalah WHERE kelompok='".mysqli_real_escape_string($conn, $k['kelompok'])."'");
                            while($t = mysqli_fetch_assoc($tema_res)) {
                                $selected = ($filter_tema == $t['nama_tema']) ? 'selected' : '';
                                $temaOption = htmlspecialchars($t['nama_tema'], ENT_QUOTES, 'UTF-8');
                                echo '<option value="'.$temaOption.'" '.$selected.'>'.$temaOption.'</option>';
                            }
                            echo '</optgroup>';
                        }
                        ?>
                    </select>
                </div>
                <div class="col-md-2">
                    <label class="form-label small fw-bold">Type Tugas</label>
                    <select name="filter_type" class="form-select form-select-sm">
                        <option value="">-- Semua Type --</option>
                        <?php 
                        $types = ["Table", "Pendahuluan", "Pembahasan", "Kesimpulan", "Lengkap"];
                        foreach($types as $ty) {
                            $sel = ($filter_type == $ty) ? 'selected' : '';
                            echo "<option value='$ty' $sel>$ty</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-sm btn-dark w-100">Filter</button>
                    <a href="admin.php" class="btn btn-sm btn-outline-secondary ms-2">Reset</a>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow-sm border-dark">
        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
            <span>Monitoring Tugas Mahasiswa</span>
            <?php if($filter_kelas != "") echo "<span class='badge bg-info text-dark'>Kelas $filter_kelas</span>"; ?>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-bordered table-hover mb-0">
                    <thead class="table-secondary text-center small">
                        <tr>
                            <th width="50">No</th>
                            <th width="120">NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th width="100">Kelas</th>
                            <th>Daftar Tugas (Format: Tema - Tipe)</th>
                        </tr>
                    </thead>
                    <tbody class="small">
                        <?php
                        $no = 1;
                        
                        // Filter untuk JOIN (Tugas)
                        $filter_join = "";
                        if($filter_tema != "") { $filter_join .= " AND t.tema_masalah = '$filter_tema'"; }
                        if($filter_type != "") { $filter_join .= " AND t.type_tugas = '$filter_type'"; }

                        // Filter untuk WHERE (User/Mahasiswa)
                        $where_user = " WHERE u.role = 'user'";
                        if($filter_kelas != "") { $where_user .= " AND u.kelas = '$filter_kelas'"; }

                        $sql = "SELECT 
                                    u.username, 
                                    u.nama_lengkap,
                                    u.kelas,
                                    GROUP_CONCAT(CONCAT(t.tema_masalah, ' (', t.type_tugas, ')', '::', t.file_upload) SEPARATOR '||') as data_tugas
                                FROM user u
                                LEFT JOIN tugas t ON u.username = t.username $filter_join
                                $where_user
                                GROUP BY u.username
                                ORDER BY u.nama_lengkap ASC";
                        
                        $res = mysqli_query($conn, $sql);
                        while($row = mysqli_fetch_assoc($res)) {
                            echo "<tr>";
                            echo "<td class='text-center'>$no</td>";
                            echo "<td>{$row['username']}</td>";
                            echo "<td>" . strtoupper($row['nama_lengkap']) . "</td>";
                            echo "<td class='text-center'>{$row['kelas']}</td>";
                            echo "<td>";
                            
                            if (!empty($row['data_tugas'])) {
                                $tugas_list = explode('||', $row['data_tugas']);
                                foreach ($tugas_list as $item) {
                                    $detail = explode('::', $item);
                                    $tema_display = $detail[0];
                                    $file_link = $detail[1];
                                    echo "<a href='uploads/$file_link' class='btn btn-xs btn-outline-primary me-1 mb-1 shadow-sm' style='font-size: 11px;' target='_blank'>
                                            <i class='bi bi-file-earmark-arrow-down'></i> $tema_display
                                          </a>";
                                }
                            } else {
                                echo "<span class='text-muted small'><i>Belum ada tugas</i></span>";
                            }
                            echo "</td></tr>";
                            $no++;
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card shadow-sm mt-5 mb-4 border-warning">
        <div class="card-header bg-warning"><strong>Import Mahasiswa (CSV)</strong></div>
        <div class="card-body">
            <p class="small text-muted">Format kolom: <b>NIM; Password; Nama; Kelas</b></p>
            <?php if(isset($msg_import)) echo "<div class='alert alert-success'>$msg_import</div>"; ?>
            <form action="" method="POST" enctype="multipart/form-data" class="row g-2">
                <div class="col-auto"><input type="file" name="file_csv" class="form-control" accept=".csv" required></div>
                <div class="col-auto"><button type="submit" name="import" class="btn btn-dark">Proses Import</button></div>
            </form>
        </div>
    </div>
</div>

<footer class="text-center mt-5 mb-4 text-muted small small">
    &copy; 2026 UNISDA - Dashboard Pak Zainul Hakim
</footer>

</body>
</html>