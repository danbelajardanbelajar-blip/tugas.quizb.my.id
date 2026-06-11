-- Update tabel soal untuk mendukung tipe Ganda dan File
ALTER TABLE `soal` 
ADD COLUMN `jenis` ENUM('ganda', 'uraian', 'file') NOT NULL DEFAULT 'uraian' AFTER `pertanyaan`,
ADD COLUMN `opsi` JSON NULL AFTER `jenis`;
