/**
 * assets/js/utils.js — Utilitas UI bersama
 */

/* ─── Toast ─────────────────────────────────────────────────────── */
const Toast = {
    show(message, type = 'success', duration = 3500) {
        const icons = { success: '✅', error: '❌', warning: '⚠️', info: 'ℹ️' };
        const container = document.getElementById('toast-container');
        const el = document.createElement('div');
        el.className = `toast ${type}`;
        el.innerHTML = `<span class="toast-icon">${icons[type] || '💬'}</span><span>${message}</span>`;
        container.appendChild(el);
        setTimeout(() => {
            el.style.opacity = '0';
            el.style.transform = 'translateX(40px)';
            el.style.transition = 'all 0.3s ease';
            setTimeout(() => el.remove(), 300);
        }, duration);
    },
};

/* ─── Modal ─────────────────────────────────────────────────────── */
const Modal = {
    open(title, bodyHTML, footerHTML = '') {
        document.getElementById('modal-box').innerHTML = `
            <div class="modal-header">
                <span class="modal-title">${title}</span>
                <button class="modal-close" onclick="Modal.close()" title="Tutup">✕</button>
            </div>
            <div class="modal-body">${bodyHTML}</div>
            ${footerHTML ? `<div class="modal-footer">${footerHTML}</div>` : ''}
        `;
        document.getElementById('modal-backdrop').classList.remove('hidden');
        document.getElementById('modal-backdrop').addEventListener('click', (e) => {
            if (e.target === document.getElementById('modal-backdrop')) Modal.close();
        }, { once: true });
    },

    close() {
        document.getElementById('modal-backdrop').classList.add('hidden');
        document.getElementById('modal-box').innerHTML = '';
    },

    confirm(message, onYes, yesLabel = 'Ya, Hapus', yesClass = 'btn btn-danger') {
        Modal.open(
            '⚠️ Konfirmasi',
            `<p style="color:var(--text-secondary);font-size:14px">${message}</p>`,
            `<button class="btn btn-secondary" onclick="Modal.close()">Batal</button>
             <button class="${yesClass}" id="modal-yes-btn">${yesLabel}</button>`
        );
        setTimeout(() => {
            document.getElementById('modal-yes-btn')?.addEventListener('click', () => {
                Modal.close();
                onYes();
            });
        }, 0);
    },
};

/* ─── Helpers ───────────────────────────────────────────────────── */
function formatDate(dateStr) {
    if (!dateStr) return '—';
    const d = new Date(dateStr);
    return d.toLocaleDateString('id-ID', { day: 'numeric', month: 'short', year: 'numeric' });
}

function isOverdue(deadlineStr) {
    if (!deadlineStr) return false;
    return new Date(deadlineStr) < new Date();
}

function deadlineBadge(deadlineStr) {
    if (!deadlineStr) return '';
    if (isOverdue(deadlineStr)) {
        return `<span class="badge badge-danger">⏰ Deadline: ${formatDate(deadlineStr)}</span>`;
    }
    return `<span class="badge badge-warning">📅 Deadline: ${formatDate(deadlineStr)}</span>`;
}

function escHtml(str) {
    const d = document.createElement('div');
    d.textContent = str;
    return d.innerHTML;
}

function setLoading(btn, loading = true, label = 'Memproses…') {
    if (loading) {
        btn.dataset.origText = btn.innerHTML;
        btn.innerHTML = `<span class="loader-ring" style="width:16px;height:16px;border-width:2px"></span> ${label}`;
        btn.disabled = true;
    } else {
        btn.innerHTML = btn.dataset.origText || btn.innerHTML;
        btn.disabled = false;
    }
}
