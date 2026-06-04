<?php
session_start();

// Proteksi: Jika belum login, tendang ke login.php
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login") {
    header("location:login.php");
    exit();
}

include 'koneksi.php';

if (!$conn) {
    die("Koneksi Database Gagal: " . mysqli_connect_error());
}

// Ambil nama dari session
$nama = $_SESSION['username'];
$pesan = "";

// PROSES FORM (Baik untuk Autosave via AJAX maupun Submit tombol)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // Menyiapkan array jawaban
    $j = [];
    for ($i = 1; $i <= 17; $i++) {
        $j[$i] = isset($_POST['jawaban_' . $i]) ? $_POST['jawaban_' . $i] : '';
    }

    // Cek apakah mahasiswa ini sudah pernah menyimpan (autosave/submit) sebelumnya
    $cek_user = $conn->prepare("SELECT id FROM tb_soal WHERE nama_mahasiswa = ?");
    $cek_user->bind_param("s", $nama);
    $cek_user->execute();
    $hasil_cek = $cek_user->get_result();

    if ($hasil_cek->num_rows > 0) {
        // Jika sudah ada, lakukan UPDATE (agar tidak ada data ganda)
        $sql = "UPDATE tb_soal SET 
                jawaban_1=?, jawaban_2=?, jawaban_3=?, jawaban_4=?, jawaban_5=?, 
                jawaban_6=?, jawaban_7=?, jawaban_8=?, jawaban_9=?, jawaban_10=?, 
                jawaban_11=?, jawaban_12=?, jawaban_13=?, jawaban_14=?, jawaban_15=?, 
                jawaban_16=?, jawaban_17=?, waktu_submit=CURRENT_TIMESTAMP
                WHERE nama_mahasiswa=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param(
            "ssssssssssssssssss", 
            $j[1], $j[2], $j[3], $j[4], $j[5], $j[6], $j[7], $j[8], $j[9], 
            $j[10], $j[11], $j[12], $j[13], $j[14], $j[15], $j[16], $j[17], $nama
        );
    } else {
        // Jika belum ada, lakukan INSERT
        $sql = "INSERT INTO tb_soal (
                    nama_mahasiswa, jawaban_1, jawaban_2, jawaban_3, jawaban_4, jawaban_5, 
                    jawaban_6, jawaban_7, jawaban_8, jawaban_9, jawaban_10, jawaban_11, 
                    jawaban_12, jawaban_13, jawaban_14, jawaban_15, jawaban_16, jawaban_17
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param(
            "ssssssssssssssssss", 
            $nama, $j[1], $j[2], $j[3], $j[4], $j[5], $j[6], $j[7], $j[8], $j[9], 
            $j[10], $j[11], $j[12], $j[13], $j[14], $j[15], $j[16], $j[17]
        );
    }

    $stmt->execute();
    $stmt->close();

    // Jika ini adalah request dari Autosave (AJAX), hentikan script dan beri respon text
    if (isset($_POST['is_autosave'])) {
        echo "sukses";
        exit(); // Sangat penting agar tidak memuat ulang UI HTML saat autosave
    } else {
        // Jika ini submit dari tombol akhir
        $pesan = "<div class='alert success'>Tugas final berhasil dikumpulkan!</div>";
    }
}

// MENGAMBIL DATA YANG SUDAH TERSIMPAN (Untuk mencegah hilang saat refresh)
$data_tersimpan = array_fill(1, 17, "");
$ambil_data = $conn->prepare("SELECT * FROM tb_soal WHERE nama_mahasiswa = ?");
$ambil_data->bind_param("s", $nama);
$ambil_data->execute();
$hasil_data = $ambil_data->get_result();

if ($hasil_data->num_rows > 0) {
    $baris = $hasil_data->fetch_assoc();
    for ($i = 1; $i <= 17; $i++) {
        $data_tersimpan[$i] = $baris['jawaban_' . $i];
    }
}
$ambil_data->close();

