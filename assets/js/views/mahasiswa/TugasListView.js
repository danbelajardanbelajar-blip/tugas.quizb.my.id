/**
 * assets/js/views/mahasiswa/TugasListView.js
 * Mahasiswa — Daftar tugas (Dashboard)
 */
const TugasListView = {
    _tugas: [],
    _progress: {}, // { tugas_id: { total, answered } }

    async render() {
        const container = document.getElementById('page-container');
        container.innerHTML = `
            <div style="padding: 32px 36px 0;">
                <h1 class="page-title">📚 Tugas Anda</h1>
                <p class="page-subtitle">Pilih tugas di bawah ini untuk mulai mengerjakan.</p>
            </div>
            <div class="page-body">
                <div id="mhs-tugas-list">
                    <div class="app-loader" style="height:200px">
                        <div class="loader-ring"></div>
                    </div>
                </div>
            </div>`;
        await this.loadData();
    },

    async loadData() {
        const res = await API.get('tugas.php');
        if (!res.success) { Toast.show(res.message, 'error'); return; }
        
        this._tugas = res.data || [];
        
        // Fetch progress for each tugas
        await Promise.all(this._tugas.map(async (t) => {
            try {
                const pRes = await API.get(`jawaban.php?action=progress&tugas_id=${t.id}`);
                if (pRes.success) this._progress[t.id] = pRes.data;
            } catch (e) {
                console.error('Failed to get progress', e);
            }
        }));

        this.renderGrid();
    },

    renderGrid() {
        const wrap = document.getElementById('mhs-tugas-list');
        if (!this._tugas.length) {
            wrap.innerHTML = `<div class="empty-state">
                <div class="empty-state-icon">🎉</div>
                <div class="empty-state-title">Hore! Belum ada tugas.</div>
                <div class="empty-state-desc">Saat ini tidak ada tugas yang perlu dikerjakan.</div>
            </div>`;
            return;
        }

        const html = this._tugas.map((t, i) => {
            const p = this._progress[t.id] || { total: 0, answered: 0 };
            const percent = p.total > 0 ? Math.round((p.answered / p.total) * 100) : 0;
            const overdue = isOverdue(t.deadline);
            
            let statusBadge = '';
            if (p.total > 0 && p.answered === p.total) {
                statusBadge = `<span class="badge badge-success">Selesai</span>`;
            } else if (p.answered > 0) {
                statusBadge = `<span class="badge badge-warning">Dikerjakan (${percent}%)</span>`;
            } else {
                statusBadge = `<span class="badge badge-default">Belum Dikerjakan</span>`;
            }

            return `
            <div class="tugas-card" onclick="location.hash='#tugas/${t.id}'">
                <div class="tugas-card-header">
                    <div class="tugas-card-num">${i + 1}</div>
                    ${statusBadge}
                </div>
                <div class="tugas-card-title">${escHtml(t.judul)}</div>
                <div class="tugas-card-desc">${escHtml(t.deskripsi || 'Tidak ada deskripsi')}</div>
                <div class="tugas-card-meta">
                    <div style="display:flex;align-items:center;gap:6px">
                        ${overdue ? '🔴' : '📅'} <span class="${overdue ? 'text-danger' : ''}">${formatDate(t.deadline)}</span>
                    </div>
                    <div>${t.tema_count} tema · ${p.total} soal</div>
                </div>
                ${p.total > 0 ? `
                    <div class="progress-bar-wrap">
                        <div class="progress-bar-fill" style="width: ${percent}%"></div>
                    </div>
                ` : ''}
            </div>`;
        }).join('');

        wrap.innerHTML = `<div class="tugas-grid">${html}</div>`;
    }
};
