<?php
session_start();

// Proteksi: Jika belum login, tendang ke login.php
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login") {
    header("location:login.php");
    exit();
}

// Konfigurasi Database
$host = 'localhost';
$user = 'quic1934_zenhkm';
$pass = '03Maret1990';
$db   = 'quic1934_tugas';

// Membuat koneksi
$conn = new mysqli($host, $user, $pass, $db);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi Database Gagal: " . $conn->connect_error);
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

// Mengambil Daftar Soal dari Database agar dinamis
$daftar_soal = [];
$ambil_soal = $conn->query("SELECT * FROM tb_daftar_soal ORDER BY id ASC");
if ($ambil_soal) {
    while ($row = $ambil_soal->fetch_assoc()) {
        $daftar_soal[$row['id']] = $row['teks_soal'];
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas Analisis Fiqih - Bayi Tabung</title>
    <style>
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
    <h2>Tugas Analisis Hukum Bayi Tabung</h2>
    <div class="user-info">
        👤 Dikerjakan oleh: <?= htmlspecialchars($nama); ?>
    </div>
    
    <?= $pesan; ?>

    <form action="" method="post" id="formSoal">
        <?php foreach ($daftar_soal as $nomor => $soal) : ?>
            <div class="form-group">
                <label><?= $nomor . ". " . $soal ?></label>
                <textarea 
                    name="jawaban_<?= $nomor ?>" 
                    class="soal-textarea"
                    required 
                    autocomplete="off"
                    oncopy="return false;" 
                    oncut="return false;" 
                    onpaste="return false;" 
                    ondrop="return false;"
                    placeholder="Ketik jawaban di sini..."
                ><?= htmlspecialchars($data_tersimpan[$nomor]); ?></textarea>
            </div>
        <?php endforeach; ?>

        <button type="submit" name="submit" class="btn-submit">Selesai & Kumpulkan Tugas</button>
        <a href="index.php" style="display: block; text-align: center; margin-top: 15px; color: #7f8c8d; text-decoration: none;">Kembali ke Dashboard</a>
    </form>
</div>

<!-- Script AJAX untuk Silent Autosave -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const textareas = document.querySelectorAll('.soal-textarea');
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