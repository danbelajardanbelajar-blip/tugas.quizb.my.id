-- ================================================================
-- Web Tugas Perkuliahan - Database Schema
-- Jalankan file ini di MySQL untuk membuat database & tabel
-- ================================================================

-- CREATE DATABASE IF NOT EXISTS `quic1934_tugas`
--    CHARACTER SET utf8mb4
--    COLLATE utf8mb4_unicode_ci;

USE `quic1934_tugas`;

-- ----------------------------------------------------------------
-- Tabel users (admin & mahasiswa)
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
    `id`         INT          NOT NULL AUTO_INCREMENT,
    `username`   VARCHAR(50)  NOT NULL COMMENT 'NIM untuk mahasiswa',
    `password`   VARCHAR(255) NOT NULL,
    `role`       ENUM('admin','mahasiswa') NOT NULL DEFAULT 'mahasiswa',
    `nama`       VARCHAR(100) NOT NULL,
    `kelas`      VARCHAR(20)  NULL COMMENT 'Hanya untuk mahasiswa',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------------
-- Tabel tugas
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tugas` (
    `id`         INT          NOT NULL AUTO_INCREMENT,
    `judul`      VARCHAR(200) NOT NULL,
    `deskripsi`  TEXT         NULL,
    `deadline`   DATE         NULL,
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------------
-- Tabel tema (bagian dari tugas)
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tema` (
    `id`         INT          NOT NULL AUTO_INCREMENT,
    `tugas_id`   INT          NOT NULL,
    `nama`       VARCHAR(200) NOT NULL,
    `urutan`     INT          NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`tugas_id`) REFERENCES `tugas`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------------
-- Tabel soal (pertanyaan uraian dalam tema)
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `soal` (
    `id`         INT  NOT NULL AUTO_INCREMENT,
    `tema_id`    INT  NOT NULL,
    `pertanyaan` TEXT NOT NULL,
    `jenis`      ENUM('ganda', 'uraian', 'file') NOT NULL DEFAULT 'uraian',
    `opsi`       JSON NULL,
    `urutan`     INT  NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`tema_id`) REFERENCES `tema`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------------
-- Tabel jawaban mahasiswa
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jawaban` (
    `id`           INT  NOT NULL AUTO_INCREMENT,
    `mahasiswa_id` INT  NOT NULL,
    `soal_id`      INT  NOT NULL,
    `isi`          TEXT NULL,
    `created_at`   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_jawaban` (`mahasiswa_id`, `soal_id`),
    FOREIGN KEY (`mahasiswa_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`soal_id`)     REFERENCES `soal`(`id`)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
