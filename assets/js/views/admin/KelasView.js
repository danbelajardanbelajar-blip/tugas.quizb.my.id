/**
 * assets/js/views/admin/KelasView.js
 */
const KelasView = (() => {
    let _kelas = [];

    async function fetchKelas() {
        showLoader();
        try {
            const res = await API.get('kelas.php?action=list');
            if (res.success) {
                _kelas = res.data || [];
                renderTable();
            } else {
                _kelas = [];
                renderTable();
                showToast(res.message, 'error');
            }
        } catch (e) {
            _kelas = [];
            renderTable();
            showToast('Gagal memuat data kelas', 'error');
        } finally {
            hideLoader();
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
        const title = id ? 'Edit Kelas' : 'Tambah Kelas';
        const html = `
            <div class="modal-header">
                <h3>${title}</h3>
                <button class="btn-close" onclick="closeModal()">×</button>
            </div>
            <div class="modal-body">
                <form id="form-kelas" onsubmit="event.preventDefault(); KelasView.saveKelas(${id || 'null'});">
                    <div class="form-group">
                        <label>Nama Kelas</label>
                        <input type="text" id="kelas-nama" class="form-control" value="${kelas ? escHtml(kelas.nama) : ''}" required>
                    </div>
                    <div style="text-align:right; margin-top:1rem;">
                        <button type="button" class="btn btn-secondary" onclick="closeModal()">Batal</button>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        `;
        showModal(html);
        document.getElementById('kelas-nama').focus();
    }

    async function saveKelas(id) {
        const nama = document.getElementById('kelas-nama').value.trim();
        if (!nama) return;

        const action = id ? 'update' : 'create';
        const payload = id ? { id, nama } : { nama };

        try {
            const res = await API.post('kelas.php?action=' + action, payload);
            if (res.success) {
                showToast(res.message, 'success');
                closeModal();
                fetchKelas();
            } else {
                showToast(res.message, 'error');
            }
        } catch (e) {
            showToast('Gagal menyimpan kelas', 'error');
        }
    }

    async function deleteKelas(id) {
        if (!confirm('Yakin ingin menghapus kelas ini?')) return;
        try {
            const res = await API.post('kelas.php?action=delete', { id });
            if (res.success) {
                showToast(res.message, 'success');
                fetchKelas();
            } else {
                showToast(res.message, 'error');
            }
        } catch (e) {
            showToast('Gagal menghapus kelas', 'error');
        }
    }

    return { render, showFormModal, saveKelas, deleteKelas };
})();
