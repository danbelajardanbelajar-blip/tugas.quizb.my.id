-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Jun 2026 pada 07.36
-- Versi server: 11.4.10-MariaDB-cll-lve
-- Versi PHP: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quic1934_tugas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `must_change_password`, `created_at`, `updated_at`) VALUES
(1, 'zainul', '$2y$10$JYiK0q029eISvxqGA7TbGOj2AQT8/pUvnbwtffXjfx8zPteli3IfK', 1, '2026-04-09 13:40:50', '2026-04-09 13:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_content`
--

CREATE TABLE `site_content` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `content_json` longtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `site_content`
--

INSERT INTO `site_content` (`id`, `content_json`, `updated_at`) VALUES
(1, '{\"site\":{\"title\":\"PAI Multikultural Hub\",\"subtitle\":\"Portofolio jurnal dan artikel untuk Pendidikan Agama Islam yang inklusif, dialogis, dan peka terhadap keragaman sosial-budaya.\",\"description\":\"Platform ini menghimpun tautan jurnal, portal pencarian, dan posting kurasi bertema PAI Multikultural agar proses pencarian referensi lebih cepat, rapi, dan mudah dipublikasikan ulang ke GitHub.\",\"updatedAt\":\"2026-04-09\",\"highlightTopics\":[\"Moderasi beragama\",\"Kelas PAI inklusif\",\"Dialog lintas budaya\",\"Toleransi dan tasamuh\",\"Kurikulum PAI kontekstual\",\"Kearifan lokal\"]},\"journals\":[{\"id\":\"journal-moraref\",\"title\":\"MORAREF\",\"institution\":\"Kementerian Agama Republik Indonesia\",\"level\":\"Portal Nasional\",\"focus\":\"Portal indeks jurnal keislaman dan pendidikan Islam\",\"url\":\"https://moraref.kemenag.go.id/\",\"note\":\"Portal penting untuk menelusuri jurnal-jurnal Islam dan pendidikan. Saat data awal ini dibuat, laman utamanya sedang menampilkan status perbaikan sehingga cocok dipantau ulang secara berkala.\",\"tags\":[\"portal\",\"PAI\",\"pendidikan Islam\"],\"featured\":true},{\"id\":\"journal-garuda\",\"title\":\"GARUDA\",\"institution\":\"Kemendikbudristek\",\"level\":\"Portal Nasional\",\"focus\":\"Indeks artikel ilmiah Indonesia lintas disiplin\",\"url\":\"https://garuda.kemdikbud.go.id/\",\"note\":\"Cocok untuk menelusuri artikel pendidikan, moderasi beragama, dan riset terkait keragaman sosial dalam konteks pembelajaran.\",\"tags\":[\"portal\",\"artikel\",\"pendidikan\"],\"featured\":true},{\"id\":\"journal-doaj\",\"title\":\"DOAJ\",\"institution\":\"Directory of Open Access Journals\",\"level\":\"Portal Internasional\",\"focus\":\"Direktori jurnal akses terbuka lintas bidang\",\"url\":\"https://doaj.org/\",\"note\":\"Portal internasional yang berguna untuk menemukan jurnal open access dan menelusuri artikel yang relevan dengan pendidikan, agama, dan keberagaman.\",\"tags\":[\"open access\",\"portal\",\"internasional\"],\"featured\":true},{\"id\":\"journal-al-jamiah\",\"title\":\"Al-Jami\'ah: Journal of Islamic Studies\",\"institution\":\"UIN Sunan Kalijaga Yogyakarta\",\"level\":\"Internasional\",\"focus\":\"Kajian Islam dan kemasyarakatan\",\"url\":\"https://aljamiah.or.id/index.php/AJIS\",\"note\":\"Berguna untuk menelusuri isu relasi agama, budaya, dan pendidikan Islam di masyarakat plural.\",\"tags\":[\"Islamic studies\",\"pluralitas\",\"pendidikan\"],\"featured\":false},{\"id\":\"journal-qijis\",\"title\":\"QIJIS: Qudus International Journal of Islamic Studies\",\"institution\":\"IAIN Kudus\",\"level\":\"Internasional\",\"focus\":\"Kajian Islam, pendidikan, dan dinamika sosial\",\"url\":\"https://journal.iainkudus.ac.id/index.php/QIJIS\",\"note\":\"Dapat dipantau untuk artikel yang membahas transformasi pendidikan Islam dan relasi antar-komunitas.\",\"tags\":[\"Islamic studies\",\"pendidikan\",\"sosial\"],\"featured\":true},{\"id\":\"journal-edukasia\",\"title\":\"Edukasia: Jurnal Penelitian Pendidikan Islam\",\"institution\":\"IAIN Kudus\",\"level\":\"Nasional\",\"focus\":\"Penelitian pendidikan Islam\",\"url\":\"https://journal.iainkudus.ac.id/index.php/Edukasia\",\"note\":\"Sangat relevan untuk topik strategi pembelajaran PAI, kurikulum, dan pendekatan inklusif di kelas.\",\"tags\":[\"PAI\",\"kurikulum\",\"pembelajaran\"],\"featured\":true},{\"id\":\"journal-google-scholar\",\"title\":\"Google Scholar\",\"institution\":\"Google\",\"level\":\"Portal Internasional\",\"focus\":\"Penelusuran artikel ilmiah lintas bidang\",\"url\":\"https://scholar.google.com/\",\"note\":\"Pintu masuk paling praktis untuk membangun query tema PAI Multikultural, moderasi beragama, dan pembelajaran inklusif.\",\"tags\":[\"portal\",\"artikel\",\"pencarian\"],\"featured\":false},{\"id\":\"journal-jpi\",\"title\":\"Jurnal Pendidikan Islam\",\"institution\":\"UIN Sunan Kalijaga Yogyakarta\",\"level\":\"Nasional\",\"focus\":\"Riset pendidikan Islam dan pengembangan teori-praktik pendidikan\",\"url\":\"https://ejournal.uin-suka.ac.id/tarbiyah/index.php/JPI\",\"note\":\"Bisa dipakai untuk mencari kajian tentang kurikulum, pendidikan karakter, dan pendekatan kontekstual dalam PAI.\",\"tags\":[\"pendidikan Islam\",\"karakter\",\"kurikulum\"],\"featured\":false}],\"posts\":[{\"id\":\"post-kurasi-sekolah-menengah\",\"type\":\"Kurasi Topik\",\"title\":\"PAI Multikultural di Sekolah Menengah\",\"author\":\"Tim Kurasi\",\"year\":\"2026\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=pendidikan+agama+islam+multikultural+sekolah+menengah\",\"summary\":\"Pintu masuk untuk menelusuri riset tentang praktik pembelajaran PAI di lingkungan sekolah menengah yang majemuk secara sosial dan budaya.\",\"tags\":[\"PAI\",\"sekolah\",\"multikultural\"],\"featured\":true},{\"id\":\"post-moderasi-beragama\",\"type\":\"Kurasi Topik\",\"title\":\"Moderasi Beragama dalam Pembelajaran PAI\",\"author\":\"Tim Kurasi\",\"year\":\"2026\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=moderasi+beragama+dalam+pembelajaran+PAI\",\"summary\":\"Kumpulan telusur untuk mencari artikel yang membahas moderasi beragama, sikap berimbang, dan desain materi PAI yang tidak eksklusif.\",\"tags\":[\"moderasi\",\"PAI\",\"agama\"],\"featured\":true},{\"id\":\"post-pai-inklusif\",\"type\":\"Kurasi Topik\",\"title\":\"Strategi PAI Inklusif untuk Kelas Multikultur\",\"author\":\"Tim Kurasi\",\"year\":\"2025\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=pembelajaran+PAI+inklusif+kelas+multikultural\",\"summary\":\"Fokus pada metode pembelajaran, pengelolaan diskusi, dan penumbuhan empati di kelas dengan latar peserta didik yang beragam.\",\"tags\":[\"inklusif\",\"kelas\",\"strategi\"],\"featured\":true},{\"id\":\"post-nilai-tasamuh\",\"type\":\"Kurasi Topik\",\"title\":\"Nilai Tasamuh dan Resolusi Konflik\",\"author\":\"Tim Kurasi\",\"year\":\"2025\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=nilai+tasamuh+dalam+pembelajaran+PAI\",\"summary\":\"Menjembatani pencarian artikel tentang toleransi, tasamuh, akhlak sosial, dan manajemen perbedaan dalam praktik pendidikan Islam.\",\"tags\":[\"tasamuh\",\"toleransi\",\"akhlak\"],\"featured\":false},{\"id\":\"post-identitas-kebangsaan\",\"type\":\"Kurasi Topik\",\"title\":\"PAI, Kebangsaan, dan Pendidikan Kewargaan\",\"author\":\"Tim Kurasi\",\"year\":\"2025\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=PAI+kebangsaan+dan+multikultural\",\"summary\":\"Kurasi untuk mencari artikel yang mempertemukan pendidikan agama, identitas kebangsaan, dan kehidupan demokratis di sekolah.\",\"tags\":[\"kebangsaan\",\"demokrasi\",\"PAI\"],\"featured\":false},{\"id\":\"post-projek-sosial\",\"type\":\"Kurasi Praktik\",\"title\":\"Projek Sosial Berbasis PAI dan Keberagaman\",\"author\":\"Tim Kurasi\",\"year\":\"2024\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=projek+sosial+berbasis+PAI+keberagaman\",\"summary\":\"Pencarian yang dapat dipakai untuk menemukan model praktik projek, pengabdian, dan pembelajaran kontekstual berbasis isu sosial-keagamaan.\",\"tags\":[\"projek\",\"kontekstual\",\"sosial\"],\"featured\":false},{\"id\":\"post-kearifan-lokal\",\"type\":\"Kurasi Topik\",\"title\":\"Kearifan Lokal sebagai Sumber Belajar PAI\",\"author\":\"Tim Kurasi\",\"year\":\"2024\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=kearifan+lokal+dalam+pendidikan+agama+islam\",\"summary\":\"Mengarah pada artikel tentang integrasi budaya lokal, tradisi masyarakat, dan penguatan sikap toleran dalam pembelajaran PAI.\",\"tags\":[\"kearifan lokal\",\"budaya\",\"materi\"],\"featured\":false},{\"id\":\"post-evaluasi-sikap\",\"type\":\"Kurasi Penelitian\",\"title\":\"Evaluasi Sikap Toleransi Peserta Didik\",\"author\":\"Tim Kurasi\",\"year\":\"2024\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=evaluasi+sikap+toleransi+peserta+didik+PAI\",\"summary\":\"Telusur awal untuk metodologi penilaian afektif, indikator toleransi, dan evaluasi hasil pembelajaran PAI berbasis nilai kebersamaan.\",\"tags\":[\"evaluasi\",\"toleransi\",\"peserta didik\"],\"featured\":false}]}', '2026-04-09 13:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_daftar_soal`
--

CREATE TABLE `tb_daftar_soal` (
  `id` int(11) NOT NULL,
  `tema_id` int(11) DEFAULT NULL,
  `teks_soal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_daftar_soal`
--

INSERT INTO `tb_daftar_soal` (`id`, `tema_id`, `teks_soal`) VALUES
(0, 7, 'Temukan 3 nama ulama yang mengatakan rokok halal!');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id` int(11) NOT NULL,
  `nama_mahasiswa` varchar(150) NOT NULL,
  `jawaban_1` text NOT NULL,
  `jawaban_2` text NOT NULL,
  `jawaban_3` text NOT NULL,
  `jawaban_4` text NOT NULL,
  `jawaban_5` text NOT NULL,
  `jawaban_6` text NOT NULL,
  `jawaban_7` text NOT NULL,
  `jawaban_8` text NOT NULL,
  `jawaban_9` text NOT NULL,
  `jawaban_10` text NOT NULL,
  `jawaban_11` text NOT NULL,
  `jawaban_12` text NOT NULL,
  `jawaban_13` text NOT NULL,
  `jawaban_14` text NOT NULL,
  `jawaban_15` text NOT NULL,
  `jawaban_16` text NOT NULL,
  `jawaban_17` text NOT NULL,
  `waktu_submit` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tema_masalah`
--

CREATE TABLE `tema_masalah` (
  `id_tema` int(11) NOT NULL,
  `nama_tema` varchar(255) NOT NULL,
  `kelompok` enum('Masalah Utama','Masalah Kontemporer') NOT NULL,
  `kelas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tema_masalah`
--

INSERT INTO `tema_masalah` (`id_tema`, `nama_tema`, `kelompok`, `kelas`) VALUES
(1, 'Kenapa sesama muslim tapi puasanya beda hari', 'Masalah Utama', '6B'),
(2, 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Masalah Utama', '6B'),
(3, 'Membaca basmalah saat sholat (keras/pelan)', 'Masalah Utama', '6B'),
(4, 'Hukum qunut dalam sholat subuh', 'Masalah Utama', '6B'),
(5, 'Menyentuh mushaf tanpa wudhu', 'Masalah Utama', '6B'),
(6, 'Hukum suntik ketika puasa', 'Masalah Utama', '6B'),
(7, 'Hukum merokok', 'Masalah Utama', '6B'),
(8, 'Hukum niat puasa', 'Masalah Utama', '6B'),
(9, 'Hukum memegang mushaf saat haid', 'Masalah Utama', '6B'),
(10, 'Berkumur saat puasa', 'Masalah Utama', '6B'),
(11, 'Tadaruss speaker malam hari', 'Masalah Utama', '6B'),
(12, 'Hukum nikah hamil luar nikah', 'Masalah Utama', '6B'),
(13, 'Sholat pakai make up merkuri', 'Masalah Utama', '6B'),
(14, 'Ziarah kubur', 'Masalah Utama', '6B'),
(15, 'Masalah Waris Al-Musyarakah', 'Masalah Utama', '6B'),
(16, 'Muslim ikut perayaan non muslim', 'Masalah Utama', '6B'),
(17, 'Hukum uang trading', 'Masalah Utama', '6B'),
(18, 'Rokaat Tarawih 8 atau 20', 'Masalah Utama', '6B'),
(19, 'Hukum Uang Digital/ Crypto', 'Masalah Kontemporer', '6B'),
(20, 'Bayar zakat online', 'Masalah Kontemporer', '6B'),
(21, 'Hukum bayi tabung', 'Masalah Kontemporer', '6B'),
(22, 'Transaksi Shopee', 'Masalah Kontemporer', '6B'),
(23, 'Aplikasi Quran HP tanpa wudhu', 'Masalah Kontemporer', '6B'),
(24, 'Hukum main saham', 'Masalah Kontemporer', '6B'),
(25, 'Zakat Fitrah dengan Uang', 'Masalah Kontemporer', '6B'),
(26, 'Donor/Bank ASI', 'Masalah Kontemporer', '6B'),
(27, 'Hukum Pinjol', 'Masalah Kontemporer', '6B'),
(28, 'Jual Beli Bitcoin', 'Masalah Kontemporer', '6B'),
(29, 'Penyalahgunaan AI', 'Masalah Kontemporer', '6B'),
(30, 'Jual beli organ tubuh', 'Masalah Kontemporer', '6B'),
(31, 'Hukum foto prewed', 'Masalah Kontemporer', '6B'),
(32, 'Sholawat dibuat DJ', 'Masalah Kontemporer', '6B'),
(33, 'Hukum Paylater', 'Masalah Kontemporer', '6B'),
(34, 'Hukum Vaksin', 'Masalah Kontemporer', '6B'),
(35, 'Masafatul Qoshor', 'Masalah Kontemporer', '6B'),
(36, 'Jumlah rakaat dalam shalat tarawih', 'Masalah Utama', '6C'),
(37, 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Masalah Utama', '6C'),
(38, 'Nikah tanpa wali', 'Masalah Utama', '6C'),
(39, 'Riba atau bunga dalam pinjam meminjam', 'Masalah Utama', '6C'),
(40, 'Hukum talak tiga sekaligus', 'Masalah Utama', '6C'),
(41, 'Batas aurat laki-laki dan perempuan', 'Masalah Utama', '6C'),
(42, 'Perbedaan mazhab dalam wudhu', 'Masalah Utama', '6C'),
(43, 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Masalah Utama', '6C'),
(44, 'Qunut shalat subuh', 'Masalah Utama', '6C'),
(45, 'Hukum talak dalam pernikahan', 'Masalah Utama', '6C'),
(46, 'Khutbah Jumat menggunakan selain bahasa Arab', 'Masalah Utama', '6C'),
(47, 'Nikah mut’ah', 'Masalah Utama', '6C'),
(48, 'Mengangkat tangan saat takbir selain takbiratul ihram', 'Masalah Utama', '6C'),
(49, 'Mengqadha shalat yang sengaja ditinggalkan', 'Masalah Utama', '6C'),
(50, 'Muamalat sewa-menyewa (ijarah)', 'Masalah Utama', '6C'),
(51, 'Hukum rokok dan vape', 'Masalah Utama', '6C'),
(52, 'Hukum musik dalam Islam', 'Masalah Utama', '6C'),
(53, 'Talak tiga yang diucapkan sekaligus', 'Masalah Utama', '6C'),
(54, 'Mendengar dan menjawab adzan lebih dari satu', 'Masalah Utama', '6C'),
(55, 'Membuang rambut atau kuku saat sedang haid', 'Masalah Utama', '6C'),
(56, 'Hukum E-wallet, Kripto, dan bunga bank', 'Masalah Kontemporer', '6C'),
(57, 'Hukum operasi plastik', 'Masalah Kontemporer', '6C'),
(58, 'Nikah beda agama', 'Masalah Kontemporer', '6C'),
(59, 'Bayi tabung dan rekayasa reproduksi', 'Masalah Kontemporer', '6C'),
(60, 'Hukum donor organ', 'Masalah Kontemporer', '6C'),
(61, 'Jual beli online (marketplace)', 'Masalah Kontemporer', '6C'),
(62, 'Transaksi digital dan E-money (cashless)', 'Masalah Kontemporer', '6C'),
(63, 'Hukum bunga bank', 'Masalah Kontemporer', '6C'),
(64, 'Donor organ dan transplantasi', 'Masalah Kontemporer', '6C'),
(65, 'Hukum bayi tabung dalam kedokteran modern', 'Masalah Kontemporer', '6C'),
(66, 'Penggunaan dompet digital (ShopeePay)', 'Masalah Kontemporer', '6C'),
(67, 'Bayi tabung', 'Masalah Kontemporer', '6C'),
(68, 'Jual beli online', 'Masalah Kontemporer', '6C'),
(69, 'Menggunakan make-up dan skincare saat puasa', 'Masalah Kontemporer', '6C'),
(70, 'Transplantasi organ saat hidup atau mati otak', 'Masalah Kontemporer', '6C'),
(71, 'Kurban online (transfer dana penyembelihan)', 'Masalah Kontemporer', '6C'),
(72, 'Hukum aplikasi pinjaman online (pinjol)', 'Masalah Kontemporer', '6C'),
(73, 'Akad nikah secara online', 'Masalah Kontemporer', '6C'),
(74, 'Bekerja sebagai pegawai bank konvensional', 'Masalah Kontemporer', '6C'),
(75, 'Hukum suntik atau infus saat puasa', 'Masalah Kontemporer', '6C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tema_masalah` varchar(255) DEFAULT NULL,
  `type_tugas` varchar(50) DEFAULT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `file_upload` varchar(255) NOT NULL,
  `stamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `username`, `tema_masalah`, `type_tugas`, `kelas`, `file_upload`, `stamp`) VALUES
(4, '1', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', NULL, '1775701678_Aqidatul_Awwam_Revised.docx', '2026-04-10 06:51:05'),
(5, '1', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775701878_Screenshot_2026-04-09_090628.png', '2026-04-10 06:51:05'),
(7, '23051041', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', NULL, '1775702187_Masailul_Fiqih_Fatimatuz_Zahro_(2).docx', '2026-04-10 06:51:05'),
(8, '23051040', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', NULL, '1775702233_MASHAILUL_FIQHIYAH_(OLIVIA_MAULIDATUR_R).docx', '2026-04-10 06:51:05'),
(11, '23051041', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775702292_Pendahuluan_Fatimatuz_Zahroh_23051041.docx', '2026-04-10 06:51:05'),
(13, '23051040', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775702318_Pendahuluan_OLIVIA_MAULIDATUR_ROHMA_(_23051040_).docx', '2026-04-10 06:51:05'),
(15, '23051041', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', NULL, '1775702350_Hasil_dan_Pembahasan_Fatimatuz_Zahro_23051041.docx', '2026-04-10 06:51:05'),
(16, '23051023', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775702355_Mashailul_Fiqhiyah^LJMuh_SYAHRUL,FAKHRUS,SARIF_(AutoRecovered).pdf', '2026-04-10 06:51:05'),
(18, '23051040', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', NULL, '1775702413_HASIL_DAN_PEMBAHASAN_MF_OLIVIA_MAULIDATUR_ROHMA_(23051040).docx', '2026-04-10 06:51:05'),
(20, '23051042', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', NULL, '1775702458_Mashailul_Fiqhiyyah_Rosikhotun_Nadiyah_(23051042).docx', '2026-04-10 06:51:05'),
(21, '23051042', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775702501_PENDAHULUAN_MASHAILUL_FIQHIYAH.docx', '2026-04-10 06:51:05'),
(22, '23051042', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', NULL, '1775702526_PEMBAHASAN_MASAILUL_FIQHIYYAH.docx', '2026-04-10 06:51:05'),
(26, '23051047', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775702624_Mashailul_Fiqhiyah^LJMuh_SYAHRUL,FAKHRUS,SARIF_(AutoRecovered).pdf', '2026-04-10 06:51:05'),
(27, '23051066', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', NULL, '1775702633_tabel_novi.docx', '2026-04-10 06:51:05'),
(28, '23051141', 'Masalah Waris Al-Musyarakah', 'Pembahasan', NULL, '1775702721_pak_zainul.docx', '2026-04-10 06:51:05'),
(31, '23051066', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775702752_latar_belakang_novi.docx', '2026-04-10 06:51:05'),
(32, '23051066', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', NULL, '1775702844_sub_bab_hasil_&_pembahasan.docx', '2026-04-10 06:51:05'),
(34, '23051035', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775703053_Mashailul_Fiqhiyah^LJMuh_SYAHRUL,FAKHRUS,SARIF_(AutoRecovered).pdf', '2026-04-10 06:51:05'),
(35, '1', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775703206_Screenshot_2026-04-07_060753.png', '2026-04-10 06:51:05'),
(36, '1', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775703232_Disertasi_(Pasca_Uji_Terbuka)-2.docx', '2026-04-10 06:51:05'),
(37, '1', 'Menyentuh lawan jenis apakah membatalkan wudhu (Novi)', 'Pembahasan', NULL, '1775703252_Disertasi_(Pasca_Uji_Terbuka)-2.docx', '2026-04-10 06:51:05'),
(38, '1', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775704962_Document_(1).docx', '2026-04-10 06:51:05'),
(39, '23051157', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775734996_hasil_dan_pembahasan_syafa_dan_sukronnmkmn.docx', '2026-04-10 06:51:05'),
(40, '23051157', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775735029_hasil_dan_pembahasan_syafa_dan_sukronnmkmn.docx', '2026-04-10 06:51:05'),
(41, '23051041', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775739009_LENGKAP_Fatimatuz_Zahroh_23051041.docx', '2026-04-10 06:51:05'),
(43, '23051050', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', NULL, '1775744683_MASHAILUL.docx', '2026-04-10 06:51:05'),
(44, '23051050', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', NULL, '1775744916_TABEL_MASHAILUL.docx', '2026-04-10 06:51:05'),
(45, '1', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775745437_Surah_An_Naba_.xlsx', '2026-04-10 06:51:05'),
(46, '23051037', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', NULL, '1775753468_hidayatun_ni_mah__MF_.pdf', '2026-04-10 06:51:05'),
(47, '23051037', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', NULL, '1775753490_Pendahuluan_hidayatun_ni_mah.pdf', '2026-04-10 06:51:05'),
(48, '23051037', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', NULL, '1775753511_pembahasan_masailul_fiqh.pdf', '2026-04-10 06:51:05'),
(49, '23051037', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Kesimpulan', NULL, '1775753533_pembahasan_masailul_fiqh.pdf', '2026-04-10 06:51:05'),
(51, '23051111', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775803903_masailul_fiqhiyah_putri_avnita_.pdf', '2026-04-10 06:51:43'),
(52, '23051068', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775803978_IMG_0372.jpeg', '2026-04-10 06:52:58'),
(54, '23051115', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804183_17758041194868837714600486145509.jpg', '2026-04-10 06:56:23'),
(55, '23051122', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804201_IMG_20260410_135531.jpg', '2026-04-10 06:56:41'),
(57, '23051146', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804304_20260410_135714.jpg', '2026-04-10 06:58:24'),
(58, '23051142', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804319_IMG_20260410_135749.jpg', '2026-04-10 06:58:39'),
(59, '23051158', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804341_image.jpg', '2026-04-10 06:59:01'),
(60, '23051133', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804343_17758041167901734503019570685457.jpg', '2026-04-10 06:59:03'),
(61, '23051130', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', NULL, '1775804549_WhatsApp_Image_2026-04-10_at_14.01.23.jpeg', '2026-04-10 07:02:29'),
(62, '23051132', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805096_17758050825367283165720598380652.jpg', '2026-04-10 07:11:36'),
(63, '1', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1775805123_package-lock.json', '2026-04-10 07:12:03'),
(66, '23051096', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805288_Himmatul.xlsx', '2026-04-10 07:14:48'),
(67, '23051115', 'Rokaat Tarawih 8 atau 20 (wafiyah)', 'Table', '6C', '1775805326_17758052976367981669582862919264.jpg', '2026-04-10 07:15:26'),
(68, '23051135', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805345_20260410_141258.jpg', '2026-04-10 07:15:45'),
(69, '23051135', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805368_20260410_141306.jpg', '2026-04-10 07:16:08'),
(70, '23051118', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805373_DOC-20260410-WA0020.PDF', '2026-04-10 07:16:13'),
(71, '23051129', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805432_image.jpg', '2026-04-10 07:17:12'),
(72, '23051129', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805452_image.jpg', '2026-04-10 07:17:32'),
(73, '23051129', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805469_image.jpg', '2026-04-10 07:17:49'),
(75, '23051129', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805484_image.jpg', '2026-04-10 07:18:04'),
(76, '23051102', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805486_jumlah_rakaat_tarawih.docx', '2026-04-10 07:18:06'),
(77, '23051129', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805499_image.jpg', '2026-04-10 07:18:19'),
(78, '23051069', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775805701_image.jpg', '2026-04-10 07:21:41'),
(80, '23051150', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', '6B', '1775817458_ALFI_ARDILLA.docx', '2026-04-10 10:37:38'),
(81, '23051150', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', '6B', '1775817476_ALFI_ARDILLA__LENGKAP_.docx', '2026-04-10 10:37:56'),
(87, '23051044', 'Hukum nikah hamil luar nikah (maftukhah)', 'Table', '6B', '1775822416_TABEL_maftukhah_23051044.docx', '2026-04-10 12:00:16'),
(88, '23051044', 'Jual beli organ tubuh (maftukhah)', 'Pembahasan', '6B', '1775822461_LATAR_BELAKANG___PEMBAHASAN_penentuan_bulan_ramadhan.docx', '2026-04-10 12:01:01'),
(89, '23051043', 'Muslim ikut perayaan non muslim (Nabila)', 'Pembahasan', '6B', '1775824566_Dokumen_tanpa_judul.docx', '2026-04-10 12:36:06'),
(90, '23051043', 'Muslim ikut perayaan non muslim (Nabila)', 'Pendahuluan', '6B', '1775824770_ALFI_ARDILLA_NABILA_SHOUNIYAH-1.docx', '2026-04-10 12:39:30'),
(91, '23051054', 'Jumlah rakaat dalam shalat tarawih', 'Lengkap', '6C', '1775825619_ahmad_muzayyan_abul_aula.pdf', '2026-04-10 12:53:39'),
(92, '23051152', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1775860838_MASAILUL_FIQHIYAH_RIZKIYAH.pdf', '2026-04-10 22:40:38'),
(93, '23051040', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', '6B', '1775902688_LENGKAP__OLIVIA_MAULIDATUR_ROHMA_23051040_.docx', '2026-04-11 10:18:08'),
(94, '23051042', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', '6B', '1776169719_1775743954_Tugas_Mashailul_Fiqhiyyah_Majelis_Tarjih_Dan_LBMNU_Lengkap__1_.docx', '2026-04-14 12:28:39'),
(96, '23051159', 'Jumlah rakaat dalam shalat tarawih', 'Pembahasan', '6C', '1776295386_7B840719-23ED-4210-8C96-5AAE8C9DA379.jpeg', '2026-04-15 23:23:06'),
(97, '23051159', 'Jumlah rakaat dalam shalat tarawih', 'Pembahasan', '6C', '1776295440_12A2E60C-55F4-4E4D-A856-CFDF3B3CAC47.jpeg', '2026-04-15 23:24:00'),
(98, '23051086', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', '6B', '1776300028_MASHAILUL_FIQHIYAH_.pdf', '2026-04-16 00:40:28'),
(99, '23051080', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1776309744_masailul_fiqhiyah_isnaini.docx', '2026-04-16 03:22:24'),
(100, '23051087', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1776309882_tugas_widiya.docx', '2026-04-16 03:24:42'),
(102, '23051048', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776407758_Tugas_1_mashailul_Fiqhiyah_Gita.docx', '2026-04-17 06:35:58'),
(103, '23051048', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Pendahuluan', '6B', '1776407778_tugas_2_mashailul_fiqhiyah_gita.docx', '2026-04-17 06:36:18'),
(104, '23051048', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Pembahasan', '6B', '1776407801_Tugas_3_mashailul_fiqhiyah_Gita.docx', '2026-04-17 06:36:41'),
(105, '23051150', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Lengkap', '6B', '1776509326_Hukum_memakai_Uang_Digital.pdf', '2026-04-18 10:48:46'),
(108, '23051043', 'Muslim ikut perayaan non muslim (Nabila)', 'Table', '6B', '1776650778_masailul_fiqih.docx', '2026-04-20 02:06:18'),
(109, '23051040', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776696370_OLIVIA_MAULIDATUR_ROHMA___HUKUM_UANG_DIGITAL_.docx', '2026-04-20 14:46:10'),
(110, '23051042', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776738118_Jawaban_mashailul_Fiqhiyyah_hukum_kripto.docx', '2026-04-21 02:21:58'),
(111, '23051142', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776769531_Tugas_Masailul_Fiqhiyah_E-Wallet_Muthi_a_Nafisatun.pdf', '2026-04-21 11:05:31'),
(112, '23051054', 'Hukum E-wallet, Kripto, dan bunga bank', 'Lengkap', '6C', '1776825100_tugas_ahmad_muzayyan_abul_aula_masailul_fiqhiyyah_6c.pdf', '2026-04-22 02:31:40'),
(113, '23051066', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', '6B', '1776830165_yogi_noviana.docx', '2026-04-22 03:56:05'),
(114, '23051096', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776832724_Tugas_masailul_fiqhiyah_himmatul_23051096.docx', '2026-04-22 04:38:44'),
(115, '23051066', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776834438_tugas_USTD_Zainul.docx', '2026-04-22 05:07:18'),
(116, '23051069', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776836465_Masailul_Fiqhiyah-Nichdah.pdf', '2026-04-22 05:41:05'),
(118, '23051146', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776856639_Masailul_Fiqhiyah._Tukhibah_NR.pdf', '2026-04-22 11:17:19'),
(119, '23051133', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776858030_tugas_2_khofifah_23051133.pdf', '2026-04-22 11:40:30'),
(120, '23051111', 'Transaksi digital dan E-money (cashless)', 'Table', '6C', '1776858234_masailul_fiqhiyah_putri_avnita_2.xlsx', '2026-04-22 11:43:54'),
(121, '23051132', 'Hukum E-wallet, Kripto, dan bunga bank', 'Lengkap', '6C', '1776861492_TUGAS2_SITINUR23051132_MASAILUL_FIQIYAH.docx', '2026-04-22 12:38:12'),
(122, '23051159', 'Hukum E-wallet, Kripto, dan bunga bank', 'Lengkap', '6C', '1776862120_image.jpg', '2026-04-22 12:48:40'),
(123, '23051159', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776862210_image.jpg', '2026-04-22 12:50:10'),
(124, '23051159', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776862234_image.jpg', '2026-04-22 12:50:34'),
(125, '23051087', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776862567_tugas_widiya.docx', '2026-04-22 12:56:07'),
(127, '23051138', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1776863998_IMG_20260422_201834.jpg', '2026-04-22 13:19:58'),
(128, '23051138', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1776864020_IMG_20260422_201842.jpg', '2026-04-22 13:20:20'),
(129, '23051118', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776866083_tugas_fiqih_putri_isnaini.docx', '2026-04-22 13:54:43'),
(130, '23051152', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776866117_Masailul_Fiqhiyah_Rizkiyah.pdf', '2026-04-22 13:55:17'),
(131, '23051080', 'Hukum E-wallet, Kripto, dan bunga bank', 'Lengkap', '6C', '1776868641_masailul_fiqhiyah_isnaini.docx', '2026-04-22 14:37:21'),
(132, '23051041', 'Hukum uang trading (barik)', 'Table', '6B', '1776868832_Masalah_Hukum_Memakai_Uang_Digital_Fatimatuz_Zahro.pdf', '2026-04-22 14:40:32'),
(133, '23051154', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776869139__Amanda__Masailul_Fiqhiyyah_.docx', '2026-04-22 14:45:39'),
(135, '23051135', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776870501_Tugas_Pak_Zainul_2.pdf', '2026-04-22 15:08:21'),
(136, '23051035', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776872973_Hukum_Memakai_Uang_Digital_Muh_syahrul_Ramadhan.docx', '2026-04-22 15:49:33'),
(137, '23051036', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776874322_uang_elektronik_boleh_digunakan_jika_tidak_mengandung_riba.docx', '2026-04-22 16:12:02'),
(138, '23051049', 'Hukum Paylater', 'Table', '6B', '1776874526_Tugas_Mashailul_Fiqhiyah..pdf', '2026-04-22 16:15:26'),
(139, '23051049', 'Hukum Paylater', 'Lengkap', '6B', '1776874854_Mashailul_Fiqhiyah_Rifta.docx', '2026-04-22 16:20:54'),
(140, '23051036', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Lengkap', '6B', '1776874886_Mohammad_Arju_syafa_LENGKAP.docx', '2026-04-22 16:21:26'),
(141, '23051037', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776899728_Hukum_Penggunaan_Uang_Digital.docx', '2026-04-22 23:15:28'),
(142, '23051086', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776900398_Mashailul_fiqhiyah_per.16.pdf', '2026-04-22 23:26:38'),
(143, '23051115', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776906257_masailul_fiqiyah_ihdinatul_jannah-1.docx', '2026-04-23 01:04:17'),
(144, '23051044', 'Hukum Uang Digital/ Crypto (Nadiyah)', 'Table', '6B', '1776906955_HUKUM_UANG_DIGITAL_Maftukha_23051044.pdf', '2026-04-23 01:15:55'),
(145, '23051078', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Table', '6B', '1776908428_MASALAH_FIQIH.docx', '2026-04-23 01:40:28'),
(146, '23051078', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pembahasan', '6B', '1776908646_Hasil_dan_Pembahasan_masailul_fiqiyah.docx', '2026-04-23 01:44:06'),
(147, '23051078', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Pendahuluan', '6B', '1776908714_pendahuluan_masailul_fiqiyah.docx', '2026-04-23 01:45:14'),
(148, '23051078', 'Kenapa sesama muslim tapi puasanya beda hari (sabiq)', 'Kesimpulan', '6B', '1776908762_kesimpulan_masailul_fiqiyah.docx', '2026-04-23 01:46:02'),
(149, '23051048', 'Menyentuh lawan jenis apakah membatalkan wudhu (Novi)', 'Table', '6B', '1776909526_Tugas_2.heic', '2026-04-23 01:58:46'),
(150, '23051048', 'Menyentuh lawan jenis apakah membatalkan wudhu (Novi)', 'Table', '6B', '1776909558_Tugas_1.heic', '2026-04-23 01:59:18'),
(151, '23051157', 'Menyentuh lawan jenis apakah membatalkan wudhu (Novi)', 'Table', '6B', '1776909963_IMG20260423090332.jpg', '2026-04-23 02:06:03'),
(152, '23051122', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776910738_masailul_nela_yusnita.pdf', '2026-04-23 02:18:58'),
(153, '23051157', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911210_IMG20260423092112.jpg', '2026-04-23 02:26:50'),
(154, '23051041', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911285_Hukum_menyentuh_lawan_jenis_Fatimatuz_Zahroh.pdf', '2026-04-23 02:28:05'),
(155, '23051157', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911370_IMG20260423092120.jpg', '2026-04-23 02:29:30'),
(156, '23051042', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911436_Jawaban_Mashailul_Fiqhiyyah_Hukum_menyentuh_lawan_jenis.docx', '2026-04-23 02:30:36'),
(157, '23051066', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911497_tugas_uz_2.docx', '2026-04-23 02:31:37'),
(158, '23051050', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911508_IMG20260423092148.jpg', '2026-04-23 02:31:48'),
(159, '23051040', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776911855_OLIVIA_MAULIDATUR_ROHMA_23051040__HUKUM_MENYENTUH_LAWAN_JENIS_APAKAH_MEMBATALKAN_WUDHU_.docx', '2026-04-23 02:37:35'),
(160, '23051048', 'Hukum Uang Digital/ Crypto', 'Table', '6B', '1776912024_Uang_1.heic', '2026-04-23 02:40:24'),
(161, '23051048', 'Hukum Uang Digital/ Crypto', 'Table', '6B', '1776912038_Uang_2.heic', '2026-04-23 02:40:38'),
(162, '23051044', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1776912588_MAFA_hukum_menyentuh_lawan_jenis.pdf', '2026-04-23 02:49:48'),
(163, '23051130', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776913422_2026-04-23_10-02-02.pdf', '2026-04-23 03:03:42'),
(164, '23051158', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776914687_Maslaha_Mursalah_Rani.docx', '2026-04-23 03:24:47'),
(165, '23051129', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776915291_azky_masailul_fiqih.docx', '2026-04-23 03:34:51'),
(166, '23051102', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776915331_IMG_20260423_103350.jpg', '2026-04-23 03:35:31'),
(167, '23051158', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776915423_mashlaha_mursalah__menyentuh_lawan_jenis_.docx', '2026-04-23 03:37:03'),
(168, '23051115', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776915807_masailul_fiqiyah_menyentuh_lawan_jenis__ihdinatul.docx', '2026-04-23 03:43:27'),
(169, '23051080', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Lengkap', '6C', '1776915879_masailul_fiqhiyah_wudhu.docx', '2026-04-23 03:44:39'),
(170, '23051133', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776915959_maslahah_mursalah_menyentuh_lawan_jenis.docx', '2026-04-23 03:45:59'),
(172, '23051068', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776916186_masilul_fiqhiyah_zuni23051068.pdf', '2026-04-23 03:49:46'),
(173, '23051114', 'Hukum E-wallet, Kripto, dan bunga bank', 'Table', '6C', '1776916483_masailul_fiqih_faizin.docx', '2026-04-23 03:54:43'),
(174, '23051132', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Lengkap', '6C', '1776917062_TUGAS3_SITINUR23051132_MASAILUL_FIQIYAH.docx', '2026-04-23 04:04:22'),
(176, '23051087', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1776917807_tugas_3_masailul_fiqhiyah.docx', '2026-04-23 04:16:47'),
(177, '23051111', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776917824_masailul_fiqhiyah_putri_avnita_3.xlsx', '2026-04-23 04:17:04'),
(180, '23051159', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776918107_Ainun_.docx', '2026-04-23 04:21:47'),
(181, '23051102', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1776920438_IMG_20260423_115440.jpg', '2026-04-23 05:00:38'),
(182, '23051138', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776921688_syafira_nisaul_abdillah.docx', '2026-04-23 05:21:28'),
(183, '23051130', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776926133_2026-04-23_13-33-44.pdf', '2026-04-23 06:35:33'),
(184, '23051130', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776926147_2026-04-23_13-33-44.pdf', '2026-04-23 06:35:47'),
(185, '23051096', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776927248_Tugas_Himmatul_F.__23051096_.docx', '2026-04-23 06:54:08'),
(186, '23051152', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1776930102_Masailul_Fiqhiyah-Hukum_menyentuh_lawan_jenis.pdf', '2026-04-23 07:41:42'),
(187, '23051078', 'Hukum Uang Digital/ Crypto', 'Table', '6B', '1776931706_Tugas_uang_digital.docx', '2026-04-23 08:08:26'),
(188, '23051069', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1776932948_Masailul_Fiqih-Nichdah2.pdf', '2026-04-23 08:29:08'),
(189, '23051043', 'Hukum main saham', 'Table', '6B', '1776939835_masailul_fiqih.docx', '2026-04-23 10:23:55'),
(190, '23051054', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Lengkap', '6C', '1776944024_tugas_masailul_fiqhiyah_ahmad_muzayyan_abul_aula_6c.pdf', '2026-04-23 11:33:44'),
(191, '23051146', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1776946237_20260423_181240.jpg', '2026-04-23 12:10:37'),
(192, '23051146', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1776946266_20260423_181524.jpg', '2026-04-23 12:11:06'),
(193, '23051050', 'Hukum Uang Digital/ Crypto', 'Table', '6B', '1776948696_mashailul_11.docx', '2026-04-23 12:51:36'),
(195, '23051142', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776953211_Tugas_Masailul_Fiqhiyah_Menyentuh_Lawan__Muthi_a_Nafisatun.pdf', '2026-04-23 14:06:51'),
(196, '23051154', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1776953649_Amanda_tugas_masailul_fiqhiyah.docx', '2026-04-23 14:14:09'),
(197, '23051154', 'Jumlah rakaat dalam shalat tarawih', 'Table', '6C', '1776953816_Tugas_Masailul_fiqhiyah.docx', '2026-04-23 14:16:56'),
(198, '23051150', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Lengkap', '6B', '1776955988_Hukum_Menyentuh_Lawan_Jenis.pdf', '2026-04-23 14:53:08'),
(199, '23051078', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1777037293_Masalah_menyentuh_lawan_jenis.docx', '2026-04-24 13:28:13'),
(200, '23051050', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1777118417_mashailul2.docx', '2026-04-25 12:00:17'),
(201, '23051135', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1777212238_Tugas_Pak_Zainul3.pdf', '2026-04-26 14:03:58'),
(204, '23051129', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Table', '6C', '1777253427_azky_masailul_fiqih_3.docx', '2026-04-27 01:30:27'),
(205, '23051115', 'Hukum operasi plastik', 'Table', '6C', '1777254446_Masailul_fiqiyah_ihdinatul_jannah__operasi_plastik.docx', '2026-04-27 01:47:26'),
(208, '23051111', 'Hukum operasi plastik', 'Table', '6C', '1777254966_masailul_fiqhiyah_avnita.pdf', '2026-04-27 01:56:06'),
(211, '23051069', 'Hukum operasi plastik', 'Table', '6C', '1777255366_Masailul_Fiqhiyah-Nichdah4.docx', '2026-04-27 02:02:46'),
(212, '23051152', 'Hukum operasi plastik', 'Table', '6C', '1777272569_Masailul_Fiqhiyah-Hukum_operasi_plastik.pdf', '2026-04-27 06:49:29'),
(213, '23051138', 'Hukum operasi plastik', 'Table', '6C', '1777294300_1776921688_syafira_nisaul_abdillah.docx', '2026-04-27 12:51:40'),
(214, '23051142', 'Hukum operasi plastik', 'Table', '6C', '1777300318_Hukum_Operasi_Plastik_Muthi_a_Nafisatun.docx', '2026-04-27 14:31:58'),
(216, '23051107', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1777332995_Hukum_bersentuhan_saat_wudhu.docx', '2026-04-27 23:36:35'),
(217, '23051107', 'Hukum operasi plastik', 'Table', '6C', '1777333088_MasailulFiqihiyahOperasiplastiknww.docx', '2026-04-27 23:38:08'),
(218, '23051096', 'Hukum operasi plastik', 'Table', '6C', '1777340153_Masailul.docx', '2026-04-28 01:35:53'),
(219, '23051087', 'Hukum operasi plastik', 'Table', '6C', '1777342543_tugas_hukum_operasi_plastik.docx', '2026-04-28 02:15:43'),
(220, '23051105', 'Hukum operasi plastik', 'Lengkap', '6C', '1777342544_tugas_4.docx', '2026-04-28 02:15:44'),
(221, '23051105', 'Menyentuh lawan jenis bukan mahram membatalkan wudhu', 'Lengkap', '6C', '1777342588_tugas_3.docx', '2026-04-28 02:16:28'),
(222, '23051105', 'Hukum E-wallet, Kripto, dan bunga bank', 'Lengkap', '6C', '1777342630_tugas_2.docx', '2026-04-28 02:17:10'),
(223, '23051105', 'Jumlah rakaat dalam shalat tarawih', 'Lengkap', '6C', '1777342666_Tugas_1.docx', '2026-04-28 02:17:46'),
(224, '23051118', 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu', 'Table', '6C', '1777387042_putri_isnaini_tugas_fiqih_3...docx', '2026-04-28 14:37:22'),
(225, '23051118', 'Hukum operasi plastik', 'Table', '6C', '1777387106_putri_isnaini_tugas_fiqih_4.docx', '2026-04-28 14:38:26'),
(226, '23051154', 'Hukum operasi plastik', 'Table', '6C', '1777426066_Amanda_Hukum_Operasi_Plastik.docx', '2026-04-29 01:27:46'),
(227, '23051132', 'Hukum operasi plastik', 'Lengkap', '6C', '1777429981_TUGAS4_SITINUR23051132_MASAILUL_FIQIYAH.docx', '2026-04-29 02:33:01'),
(229, '23051086', 'Menyentuh lawan jenis apakah membatalkan wudhu', 'Table', '6B', '1777441908_Listri_Cahyati__P17.pdf', '2026-04-29 05:51:48'),
(230, '23051049', 'Hukum Paylater', 'Table', '6B', '1777474393_Rifta_Amaliya__23051049__FIQIH.pdf', '2026-04-29 14:53:13'),
(231, '23051054', 'Hukum operasi plastik', 'Lengkap', '6C', '1777542683_Tugas_Ahmad_muzayyan_abul_aula_6C_masailul_fiqhiyyah.pdf', '2026-04-30 09:51:23'),
(232, '23051133', 'Hukum operasi plastik', 'Table', '6C', '1777597763_IMG_20260501_080701.jpg', '2026-05-01 01:09:23'),
(233, '23051102', 'Hukum operasi plastik', 'Table', '6C', '1778202996_Masailul_fiqhiyah.Masalah_operasi_plastik.docx', '2026-05-08 01:16:36'),
(234, '23051048', 'Hukum bayi tabung', 'Table', '6B', '1779330704_image.jpg', '2026-05-21 02:31:44'),
(236, '23051044', 'Hukum bayi tabung', 'Table', '6B', '1779331394_DOC-20260521-WA0000..pdf', '2026-05-21 02:43:14'),
(237, '23051036', 'Hukum bayi tabung', 'Table', '6B', '1779332234_hukum_bayi_tabung.docx', '2026-05-21 02:57:14'),
(238, '23051043', 'Hukum bayi tabung', 'Table', '6B', '1779332476_masailul_fiqih.docx', '2026-05-21 03:01:16'),
(239, '23051081', 'Hukum bayi tabung', 'Table', '6B', '1779332707_bayi_tabung_naurotun_Wafiyah_.pdf', '2026-05-21 03:05:07'),
(240, '23051158', 'Hukum operasi plastik', 'Table', '6C', '1779332715_Hukum_Operasi_Plastik-1.docx', '2026-05-21 03:05:15'),
(241, '23051041', 'Hukum bayi tabung', 'Table', '6B', '1779332863_Hukum_menggunakan_jasa_bayi_tabung_atau_In_Vitro_Fertilization.docx', '2026-05-21 03:07:43'),
(242, '23051050', 'Hukum bayi tabung', 'Table', '6B', '1779332949_IMG20260521095520.jpg', '2026-05-21 03:09:09'),
(243, '23051050', 'Hukum bayi tabung', 'Table', '6B', '1779332986_IMG20260521095551.jpg', '2026-05-21 03:09:46'),
(244, '23051047', 'Hukum bayi tabung', 'Table', '6B', '1779333109_tugas_hukum_bayi_tabung_A.umar_syarif_uddin.docx', '2026-05-21 03:11:49'),
(245, '23051080', 'Nikah tanpa wali', 'Lengkap', '6C', '1779334613_Kajian_Fikih_Isnaini_Alifatur_Rohmah.pdf', '2026-05-21 03:36:53'),
(246, '23051080', 'Hukum operasi plastik', 'Lengkap', '6C', '1779334938_Tugas_Hukum_Operasi_Plastik_Isnaini.pdf', '2026-05-21 03:42:18'),
(247, '23051080', 'Hukum operasi plastik', 'Lengkap', '6C', '1779334941_Tugas_Hukum_Operasi_Plastik_Isnaini.pdf', '2026-05-21 03:42:21'),
(248, '23051080', 'Hukum operasi plastik', 'Lengkap', '6C', '1779334941_Tugas_Hukum_Operasi_Plastik_Isnaini.pdf', '2026-05-21 03:42:21'),
(249, '23051105', 'Nikah tanpa wali', 'Lengkap', '6C', '1779335252_Analisis_Hukum_Nikah_Tanpa_Wali_Betty_Rachmadhany.pdf', '2026-05-21 03:47:32'),
(250, '23051087', 'Nikah tanpa wali', 'Pembahasan', '6C', '1779335283_Hukum_Menikah_Tanpa_Wali.pdf', '2026-05-21 03:48:03'),
(251, '23051068', 'Nikah tanpa wali', 'Table', '6C', '1779336836_Dokumen__7_.docx', '2026-05-21 04:13:56'),
(252, '23051111', 'Nikah tanpa wali', 'Table', '6C', '1779336996_Hukum_Menikah_Tanpa_Wali_Tanpa_wali.docx', '2026-05-21 04:16:36'),
(253, '23051129', 'Nikah tanpa wali', 'Table', '6C', '1779337063_hukum_wali_nikah.pdf', '2026-05-21 04:17:43'),
(254, '23051132', 'Nikah tanpa wali', 'Lengkap', '6C', '1779337147_TUGAS5_Hukum_Menikah_Tanpa_Wali.docx', '2026-05-21 04:19:07'),
(255, '23051115', 'Nikah tanpa wali', 'Table', '6C', '1779337405_Tabel_Hukum_Menikah_Tanpa_Wali.pdf', '2026-05-21 04:23:25'),
(256, '23051068', 'Hukum operasi plastik', 'Table', '6C', '1779337423_Dokumen_8.docx', '2026-05-21 04:23:43'),
(257, '23051069', 'Nikah tanpa wali', 'Table', '6C', '1779337885_Hukum_menikah_tanpa_wali-Nichdah.docx', '2026-05-21 04:31:25'),
(258, '23051135', 'Nikah tanpa wali', 'Table', '6C', '1779339914_Tugas_5_Misalaul_Fiqh.docx', '2026-05-21 05:05:14'),
(259, '23051138', 'Nikah tanpa wali', 'Table', '6C', '1779342346_Nama___Syafira-WPS_Office.docx', '2026-05-21 05:45:46'),
(260, '23051133', 'Nikah tanpa wali', 'Table', '6C', '1779369452_6329a80f-fb64-4c24-9786-24686e08f652.pdf', '2026-05-21 13:17:32'),
(261, '23051078', 'Hukum bayi tabung', 'Table', '6B', '1779450506_masailul_.pdf', '2026-05-22 11:48:26'),
(262, '23051150', 'Hukum bayi tabung', 'Lengkap', '6B', '1779455476_Masalah_Bayi_Tabung.docx', '2026-05-22 13:11:16'),
(263, '23051042', 'Hukum bayi tabung', 'Table', '6B', '1779508313_Bayi_tabung_mashailul.docx', '2026-05-23 03:51:53'),
(264, '23051066', 'Hukum bayi tabung', 'Table', '6B', '1779515897_tugas_pembahasan_bayi_tabung.docx', '2026-05-23 05:58:17'),
(265, '23051076', 'Kenapa sesama muslim tapi puasanya beda hari', 'Pembahasan', '6B', '1779520506_tugas_2_MASHAILUL_FIQHIYAH_MOCH.BARIK.pdf', '2026-05-23 07:15:06'),
(266, '23051037', 'Hukum bayi tabung', 'Pembahasan', '6B', '1779675116_IMG20260521100201.jpg', '2026-05-25 02:11:56'),
(267, '23051037', 'Hukum bayi tabung', 'Pembahasan', '6B', '1779675150_IMG20260521100212.jpg', '2026-05-25 02:12:30'),
(268, '23051037', 'Hukum bayi tabung', 'Pembahasan', '6B', '1779675211_IMG20260521100219.jpg', '2026-05-25 02:13:31'),
(269, '23051037', 'Hukum bayi tabung', 'Pembahasan', '6B', '1779675240_IMG20260521100226.jpg', '2026-05-25 02:14:00'),
(270, '23051037', 'Hukum bayi tabung', 'Pembahasan', '6B', '1779675268_IMG20260521100240.jpg', '2026-05-25 02:14:28'),
(271, '23051037', 'Hukum bayi tabung', 'Pembahasan', '6B', '1779675288_IMG20260521100247.jpg', '2026-05-25 02:14:48'),
(272, '23051142', 'Nikah tanpa wali', 'Table', '6C', '1779717054_Tugas_Masailul_Fiqhiyah_Hukum_Menikah_Muthi_a_Nafisatun.docx', '2026-05-25 13:50:54'),
(273, '23051130', 'Nikah tanpa wali', 'Lengkap', '6C', '1779746546_hukum_menikah_tanpa_wali.docx', '2026-05-25 22:02:26'),
(274, '23051130', 'Hukum operasi plastik', 'Lengkap', '6C', '1779749219_hukum_operasi_plastik.docx', '2026-05-25 22:46:59'),
(275, '23051096', 'Nikah tanpa wali', 'Table', '6C', '1779771205_Masailul_tugas_himma_23051096.docx', '2026-05-26 04:53:25'),
(276, '23051054', 'Nikah tanpa wali', 'Lengkap', '6C', '1779803760_Ahmad_Muzayyan_Abul_aula_23051054_masailul_fiqhiyyah.pdf', '2026-05-26 13:56:00'),
(277, '23051146', 'Nikah tanpa wali', 'Table', '6C', '1780355847_downloadfile.PDF', '2026-06-01 23:17:27'),
(278, '23051118', 'Nikah tanpa wali', 'Table', '6C', '1780402113_Fiqih_nikah.docx', '2026-06-02 12:08:33'),
(279, '23051040', 'Hukum bayi tabung', 'Table', '6B', '1780414148_OLIVIA_MAULIDATUR_ROHMA___BAYI_TABUNG__.docx', '2026-06-02 15:29:08'),
(280, '23051135', 'Hukum operasi plastik', 'Table', '6C', '1780493425_Tugas_4_Misalaul_Fiqh.docx', '2026-06-03 13:30:25'),
(282, '23051049', 'Hukum bayi tabung', 'Table', '6B', '1780498899_Hukum_menggunakan_jasa_bayi_tabung.pdf', '2026-06-03 15:01:39'),
(283, '23051146', 'Hukum operasi plastik', 'Table', '6C', '1780529085_Nama___Tukhibah.pdf', '2026-06-03 23:24:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`, `kelas`, `role`, `created_at`) VALUES
(76, 'admin', 'admin', 'Zainul Hakim', NULL, 'admin', '2026-04-09 02:09:44'),
(149, '23051021', '827401', 'AHMAD DHIYA UDDIN NABHAN', '6B', 'user', '2026-04-09 02:12:23'),
(150, '23051023', '391504', 'AHMAD FAKHRUSY SYAKIRIN AL HAQIQI', '6B', 'user', '2026-04-09 02:12:23'),
(151, '23051034', '652819', 'MOH. SABIQ ANNAUWAL', '6B', 'user', '2026-04-09 02:12:23'),
(152, '23051035', '104736', 'MUH.SYAHRUL RAMADHAN', '6B', 'user', '2026-04-09 02:12:23'),
(153, '23051036', '449283', 'MOHAMMAD ARJU SYAFA', '6B', 'user', '2026-04-09 02:12:23'),
(154, '23051037', '736150', 'HIDAYATUN NI\'MAH', '6B', 'user', '2026-04-09 02:12:23'),
(155, '23051040', '218594', 'OLIVIA MAULIDATUR ROHMA', '6B', 'user', '2026-04-09 02:12:23'),
(156, '23051041', '503612', 'FATIMATUZ ZAHRO', '6B', 'user', '2026-04-09 02:12:23'),
(157, '23051042', '927405', 'ROSIKHOTUN NADIYAH', '6B', 'user', '2026-04-09 02:12:23'),
(158, '23051043', '385021', 'NABILAH SHOUNIYAH', '6B', 'user', '2026-04-09 02:12:23'),
(159, '23051044', '614937', 'MAFTUKHAH', '6B', 'user', '2026-04-09 02:12:23'),
(160, '23051047', '290384', 'AHMAD UMAR SYARIFUDDIN', '6B', 'user', '2026-04-09 02:12:23'),
(161, '23051048', '856142', 'GITA DWI NUR AINI', '6B', 'user', '2026-04-09 02:12:23'),
(162, '23051049', '472910', 'RIFTA AMALIYA KHOIRUN NISA\'', '6B', 'user', '2026-04-09 02:12:23'),
(163, '23051050', '138562', 'BAGUS RIZKY SAPUTRA', '6B', 'user', '2026-04-09 02:12:23'),
(164, '23051053', '594038', 'AHMAD WAHYUDIN TAMAMI', '6B', 'user', '2026-04-09 02:12:23'),
(165, '23051066', '702845', 'YOGI NOVIANA', '6B', 'user', '2026-04-09 02:12:23'),
(166, '23051076', '361490', 'MOCH. BARIK SHOHIBUN NI\'AM', '6B', 'user', '2026-04-09 02:12:23'),
(167, '23051078', '825037', 'KINANTI LADYSA IMANIAR', '6B', 'user', '2026-04-09 02:12:23'),
(168, '23051081', '419263', 'NAUROTUN WAFIYAH', '6B', 'user', '2026-04-09 02:12:23'),
(169, '23051086', '950381', 'LISTRI CAHYATI', '6B', 'user', '2026-04-09 02:12:23'),
(170, '23051141', '184726', 'MUHAMMAD FARIZI AL LATIEF', '6B', 'user', '2026-04-09 02:12:23'),
(171, '23051150', '639015', 'ALFI ARDILLA', '6B', 'user', '2026-04-09 02:12:23'),
(172, '23051157', '527184', 'SUKRON MA\'MUN', '6B', 'user', '2026-04-09 02:12:23'),
(173, '1', '123', 'Zainul', '6C', 'user', '2026-04-09 02:14:47'),
(174, '23051054', '717514', 'AHMAD MUZAYYAN ABUL AULA', '6C', 'user', '2026-04-10 06:40:19'),
(175, '23051069', '587643', 'NICHDAH ROICHATUL JANNAH', '6C', 'user', '2026-04-10 06:40:19'),
(176, '23051080', '149205', 'ISNAINI ALIFATUR ROHMAH', '6C', 'user', '2026-04-10 06:40:19'),
(177, '23051087', '715064', 'WIDIYA ARINI RAHMAWATI', '6C', 'user', '2026-04-10 06:40:19'),
(178, '23051096', '232204', 'HIMMATUL FITRIA', '6C', 'user', '2026-04-10 06:40:19'),
(179, '23051102', '798209', 'FATIMATUL HIDAYAH', '6C', 'user', '2026-04-10 06:40:19'),
(180, '23051105', '119250', 'BETTY RACHMADHANY', '6C', 'user', '2026-04-10 06:40:19'),
(181, '23051107', '459378', 'FRIPDA BAGUS SETIAWAN', '6C', 'user', '2026-04-10 06:40:19'),
(182, '23051108', '900364', 'MOH. FAJAR ALFIANSYAH', '6C', 'user', '2026-04-10 06:40:19'),
(183, '23051111', '380869', 'PUTRI AVNITA MAHFUDZOH', '6C', 'user', '2026-04-10 06:40:19'),
(184, '23051114', '761893', 'MUHAMMAD IZAL FAIZIN', '6C', 'user', '2026-04-10 06:40:19'),
(185, '23051115', '911856', 'IHDINATUL JANNAH', '6C', 'user', '2026-04-10 06:40:19'),
(186, '23051118', '696099', 'PUTRI ISNAINI', '6C', 'user', '2026-04-10 06:40:19'),
(187, '23051122', '346890', 'NELA YUSNITA ANGGRAENI', '6C', 'user', '2026-04-10 06:40:19'),
(188, '23051129', '114958', 'AHMAD ZAINAL AZKY', '6C', 'user', '2026-04-10 06:40:19'),
(189, '23051130', '571417', 'NABILAH ARIFAH EL-ZAHRA', '6C', 'user', '2026-04-10 06:40:19'),
(190, '23051132', '276239', 'SITI NUR NIKMATUL ZAENAB', '6C', 'user', '2026-04-10 06:40:19'),
(191, '23051133', '935649', 'KHOFIFAH', '6C', 'user', '2026-04-10 06:40:19'),
(192, '23051135', '654033', 'AHMAD NUR SIDDIQI', '6C', 'user', '2026-04-10 06:40:19'),
(193, '23051138', '840187', 'SYAFIRA NISAUL ABDILLAH', '6C', 'user', '2026-04-10 06:40:19'),
(194, '23051142', '109724', 'MUTHI\'A NAFISATUN NAJWA', '6C', 'user', '2026-04-10 06:40:19'),
(195, '23051146', '796935', 'TUKHIBAH NUR RIZQIA', '6C', 'user', '2026-04-10 06:40:19'),
(196, '23051152', '869639', 'RIZKIYAH FITROTUN NISA\'', '6C', 'user', '2026-04-10 06:40:19'),
(197, '23051154', '167062', 'AMANDA RIFQIYAH', '6C', 'user', '2026-04-10 06:40:19'),
(198, '23051158', '311575', 'RANI RUSDIANA', '6C', 'user', '2026-04-10 06:40:19'),
(199, '23051159', '814968', 'AINUN NABILA', '6C', 'user', '2026-04-10 06:40:19'),
(200, '23051068', '558514', 'ZUNI JUMANASARI', '6C', 'user', '2026-04-10 06:40:19'),
(201, '121212', '123', 'aaa', '6c', 'user', '2026-04-23 02:25:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `site_content`
--
ALTER TABLE `site_content`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_daftar_soal`
--
ALTER TABLE `tb_daftar_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tema_id` (`tema_id`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tema_masalah`
--
ALTER TABLE `tema_masalah`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `fk_user_tugas` (`username`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tema_masalah`
--
ALTER TABLE `tema_masalah`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_daftar_soal`
--
ALTER TABLE `tb_daftar_soal`
  ADD CONSTRAINT `fk_tb_daftar_soal_tema_masalah` FOREIGN KEY (`tema_id`) REFERENCES `tema_masalah` (`id_tema`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fk_user_tugas` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
