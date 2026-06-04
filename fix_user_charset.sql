-- ============================================================
-- SCRIPT: Perbaiki charset tabel `user` dengan aman
-- (bypass foreign key constraint)
-- Jalankan di phpMyAdmin tab SQL
-- ============================================================

-- Matikan sementara pengecekan foreign key
SET FOREIGN_KEY_CHECKS = 0;

-- Ubah charset tabel user ke utf8mb4
ALTER TABLE `user`
    CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Hidupkan kembali pengecekan foreign key
SET FOREIGN_KEY_CHECKS = 1;

-- Selesai
-- ============================================================
