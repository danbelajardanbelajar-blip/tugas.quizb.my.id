/**
 * assets/js/views/mahasiswa/KerjakanView.js
 * Mahasiswa — Pengerjaan tugas (Layout sidebar tema + main soal)
 */
const KerjakanView = {
    _tugas: null,
    _jawaban: [], // raw data from server
    _activeTemaId: null,
    _saveTimeout: null,

    async render(tugasId) {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div class="page-header">
                <h1 class="page-title" id="k-title">Memuat Tugas…</h1>
                <p class="page-subtitle" id="k-subtitle"></p>
            </div>
            <div class="page-body">
                <div id="kerjakan-layout-wrap">
                    <div class="app-loader" style="height:300px">
                        <div class="loader-ring"></div>
                    </div>
                </div>
            </div>`;

        // Fetch tugas detail
        const tRes = await API.get(`tugas.php?id=${tugasId}&detail`);
        if (!tRes.success) { Toast.show(tRes.message, 'error'); return; }
        this._tugas = tRes.data;

        document.getElementById('k-title').textContent = this._tugas.judul;
        document.getElementById('k-subtitle').innerHTML =
            (this._tugas.deskripsi ? escHtml(this._tugas.deskripsi) + ' &nbsp;·&nbsp; ' : '') +
            deadlineBadge(this._tugas.deadline);

        // Fetch existing answers
        const jRes = await API.get(`jawaban.php?action=mahasiswa-tugas&tugas_id=${tugasId}`);
        if (jRes.success) this._jawaban = jRes.data || [];

        this.renderLayout();
    },

    renderLayout() {
        const wrap = document.getElementById('kerjakan-layout-wrap');
        const temas = this._tugas.temas || [];

        if (!temas.length) {
            wrap.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">🏷️</div>
                <div class="empty-state-title">Belum ada tema/soal</div>
                <div class="empty-state-desc">Admin belum menambahkan soal pada tugas ini.</div>
            </div>`;
            return;
        }

        if (!this._activeTemaId) {
            this._activeTemaId = temas[0].id;
        }

        wrap.innerHTML = `
            <div class="kerjakan-layout">
                <div class="kerjakan-sidebar">
                    <div style="font-size:11px;font-weight:700;color:var(--text-muted);text-transform:uppercase;letter-spacing:0.05em;margin-bottom:12px;padding-left:14px">
                        Daftar Tema
                    </div>
                    <div class="tema-tab-list" id="k-tema-list"></div>
                </div>
                <div class="kerjakan-main" id="k-main-content"></div>
            </div>`;

        this.renderSidebar();
        this.renderSoal();
    },

    renderSidebar() {
        const list = document.getElementById('k-tema-list');
        const temas = this._tugas.temas || [];

        list.innerHTML = temas.map((tm, i) => {
            // Hitung status pengerjaan per tema
            const soals = tm.soals || [];
            const total = soals.length;
            let answered = 0;

            soals.forEach(s => {
                const j = this._jawaban.find(x => x.soal_id === s.id);
                if (j && j.isi && j.isi.trim() !== '') answered++;
            });

            let statusClass = '';
            if (total > 0) {
                if (answered === total) statusClass = 'done';
                else if (answered > 0) statusClass = 'partial';
            }

            return `
                <button class="tema-tab ${this._activeTemaId === tm.id ? 'active' : ''} ${statusClass}"
                        onclick="KerjakanView.switchTema(${tm.id})">
                    <div class="dot"></div>
                    <div style="flex:1;overflow:hidden;text-overflow:ellipsis;white-space:nowrap">
                        ${i + 1}. ${escHtml(tm.nama)}
                    </div>
                    ${total > 0 ? `<div style="font-size:11px;color:var(--text-muted)">${answered}/${total}</div>` : ''}
                </button>`;
        }).join('');
    },

    switchTema(temaId) {
        if (this._activeTemaId == temaId) return;
        this._activeTemaId = temaId;
        this.renderSidebar();
        this.renderSoal();
    },

    renderSoal() {
        const main = document.getElementById('k-main-content');
        const tm = (this._tugas.temas || []).find(t => t.id === this._activeTemaId);
        
        if (!tm) return;

        const soals = tm.soals || [];
        if (!soals.length) {
            main.innerHTML = `<div class="card card-body empty-state">
                <div class="empty-state-icon">📝</div>
                <div class="empty-state-title">Belum ada soal</div>
                <div class="empty-state-desc">Belum ada pertanyaan pada tema ini.</div>
            </div>`;
            return;
        }

        const isPastDeadline = isOverdue(this._tugas.deadline);

        const html = `
            <div class="card" style="margin-bottom:24px">
                <div class="card-header">
                    <div>
                        <div class="card-title">🏷️ ${escHtml(tm.nama)}</div>
                        <div style="font-size:12px;color:var(--text-muted);margin-top:4px">
                            Isi jawaban pada kotak yang disediakan. Jawaban tersimpan otomatis.
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    ${isPastDeadline ? `
                        <div style="padding:12px 16px;background:var(--danger-bg);border:1px solid rgba(239,68,68,.3);border-radius:8px;color:var(--danger);font-size:13px;margin-bottom:20px;display:flex;align-items:center;gap:10px">
                            <span style="font-size:18px">⚠️</span>
                            <strong>Sudah melewati batas waktu (deadline).</strong> Anda tidak dapat mengubah jawaban lagi.
                        </div>
                    ` : ''}
                    <div class="soal-kerjakan">
                        ${soals.map((s, i) => {
                            const ans = this._jawaban.find(x => x.soal_id === s.id);
                            const isi = ans ? ans.isi : '';
                            const isPastDeadline = isOverdue(this._tugas.deadline);
                            
                            let inputHtml = '';
                            if (s.jenis === 'ganda') {
                                let opsiObj = s.opsi;
                                if (typeof opsiObj === 'string') {
                                    try { opsiObj = JSON.parse(opsiObj); } catch(e) {}
                                }
                                if (typeof opsiObj === 'object') {
                                    inputHtml = '<div style="display:flex; flex-direction:column; gap:8px; margin-top:12px;">';
                                    Object.entries(opsiObj).forEach(([k,v]) => {
                                        const checked = (isi === k) ? 'checked' : '';
                                        inputHtml += `
                                            <label style="display:flex; align-items:center; gap:8px; cursor:pointer">
                                                <input type="radio" name="soal-${s.id}" value="${k}" ${checked} 
                                                       ${isPastDeadline ? 'disabled' : ''}
                                                       onchange="KerjakanView.handleInput(${s.id}, this.value)">
                                                <strong style="width:20px; text-align:center">${k}.</strong> ${escHtml(v)}
                                            </label>`;
                                    });
                                    inputHtml += '</div>';
                                }
                            } else if (s.jenis === 'file') {
                                inputHtml = `
                                    <div style="margin-top:12px;">
                                        ${isi ? `<div style="margin-bottom:8px">File saat ini: <a href="${escHtml(isi)}" target="_blank" class="badge badge-info">Lihat File</a></div>` : ''}
                                        <input type="file" id="file-soal-${s.id}" class="form-control" ${isPastDeadline ? 'disabled' : ''} 
                                            onchange="KerjakanView.handleInputFile(${s.id})">
                                    </div>
                                `;
                            } else {
                                inputHtml = `
                                    <textarea class="form-control"
                                              rows="4"
                                              style="margin-top:12px"
                                              placeholder="Ketik jawaban Anda di sini…"
                                              data-soalid="${s.id}"
                                              oninput="KerjakanView.handleInput(${s.id})"
                                              onpaste="event.preventDefault(); Toast.show('Anda tidak diizinkan melakukan paste jawaban.', 'warning');"
                                              ${isPastDeadline ? 'disabled' : ''}>${escHtml(isi)}</textarea>
                                `;
                            }

                            const types = { uraian: '📝 Uraian', ganda: '🔘 Ganda', file: '📎 File' };

                            return `
                                <div class="soal-kerjakan-item">
                                    <div class="soal-kerjakan-num">
                                        <div class="soal-kerjakan-label">Soal ${i + 1}</div>
                                    </div>
                                    <div class="soal-kerjakan-pertanyaan">
                                        <span class="badge badge-default" style="font-size:10px; margin-bottom:6px; display:inline-block">${types[s.jenis] || 'Uraian'}</span><br>
                                        ${escHtml(s.pertanyaan)}
                                    </div>
                                    ${inputHtml}
                                    <div class="save-indicator" id="save-ind-${s.id}">
                                        ✅ Tersimpan otomatis
                                    </div>
                                </div>
                            `;
                        }).join('')}
                    </div>
                </div>
            </div>`;

        main.innerHTML = html;
    },

    // ─── Auto-save mechanism ─────────────────────────────────────────
    handleInput(soalId, val = null) {
        if (this._saveTimeout) clearTimeout(this._saveTimeout);
        
        let isi = val;
        if (isi === null) {
            const el = document.querySelector(`textarea[data-soalid="${soalId}"]`);
            if (el) isi = el.value;
        }
        
        const ind = document.getElementById(`save-ind-${soalId}`);
        if (!ind) return;
        
        ind.innerHTML = `⏳ Menyimpan…`;
        ind.style.color = 'var(--warning)';
        ind.classList.add('visible');

        // Debounce 1.5 seconds after user stops typing
        this._saveTimeout = setTimeout(() => {
            this.saveAnswer(soalId, isi);
        }, 1500);
    },

    async handleInputFile(soalId) {
        const el = document.getElementById(`file-soal-${soalId}`);
        if (!el.files || el.files.length === 0) return;
        
        const file = el.files[0];
        const ind = document.getElementById(`save-ind-${soalId}`);
        
        ind.innerHTML = `⏳ Mengupload…`;
        ind.style.color = 'var(--warning)';
        ind.classList.add('visible');

        const formData = new FormData();
        formData.append('soal_id', soalId);
        formData.append('file', file);

        try {
            const res = await API.post('jawaban.php?action=submit', formData);
            if (res.success) {
                const ex = this._jawaban.find(x => x.soal_id == soalId);
                if (ex) ex.isi = 'uploaded';
                else this._jawaban.push({ soal_id: soalId, isi: 'uploaded' });

                ind.innerHTML = `✅ Tersimpan`;
                ind.style.color = 'var(--success)';
                this.renderSidebar();
                
                setTimeout(() => {
                    ind.classList.remove('visible');
                    // Reload the answers to get the new file URL
                    this.reloadAnswers();
                }, 2000);
            } else {
                ind.innerHTML = `❌ Gagal mengupload`;
                ind.style.color = 'var(--danger)';
            }
        } catch (err) {
            ind.innerHTML = `❌ Gagal mengupload (Koneksi error)`;
            ind.style.color = 'var(--danger)';
        }
    },

    async reloadAnswers() {
        const jRes = await API.get(`jawaban.php?action=mahasiswa-tugas&tugas_id=${this._tugas.id}`);
        if (jRes.success) {
            this._jawaban = jRes.data || [];
            this.renderSoal(); // refresh file link
        }
    },

    async saveAnswer(soalId, isi) {
        const ind = document.getElementById(`save-ind-${soalId}`);
        
        try {
            const res = await API.post('jawaban.php?action=submit', { soal_id: soalId, isi });
            if (res.success) {
                // Update local data array
                const ex = this._jawaban.find(x => x.soal_id == soalId);
                if (ex) ex.isi = isi;
                else this._jawaban.push({ soal_id: soalId, isi });

                ind.innerHTML = `✅ Tersimpan`;
                ind.style.color = 'var(--success)';
                
                // Update sidebar completion dots
                this.renderSidebar();
                
                setTimeout(() => {
                    ind.classList.remove('visible');
                }, 2500);
            } else {
                ind.innerHTML = `❌ Gagal menyimpan`;
                ind.style.color = 'var(--danger)';
            }
        } catch (err) {
            ind.innerHTML = `❌ Gagal menyimpan (Koneksi error)`;
            ind.style.color = 'var(--danger)';
        }
    }
};
