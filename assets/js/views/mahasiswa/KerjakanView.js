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
        this.loadKomentar();
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
                                const lastEdit = (ans && ans.updated_at) ? `Terakhir edit: ${formatDate(ans.updated_at)}` : '';
                                const plainText = isi ? isi.replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim() : '';
                                const previewText = plainText ? plainText.substring(0, 150) + (plainText.length > 150 ? '...' : '') : '<em class="text-muted">Belum dijawab</em>';
                                const gradient = (plainText && plainText.length > 150) ? `<div style="position:absolute; bottom:0; left:0; right:0; height:25px; background:linear-gradient(transparent, var(--bg-input));"></div>` : '';

                                inputHtml = `
                                    <div id="uraian-preview-${s.id}" style="margin-top:12px; padding:12px; background:var(--bg-input); border:1px solid var(--border); border-radius:8px; font-size:14px; max-height:80px; overflow:hidden; position:relative;">
                                        ${previewText}
                                        ${gradient}
                                    </div>
                                    <div id="uraian-editor-container-${s.id}" style="display:none; margin-top:12px; background:var(--bg-input);">
                                        <div id="quill-soal-${s.id}" style="min-height: 150px; font-size: 14px; background: #fff; color: #333;" data-soalid="${s.id}">${isi}</div>
                                    </div>
                                    <div style="display:flex; justify-content:space-between; align-items:center; margin-top:8px;">
                                        <div style="font-size:11px; color:var(--text-muted);" id="last-edit-${s.id}">${lastEdit}</div>
                                        ${!isPastDeadline ? `<button class="btn btn-sm btn-secondary" onclick="KerjakanView.toggleEdit(${s.id})" id="btn-edit-${s.id}">✏️ Edit Jawaban</button>` : ''}
                                    </div>
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
            </div>
            
            <div class="card" style="margin-bottom:24px" id="komentar-card">
                <div class="card-header">
                    <div>
                        <div class="card-title">💬 Diskusi & Masukan Guru</div>
                        <div style="font-size:12px;color:var(--text-muted);margin-top:4px">
                            Diskusikan tugas ini dengan guru Anda
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div id="komentar-list" style="display:flex; flex-direction:column; gap:10px; max-height:300px; overflow-y:auto; margin-bottom:15px; padding-right:5px; padding-bottom:10px;">
                        <div class="text-center text-muted" style="font-size:12px;">Memuat komentar...</div>
                    </div>
                    <div style="display:flex; flex-direction:column; gap:8px;">
                        <div id="quill-komentar" style="min-height:80px; background:#fff; color:#333; font-size:14px;"></div>
                        <button class="btn btn-primary" onclick="KerjakanView.kirimKomentar()" id="btn-kirim-komentar" style="align-self:flex-end;">Kirim</button>
                    </div>
                </div>
            </div>
            `;

        main.innerHTML = html;
        this.loadKomentar();
        this.initQuill(soals);
    },

    initQuill(soals) {
        // Reset instansi karena DOM digambar ulang setiap kali renderSoal
        this._quillInstances = {};

        soals.forEach(s => {
            if (s.jenis === 'ganda' || s.jenis === 'file') return;
            const container = document.getElementById(`quill-soal-${s.id}`);
            if (container && !this._quillInstances[s.id]) {
                const quill = new Quill(container, {
                    theme: 'snow',
                    modules: {
                        toolbar: [
                            ['bold', 'italic', 'underline'],
                            [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                            ['clean']
                        ]
                    }
                });
                
                // Anti-cheat
                quill.root.addEventListener('paste', e => { e.preventDefault(); Toast.show('Paste tidak diizinkan.', 'warning'); });
                quill.root.addEventListener('drop', e => { e.preventDefault(); Toast.show('Drop tidak diizinkan.', 'warning'); });

                quill.on('text-change', (delta, oldDelta, source) => {
                    if (source === 'user') {
                        this.handleInput(s.id, quill.root.innerHTML);
                    }
                });
                
                this._quillInstances[s.id] = quill;
            }
        });

        // Init Komentar
        const komentarContainer = document.getElementById('quill-komentar');
        if (komentarContainer) {
            this._quillKomentar = new Quill(komentarContainer, {
                theme: 'snow',
                modules: {
                    toolbar: [ ['bold', 'italic'], [{ 'list': 'ordered'}, { 'list': 'bullet' }] ]
                }
            });
        }
    },

    // ─── Edit Mode Toggler ──────────────────────────────────────────
    toggleEdit(soalId) {
        const preview = document.getElementById(`uraian-preview-${soalId}`);
        const editor = document.getElementById(`uraian-editor-${soalId}`);
        const btn = document.getElementById(`btn-edit-${soalId}`);
        
        if (!preview || !editor || !btn) return;

        if (editor.style.display === 'none') {
            preview.style.display = 'none';
            editor.style.display = 'block';
            btn.innerHTML = '❌ Tutup Edit';
            if (this._quillInstances && this._quillInstances[soalId]) {
                this._quillInstances[soalId].focus();
            }
        } else {
            preview.style.display = 'block';
            editor.style.display = 'none';
            btn.innerHTML = '✏️ Edit Jawaban';
            
            // Perbarui teks preview
            let isi = '';
            if (this._quillInstances && this._quillInstances[soalId]) {
                isi = this._quillInstances[soalId].root.innerHTML;
            }
            const plainText = isi ? isi.replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim() : '';
            const previewText = plainText ? plainText.substring(0, 150) + (plainText.length > 150 ? '...' : '') : '<em class="text-muted">Belum dijawab</em>';
            const gradient = (plainText && plainText.length > 150) ? `<div style="position:absolute; bottom:0; left:0; right:0; height:25px; background:linear-gradient(transparent, var(--bg-input));"></div>` : '';
            preview.innerHTML = previewText + gradient;
        }
    },

    // ─── Auto-save mechanism ─────────────────────────────────────────
    handleInput(soalId, val = null, e = null) {
        if (this._saveTimeout) clearTimeout(this._saveTimeout);
        
        let isi = val;
        let el = null;
        if (isi === null) {
            el = document.querySelector(`textarea[data-soalid="${soalId}"]`);
            if (el) isi = el.value;
        }
        
        // --- ANTI-CHEAT: BLOKIR PASTE & DROP (Fallback) ---
        if (e && el) {
            if (e.inputType === 'insertFromPaste' || e.inputType === 'insertFromDrop') {
                // Should have been caught by onbeforeinput, but just in case
                el.value = el.getAttribute('data-prev-value') || '';
                isi = el.value;
                Toast.show('Input dari clipboard terdeteksi dan dibatalkan.', 'warning');
            } else {
                // Simpan nilai ketikan manual yang sah
                el.setAttribute('data-prev-value', isi);
            }
        }
        // ---------------------------------------------------------
        
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
                const nowStr = new Date().toISOString(); // local approximation
                if (ex) {
                    ex.isi = isi;
                    ex.updated_at = nowStr; 
                }
                else this._jawaban.push({ soal_id: soalId, isi, updated_at: nowStr });

                ind.innerHTML = `✅ Tersimpan`;
                ind.style.color = 'var(--success)';
                
                // Update timestamp UI
                const lastEditEl = document.getElementById(`last-edit-${soalId}`);
                if (lastEditEl) lastEditEl.innerHTML = `Terakhir edit: Baru saja`;
                
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
    },

    // ─── Komentar ───────────────────────────────────────────────────
    async loadKomentar() {
        if (!this._activeTemaId) return;
        
        const list = document.getElementById('komentar-list');
        if (!list) return;

        const res = await API.get(`komentar.php?action=list&tema_id=${this._activeTemaId}`);
        if (!res.success) {
            list.innerHTML = `<div class="text-center text-danger" style="font-size:12px;">Gagal memuat komentar</div>`;
            return;
        }

        const data = res.data || [];
        if (data.length === 0) {
            list.innerHTML = `<div class="text-center text-muted" style="font-size:12px;">Belum ada pesan. Anda bisa bertanya atau berdiskusi di sini.</div>`;
            return;
        }

        list.innerHTML = data.map(k => {
            const isMe = k.pengirim_role === 'mahasiswa';
            const align = isMe ? 'flex-end' : 'flex-start';
            const bg = isMe ? 'var(--primary)' : 'var(--bg-input)';
            const color = isMe ? '#fff' : 'var(--text-primary)';
            const border = isMe ? 'none' : '1px solid var(--border)';
            const nameColor = isMe ? 'var(--text-muted)' : 'var(--text-muted)';
            const senderName = isMe ? 'Anda' : 'Guru (Admin)';
            
            return `
            <div style="display:flex; flex-direction:column; align-items:${align}; max-width:85%; align-self:${align};">
                <div style="font-size:10px; color:${nameColor}; margin-bottom:4px;">
                    ${senderName} • ${formatDate(k.created_at)}
                </div>
                <div style="background:${bg}; color:${color}; padding:8px 12px; border-radius:12px; border:${border}; font-size:13px; line-height:1.4; word-break:break-word; white-space:pre-wrap;">
                    ${k.isi}
                </div>
            </div>`;
        }).join('');
        
        // Scroll to bottom
        list.scrollTop = list.scrollHeight;
    },

    async kirimKomentar() {
        if (!this._activeTemaId) return;

        const btn = document.getElementById('btn-kirim-komentar');
        if (!this._quillKomentar) return;

        const plainText = this._quillKomentar.getText().trim();
        if (!plainText) return;

        const isi = this._quillKomentar.root.innerHTML;

        setLoading(btn, true, 'Kirim');
        this._quillKomentar.disable();

        const res = await API.post('komentar.php?action=send', {
            tema_id: this._activeTemaId,
            isi: isi
        });

        setLoading(btn, false);
        this._quillKomentar.enable();

        if (res.success) {
            this._quillKomentar.root.innerHTML = '';
            this._quillKomentar.focus();
            this.loadKomentar();
        } else {
            Toast.show(res.message, 'error');
        }
    }
};
