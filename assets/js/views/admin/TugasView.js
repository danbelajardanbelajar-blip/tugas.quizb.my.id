/**
 * assets/js/views/admin/TugasView.js
 * Admin — Data Tugas (CRUD tugas + tema accordion + soal form)
 */
const TugasView = {
    _tugasList: [],
    _currentTugas: null,

    // ──────────────────────────────────────────────────────────────
    // LIST VIEW
    // ──────────────────────────────────────────────────────────────
    async render() {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div class="page-header">
                <h1 class="page-title">📋 Data Tugas</h1>
                <p class="page-subtitle">Buat dan kelola tugas, tema, dan soal uraian.</p>
            </div>
            <div class="page-body">
                <div class="card">
                    <div class="card-header">
                        <span class="card-title">Daftar Tugas</span>
                        <button class="btn btn-primary" onclick="TugasView.openAddTugas()">
                            ➕ Buat Tugas Baru
                        </button>
                    </div>
                    <div id="tugas-list-wrap">
                        <div class="app-loader" style="height:200px">
                            <div class="loader-ring"></div>
                        </div>
                    </div>
                </div>
            </div>`;
        await this.loadList();
    },

    async loadList() {
        const res = await API.get('tugas.php');
        if (!res.success) { Toast.show(res.message, 'error'); return; }
        this._tugasList = res.data || [];
        this.renderList();
    },

    renderList() {
        const wrap = document.getElementById('tugas-list-wrap');
        if (!this._tugasList.length) {
            wrap.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">📋</div>
                <div class="empty-state-title">Belum ada tugas</div>
                <div class="empty-state-desc">Klik "Buat Tugas Baru" untuk mulai</div>
            </div>`;
            return;
        }

        const rows = this._tugasList.map((t, i) => `
            <tr>
                <td style="color:var(--text-muted);font-size:12px">${i + 1}</td>
                <td>
                    <div style="font-weight:600">${escHtml(t.judul)}</div>
                    ${t.deskripsi ? `<div style="font-size:12px;color:var(--text-muted);margin-top:2px">${escHtml(t.deskripsi).substring(0, 60)}${t.deskripsi.length > 60 ? '…' : ''}</div>` : ''}
                </td>
                <td>${deadlineBadge(t.deadline)}</td>
                <td><span class="badge badge-info">${t.tema_count} tema</span></td>
                <td>
                    <div class="td-actions">
                        <button class="btn btn-primary btn-sm"
                                onclick="location.hash='#tugas/${t.id}'" title="Kelola Tema & Soal">
                            🗂️ Kelola
                        </button>
                        <button class="btn btn-secondary btn-sm btn-icon"
                                onclick="TugasView.openEditTugas(${t.id})" title="Edit">✏️</button>
                        <button class="btn btn-danger btn-sm btn-icon"
                                onclick="TugasView.confirmDeleteTugas(${t.id},'${escHtml(t.judul)}')" title="Hapus">🗑️</button>
                    </div>
                </td>
            </tr>`).join('');

        wrap.innerHTML = `
            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Judul Tugas</th>
                            <th>Deadline</th>
                            <th>Tema</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>${rows}</tbody>
                </table>
            </div>`;
    },

    // ──────────────────────────────────────────────────────────────
    // DETAIL VIEW (Tema & Soal)
    // ──────────────────────────────────────────────────────────────
    async renderDetail(tugasId) {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div class="page-header" style="display:flex;align-items:flex-start;gap:16px;flex-wrap:wrap">
                <div style="flex:1">
                    <button class="btn btn-secondary btn-sm" onclick="location.hash='#tugas'" style="margin-bottom:12px">
                        ← Kembali ke Daftar Tugas
                    </button>
                    <h1 class="page-title" id="detail-title">Memuat…</h1>
                    <p class="page-subtitle" id="detail-subtitle"></p>
                </div>
                <div style="padding-top:48px">
                    <button class="btn btn-primary" onclick="TugasView.openAddTema()">
                        ➕ Tambah Tema
                    </button>
                </div>
            </div>
            <div class="page-body">
                <div id="tema-list-wrap">
                    <div class="app-loader" style="height:200px">
                        <div class="loader-ring"></div>
                    </div>
                </div>
            </div>`;

        const res = await API.get(`tugas.php?id=${tugasId}&detail`);
        if (!res.success) { Toast.show(res.message, 'error'); return; }
        this._currentTugas = res.data;

        document.getElementById('detail-title').textContent = '🗂️ ' + this._currentTugas.judul;
        document.getElementById('detail-subtitle').innerHTML =
            (this._currentTugas.deskripsi ? escHtml(this._currentTugas.deskripsi) + ' &nbsp;·&nbsp; ' : '') +
            deadlineBadge(this._currentTugas.deadline);

        this.renderTemaList();
    },

    renderTemaList() {
        const wrap = document.getElementById('tema-list-wrap');
        const temas = this._currentTugas.temas || [];

        if (!temas.length) {
            wrap.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">🏷️</div>
                <div class="empty-state-title">Belum ada tema</div>
                <div class="empty-state-desc">Klik "Tambah Tema" untuk membuat tema pertama</div>
            </div>`;
            return;
        }

        const temasHtml = temas.map((tm, ti) => `
            <div class="tema-item" id="tema-item-${tm.id}">
                <div class="tema-header" onclick="TugasView.toggleTema(${tm.id})">
                    <span class="tema-toggle">▶</span>
                    <span class="tema-name">${escHtml(tm.nama)}</span>
                    <span class="badge badge-default" style="margin-left:auto;margin-right:8px">
                        ${tm.soals ? tm.soals.length : 0} soal
                    </span>
                    <div class="tema-actions" onclick="event.stopPropagation()">
                        <button class="btn btn-secondary btn-sm btn-icon"
                                title="Edit Tema" onclick="TugasView.openEditTema(${tm.id})">✏️</button>
                        <button class="btn btn-danger btn-sm btn-icon"
                                title="Hapus Tema" onclick="TugasView.confirmDeleteTema(${tm.id},'${escHtml(tm.nama)}')">🗑️</button>
                    </div>
                </div>
                <div class="tema-body">
                    <div class="soal-list" id="soal-list-${tm.id}">
                        ${(tm.soals || []).map((s, si) => this.soalItemHtml(s, si + 1, tm.id)).join('')}
                    </div>
                    <div class="soal-form" id="soal-form-${tm.id}" style="display:none">
                        <label class="form-label">Jenis Soal</label>
                        <select class="form-control mb-2" id="soal-jenis-${tm.id}" onchange="TugasView.changeSoalJenis(${tm.id})">
                            <option value="uraian">📝 Jawaban / Uraian</option>
                            <option value="ganda">🔘 Pilihan Ganda</option>
                            <option value="file">📎 Upload File</option>
                        </select>

                        <label class="form-label">Pertanyaan</label>
                        <textarea class="form-control" id="soal-input-${tm.id}"
                                  placeholder="Tulis pertanyaan di sini…" rows="3"></textarea>
                        
                        <div id="soal-opsi-wrap-${tm.id}" style="display:none; margin-top:12px;">
                            <label class="form-label">Opsi Jawaban</label>
                            <div style="display:flex; gap:8px; margin-bottom:8px">
                                <span style="font-weight:bold; width:20px; text-align:center">A.</span>
                                <input type="text" class="form-control" id="soal-opsi-a-${tm.id}" placeholder="Pilihan A (Wajib)">
                            </div>
                            <div style="display:flex; gap:8px; margin-bottom:8px">
                                <span style="font-weight:bold; width:20px; text-align:center">B.</span>
                                <input type="text" class="form-control" id="soal-opsi-b-${tm.id}" placeholder="Pilihan B (Wajib)">
                            </div>
                            <div style="display:flex; gap:8px; margin-bottom:8px">
                                <span style="font-weight:bold; width:20px; text-align:center">C.</span>
                                <input type="text" class="form-control" id="soal-opsi-c-${tm.id}" placeholder="Pilihan C (Opsional)">
                            </div>
                            <div style="display:flex; gap:8px; margin-bottom:8px">
                                <span style="font-weight:bold; width:20px; text-align:center">D.</span>
                                <input type="text" class="form-control" id="soal-opsi-d-${tm.id}" placeholder="Pilihan D (Opsional)">
                            </div>
                            <div style="display:flex; gap:8px; margin-bottom:8px">
                                <span style="font-weight:bold; width:20px; text-align:center">E.</span>
                                <input type="text" class="form-control" id="soal-opsi-e-${tm.id}" placeholder="Pilihan E (Opsional)">
                            </div>
                        </div>

                        <div class="soal-form-actions mt-3">
                            <button class="btn btn-secondary btn-sm"
                                    onclick="TugasView.hideSoalForm(${tm.id})">Batal</button>
                            <button class="btn btn-primary btn-sm"
                                    onclick="TugasView.doAddSoal(${tm.id})" id="btn-save-soal-${tm.id}">
                                💾 Simpan Soal
                            </button>
                        </div>
                    </div>
                    <button class="btn btn-success btn-sm mt-3"
                            onclick="TugasView.showSoalForm(${tm.id})">
                        ➕ Tambah Soal
                    </button>
                </div>
            </div>`).join('');

        wrap.innerHTML = `<div class="tema-list">${temasHtml}</div>`;
    },

    soalItemHtml(s, num, temaId) {
        const types = { uraian: '📝 Uraian', ganda: '🔘 Ganda', file: '📎 File' };
        let opsiHtml = '';
        if (s.jenis === 'ganda' && s.opsi) {
            let opsiObj = s.opsi;
            if (typeof opsiObj === 'string') {
                try { opsiObj = JSON.parse(opsiObj); } catch(e) {}
            }
            if (typeof opsiObj === 'object') {
                opsiHtml = '<div style="margin-top:8px; font-size:13px;">' + 
                    Object.entries(opsiObj).map(([k,v]) => `<div style="margin-bottom:2px"><strong>${k}.</strong> ${escHtml(v)}</div>`).join('') +
                    '</div>';
            }
        }
        return `
            <div class="soal-item" id="soal-item-${s.id}">
                <div class="soal-num">${num}</div>
                <div class="soal-text">
                    <span class="badge badge-default" style="font-size:10px; margin-bottom:6px; display:inline-block">${types[s.jenis] || 'Uraian'}</span><br>
                    ${escHtml(s.pertanyaan)}
                    ${opsiHtml}
                </div>
                <div class="soal-actions">
                    <button class="btn btn-secondary btn-sm btn-icon"
                            title="Edit Soal" onclick="TugasView.openEditSoal(${s.id})">✏️</button>
                    <button class="btn btn-danger btn-sm btn-icon"
                            title="Hapus Soal" onclick="TugasView.confirmDeleteSoal(${s.id})">🗑️</button>
                </div>
            </div>`;
    },

    toggleTema(temaId) {
        const item = document.getElementById(`tema-item-${temaId}`);
        item.classList.toggle('open');
    },

    changeSoalJenis(temaId) {
        const jenis = document.getElementById(`soal-jenis-${temaId}`).value;
        document.getElementById(`soal-opsi-wrap-${temaId}`).style.display = (jenis === 'ganda') ? 'block' : 'none';
    },

    showSoalForm(temaId) {
        document.getElementById(`soal-form-${temaId}`).style.display = 'block';
        document.getElementById(`soal-input-${temaId}`).focus();
        this.changeSoalJenis(temaId);
    },

    hideSoalForm(temaId) {
        document.getElementById(`soal-form-${temaId}`).style.display = 'none';
        document.getElementById(`soal-input-${temaId}`).value = '';
        document.getElementById(`soal-jenis-${temaId}`).value = 'uraian';
        this.changeSoalJenis(temaId);
        document.getElementById(`soal-opsi-a-${temaId}`).value = '';
        document.getElementById(`soal-opsi-b-${temaId}`).value = '';
        document.getElementById(`soal-opsi-c-${temaId}`).value = '';
        document.getElementById(`soal-opsi-d-${temaId}`).value = '';
        document.getElementById(`soal-opsi-e-${temaId}`).value = '';
    },

    // ──────────────────────────────────────────────────────────────
    // CRUD Tugas
    // ──────────────────────────────────────────────────────────────
    openAddTugas() {
        Modal.open('➕ Buat Tugas Baru',
            `<div class="form-group">
                <label class="form-label">Judul Tugas <span style="color:var(--danger)">*</span></label>
                <input id="t-judul" class="form-control" placeholder="Contoh: Tugas 1 — Pengantar">
            </div>
            <div class="form-group">
                <label class="form-label">Deskripsi</label>
                <textarea id="t-desk" class="form-control" rows="3"
                          placeholder="Deskripsi singkat tugas…"></textarea>
            </div>
            <div class="form-group">
                <label class="form-label">Deadline</label>
                <input id="t-dead" type="date" class="form-control">
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-tugas">Simpan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-tugas').addEventListener('click', () => this.doAddTugas());
            document.getElementById('t-judul').focus();
        }, 0);
    },

    async doAddTugas() {
        const btn   = document.getElementById('btn-save-tugas');
        const judul = document.getElementById('t-judul').value.trim();
        const desk  = document.getElementById('t-desk').value.trim();
        const dead  = document.getElementById('t-dead').value;
        if (!judul) { Toast.show('Judul tugas wajib diisi', 'warning'); return; }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.post('tugas.php', { judul, deskripsi: desk, deadline: dead || null });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.loadList();
        } else {
            Toast.show(res.message, 'error');
        }
    },

    openEditTugas(id) {
        const t = this._tugasList.find(x => x.id == id);
        if (!t) return;
        Modal.open('✏️ Edit Tugas',
            `<div class="form-group">
                <label class="form-label">Judul Tugas</label>
                <input id="t-judul" class="form-control" value="${escHtml(t.judul)}">
            </div>
            <div class="form-group">
                <label class="form-label">Deskripsi</label>
                <textarea id="t-desk" class="form-control" rows="3">${escHtml(t.deskripsi || '')}</textarea>
            </div>
            <div class="form-group">
                <label class="form-label">Deadline</label>
                <input id="t-dead" type="date" class="form-control" value="${t.deadline || ''}">
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-edit-tugas">Simpan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-edit-tugas')
                .addEventListener('click', () => this.doEditTugas(id));
        }, 0);
    },

    async doEditTugas(id) {
        const btn   = document.getElementById('btn-save-edit-tugas');
        const judul = document.getElementById('t-judul').value.trim();
        const desk  = document.getElementById('t-desk').value.trim();
        const dead  = document.getElementById('t-dead').value;
        if (!judul) { Toast.show('Judul tugas wajib diisi', 'warning'); return; }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.put(`tugas.php?id=${id}`, { judul, deskripsi: desk, deadline: dead || null });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.loadList();
        } else {
            Toast.show(res.message, 'error');
        }
    },

    confirmDeleteTugas(id, judul) {
        Modal.confirm(
            `Hapus tugas <strong>${escHtml(judul)}</strong>? Semua tema, soal, dan jawaban akan terhapus.`,
            async () => {
                const res = await API.delete(`tugas.php?id=${id}`);
                if (res.success) {
                    Toast.show(res.message, 'success');
                    await this.loadList();
                } else Toast.show(res.message, 'error');
            }
        );
    },

    // ──────────────────────────────────────────────────────────────
    // CRUD Tema
    // ──────────────────────────────────────────────────────────────
    openAddTema() {
        const tugasId = this._currentTugas?.id;
        if (!tugasId) return;
        Modal.open('➕ Tambah Tema',
            `<div class="form-group">
                <label class="form-label">Nama Tema <span style="color:var(--danger)">*</span></label>
                <input id="tm-nama" class="form-control" placeholder="Contoh: Tema 1 — Konsep Dasar">
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-tema">Simpan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-tema').addEventListener('click', () => this.doAddTema(tugasId));
            document.getElementById('tm-nama').focus();
        }, 0);
    },

    async doAddTema(tugasId) {
        const btn  = document.getElementById('btn-save-tema');
        const nama = document.getElementById('tm-nama').value.trim();
        if (!nama) { Toast.show('Nama tema wajib diisi', 'warning'); return; }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.post('tema.php', { tugas_id: tugasId, nama });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.renderDetail(tugasId);
        } else Toast.show(res.message, 'error');
    },

    openEditTema(temaId) {
        const tm = this._currentTugas.temas.find(x => x.id == temaId);
        if (!tm) return;
        Modal.open('✏️ Edit Tema',
            `<div class="form-group">
                <label class="form-label">Nama Tema</label>
                <input id="tm-nama" class="form-control" value="${escHtml(tm.nama)}">
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-edit-tema">Simpan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-edit-tema')
                .addEventListener('click', () => this.doEditTema(temaId));
        }, 0);
    },

    async doEditTema(temaId) {
        const btn  = document.getElementById('btn-save-edit-tema');
        const nama = document.getElementById('tm-nama').value.trim();
        if (!nama) { Toast.show('Nama tema wajib diisi', 'warning'); return; }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.put(`tema.php?id=${temaId}`, { nama });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.renderDetail(this._currentTugas.id);
        } else Toast.show(res.message, 'error');
    },

    confirmDeleteTema(temaId, nama) {
        Modal.confirm(
            `Hapus tema <strong>${escHtml(nama)}</strong>? Semua soal dan jawaban akan terhapus.`,
            async () => {
                const res = await API.delete(`tema.php?id=${temaId}`);
                if (res.success) {
                    Toast.show(res.message, 'success');
                    await this.renderDetail(this._currentTugas.id);
                } else Toast.show(res.message, 'error');
            }
        );
    },

    // ──────────────────────────────────────────────────────────────
    // CRUD Soal
    // ──────────────────────────────────────────────────────────────
    async doAddSoal(temaId) {
        const btn = document.getElementById(`btn-save-soal-${temaId}`);
        const jenis = document.getElementById(`soal-jenis-${temaId}`).value;
        const pertanyaan = document.getElementById(`soal-input-${temaId}`).value.trim();
        if (!pertanyaan) { Toast.show('Pertanyaan wajib diisi', 'warning'); return; }

        let opsi = null;
        if (jenis === 'ganda') {
            const a = document.getElementById(`soal-opsi-a-${temaId}`).value.trim();
            const b = document.getElementById(`soal-opsi-b-${temaId}`).value.trim();
            const c = document.getElementById(`soal-opsi-c-${temaId}`).value.trim();
            const d = document.getElementById(`soal-opsi-d-${temaId}`).value.trim();
            const e = document.getElementById(`soal-opsi-e-${temaId}`).value.trim();
            if (!a || !b) { Toast.show('Minimal opsi A dan B wajib diisi', 'warning'); return; }
            opsi = { A: a, B: b };
            if (c) opsi.C = c;
            if (d) opsi.D = d;
            if (e) opsi.E = e;
        }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.post('soal.php', { tema_id: temaId, pertanyaan, jenis, opsi });
        setLoading(btn, false);

        if (res.success) {
            Toast.show(res.message, 'success');
            this.hideSoalForm(temaId);
            await this.renderDetail(this._currentTugas.id);
            // Re-open the tema accordion
            setTimeout(() => {
                const item = document.getElementById(`tema-item-${temaId}`);
                if (item && !item.classList.contains('open')) item.classList.add('open');
            }, 100);
        } else Toast.show(res.message, 'error');
    },

    openEditSoal(soalId) {
        let soal = null;
        for (const tm of this._currentTugas.temas || []) {
            soal = (tm.soals || []).find(s => s.id == soalId);
            if (soal) break;
        }
        if (!soal) return;
        let opsiObj = {};
        if (soal.jenis === 'ganda' && soal.opsi) {
            opsiObj = typeof soal.opsi === 'string' ? JSON.parse(soal.opsi) : soal.opsi;
        }

        Modal.open('✏️ Edit Soal',
            `<div class="form-group">
                <label class="form-label">Jenis Soal</label>
                <select class="form-control mb-2" id="s-jenis" onchange="document.getElementById('s-opsi-wrap').style.display = (this.value==='ganda')?'block':'none'">
                    <option value="uraian" ${soal.jenis==='uraian'?'selected':''}>📝 Jawaban / Uraian</option>
                    <option value="ganda" ${soal.jenis==='ganda'?'selected':''}>🔘 Pilihan Ganda</option>
                    <option value="file" ${soal.jenis==='file'?'selected':''}>📎 Upload File</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">Pertanyaan</label>
                <textarea id="s-pertanyaan" class="form-control" rows="4">${escHtml(soal.pertanyaan)}</textarea>
            </div>
            <div id="s-opsi-wrap" style="display:${soal.jenis==='ganda'?'block':'none'}; margin-bottom:12px;">
                <label class="form-label">Opsi Jawaban</label>
                <div style="display:flex; gap:8px; margin-bottom:8px">
                    <span style="font-weight:bold; width:20px; text-align:center">A.</span>
                    <input type="text" class="form-control" id="s-opsi-a" value="${escHtml(opsiObj.A||'')}">
                </div>
                <div style="display:flex; gap:8px; margin-bottom:8px">
                    <span style="font-weight:bold; width:20px; text-align:center">B.</span>
                    <input type="text" class="form-control" id="s-opsi-b" value="${escHtml(opsiObj.B||'')}">
                </div>
                <div style="display:flex; gap:8px; margin-bottom:8px">
                    <span style="font-weight:bold; width:20px; text-align:center">C.</span>
                    <input type="text" class="form-control" id="s-opsi-c" value="${escHtml(opsiObj.C||'')}">
                </div>
                <div style="display:flex; gap:8px; margin-bottom:8px">
                    <span style="font-weight:bold; width:20px; text-align:center">D.</span>
                    <input type="text" class="form-control" id="s-opsi-d" value="${escHtml(opsiObj.D||'')}">
                </div>
                <div style="display:flex; gap:8px; margin-bottom:8px">
                    <span style="font-weight:bold; width:20px; text-align:center">E.</span>
                    <input type="text" class="form-control" id="s-opsi-e" value="${escHtml(opsiObj.E||'')}">
                </div>
            </div>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="btn btn-primary" id="btn-save-edit-soal">Simpan</button>`
        );
        setTimeout(() => {
            document.getElementById('btn-save-edit-soal')
                .addEventListener('click', () => this.doEditSoal(soalId));
        }, 0);
    },

    async doEditSoal(soalId) {
        const btn        = document.getElementById('btn-save-edit-soal');
        const jenis      = document.getElementById('s-jenis').value;
        const pertanyaan = document.getElementById('s-pertanyaan').value.trim();
        if (!pertanyaan) { Toast.show('Pertanyaan wajib diisi', 'warning'); return; }

        let opsi = null;
        if (jenis === 'ganda') {
            const a = document.getElementById('s-opsi-a').value.trim();
            const b = document.getElementById('s-opsi-b').value.trim();
            const c = document.getElementById('s-opsi-c').value.trim();
            const d = document.getElementById('s-opsi-d').value.trim();
            const e = document.getElementById('s-opsi-e').value.trim();
            if (!a || !b) { Toast.show('Minimal opsi A dan B wajib diisi', 'warning'); return; }
            opsi = { A: a, B: b };
            if (c) opsi.C = c;
            if (d) opsi.D = d;
            if (e) opsi.E = e;
        }

        setLoading(btn, true, 'Menyimpan…');
        const res = await API.put(`soal.php?id=${soalId}`, { pertanyaan, jenis, opsi });
        setLoading(btn, false);

        if (res.success) {
            Modal.close();
            Toast.show(res.message, 'success');
            await this.renderDetail(this._currentTugas.id);
        } else Toast.show(res.message, 'error');
    },

    confirmDeleteSoal(soalId) {
        Modal.confirm(
            'Hapus soal ini? Semua jawaban untuk soal ini akan terhapus.',
            async () => {
                const res = await API.delete(`soal.php?id=${soalId}`);
                if (res.success) {
                    Toast.show(res.message, 'success');
                    await this.renderDetail(this._currentTugas.id);
                } else Toast.show(res.message, 'error');
            }
        );
    },
};
