/**
 * assets/js/views/admin/MahasiswaView.js
 * Admin — Data Mahasiswa (tabel, import Excel, edit, delete)
 */
const MahasiswaView = {
    _data: [],
    _currentPage: 1,
    _itemsPerPage: 10,

    async render() {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div class="page-header">
                <h1 class="page-title">👥 Data Mahasiswa</h1>
                <p class="page-subtitle">Kelola daftar mahasiswa — tambah, edit, hapus, atau import dari Excel.</p>
            </div>
            <div class="page-body">
                <div id="mhs-stats" class="stats-row"></div>
                <div class="card">
                    <div class="card-header">
                        <span class="card-title">Daftar Mahasiswa</span>
                        <div class="flex gap-2 flex-wrap">
                            <button class="btn btn-secondary" onclick="MahasiswaView.openImport()" id="btn-import">
                                📥 Import Excel
                            </button>
                            <button class="btn btn-primary" onclick="MahasiswaView.openAdd()" id="btn-add">
                                ➕ Tambah Mahasiswa
                            </button>
                        </div>
                    </div>
                    <div class="table-wrap">
                        <div id="mhs-table-wrap">
                            <div class="app-loader" style="height:200px">
                                <div class="loader-ring"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>`;
        await this.loadData();
    },

    async loadData() {
        const res = await API.get('mahasiswa.php');
        if (!res.success) { Toast.show(res.message, 'error'); return; }
        this._data = res.data || [];
        this._currentPage = 1;
        this.renderTable();
        this.renderStats();
    },

    renderStats() {
        const klases = [...new Set(this._data.map(m => m.kelas).filter(Boolean))];
        document.getElementById('mhs-stats').innerHTML = `
            <div class="stat-card">
                <div class="stat-label">Total Mahasiswa</div>
                <div class="stat-value">${this._data.length}</div>
                <div class="stat-sub">terdaftar</div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Jumlah Kelas</div>
                <div class="stat-value">${klases.length}</div>
                <div class="stat-sub">${klases.join(', ') || '—'}</div>
            </div>`;
    },

    renderTable() {
        const wrap = document.getElementById('mhs-table-wrap');
        if (!this._data.length) {
            wrap.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">👥</div>
                <div class="empty-state-title">Belum ada mahasiswa</div>
                <div class="empty-state-desc">Tambah manual atau import dari file Excel (.xlsx)</div>
            </div>`;
            return;
        }

        const totalPages = Math.ceil(this._data.length / this._itemsPerPage);
        if (this._currentPage > totalPages) this._currentPage = totalPages;
        
        const start = (this._currentPage - 1) * this._itemsPerPage;
        const end = start + this._itemsPerPage;
        const pagedData = this._data.slice(start, end);

        const rows = pagedData.map((m, i) => `
            <tr>
                <td style="color:var(--text-muted);font-size:12px">${start + i + 1}</td>
                <td><strong>${escHtml(m.username)}</strong></td>
                <td>${escHtml(m.nama)}</td>
                <td>
                    ${m.kelas
                        ? `<span class="badge badge-primary">${escHtml(m.kelas)}</span>`
                        : `<span class="text-muted text-sm">—</span>`}
                </td>
                <td>
                    <div class="td-actions">
                        <button class="btn btn-secondary btn-sm btn-icon"
                                title="Edit" onclick="MahasiswaView.openEdit(${m.id})">✏️</button>
                        <button class="btn btn-danger btn-sm btn-icon"
                                title="Hapus" onclick="MahasiswaView.confirmDelete(${m.id},'${escHtml(m.nama)}')">🗑️</button>
                    </div>
                </td>
            </tr>`).join('');

        let paginationHtml = '';
        if (totalPages > 1) {
            paginationHtml = `
            <div style="display:flex;justify-content:space-between;align-items:center;padding:16px 0;border-top:1px solid var(--border);margin-top:16px;">
                <div style="font-size:13px;color:var(--text-muted)">
                    Menampilkan ${start + 1} - ${Math.min(end, this._data.length)} dari ${this._data.length} mahasiswa
                </div>
                <div style="display:flex;gap:4px">
                    <button class="btn btn-secondary btn-sm" ${this._currentPage === 1 ? 'disabled' : ''} onclick="MahasiswaView.goToPage(${this._currentPage - 1})">← Prev</button>
                    <span style="display:flex;align-items:center;padding:0 12px;font-size:13px;font-weight:600">${this._currentPage} / ${totalPages}</span>
                    <button class="btn btn-secondary btn-sm" ${this._currentPage === totalPages ? 'disabled' : ''} onclick="MahasiswaView.goToPage(${this._currentPage + 1})">Next →</button>
                </div>
            </div>`;
        }

        wrap.innerHTML = `
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>NIM</th>
                        <th>Nama</th>
                        <th>Kelas</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>${rows}</tbody>
            </table>
            ${paginationHtml}`;
    },

    goToPage(page) {
        this._currentPage = page;
        this.renderTable();
    },

    // ─── Tambah ──────────────────────────────────────────────────────
    openAdd() {
        Modal.open('➕ Tambah Mahasiswa',
            `<div class="form-group">
                <label class="form-label">NIM <span style="color:var(--danger)">*</span></label>
                <input id="f-nim" class="form-control" placeholder="Contoh: 20210001">
                <div class="form-hint">Password default = NIM</div>
            </div>
            <div class="form-group">
                <label class="form-label">Nama Lengkap <span style="color:var(--danger)">*</span></label>
                <input id="f-nama" class="form-control" placeholder="Contoh: Budi Santoso">
            </div>
            <div class="form-group">
                <label class="form-label">Kelas</label>
                <input id="f-kelas" class="form-control" placeholder="Contoh: A">
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-mhs">Simpan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-mhs').addEventListener('click', () => this.doAdd());
            document.getElementById('f-nim').focus();
        }, 0);
    },

    async doAdd() {
        const btn = document.getElementById('btn-save-mhs');
        const nim   = document.getElementById('f-nim').value.trim();
        const nama  = document.getElementById('f-nama').value.trim();
        const kelas = document.getElementById('f-kelas').value.trim();
        if (!nim || !nama) { Toast.show('NIM dan nama wajib diisi', 'warning'); return; }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.post('mahasiswa.php', { nim, nama, kelas });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.loadData();
        } else {
            Toast.show(res.message, 'error');
        }
    },

    // ─── Edit ────────────────────────────────────────────────────────
    openEdit(id) {
        const m = this._data.find(x => x.id == id);
        if (!m) return;
        Modal.open('✏️ Edit Mahasiswa',
            `<div class="form-group">
                <label class="form-label">NIM</label>
                <input id="f-nim" class="form-control" value="${escHtml(m.username)}">
            </div>
            <div class="form-group">
                <label class="form-label">Nama Lengkap</label>
                <input id="f-nama" class="form-control" value="${escHtml(m.nama)}">
            </div>
            <div class="form-group">
                <label class="form-label">Kelas</label>
                <input id="f-kelas" class="form-control" value="${escHtml(m.kelas || '')}">
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-edit">Simpan Perubahan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-edit').addEventListener('click', () => this.doEdit(id));
        }, 0);
    },

    async doEdit(id) {
        const btn   = document.getElementById('btn-save-edit');
        const nim   = document.getElementById('f-nim').value.trim();
        const nama  = document.getElementById('f-nama').value.trim();
        const kelas = document.getElementById('f-kelas').value.trim();
        if (!nim || !nama) { Toast.show('NIM dan nama wajib diisi', 'warning'); return; }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.put(`mahasiswa.php?id=${id}`, { nim, nama, kelas });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.loadData();
        } else {
            Toast.show(res.message, 'error');
        }
    },

    // ─── Hapus ───────────────────────────────────────────────────────
    confirmDelete(id, nama) {
        Modal.confirm(
            `Hapus mahasiswa <strong>${escHtml(nama)}</strong>? Semua jawaban akan ikut terhapus.`,
            async () => {
                const res = await API.delete(`mahasiswa.php?id=${id}`);
                if (res.success) {
                    Toast.show(res.message, 'success');
                    await this.loadData();
                } else {
                    Toast.show(res.message, 'error');
                }
            }
        );
    },

    // ─── Import Excel ────────────────────────────────────────────────
    openImport() {
        Modal.open('📥 Import Mahasiswa dari Excel',
            `<div style="text-align: right; margin-bottom: 12px;">
                <a href="Template_Mahasiswa.csv" download class="btn btn-secondary btn-sm" style="text-decoration: none; display: inline-block;">⬇️ Download Template (.csv)</a>
            </div>
            <div class="dropzone" id="dropzone" onclick="document.getElementById('excel-file-input').click()">
                <div class="dropzone-icon">📊</div>
                <div class="dropzone-label">Klik atau seret file Excel ke sini</div>
                <div class="dropzone-hint">Format: .xlsx atau .csv — Kolom wajib: <strong>id (NIM)</strong>, <strong>nama</strong>, <strong>kelas</strong></div>
            </div>
            <input type="file" id="excel-file-input" accept=".xlsx,.xls,.csv">
            <div id="import-preview"></div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary hidden" id="btn-do-import">📥 Import Sekarang</button>`
        );
        setTimeout(() => this.bindImport(), 0);
    },

    bindImport() {
        let parsedData = [];

        const fileInput = document.getElementById('excel-file-input');
        const dropzone  = document.getElementById('dropzone');

        const processFile = (file) => {
            if (!file) return;
            const reader = new FileReader();
            reader.onload = (e) => {
                try {
                    const wb   = XLSX.read(e.target.result, { type: 'binary' });
                    const ws   = wb.Sheets[wb.SheetNames[0]];
                    const rows = XLSX.utils.sheet_to_json(ws, { defval: '' });
                    parsedData = rows;
                    this.showImportPreview(rows);
                    document.getElementById('btn-do-import').classList.remove('hidden');
                } catch (err) {
                    Toast.show('Gagal membaca file Excel: ' + err.message, 'error');
                }
            };
            reader.readAsBinaryString(file);
        };

        fileInput.addEventListener('change', (e) => processFile(e.target.files[0]));

        dropzone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropzone.classList.add('drag-over');
        });
        dropzone.addEventListener('dragleave', () => dropzone.classList.remove('drag-over'));
        dropzone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropzone.classList.remove('drag-over');
            processFile(e.dataTransfer.files[0]);
        });

        document.getElementById('btn-do-import').addEventListener('click', async () => {
            if (!parsedData.length) return;
            const btn = document.getElementById('btn-do-import');
            setLoading(btn, true, 'Mengimport…');
            const res = await API.post('mahasiswa.php?action=import', { students: parsedData });
            setLoading(btn, false);
            if (res.success) {
                Modal.close();
                Toast.show(res.message, 'success');
                await this.loadData();
            } else {
                Toast.show(res.message, 'error');
            }
        });
    },

    showImportPreview(rows) {
        const preview = document.getElementById('import-preview');
        if (!rows.length) {
            preview.innerHTML = `<p class="text-muted text-sm mt-3">Tidak ada data ditemukan.</p>`;
            return;
        }
        const sample = rows.slice(0, 5);
        preview.innerHTML = `
            <div class="import-preview mt-3">
                <div class="import-preview-header">
                    📋 Preview — ${rows.length} baris ditemukan
                    ${rows.length > 5 ? `(menampilkan 5 pertama)` : ''}
                </div>
                <div class="table-wrap">
                    <table>
                        <thead><tr><th>ID/NIM</th><th>Nama</th><th>Kelas</th></tr></thead>
                        <tbody>
                            ${sample.map(r => `
                                <tr>
                                    <td>${escHtml(String(r.id ?? r.nim ?? ''))}</td>
                                    <td>${escHtml(String(r.nama ?? ''))}</td>
                                    <td>${escHtml(String(r.kelas ?? ''))}</td>
                                </tr>`).join('')}
                        </tbody>
                    </table>
                </div>
            </div>`;
    },
};
