-- Tambahkan kolom tema_id pada tabel tb_daftar_soal untuk menghubungkan soal dengan tema_masalah
ALTER TABLE tb_daftar_soal
    ADD COLUMN tema_id INT NULL AFTER id;

-- Tambahkan index untuk kolom tema_id agar query lebih cepat
ALTER TABLE tb_daftar_soal
    ADD INDEX idx_tema_id (tema_id);

-- Tambahkan foreign key jika engine mendukung (opsional)
ALTER TABLE tb_daftar_soal
    ADD CONSTRAINT fk_tb_daftar_soal_tema_masalah
    FOREIGN KEY (tema_id) REFERENCES tema_masalah(id_tema)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