// Ambil parameter tema dari URL
$tema_id_param  = isset($_GET['tema']) ? intval($_GET['tema']) : 0;
$nama_tema_soal = 'Analisis Hukum Fiqih'; // default

if ($tema_id_param > 0) {
    $res_tema = $conn->query("SELECT nama_tema FROM tema_masalah WHERE id_tema = $tema_id_param");
    if ($res_tema && $res_tema->num_rows > 0) {
        $nama_tema_soal = $res_tema->fetch_assoc()['nama_tema'];
    }
}

// Mengambil Daftar Soal dari Database (filter by tema jika ada)
$daftar_soal = [];
if ($tema_id_param > 0) {
    $ambil_soal = $conn->query("SELECT * FROM tb_daftar_soal WHERE tema_id = $tema_id_param ORDER BY id ASC");
} else {
    $ambil_soal = $conn->query("SELECT * FROM tb_daftar_soal ORDER BY id ASC");
}
if ($ambil_soal) {
    $soal_no = 1;
    while ($row = $ambil_soal->fetch_assoc()) {
        $daftar_soal[$row['id']] = ['teks' => $row['teks_soal'], 'no' => $soal_no++];
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($nama_tema_soal, ENT_QUOTES, 'UTF-8'); ?> - Mashailul Fiqhiyah</title>
    <style>
        /* ====== ANTI COPY-PASTE GLOBAL ====== */
        * {
            -webkit-user-select: none !important;
            -moz-user-select: none !important;
            -ms-user-select: none !important;
            user-select: none !important;
            -webkit-touch-callout: none !important; /* Blokir long-press menu di iOS */
        }
        /* Textarea tetap bisa diketik, tapi tidak bisa select-all / copy / paste */
        textarea {
            -webkit-user-select: text !important;
            -moz-user-select: text !important;
            -ms-user-select: text !important;
            user-select: text !important;
        }
        /* ====================================== */

        body { font-family: Arial, sans-serif; background-color: #f4f7f6; color: #333; line-height: 1.6; padding: 20px; }
        .container { max-width: 800px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); position: relative;}
        h2 { text-align: center; color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; margin-bottom: 20px;}
        .form-group { margin-bottom: 20px; }
        label { font-weight: bold; display: block; margin-bottom: 8px; color: #2c3e50; }
        textarea { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; font-family: inherit; height: 100px; resize: vertical; }
        textarea:focus { border-color: #3498db; outline: none; box-shadow: 0 0 5px rgba(52, 152, 219, 0.3); }
        .btn-submit { display: block; width: 100%; background: #3498db; color: #fff; border: none; padding: 15px; font-size: 16px; border-radius: 4px; cursor: pointer; font-weight: bold; transition: background 0.3s;}
        .btn-submit:hover { background: #2980b9; }
        .alert { padding: 15px; margin-bottom: 20px; border-radius: 4px; font-weight: bold; }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .user-info { background: #e8f4f8; padding: 10px 15px; border-radius: 5px; margin-bottom: 20px; border-left: 5px solid #3498db; font-weight: bold;}
    </style>
</head>
<body>

<div class="container">
    <h2><?= htmlspecialchars($nama_tema_soal, ENT_QUOTES, 'UTF-8'); ?></h2>
    <div class="user-info">
        👤 Dikerjakan oleh: <?= htmlspecialchars($nama); ?>
    </div>
    
    <?= $pesan; ?>

    <form action="" method="post" id="formSoal">
        <?php if (empty($daftar_soal)): ?>
            <div style="text-align:center; padding:2rem; color:#7f8c8d;">
                <p>Belum ada soal untuk tema ini.</p>
                <a href="index.php" style="color:#3498db;">Kembali ke Dashboard</a>
            </div>
        <?php else: ?>
        <?php foreach ($daftar_soal as $soal_id => $soal_data): ?>
            <div class="form-group">
                <label><?= $soal_data['no'] . ". " . htmlspecialchars($soal_data['teks'], ENT_QUOTES, 'UTF-8'); ?></label>
                <textarea
                    name="jawaban_<?= $soal_id ?>"
                    class="soal-textarea"
                    required
                    autocomplete="off"
                    oncopy="return false;"
                    oncut="return false;"
                    onpaste="return false;"
                    ondrop="return false;"
                    placeholder="Ketik jawaban di sini..."
                ><?= htmlspecialchars($data_tersimpan[$soal_id] ?? ''); ?></textarea>
            </div>
        <?php endforeach; ?>
        <?php endif; ?>

        <button type="submit" name="submit" class="btn-submit">Selesai & Kumpulkan Tugas</button>
        <a href="index.php" style="display: block; text-align: center; margin-top: 15px; color: #7f8c8d; text-decoration: none;">Kembali ke Dashboard</a>
    </form>
</div>

<!-- Script AJAX untuk Silent Autosave -->
<script>
    document.addEventListener("DOMContentLoaded", function() {

        // ============================================================
        // PROTEKSI COPY-PASTE MENYELURUH (Desktop & HP)
        // ============================================================

        // 1. Blokir klik kanan (context menu) di seluruh halaman
        document.addEventListener('contextmenu', function(e) {
            e.preventDefault();
            return false;
        });

        // 2. Blokir event copy, cut, paste di seluruh halaman
        document.addEventListener('copy',  function(e) { e.preventDefault(); return false; });
        document.addEventListener('cut',   function(e) { e.preventDefault(); return false; });
        document.addEventListener('paste', function(e) { e.preventDefault(); return false; });

        // 3. Blokir shortcut keyboard berbahaya (Ctrl+C, Ctrl+V, Ctrl+X, Ctrl+A)
        document.addEventListener('keydown', function(e) {
            const key = e.key.toLowerCase();
            if (e.ctrlKey || e.metaKey) { // metaKey untuk Mac/iPhone keyboard
                if (['c', 'v', 'x', 'a'].includes(key)) {
                    e.preventDefault();
                    return false;
                }
            }
        });

        // 4. Blokir drag & drop teks ke dalam textarea
        document.addEventListener('dragstart', function(e) {
            e.preventDefault();
            return false;
        });
        document.addEventListener('drop', function(e) {
            e.preventDefault();
            return false;
        });

        // 5. Blokir paste khusus di setiap textarea (lapisan ganda)
        const textareas = document.querySelectorAll('.soal-textarea');
        textareas.forEach(function(textarea) {
            textarea.addEventListener('paste', function(e) {
                e.preventDefault();
                return false;
            });
            textarea.addEventListener('copy', function(e) {
                e.preventDefault();
                return false;
            });
            textarea.addEventListener('cut', function(e) {
                e.preventDefault();
                return false;
            });
            textarea.addEventListener('drop', function(e) {
                e.preventDefault();
                return false;
            });
            // Blokir klik kanan di textarea juga
            textarea.addEventListener('contextmenu', function(e) {
                e.preventDefault();
                return false;
            });
        });

        // ============================================================
        // AUTOSAVE SILENT (AJAX)
        // ============================================================
        const form = document.getElementById('formSoal');

        // Trigger autosave ketika kursor keluar (blur/pindah) dari textarea
        textareas.forEach(textarea => {
            textarea.addEventListener('blur', function() {
                jalankanAutosave();
            });
        });

        function jalankanAutosave() {
            // Ambil semua data form
            const formData = new FormData(form);
            formData.append('is_autosave', 'true'); // Penanda bahwa ini AJAX request

            // Kirim ke server secara diam-diam
            fetch('', { 
                method: 'POST',
                body: formData
            }).catch(error => {
                // Error diredam (silent fail) agar tidak mengganggu UI mahasiswa
                console.error("Autosave gagal: ", error);
            });
        }
    });
</script>

</body>
</html>