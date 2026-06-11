/**
 * assets/js/app.js — SPA Router & Bootstrap
 */
const App = (() => {
    let _user = null;

    // ─── Public API ────────────────────────────────────────────────
    async function init() {
        await checkAuth();
        window.addEventListener('hashchange', route);
        route();
    }

    async function checkAuth() {
        try {
            const res = await API.get('auth.php?action=check');
            if (res.success) _user = res.data;
            else _user = null;
        } catch {
            _user = null;
        }
    }

    function getUser() { return _user; }

    function isAdmin() { return _user?.role === 'admin'; }

    async function logout(redirect = true) {
        await API.post('auth.php?action=logout');
        _user = null;
        if (redirect) {
            location.hash = '#login';
        } else {
            renderLogin();
        }
    }

    // ─── Router ────────────────────────────────────────────────────
    function route() {
        if (!_user) {
            renderLogin();
            return;
        }

        const hash  = location.hash || '#';
        const path  = hash.replace(/^#\/?/, '');
        const parts = path.split('/').filter(Boolean);

        if (_user.role === 'admin') {
            routeAdmin(parts);
        } else {
            routeMahasiswa(parts);
        }
    }

    function routeAdmin(parts) {
        const page = parts[0] || 'mahasiswa';
        renderAdminShell(page);

        switch (page) {
            case 'mahasiswa': MahasiswaView.render(); break;
            case 'tugas':
                if (parts[1]) TugasView.renderDetail(parseInt(parts[1]));
                else           TugasView.render();
                break;
            case 'rekap':     RekapView.render(parts[1] ? parseInt(parts[1]) : null); break;
            default:          MahasiswaView.render();
        }
    }

    function routeMahasiswa(parts) {
        const page = parts[0] || 'tugas';
        renderMahasiswaShell();

        switch (page) {
            case 'tugas':
                if (parts[1]) KerjakanView.render(parseInt(parts[1]));
                else           TugasListView.render();
                break;
            default: TugasListView.render();
        }
    }

    // ─── Shell renderers ────────────────────────────────────────────
    function renderLogin() {
        document.getElementById('app').innerHTML = LoginView.html();
        LoginView.bind();
    }

    function renderAdminShell(activePage) {
        const navItems = [
            { key: 'mahasiswa', icon: '👥', label: 'Data Mahasiswa' },
            { key: 'tugas',     icon: '📋', label: 'Data Tugas'     },
            { key: 'rekap',     icon: '📊', label: 'Rekapitulasi'   },
        ];

        const navHtml = navItems.map(n => `
            <button class="nav-item ${activePage === n.key ? 'active' : ''}"
                    onclick="location.hash='#${n.key}'"
                    id="nav-${n.key}">
                <span class="nav-icon">${n.icon}</span> ${n.label}
            </button>
        `).join('');

        document.getElementById('app').innerHTML = `
            <div class="layout">
                <aside class="sidebar">
                    <div class="sidebar-brand">
                        <div class="sidebar-brand-logo">
                            <div class="sidebar-brand-icon">🎓</div>
                            <div class="sidebar-brand-text">
                                <div class="sidebar-brand-name">Portal Tugas</div>
                                <div class="sidebar-brand-sub">Perkuliahan</div>
                            </div>
                        </div>
                    </div>
                    <nav class="sidebar-nav">
                        <div class="nav-section-label">Menu Admin</div>
                        ${navHtml}
                    </nav>
                    <div class="sidebar-footer">
                        <div class="user-info">
                            <div class="user-avatar">👤</div>
                            <div>
                                <div class="user-name">${escHtml(_user.nama)}</div>
                                <div class="user-role">Administrator</div>
                            </div>
                        </div>
                        <button class="btn-logout" onclick="App.logout()">
                            🚪 Logout
                        </button>
                    </div>
                </aside>
                <div class="main-content">
                    <div id="page-container"></div>
                </div>
            </div>
        `;
    }

    function renderMahasiswaShell() {
        // Only render shell once to avoid flickering when switching tabs
        if (document.getElementById('mhs-shell')) return;

        document.getElementById('app').innerHTML = `
            <div id="mhs-shell" class="layout" style="flex-direction:column">
                <header class="mhs-header">
                    <div class="mhs-header-left">
                        <div class="mhs-header-logo">🎓</div>
                        <span class="mhs-header-brand">Portal Tugas</span>
                        ${location.hash !== '#tugas' && location.hash !== '#' && location.hash !== '' ?
                            `<button class="btn btn-secondary btn-sm" onclick="location.hash='#tugas'">← Kembali</button>` : ''}
                    </div>
                    <div class="mhs-header-right">
                        <span class="mhs-header-user" title="${escHtml(_user.nama)}">👋 ${escHtml(_user.nama)}</span>
                        <button class="btn btn-danger btn-sm" onclick="App.logout()">Logout</button>
                    </div>
                </header>
                <div id="page-container" style="flex:1"></div>
            </div>
        `;
    }

    return { init, checkAuth, getUser, isAdmin, logout, route, renderMahasiswaShell };
})();

// ─── Bootstrap ─────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => App.init());
