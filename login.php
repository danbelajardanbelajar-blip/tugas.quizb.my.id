<?php
session_start();
include 'koneksi.php';

if (isset($_POST['login'])) {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    $stmt = mysqli_prepare($conn, "SELECT username, role FROM user WHERE username = ? AND password = ?");
    mysqli_stmt_bind_param($stmt, 'ss', $username, $password);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result && mysqli_num_rows($result) > 0) {
        $data = mysqli_fetch_assoc($result);
        session_regenerate_id(true);

        $_SESSION['status']   = "login";
        $_SESSION['username'] = $data['username'];
        $_SESSION['role']     = $data['role'];

        if ($data['role'] == 'admin') {
            header("location:admin.php");
        } else {
            header("location:index.php");
        }
        exit();
    } else {
        $error = "Username atau Password salah!";
    }
    mysqli_stmt_close($stmt);
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