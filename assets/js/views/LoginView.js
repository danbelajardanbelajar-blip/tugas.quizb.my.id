/**
 * assets/js/views/LoginView.js
 */
const LoginView = {
    html() {
        return `
        <div class="login-page">
            <div class="login-box">
                <div class="login-logo">🎓</div>
                <h1 class="login-title">Portal Tugas</h1>
                <p class="login-subtitle">Masuk untuk mengakses sistem tugas perkuliahan</p>

                <div id="login-error" class="login-error"></div>

                <form id="login-form">
                    <div class="form-group">
                        <label class="form-label" for="login-username">Username / NIM</label>
                        <input id="login-username" type="text" class="form-control"
                               placeholder="Masukkan username atau NIM" autocomplete="username" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="login-password">Password</label>
                        <input id="login-password" type="password" class="form-control"
                               placeholder="Masukkan password" autocomplete="current-password" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-full btn-lg" id="login-btn" style="margin-top:8px">
                        🔐 Masuk
                    </button>
                </form>

                <p style="text-align:center;margin-top:20px;font-size:12px;color:var(--text-muted)">
                    Admin: <strong>admin</strong> / <strong>admin123</strong><br>
                    Mahasiswa: NIM sebagai username &amp; password
                </p>
            </div>
        </div>`;
    },

    bind() {
        const form = document.getElementById('login-form');
        const errEl = document.getElementById('login-error');
        const btn   = document.getElementById('login-btn');

        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            errEl.style.display = 'none';
            setLoading(btn, true, 'Masuk…');

            const res = await API.post('auth.php?action=login', {
                username: document.getElementById('login-username').value.trim(),
                password: document.getElementById('login-password').value,
            });

            setLoading(btn, false);

            if (res.success) {
                // Reload app state
                await App.checkAuth?.();
                location.hash = res.data.role === 'admin' ? '#mahasiswa' : '#tugas';
                App.route();
            } else {
                errEl.textContent = res.message;
                errEl.style.display = 'block';
            }
        });

        // Enter key shortcut
        document.getElementById('login-username')?.focus();
    },
};
