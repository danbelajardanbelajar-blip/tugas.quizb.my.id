/**
 * assets/js/views/admin/KelasView.js
 */
const KelasView = (() => {
    let _kelas = [];

    async function fetchKelas() {
        try {
            const res = await API.get('kelas.php?action=list');
            if (res.success) {
                _kelas = res.data || [];
                renderTable();
            } else {
                _kelas = [];
                renderTable();
                Toast.show(res.message, 'error');
            }
        } catch (e) {
            _kelas = [];
            renderTable();
            Toast.show('Gagal memuat data kelas', 'error');
        }
    }

    function render() {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div class="card">
                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:1rem;">
                    <h2>Kelola Kelas</h2>
                    <button class="btn btn-primary" onclick="KelasView.showFormModal()">+ Tambah Kelas</button>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Kelas</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="tbody-kelas">
                            <tr><td colspan="3" class="text-center">Memuat...</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        `;
        fetchKelas();
    }

    function renderTable() {
        const tbody = document.getElementById('tbody-kelas');
        if (!_kelas.length) {
            tbody.innerHTML = '<tr><td colspan="3" class="text-center text-muted">Belum ada kelas</td></tr>';
            return;
        }

        tbody.innerHTML = _kelas.map((k, i) => `
            <tr>
                <td>${i + 1}</td>
                <td>${escHtml(k.nama)}</td>
                <td>
                    <button class="btn btn-sm btn-secondary" onclick="KelasView.showFormModal(${k.id})">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="KelasView.deleteKelas(${k.id})">Hapus</button>
                </td>
            </tr>
        `).join('');
    }

    function showFormModal(id = null) {
        const kelas = id ? _kelas.find(k => k.id === id) : null;
        const title = id ? '✏️ Edit Kelas' : '➕ Tambah Kelas';
        const bodyHTML = `
            <div class="form-group">
                <label class="form-label">Nama Kelas</label>
                <input type="text" id="kelas-nama" class="form-control" value="${kelas ? escHtml(kelas.nama) : ''}">
            </div>
        `;
        const footerHTML = `
            <button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
            <button class="btn btn-primary" id="btn-save-kelas">Simpan</button>
        `;
        
        Modal.open(title, bodyHTML, footerHTML);
        setTimeout(() => {
            document.getElementById('btn-save-kelas').addEventListener('click', () => saveKelas(id));
            document.getElementById('kelas-nama').focus();
        }, 0);
    }

    async function saveKelas(id) {
        const btn = document.getElementById('btn-save-kelas');
        const nama = document.getElementById('kelas-nama').value.trim();
        if (!nama) {
            Toast.show('Nama kelas wajib diisi', 'warning');
            return;
        }

        const action = id ? 'update' : 'create';
        const payload = id ? { id, nama } : { nama };

        setLoading(btn, true, 'Menyimpan…');
        try {
            const res = await API.post('kelas.php?action=' + action, payload);
            setLoading(btn, false);
            if (res.success) {
                Toast.show(res.message, 'success');
                Modal.close();
                fetchKelas();
            } else {
                Toast.show(res.message, 'error');
            }
        } catch (e) {
            setLoading(btn, false);
            Toast.show('Gagal menyimpan kelas', 'error');
        }
    }

    function deleteKelas(id) {
        const kelas = _kelas.find(k => k.id === id);
        if (!kelas) return;
        
        Modal.confirm(
            `Hapus kelas <strong>${escHtml(kelas.nama)}</strong>?`,
            async () => {
                try {
                    const res = await API.post('kelas.php?action=delete', { id });
                    if (res.success) {
                        Toast.show(res.message, 'success');
                        fetchKelas();
                    } else {
                        Toast.show(res.message, 'error');
                    }
                } catch (e) {
                    Toast.show('Gagal menghapus kelas', 'error');
                }
            }
        );
    }

    return { render, showFormModal, saveKelas, deleteKelas };
})();
