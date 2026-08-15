-- 1. Pastikan kelas 'PAI-DN' ada di tabel kelas (jika menggunakan ID)
INSERT IGNORE INTO `kelas` (`nama`) VALUES ('PAI-DN');

-- 2. Dapatkan ID dari kelas 'PAI-DN' tersebut dan update tabel users 
-- (Query ini berjalan jika database Anda SUDAH dimigrasi ke sistem kelas_id yang baru)
UPDATE `users` 
SET `kelas_id` = (SELECT `id` FROM `kelas` WHERE `nama` = 'PAI-DN' LIMIT 1)
WHERE `kelas_id` IS NULL AND `role` = 'mahasiswa';

-- CATATAN: 
-- Jika Anda BELUM melakukan migrasi database (masih menggunakan sistem lama), 
-- cukup jalankan satu baris query di bawah ini:
-- UPDATE `users` SET `kelas` = 'PAI-DN' WHERE (`kelas` IS NULL OR `kelas` = '') AND `role` = 'mahasiswa';
