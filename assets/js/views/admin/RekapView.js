/**
 * assets/js/views/admin/RekapView.js
 * Admin — Rekapitulasi Jawaban
 * Level 1: List tema → Level 2: Daftar mahasiswa → Level 3: Jawaban mahasiswa
 */
const RekapView = {
    _temas: [],
    _selectedTema: null,
    _selectedMahasiswa: null,

    async render(preselectedTemaId = null) {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div class="page-header">
                <h1 class="page-title">📊 Rekapitulasi Jawaban</h1>
                <p class="page-subtitle">Pantau progres pengerjaan tugas per tema.</p>
            </div>
            <div class="page-body">
                <div id="rekap-content">
                    <div class="app-loader" style="height:200px">
                        <div class="loader-ring"></div>
                    </div>
                </div>
            </div>`;

        const res = await API.get('tema.php?all');
        if (!res.success) { Toast.show(res.message, 'error'); return; }
        this._temas = res.data || [];

        if (preselectedTemaId) {
            await this.showMahasiswaList(preselectedTemaId);
        } else {
            this.renderTemaGrid();
        }
    },

    // ─── Level 1: Grid tema ─────────────────────────────────────────
    renderTemaGrid() {
        const el = document.getElementById('rekap-content');

        if (!this._temas.length) {
            el.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">📊</div>
                <div class="empty-state-title">Belum ada tema</div>
                <div class="empty-state-desc">Buat tugas dan tema terlebih dahulu</div>
            </div>`;
            return;
        }

        // Group by tugas
        const grouped = {};
        this._temas.forEach(tm => {
            const key = tm.tugas_judul;
            if (!grouped[key]) grouped[key] = { deadline: tm.deadline, temas: [] };
            grouped[key].temas.push(tm);
        });

        let html = '';
        for (const [tugasJudul, { deadline, temas }] of Object.entries(grouped)) {
            html += `
                <div class="mb-4">
                    <div style="display:flex;align-items:center;gap:12px;margin-bottom:12px">
                        <h2 style="font-size:16px;font-weight:700;color:var(--text-primary)">
                            📋 ${escHtml(tugasJudul)}
                        </h2>
                        ${deadlineBadge(deadline)}
                    </div>
                    <div class="rekap-grid">
                        ${temas.map(tm => `
                            <div class="rekap-tema-card" onclick="RekapView.showMahasiswaList(${tm.id})">
                                <div class="rekap-tema-title">${escHtml(tm.nama)}</div>
                                <div class="rekap-tema-sub">${tm.soal_count} soal</div>
                                <div style="display:flex;align-items:baseline;gap:6px">
                                    <div class="rekap-count" id="count-${tm.id}">
                                        <div class="loader-ring" style="width:16px;height:16px;border-width:2px"></div>
                                    </div>
                                </div>
                                <div class="rekap-count-label">mahasiswa mengerjakan</div>
                            </div>`).join('')}
                    </div>
                </div>`;
        }

        el.innerHTML = html;

        // Lazy-load counts
        this._temas.forEach(async tm => {
            const res = await API.get(`jawaban.php?action=rekap-tema&tema_id=${tm.id}`);
            const countEl = document.getElementById(`count-${tm.id}`);
            if (countEl) {
                countEl.textContent = res.success ? res.data.length : '?';
            }
        });
    },

    // ─── Level 2: Daftar mahasiswa yang mengerjakan tema ────────────
    async showMahasiswaList(temaId) {
        const tema = this._temas.find(t => t.id == temaId);
        this._selectedTema = tema;

        const el = document.getElementById('rekap-content');
        el.innerHTML = `
            <button class="btn btn-secondary btn-sm" onclick="RekapView.renderTemaGrid()" style="margin-bottom:20px">
                ← Kembali ke Daftar Tema
            </button>
            <div class="card">
                <div class="card-header">
                    <div>
                        <div class="card-title">🏷️ ${escHtml(tema?.nama || 'Tema')}</div>
                        <div style="font-size:12px;color:var(--text-muted);margin-top:4px">
                            ${escHtml(tema?.tugas_judul || '')}
                        </div>
                    </div>
                </div>
                <div id="mhs-rekap-wrap">
                    <div class="app-loader" style="height:160px">
                        <div class="loader-ring"></div>
                    </div>
                </div>
            </div>`;

        const res = await API.get(`jawaban.php?action=rekap-tema&tema_id=${temaId}`);
        const wrap = document.getElementById('mhs-rekap-wrap');

        if (!res.success) { wrap.innerHTML = `<p class="text-muted" style="padding:20px">${res.message}</p>`; return; }
        const mahasiswas = res.data;

        if (!mahasiswas.length) {
            wrap.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">📭</div>
                <div class="empty-state-title">Belum ada yang mengerjakan</div>
                <div class="empty-state-desc">Mahasiswa belum mengumpulkan jawaban untuk tema ini</div>
            </div>`;
            return;
        }

        const rows = mahasiswas.map((m, i) => `
            <tr style="cursor:pointer" onclick="RekapView.showJawaban(${m.id},'${escHtml(m.nama)}',${temaId})"
                title="Lihat jawaban ${escHtml(m.nama)}">
                <td style="color:var(--text-muted);font-size:12px">${i + 1}</td>
                <td><strong>${escHtml(m.nim)}</strong></td>
                <td>${escHtml(m.nama)}</td>
                <td>${m.kelas ? `<span class="badge badge-primary">${escHtml(m.kelas)}</span>` : '—'}</td>
                <td><span class="badge badge-success">✅ ${m.jumlah_jawaban} jawaban</span></td>
                <td style="font-size:12px;color:var(--text-muted)">${formatDate(m.last_submit)}</td>
                <td>
                    <button class="btn btn-primary btn-sm">👁️ Lihat</button>
                </td>
            </tr>`).join('');

        wrap.innerHTML = `
            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NIM</th>
                            <th>Nama</th>
                            <th>Kelas</th>
                            <th>Status</th>
                            <th>Terakhir Submit</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>${rows}</tbody>
                </table>
            </div>`;
    },

    // ─── Level 3: Jawaban satu mahasiswa ────────────────────────────
    async showJawaban(mahasiswaId, namaMahasiswa, temaId) {
        Modal.open(
            `📝 Jawaban — ${escHtml(namaMahasiswa)}`,
            `<div style="font-size:12px;color:var(--text-muted);margin-bottom:16px">
                Tema: <strong>${escHtml(this._selectedTema?.nama || '')}</strong>
            </div>
            <div id="jawaban-detail-wrap">
                <div class="app-loader" style="height:100px">
                    <div class="loader-ring"></div>
                </div>
            </div>`
        );

        const res = await API.get(`jawaban.php?action=detail-mahasiswa&mahasiswa_id=${mahasiswaId}&tema_id=${temaId}`);
        const wrap = document.getElementById('jawaban-detail-wrap');
        if (!wrap) return;

        if (!res.success || !res.data.length) {
            wrap.innerHTML = `<p class="text-muted text-sm">Belum ada jawaban.</p>`;
            return;
        }

        wrap.innerHTML = res.data.map((j, i) => {
            let isiHtml = '';
            if (j.jenis === 'file') {
                isiHtml = j.isi ? `<a href="${escHtml(j.isi)}" target="_blank" class="btn btn-sm btn-primary">⬇️ Download File</a>` : '<em style="color:var(--text-muted)">Belum upload file</em>';
            } else if (j.jenis === 'ganda') {
                let opsiObj = j.opsi;
                if (typeof opsiObj === 'string') {
                    try { opsiObj = JSON.parse(opsiObj); } catch(e) {}
                }
                const selectedText = (opsiObj && j.isi && opsiObj[j.isi]) ? opsiObj[j.isi] : '';
                isiHtml = j.isi ? `<strong style="font-size:15px;color:var(--primary)">${escHtml(j.isi)}</strong>. ${escHtml(selectedText)}` : '<em style="color:var(--text-muted)">Belum dijawab</em>';
            } else {
                isiHtml = j.isi ? escHtml(j.isi) : '<em style="color:var(--text-muted)">Belum diisi</em>';
            }

            const typeBadge = j.jenis === 'ganda' ? '🔘 Ganda' : (j.jenis === 'file' ? '📎 File' : '📝 Uraian');

            return `
            <div style="margin-bottom:20px;padding-bottom:20px;
                        ${i < res.data.length - 1 ? 'border-bottom:1px solid var(--border)' : ''}">
                <div style="display:flex;align-items:center;gap:8px;margin-bottom:10px">
                    <span style="
                        background:var(--accent-glow);border:1px solid rgba(99,102,241,.2);
                        border-radius:6px;padding:3px 10px;font-size:11px;font-weight:700;
                        color:var(--accent-light)">
                        Soal ${i + 1}
                    </span>
                    <span class="badge badge-default" style="font-size:10px">${typeBadge}</span>
                </div>
                <p style="font-size:14px;color:var(--text-primary);margin-bottom:10px;font-weight:500">
                    ${escHtml(j.pertanyaan)}
                </p>
                <div style="
                    padding:12px 14px;
                    background:var(--bg-input);
                    border:1px solid var(--border);
                    border-radius:8px;
                    font-size:13px;
                    color:var(--text-secondary);
                    line-height:1.6;
                    min-height:60px;
                    white-space:pre-wrap">
                    ${isiHtml}
                </div>
                <div style="font-size:11px;color:var(--text-muted);margin-top:6px">
                    Disimpan: ${formatDate(j.updated_at)}
                </div>
            </div>`;
        }).join('');
    },
};
