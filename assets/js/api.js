/**
 * assets/js/api.js — Fetch wrapper untuk semua panggilan API
 */
const API = (() => {
    const BASE = './api/';

    async function request(endpoint, options = {}) {
        const url = BASE + endpoint;
        const defaults = {
            headers: { 'Content-Type': 'application/json' },
            credentials: 'same-origin',
        };
        const config = { ...defaults, ...options };
        if (config.body && typeof config.body === 'object') {
            config.body = JSON.stringify(config.body);
        }

        const res = await fetch(url, config);
        const data = await res.json().catch(() => ({ success: false, message: 'Server error' }));

        if (res.status === 401) {
            // Sesi habis — redirect ke login
            App.logout(false);
        }

        return data;
    }

    return {
        get   : (ep)           => request(ep, { method: 'GET' }),
        post  : (ep, body)     => request(ep, { method: 'POST',   body }),
        put   : (ep, body)     => request(ep, { method: 'PUT',    body }),
        delete: (ep)           => request(ep, { method: 'DELETE' }),
    };
})();
