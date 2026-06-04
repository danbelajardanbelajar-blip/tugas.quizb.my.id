-- ============================================================
-- SCRIPT: Perbaikan Charset untuk Mendukung Teks Arab (UTF-8)
-- Jalankan script ini di phpMyAdmin atau MySQL client
-- ============================================================

-- Pastikan koneksi menggunakan utf8mb4
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- ------------------------------------------------------------
-- 1. Perbaiki tabel: tb_daftar_soal (teks soal bisa mengandung Arab)
-- ------------------------------------------------------------
ALTER TABLE `tb_daftar_soal`
    CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `tb_daftar_soal`
    MODIFY `teks_soal` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

-- ------------------------------------------------------------
-- 2. Perbaiki tabel: tb_soal (jawaban mahasiswa bisa mengandung Arab)
-- ------------------------------------------------------------
ALTER TABLE `tb_soal`
    CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `tb_soal`
    MODIFY `nama_mahasiswa` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_1`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_2`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_3`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_4`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_5`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_6`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_7`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_8`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_9`  TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_10` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_11` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_12` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_13` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_14` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_15` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_16` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `jawaban_17` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

-- ------------------------------------------------------------
-- 3. Perbaiki tabel: tema_masalah (nama tema bisa mengandung Arab)
-- ------------------------------------------------------------
ALTER TABLE `tema_masalah`
    CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `tema_masalah`
    MODIFY `nama_tema` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `kelompok`  ENUM('Masalah Utama','Masalah Kontemporer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    MODIFY `kelas`     VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;

-- ------------------------------------------------------------
-- 4. Perbaiki tabel: user (nama_lengkap bisa mengandung karakter khusus)
-- ------------------------------------------------------------
ALTER TABLE `user`
    CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- SELESAI
-- Setelah menjalankan script ini:
-- - Teks Arab bisa disimpan dan dibaca dengan benar
-- - Jawaban mahasiswa yang mengandung Arab tidak akan rusak
-- - Nama tema yang mengandung Arab akan tampil dengan benar
-- ============================================================
