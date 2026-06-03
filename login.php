<?php
session_start();
include 'koneksi.php';

if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Pastikan query mengambil kolom role (atau rule)
    $query = mysqli_query($conn, "SELECT * FROM user WHERE username='$username' AND password='$password'");
    
    if (mysqli_num_rows($query) > 0) {
        $data = mysqli_fetch_assoc($query);
        
        // Set session
        $_SESSION['status']   = "login";
        $_SESSION['username'] = $data['username'];
        $_SESSION['role']     = $data['role']; // Simpan role di session

        // Logika Pengalihan Berdasarkan Role
        if ($data['role'] == 'admin') {
            header("location:admin.php");
        } else {
            header("location:index.php");
        }
        exit(); // Penting untuk menghentikan eksekusi script setelah redirect
    } else {
        $error = "Username atau Password salah!";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f7f6; }
        .login-card { max-width: 400px; margin-top: 100px; border-radius: 15px; }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="card login-card shadow-lg w-100">
            <div class="card-body p-5">
                <h3 class="text-center mb-4">Login</h3>
                <?php if(isset($error)) echo "<div class='alert alert-danger'>$error</div>"; ?>
                <form method="POST">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Masukkan Username" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Masukkan Password" required>
                    </div>
                    <button type="submit" name="login" class="btn btn-primary w-100">Masuk Sekarang</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>