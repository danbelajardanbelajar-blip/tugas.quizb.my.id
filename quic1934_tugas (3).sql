-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Jun 2026 pada 09.28
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_daftar_soal`
--

INSERT INTO `tb_daftar_soal` (`id`, `tema_id`, `teks_soal`) VALUES
(1, 7, 'Tulis 3 ulama/ lembaga yang mengatakan rokok haram!'),
(2, 7, 'Tulis 3 ulama/ lembaga yang mengatakan rokok makruh!'),
(3, 7, 'Tulis ayat atau hadis yang dijadikan dasar oleh ulama yang mengatakan haram!'),
(4, 7, 'Tulis ayat atau hadis yang dijadikan dasar oleh ulama yang mengatakan makruh!'),
(5, 7, 'Tulis alasan ulama yang mengatakan bahwa larangan rokok mencapai derajat haram!'),
(6, 7, 'Tulis alasan ulama yang mengatakan bahwa larangan rokok tidak mencapai derajat haram (hanya makruh)!'),
(7, 7, 'analisis 6 jawaban dari pertanyaan di atas dan tentukan posisimu, apakah mengikuti yang mengharamkan atau mengikuti yang memakruhkan!'),
(8, 7, 'tulis judul buku atau jurnal yang kamu baca untuk menjawab pertanyaan pertanyaan di atas!');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id` int(11) NOT NULL,
  `nama_mahasiswa` varchar(150) NOT NULL,
  `tema_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`id`, `nama_mahasiswa`, `tema_id`, `jawaban_1`, `jawaban_2`, `jawaban_3`, `jawaban_4`, `jawaban_5`, `jawaban_6`, `jawaban_7`, `jawaban_8`, `jawaban_9`, `jawaban_10`, `jawaban_11`, `jawaban_12`, `jawaban_13`, `jawaban_14`, `jawaban_15`, `jawaban_16`, `jawaban_17`, `waktu_submit`) VALUES
(7, '23051042', NULL, '1. Syekh Asy-Syihab Al-Qalyubi \r\n2. Syekh Ibnu Allan\r\n3. K. H. Ahmad Rifai Kalisalak\r\n', '1. Ulama 4 madzhab\r\n2. Ulama NU (keputusan forum bahtsul masail) \r\n3. Ibnu Abidin\r\n ', 'لا ضرار و لا ضرار\r\n\"Tidak boleh ada bahaya (yang dilakukan) tanpa sengaja maupun membalas bahaya.\" (HR. Ibnu Majah)\r\n', 'Sebagian ulama yang lain berpendapat bahwa merokok hukumnya makruh, karena orang yang merokok mengeluarkan bau tidak sedap. Hukum ini diqiyaskan dengan memakan bawang putih mentah yang mengeluarkan bau yang tidak sedap, berdasarkan sabda nabi shallallahu ‘alaihi wa sallam,\r\nمن اكل البصل و الثوم و الكراث فلايقربن مسجدنا فان الملاءكة تتاذى مما يتاذى منه بنو ادم\r\n\r\n\r\n“Barang siapa yang memakan bawang merah, bawang putih (mentah) dan karats, maka janganlah dia menghampiri masjid kami, karena para malaikat terganggu dengan hal yang mengganggu manusia (yaitu: bau tidak sedap)“. (HR. Muslim no. 564).\r\n', 'Karena membahayakan diri, membahayakan orang lain, pemborosan (tabdzir), maqashid syariah', 'rokok menghasilkan bau yang tidak sedap dan mengganggu, berpotensi membahayakan kesehatan (mudarat), serta menyebabkan pemborosan atau kesia-siaan harta.', 'Perbedaan pendapat ulama mengenai hukum rokok terbagi menjadi dua, yaitu makruh dan haram. Pendapat yang menganggap rokok makruh didasarkan pada tidak adanya dalil khusus dalam Al-Qur’an dan Hadis yang secara eksplisit menyebut rokok, serta anggapan bahwa dampaknya tidak terlalu membahayakan atau belum terbukti secara pasti pada masa lalu, sehingga rokok hanya dianjurkan untuk ditinggalkan tanpa adanya dosa jika dilakukan. Namun, pendapat yang mengharamkan rokok memiliki dasar yang lebih kuat dengan merujuk pada dalil umum seperti larangan membahayakan diri sendiri dan orang lain dalam QS. Al-Baqarah ayat 195 dan kaidah fiqh “la dharar wa la dhirar”, terlebih lagi didukung oleh fakta medis modern yang membuktikan bahwa rokok dapat menyebabkan berbagai penyakit serius seperti kanker, penyakit jantung, dan gangguan pernapasan serta berdampak buruk bagi perokok pasif. Oleh karena itu, dengan mempertimbangkan perkembangan ilmu pengetahuan dan prinsip syariat Islam dalam menjaga jiwa (hifz an-nafs), pendapat yang menyatakan bahwa rokok haram lebih kuat untuk dipegang dalam kondisi saat ini.', '1. R. Aris Hidayat, 2015, Kontroversi Hukum Rokok dalam Kitab\nIrsy?d Al-Ikhw?n Karya Syekh Ihsan \nMuhammad Dahlan, International Journal Ihya’ ‘Ulum Al-Din, Vol 17 No. 2\n2. M. FATAH YASIN AL-AZMI, HUKUM MEROKOK MENURUT SYAIKH IHSAN JAMPES \nDAN AHMAD SARWAT, 2022, Skripsi\n3. Syaikh Muhammad bin Shalih Al-Utsaimin, 2016, Hukum Merokok Menurut Syariat, almanhaj\n4. Nurlaila Harun, 2016, HUKUM MEROKOK MENURUT TINJAUAN NASH \nDAN KAIDAH SYAR’IYAH, Journal IAIN Manado\n5. Omiga Chabiba, Diana Lailatus Sa’diyah, 2021, ANALISIS MAQASID SYARIAH DAN \nKESADARAN HUKUM MASYARAKAT \nTERHADAP IJTIHAD MUHAMMADIAH DALAM \nFATWA TENTANG HARAM ROKOK, muslim heritage Volume 6, Nomor 1\n6. Nadira Tatya Adiba\n, Meilan Arsanti , 2023, PERILAKU MEROKOK DALAM PANDANGAN ISLAM, Jurnal Teras Kesehatan, Vol 6 No. 1', '', '', '', '', '', '', '', '', '', '2026-06-04 01:59:29'),
(8, '23051047', NULL, '1. Majlis ulama Indonesia \r\n2. Muhammadiyah \r\n3. Yusuf al-qaradawi', '1. Nahdlatul ulama \r\n2. Wahbah azzuhaili\r\n3. Ali jum\'ah', 'QS. Al-Baqarah ayat 195\r\nوَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\r\n\"Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"\r\nAyat ini dijadikan dasar bahwa merokok dapat membahayakan kesehatan dan berpotensi menyebabkan kebinasaan.', 'Surah Al-Isra\' ayat 26–27\r\nوَلَا تُبَذِّرْ تَبْذِيرًا ۝ إِنَّ الْمُبَذِّرِينَ كَانُوا إِخْوَانَ الشَّيَاطِينِ\r\n\"Janganlah kamu menghambur-hamburkan (hartamu) secara boros. Sesungguhnya para pemboros itu adalah saudara-saudara setan.\"\r\nAyat ini digunakan karena rokok dianggap menghabiskan harta untuk sesuatu yang tidak membawa manfaat yang jelas.', 'Rokok terbukti secara medis mengandung ribuan zat beracun yang memicu berbagai penyakit mematikan seperti kanker, gangguan pernapasan, dan jantung. Tindakan ini dikategorikan sebagai menjatuhkan diri ke dalam kebinasaan yang dilarang dalam Al-Qur\'an Surah Al-Baqarah ayat 195.', 'Tidak ada nash Al-Qur\'an atau hadis yang secara eksplisit menyebut rokok haram.\r\nBahaya rokok dianggap tidak langsung dan berbeda pada setiap orang.\r\nRokok lebih dekat kepada perbuatan yang dibenci (makruh) daripada haram.\r\nKaidah asal segala sesuatu adalah mubah sampai ada dalil yang mengharamkannya.', 'Menurut saya, pendapat yang mengharamkan rokok lebih kuat karena banyak penelitian membuktikan bahwa rokok membahayakan kesehatan perokok maupun orang di sekitarnya. Selain itu, Islam melarang perbuatan yang merusak diri sendiri dan orang lain. Oleh karena itu, saya cenderung mengikuti pendapat ulama yang mengharamkan rokok. Namun, saya tetap menghormati adanya perbedaan pendapat di kalangan ulama mengenai masalah ini.', '1. Fatwa MUI No. 6 Tahun 2009 tentang Rokok.\n2. Fatwa Majelis Tarjih dan Tajdid Muhammadiyah tentang Hukum Merokok.\n3. Keputusan Bahtsul Masail NU tentang Hukum Merokok.\n4. Al-Halal wal Haram fil Islam, Yusuf al-Qaradawi.\n5. WHO Report on the Global Tobacco Epidemic.', '', '', '', '', '', '', '', '', '', '2026-06-04 01:59:36'),
(9, '23051037', NULL, '1. Peserta Ijtima Ulama Komisi Fatwa se-Indonesia III \r\n2. MUI\r\n3. Majlis Muhammadiyah \r\n4.Ulama Mesir, Yordania, Yaman, dan Syria', ' \'Abdur Rahman ibn Muhammad ibn Husain ibn \'Umar Ba\'alawiy di dalam Bughyatul Mustarsyidin (hal.260)\r\nProf Dr Wahbah Az-Zuhailiy di dalam Al-Fiqh al-Islamiy wa Adillatuh (Cet. III, Jilid 6, hal. 166-167)\r\n\r\nMahmud Syaltut di dalam Al-Fatawa (hal.383-384)\r\n Asy-syafi\'i dan madzhab Al Hambali ', 'Firman Allah SWT QS Al-A’raf ayat 157:\r\nأيمرهم ابملعروف وينهاهم عن املنكر وحيل هلم الطيبات وحيرم عليهم اخلبائث \r\n“Nabi itu menyuruh mereka kepada yang makruf, melarang \r\nmereka dari yang munkar, menghalalkan bagi mereka segala yang \r\nbaik dan melarang bagi mereka segala yang buruk.”\r\n2. Firman Allah SWT QS al-Isra’ ayat 26-27:\r\nوال تبذر تبذيرا ان املبذرين كانوا اخوان الشياطني وكان الشيطان لربه كفورا \r\n“Janganlah kamu menghambur-hamburkan hartamu secara \r\nboros”. “Sesungguhnya orang-orang yang berlaku boros itu adalah \r\nsaudara-saudara syaitan. Dan syaitan itu sangat ingkar terhadap \r\nTuhannya.”\r\n3. Hadits Nabi Saw\r\nالضرر وال ضرار\r\n\"Tidak boleh membuat mudlarat kepada diri sendiri dan tidak boleh \r\nmembuat mudlarat kepada orang lain.”\r\n1. Agama Islam (syariah) menghalalkan segala yang baik dan mengharamkan \r\nkhabaist (segala yang buruk), sebagaimana ditegaskan dalam al-Quran, \r\n\r\n\r\n \r\n \r\n\r\n\Z\r\nArtinya: “… dan menghalalkan bagi mereka segala yang baik dan \r\nmengharamkan bagi mereka segala yang buruk … ” [Q. 7:157]. \r\n2. Agama Islam (syariah) melarang menjatuhkan diri ke dalam kebinasaan dan \r\nperbuatan bunuh diri sebagaimana dinyatakan dalam al-Quran, \r\n\r\nArtinya: “Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam \r\nkebinasaan, dan berbuat baiklah, karena sesungguhnya Allah menyukai orang-\r\norang yang berbuat baik” [Q. 2: 195].\r\nArtinya: “Dan janganlah kamu membunuh dirimu; sesungguhnya Allah adalah \r\nMaha Penyayang kepadamu” [Q. 4: 29]. \r\n3. Larangan perbuatan mubazir dalam al-Quran, \r\n\r\nArtinya: “Dan berikanlah kepada keluarga-keluarga yang dekat akan haknya, \r\nkepada orang miskin dan orang yang dalam perjalanan; dan janganlah kamu \r\nmenghambur-hamburkan (hartamu) secara boros, karena sesungguhnya para \r\npemboros adalah saudara-saudara setan, dan setan itu sangat ingkar pada \r\nTuhannya” [Q 17: 26-27]. \r\n4. Larangan menimbulkan mudarat atau bahaya pada diri sendiri dan pada orang \r\nlain dalam hadis riwayat Ibn Majah, Ahmad, dan Malik, \r\n', 'termaktub di dalam Al-Qur\'an dan As-Sunnah sebagai berikut: Al-Qur\'an : وَلاَ تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ وَأَحْسِنُوا إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ. البقرة: 195 Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan, dan berbuat baiklah, karena sesungguhnya Allah menyukai orang-orang yang berbuat baik. (Al-Baqarah: 195) As-Sunnah : عَنْ ابْنِ عَبَّاسٍ قَالَ قَالَ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ لاَ ضَرَرَ وَلاَ ضِرَارَ. رواه ابن ماجه, الرقم: 2331 Dari Ibnu \'Abbas ra, ia berkata ; Rasulullah SAW. bersabda: Tidak boleh berbuat kemudaratan (pada diri sendiri), dan tidak boleh berbuat kemudaratan (pada diri orang lain). (HR. Ibnu Majah, No.2331) Bertolak dari dua nash di atas, ulama\' sepakat mengenai segala sesuatu yang membawa mudarat adalah haram. Akan tetapi yang menjadi persoalan adalah apakah merokok itu membawa mudarat ataukah tidak, dan terdapat pula manfaat ataukah tidak. Dalam hal ini tercetus persepsi yang berbeda dalam meneliti dan mencermati substansi rokok dari aspek kemaslahatan dan kemafsadatan. Perbedaan persepsi ini merupakan babak baru munculnya beberapa pendapat mengenai hukum merokok dengan berbagai argumennya.\r\n', 'Menurut ahli kesehatan, rokok mengandung nikotin dan zat lain yang \r\nmembahayakan kesehatan. Di samping kepada perokok, tindakan \r\nmerokok dapat membahayakan orang lain, khususnya yang berada di \r\nsekitar perokok.\r\nSehingga Ijtima para Ulama Komisi Fatwa se-Indonesia III sepakat bahwa \r\nmerokok hukumnya haram jika dilakukan :\r\na. di tempat umum;\r\nb. oleh anak-anak; dan\r\nc. oleh wanita hamil.\r\nKarena mempertimbangkan besarnya mudhorot yang akan timbul dari pada manfaatnya bagi manusia itu sendiri atau bagi lingkungan sekitarnya.\r\nPendapat majlis Muhammadiyah juga mengeluarkan fatwa yang sama yaitu:\r\nWajib hukumnya mengupayakan pemeliharaan dan peningkatan derajat \r\nkesehatan masyarakat setinggi-tingginya dan menciptakan lingkungan yang \r\nkondusif bagi terwujudnya suatu kondisi hidup sehat yang merupakan hak \r\nsetiap orang dan merupakan bagian dari tujuan syariah (maq±¡id asy-syar³‘ah); \r\n2. Merokok hukumnya adalah haram karena: \r\na. merokok termasuk kategori perbuatan melakukan khab±’i£ yang dilarang 2\r\nb. perbuatan merokok mengandung unsur menjatuhkan diri ke dalam \r\nkebinasaan dan bahkan merupakan perbuatan bunuh diri secara perlahan \r\nsehingga oleh karena itu bertentangan dengan larangan al-Quran dalam Q. \r\n2: 195 dan 4: 29, \r\nc. perbuatan merokok membahayakan diri dan orang lain yang terkena \r\npaparan asap rokok sebab rokok adalah zat adiktif dan berbahaya \r\nsebagaimana telah disepakati oleh para ahli medis dan para akademisi dan \r\noleh karena itu merokok bertentangan dengan prinsip syariah dalam hadis \r\nNabi saw bahwa tidak ada perbuatan membahayakan diri sendiri dan \r\nmembahayakan orang lain, \r\nd. rokok diakui sebagai zat adiktif dan mengandung unsur racun yang \r\nmembahayakan walaupun tidak seketika melainkan dalam beberapa waktu \r\nkemudian sehingga oleh karena itu perbuatan merokok termasuk kategori \r\nmelakukan suatu yang melemahkan sehingga bertentangan dengan hadis \r\nNabi saw yang melarang setiap perkara yang memabukkan dan \r\nmelemahkan. \r\ne. Oleh karena merokok jelas membahayakan kesehatan bagi perokok dan \r\norang sekitar yang terkena paparan asap rokok, maka pembelajaan uang \r\nuntuk rokok berarti melakukan perbuatan mubazir (pemborosan) yang \r\ndilarang dalam Q. 17: 26-27, \r\nf. Merokok bertentangan dengan unsur-unsur tujuan syariah (maq±¡id asy-\r\nsyar³‘ah), yaitu (1) perlindungan agama (¥if§ ad-d³n), (2) perlindungan \r\njiwa/raga (¥if§ an-nafs), (3) perlindungan akal (¥if§ al-‘aql), (4) perlindungan \r\nkeluarga (¥if§ an-nasl), dan (5) perlindungan harta (¥if§ al-m±l). \r\n3. Mereka yang belum atau tidak merokok wajib menghindarkan diri dan \r\nkeluarganya dari percobaan merokok sesuai dengan Q. 66: 6 yang menyatakan, \r\n“Wahai orang-orang beriman hindarkanlah dirimu dan keluargamu dari api \r\nneraka.” \r\n4. Mereka yang telah terlanjur menjadi perokok wajib melakukan upaya dan \r\nberusaha sesuai dengan kemampuannya untuk berhenti dari kebiasaan \r\nmerokok dengan mengingat Q. 29: 69, “Dan orang-orang yang bersungguh-\r\nsungguh di jalan Kami, benar-benar akan Kami tunjukkan kepada mereka jalan-\r\njalan Kami, dan sesungguhnya Allah benar-benar beserta orang-orang yang \r\nberbuat baik,” dan Q. 2: 286, “Allah tidak akan membebani seseorang kecuali \r\nsesuai dengan kemampuannya; ia akan mendapat hasil apa yang ia usahakan \r\ndan memikul akibat perbuatan yang dia lakukan;” dan untuk itu pusat-pusat \r\nkesehatan di lingkungan Muhammadiyah harus mengupayakan adanya fasilitas \r\nuntuk memberikan terapi guna membantu orang yang berupaya berhenti \r\nmerokok. ', 'pandangan kontradiktif dalam menetapkan \'illah:\r\n1.sebagian besar ulama\' terdahulu berpandangan, bahwa merokok itu mubah atau makruh. Mereka pada masa itu lebih bertendensi pada bukti, bahwa merokok tidak membawa mudarat, atau membawa mudarat tetapi relatif kecil.\r\n2.berbeda dengan pandangan sebagian besar ulama\' terdahulu, pandangan sebagian ulama sekarang yang cenderung mengharamkan merokok karena lebih bertendensi pada informasi (bukan bukti) mengenai hasil penelitian medis yang sangat detail dalam menemukan sekecil apa pun kemudaratan yang kemudian terkesan menjadi lebih besar.\r\n3.hukum merokok itu bisa jadi bersifat relatif dan seimbang dengan apa yang diakibatkannya mengingat hukum itu berporos pada \'illah yang mendasarinya. Dengan demikian, pada satu sisi dapat dipahami bahwa merokok itu haram bagi orang tertentu yang dimungkinkan dapat terkena mudaratnya. Akan tetapi merokok itu mubah atau makruh bagi orang tertentu yang tidak terkena mudaratnya atau terkena mudaratnya tetapi kadarnya kecil.\r\n4.kalaulah merokok itu membawa mudarat relatif kecil dengan hukum makruh, kemudian di balik kemudaratan itu terdapat kemaslahatan yang lebih besar, maka hukum makruh itu dapat berubah menjadi mubah. Adapun bentuk kemaslahatan itu seperti membangkitkan semangat berpikir dan bekerja sebagaimana biasa dirasakan oleh para perokok.\r\n', 'Saya secara pribadi mengikuti pendapat makruh, karena segala sesuatu tergantung maksud nya, jika maksudnya agar semangat bekerja dan sebagainya dan dilakukan dalam kadar yang wajar maka madhorotnya relatif kecil, akan', 'https://doi.org/10.30983/alhurriyah.v3i1.534 keputusan MUI dan majlis fatwa Indonesia https://ejournal.uinbukittinggi.ac.id/alhurriyah/article/view/534\r\nhttps://repository.uin-suska.ac.id/9616/1/2012_2012224AH.pdf\r\nLampiran keputusan fatwa MUI dan majlis Muhammadiyah ', '', '', '', '', '', '', '', '', '', '2026-06-04 02:08:00'),
(12, '23051157', NULL, 'Majlis tarjih dan tajdid PP. Muhamadiyah, Majelis Ulama Indonesia (MUI),Syaikh asy-Syihab al-Qalyubi', 'Majelis Ulama Indonesia (MUI),Prof. Dr. Wahbah az-Zuhaili, Hazim Taif Abu Ghazalah. ', 'وَأَنْفِقُوا فِي سَبِيلِ اللَّهِ وَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ ۛ وَأَحْسِنُوا ۛ إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ', ' وَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\"Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\" (QS. Al-Baqarah: 195)', 'Para ulama yang menetapkan hukum merokok adalah haram mendasarkan pendapat mereka pada metode ijtihad, karena rokok tidak disebutkan secara eksplisit di dalam Al-Qur\'an maupun Hadis. Keputusan ini diambil dengan melihat illat (sebab hukum) berupa dampak kerusakan dan bahaya nyata yang ditimbulkan oleh rokok.', 'Ulama yang berpendapat bahwa rokok tidak mencapai hukum haram (memilih hukum makruh atau mubah) berargumen karena tidak adanya dalil nash (Al-Qur\'an dan Hadis) yang secara eksplisit melarangnya. Menurut mereka, bahaya rokok tidak bersifat seketika atau memabukkan, serta kaidah fikih menetapkan hukum asal segala sesuatu adalah boleh.', 'Menurut saya merokok adalah makruh. ', 'Irsyadul Ikhwan ', '', '', '', '', '', '', '', '', '', '2026-06-04 01:54:24'),
(13, '23051041', NULL, '1. Syaikh Abdullah bin Alwi Al-Haddad\r\n2. Majlis tarjih Muhammadiyah. sumber: Lazismu\r\n3. Syekh Ibrahim Al-Laqqani', '1. Majlis Ulama Indonisa (MUI) sumber: fatwah hukum MUI\r\n2. Majlis Ugama Islam Singapura (MUIS) sumber : fatwa tentang merokok | Majlis Ugama Islam Singapura\r\n3. Syekh Muhammad \'Athiyyah Saqhar sumber: \"deretan ulama klasik yang tak haramkan rokok tembakau\" kazhanah.republika.co.id', 'Ya ayyuhalladzina a manu la ta\'kulu amwalakum bainakum bil-bathili illa an takuna tijaratan an taradlim mingkum, wa la taqtulu anfusakum innalaha kana bikum rahima \r\nartinya: Wahai orang-orang beriman janganlah kamu memakan harta sesamamu dengan jalan yang batil (tidak benar) kecuali dalam perdagangan yang dilandasi atas suka sama suka diantaramu. dan janganlah kamu membunuh dirimu, Sungguh Allah maha penyayang kepadamu. (Q.S An-Nisa Ayat 29) sumber: Dr. Yuni Roslaili, MA.Rokok Dalam Perspektif, Fakultas Syariah dan Hukum, 2025.', 'Huwalladzi khalaqa laku ma fil-ardi jami\'an tsummas-tawa ilas-sama i fa sawwahunna sab\'a samawat, wa huwa bikulli syai\'in \'alim\r\nartinya: Dialah (Allah) yang menciptakan segala apa yang ada di bumi untukmu, kemudian dia menuju ke langit, lalu Dia menyempurnakannnya menjadi tujuh langit. Dan Dia Maha Mengetahui segala sesuatau. (Q.S  sumber: Hanif Hawari, Beda Pendapat Ulama Soal Hukum Rokok dalam Pandangan Islam. Danantara Indonesia. Jakarta 2023', '1. Memabukkan: mereka menganggap rokok dapat membuat pikiran menjadi kacau, menghilangkan pertimbangan akal dan menjadikan nafas sesak karena teracuni sehingga disebut memabukkan.\r\n2. Melemahkan badan\r\n3. Menimbulkan Mudarat\r\nsumber: Hanif Hawari, Beda pendapat Ulama Soal Hukum Rokok dalam Pandangan Islam. Danantara  Indonesia. jakarta 2023', '1. Barangsiapa yang menggunakanannya tetapi tidak menimbulkan Mudarat bagi akal dan badannya, maka hukumnya adalah jaiz (boleh)\r\n2. Barangsiapa yang memannfaatkannya untuk menolak mudarat, semisal penyakit, maka wajib menggunakannya.\r\nsumber: Hanif Hawari, Beda pendapat Ulama Soal Hukum Rokok dalam Pandangan Islam. Danantara Indonesia. Jakarta 2023.', 'Saya mengikuti yang haram karena rokok berdampak sangat buruk bagi perokok aktif dan perokok pasif, menurut kenslan.kemenkes.go.id hampir 100% perokok aktif pasti mengalami gangguan kesehatan baik dalam jangka pendek maupun dalam jangka panjang.', '\"Beda Pendapat Ulama Soal Hukum Rokok dalam Pandangan Islam\"\r\n\"Deretan Ulama Klasik yang tak Haramkan Rokok Tembakau\"\r\n\"Fatwa Tentang Merokok\"\r\n\"Rokok dalam Perspektif\"', '', '', '', '', '', '', '', '', '', '2026-06-04 02:27:40'),
(14, '23051040', NULL, 'a. Pimpinan pusat muhammadiyah\r\nb. Majelis ulama indonesia (MUI)\r\nC. Syaikh asy-Syihab al-Qalyubi\r\n\r\nsumber : Fathurrohman Nur Hidayat dkk, hukum merokok : perbandingan pandangan nahdlatul ulama dan muhammadiyah, Tadkirah Jurnal Terapan Hukum Islam dan Kajian Filsafat Syariah, V.2, No. 4, 2025.  ', 'a. Majelis Ulama Indonesia (MUI)\r\nb. Majelis Ugama Islam Singapura ( MUIS)\r\nC. Prof. Dr. Wahbah az-Zuhaili\r\n\r\nsumber : Nu Online, Bahtsul Masail tentang Hukum Merokok', 'Walaa tulquu biaidiikum ilat tahlukah \r\nartinya : dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan (Al-Baqarah : 195)\r\n\r\nsumber :Syaikh Muhammad bin Shalih Al-Utsaimin, hukum merokok menurut Syariat, Almanhaj.', 'Ya bani adama khuzu zinatakum inda kulli masdijiw wa kulu wasyrabu wa la tusrifu, innahu la yuhibbul musrifin \r\nartinya : wahai anak cucu adam! pakailah pakaianmu yang bagus pada setiap memasuki masjid, makan dan minumlah, tetapi jangan berlebihan. sungguh allah tidak menyukai orang yang berlebih-lebihan.\r\n\r\nsumber : kemenag, fatwa MUI rokok hukumnya makruh dan haram', 'larangan ini didasarkan pada prinsip Saddu ad-Dzari\'ah memalui beberapa alasan dan dalil utama :\r\na. membahayakan kesehatan dan jiwa \r\nb. membahayakan orang lain (perokok pasif)\r\nc. pemborosan (tabdzir)\r\nd. merupakam zat adiktif \r\n\r\nsumber : Muhammad ihsan, merokok dalam perspektif muhammadiyah dan nahdlatul ulama, al-qadha jurnal hukum islam dan perundang-undangan, 2017.', 'a. tidak ada Nash yang jelas\r\nb. bahaya tidak bersifat mutlak\r\nc. belum memenuhi kriteria khamar\r\n\r\nsumber : Dr. Ahmad Sarwat., Lc., MA, Mengapa masih ada yang menghalalkan rokok,, rumah fiqih indonesia. ', 'menurut saya rokok itu mengharamkan karena dinilai membawa bahaya (mudarat) bagi kesehatan diri sendiri dan orang lain, serta dianggap sebagai bentuk pemborosan harta. ', 'tadkirah jurnal terapan hukum islam dan kajian filsafat syariah : hukum merokok (perbandingan pandangan NU dan Muhammadiyah)\r\nNu online ( batshul masail tentang hukum merokok )\r\nAlmanhaj (hukum merokok menurut syariat)\r\nkemenag (fatwa MUI rokok hukumnya makruh dan haram)\r\nrumah fiqih indonesia (mengapa masih ada yang menghalalkan rokok)', '', '', '', '', '', '', '', '', '', '2026-06-04 02:27:58'),
(15, '23051049', NULL, '1. Yusuf al-Qaradawi\r\n2. Abdul Aziz bin Baz\r\n3. Ali Jum’ah', '1. Syekh Muhammad Nawawi al-Bantani\r\n2. Syekh Ahmad Khatib al-Minangkabawi\r\n3. Syekh Ibrahim al-Bajuri', '1. Wa laa tulquu biaidiikum ilat-tahluka.(Qs. Al-Baqarah: 195)\r\nArtinya: “Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.”\r\n2. Wa laa taqtuluu anfusakum innallaaha kaana bikum rahiima. (Qs An-Nisa: 29)\r\nArtinya: “Dan janganlah kamu membunuh dirimu, sesungguhnya Allah maha penyayang kepadamu.”\r\n', '1. Wa yuharrimu ‘alaihimul khabaaits (QS. Al-A’raf Ayat 157)\r\nArtinya: “Dan mengharamkan bagi mereka segala yang buruk.”\r\n2. Man akala minhadzihisy syajarati (al-tsum) falaa yaqrabanna masjidanaa.\r\nArtinya: “Barang siapa makan tanaman ini( Bawang putih ), makan janganlah ia mendekati masjid kami.”', '1. Rokok membahayakan kesehatan (Mudharat)\r\n2. Rokok membahayakan orang lain(Perokok Pasif)\r\n3. Rokok termasuk pemborosan harta\r\n4. Rokok termasuk Al-Khabaits (Sesuatu yang buruk)', '1. Tidak ada nash yang tegas (Sharih) Mengharamkan rokok.\r\n2. Rokok diqiyaskan dengan makanan yang berbau tidak sedap.\r\n3. Bahaya rokok pada masa Ulama’ klasik belum terbukti secara pasti.', 'Posisi saya adalah mengikuti pendapat ulama’ yang mengharamkan rokok, karena alasan kemudharatan yang terbukti secara ilmiah, lebih sesuai dengan tujuan syariat islam dalam menjaga kesehatan dan keselamatan manusia.', '1. Al- Halal Wal Haram fil Islam - Yusuf Al-Qaradawi\r\n2. Nihaya az-Zain fi Irsyad al-Mubtadi’in - Nawawi al-Bantani\r\n3. Hasyiyah al-Bajuri ‘ala fath al-Qarib - Ibrahim al-Bajuri\r\n4. Shahih Bukhari - Imam al-Bukhari\r\n5. Sunan Ibnu Majah - Imam Ibnu Majah.', '', '', '', '', '', '', '', '', '', '2026-06-04 02:26:52'),
(16, '23051081', NULL, '1. Majelis Ulama Indonesia (MUI)\r\nMUI dalam fatwanya (2009) menyatakan bahwa merokok hukumnya haram, terutama bagi anak-anak, ibu hamil, dan di tempat umum, karena membahayakan kesehatan dan termasuk perbuatan yang merugikan diri sendiri.\r\n2. Lajnah Daimah (Komite Fatwa Arab Saudi)\r\nLajnah Daimah (Komite Fatwa Permanen Arab Saudi) menyatakan bahwa rokok haram secara mutlak, karena mengandung bahaya bagi tubuh dan termasuk perbuatan membuang harta sia-sia serta merusak kesehatan.\r\n3. Dar al-Ifta Mesir (Lembaga Fatwa Mesir)\r\nLembaga ini juga mengeluarkan fatwa bahwa rokok haram, dengan alasan medis modern menunjukkan dampak buruk yang jelas terhadap kesehatan dan dapat menyebabkan kematian dini.', '1. Nahdlatul Ulama (NU)\r\nDalam sebagian pandangan fikih klasik yang pernah berkembang di kalangan ulama NU, rokok dianggap makruh karena belum ada dalil tegas yang mengharamkan secara langsung, meskipun tetap dinilai tidak baik bagi kesehatan.\r\n2. Syaikh Muhammad Arsyad al-Banjari\r\nUlama Nusantara ini dalam beberapa pandangan fiqih klasik lebih cenderung memandang rokok sebagai makruh, karena pada masanya dampak kesehatan belum diketahui secara pasti seperti sekarang.\r\n3. Imam Abu Hamid Al-Ghazali (dalam pendekatan sebagian ulama yang mengutip prinsipnya)\r\nImam Al-Ghazali tidak secara langsung membahas rokok modern, tetapi prinsip beliau dalam Ihya Ulumuddin sering dijadikan dasar oleh sebagian ulama bahwa sesuatu yang tidak jelas haramnya dan tidak disebutkan tegas bisa dihukumi makruh, selama ada unsur mudarat ringan.', '1. QS. Al-Baqarah ayat 195\r\n“Wa l? tulq? bi-ayd?kum il? at-tahlukah”\r\n(Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan)\r\n2. QS. An-Nisa ayat 29\r\n“Wa l? taqtul? anfusakum, innall?ha k?na bikum ra??m?”\r\n(Dan janganlah kamu membunuh dirimu sendiri, sesungguhnya Allah Maha Penyayang kepadamu)\r\n3. Hadis Nabi ?\r\n“L? ?arar wa l? ?ir?r”\r\n(Tidak boleh membahayakan diri sendiri dan tidak boleh membahayakan orang lain)', '1. QS. Al-A’raf ayat 31\r\n“Kul? wa-isyrab? wa l? tusrif? innahu l? yu?ibbul musrif?n”\r\n(Makan dan minumlah, tetapi jangan berlebihan. Sesungguhnya Allah tidak menyukai orang yang berlebihan)\r\n2. QS. Al-Isra ayat 27\r\n“Innal mubadhdhir?na k?n? ikh-w?na asy-syay???n”\r\n(Sesungguhnya para pemboros itu adalah saudara-saudara setan)\r\n3. Hadis Nabi ?\r\n“Innam? al-a‘m?lu bin-niyy?t”\r\n(Sesungguhnya setiap amal tergantung niatnya)', '1. Membahayakan kesehatan /dharar\r\nRokok terbukti secara medis menyebabkan penyakit serius seperti kanker, jantung, dan pau-paru. Dalam Islam, segala yang membahayakan diri dilarang.\r\n2. Termasuk perbuatan membinasakan diri\r\nBerdasarkan prinsip larangan dalam Islam: tidak boleh merusak atau membahayakan diri sendiri, sehingga rokok termasuk perbuatan yang dilarang.\r\n3. Mubazir dan pemborosan harta\r\nUang yang digunakan untuk rokok dianggap sia-sia karena tidak memberi manfaat, bahkan justru merugikan.\r\n4. Membahayakan orang lain (perokok pasif)\r\nAsap rokok tidak hanya merusak diri sendiri, tetapi juga orang lain di sekitar, sehingga termasuk melanggar prinsip “tidak boleh membahayakan orang lain”.\r\n5. Kaidah fiqih: “la darar wa la dirar”\r\nArtinya: tidak boleh ada bahaya dan tidak boleh saling membahayakan. Karena rokok mengandung bahaya nyata, maka sebagian ulama mengharamkannya.\r\n\r\n\r\n\r\n', '1. Tidak ada dalil tegas (nash) yang mengharamkan rokok\r\nDalam Al-Qur’an dan hadis tidak ada larangan eksplisit tentang rokok, karena rokok baru dikenal setelah masa Nabi.\r\n2. Hukum asal benda adalah mubah (boleh)\r\nDalam kaidah fikih: “Hukum asal segala sesuatu adalah boleh sampai ada dalil yang mengharamkan.”\r\nKarena tidak ada dalil yang jelas, maka rokok tidak langsung dihukumi haram.\r\n3. Bahaya rokok dianggap tidak pasti atau berbeda-beda\r\nPada sebagian pandangan ulama klasik, dampak rokok belum dianggap pasti membahayakan semua orang secara langsung, sehingga tidak mencapai tingkat “darurat haram”.\r\n4. Perbedaan tingkat dampak (darar) pada tiap orang\r\nAda orang yang merokok tetapi tidak langsung sakit, sehingga sebagian ulama menilai hukumnya lebih ringan (makruh), bukan haram mutlak.\r\n5. Qiyas tidak dianggap kuat untuk mengharamkan\r\nSebagian ulama tidak menyamakan rokok dengan sesuatu yang jelas haram (seperti racun mematikan), sehingga qiyas untuk pengharaman tidak dianggap kuat.\r\n6. Sikap hati-hati (ihtiyat) diambil pada tingkat makruh\r\nMereka tetap memandang rokok sebagai sesuatu yang tidak baik, merugikan kesehatan dan harta, sehingga dihukumi makruh (dibenci), bukan haram.', 'Saat ini, bukti medis modern menunjukkan rokok jelas membahayakan kesehatan (bahkan bisa fatal).\r\nKaidah fikih juga menyatakan: “la darar wa la dirar” (tidak boleh membahayakan diri sendiri dan orang lain).\r\nKarena bahaya rokok sudah terbukti kuat dan luas, maka alasan “tidak pasti berbahaya” sudah tidak lagi relevan secara ilmiah.', '1. Fatwa Majelis Ulama Indonesia (MUI) No. 4 Tahun 2009 tentang Hukum Merokok\r\n2. Yusuf al-Qaradawi – Halal dan Haram dalam Islam\r\n3. Kaidah Fikih: “La darar wa la dirar” (tidak boleh membahayakan diri sendiri dan orang lain)\r\n4. Jurnal-jurnal UIN/IAIN tentang “Hukum Merokok dalam Perspektif Islam dan Kesehatan”\r\n', '', '', '', '', '', '', '', '', '', '2026-06-04 02:25:45'),
(17, '23051078', NULL, '1. Majelis Tarjih dan Tajdid Muhammadiyah: Lembaga keagamaan Indonesia ini secara resmi mengeluarkan fatwa haram rokok pada tahun 2010 karena rokok terbukti merusak kesehatan diri sendiri dan orang lain di sekitarnya.Syaikh\r\n2. Muhammad bin Shalih al-Utsaimin: Ulama besar dan ahli fiqih dari Arab Saudi yang menegaskan bahwa rokok haram karena termasuk perbuatan menghambur-hamburkan harta secara sia-sia (tabzir) dan merusak tubuh.\r\n3. Dar al-Ifta al-Mishriyyah (Lembaga Fatwa Mesir): Lembaga fatwa resmi negara Mesir yang menetapkan bahwa merokok hukumnya haram berdasarkan dalil syariat yang melarang manusia menjatuhkan diri ke dalam kebinasaan.', '1. Ulama Nahdlatul Ulama (NU) dalam Keputusan Bahtsul MasailKeterangan: Secara kelembagaan di Indonesia, para ulama NU melalui forum Bahtsul Masail (lembaga pengkaji hukum Islam) menetapkan hukum rokok adalah makruh tanzih (makruh yang mendekati kebolehan)\r\nAlasan: Ulama NU berpandangan bahwa tidak ada satu pun nash (dalil) yang secara eksplisit/tegas di dalam Al-Qur\'an maupun Hadis yang melarang atau mengharamkan tembakau. Oleh sebab itu, hukumnya tidak bisa ditarik sampai tingkat haram secara mutlak, melainkan makruh karena efek bau kurang sedap yang ditimbulkannya\r\n2. Syeikh Wahbah az-ZuhailiUlama besar asal Suriah ini menjelaskan dalam kitab Al-Fiqh al-Islamiy wa Adillatuh bahwa sebagian ulama menghukumi rokok (tembakau) makruh karena dinilai dapat mengurangi kesehatan dan nafsu makan.\r\n3. Syeikh Ihsan bin Muhammad Dahlan al-JampasyUlama Nusantara asal Kediri ini mengulas masalah rokok dalam kitabnya, Irsyad al-Ikhwan. Beliau menyebutkan bahwa pendapat masyhur (kebanyakan) ulama mengatakan hukum rokok adalah makruh sebelum adanya bahaya atau mudharat yang pasti bagi tubuh.', 'Ulama menjelaskan bahwa kandungan racun di dalam rokok merusak organ tubuh secara perlahan, sehingga merokok dianggap sebagai tindakan merusak diri sendiri secara sengaja.\r\n\r\nوَلَا تَقْتُلُوْٓا اَنْفُسَكُمْۗ اِنَّ اللّٰهَ كَانَ بِكُمْ رَحِيْمًا ۝٢٩\r\nJanganlah kamu membunuh dirimu. Sesungguhnya Allah adalah Maha Penyayang kepadamu.', 'Ulama yang menyatakan bahwa merokok hukumnya makruh menyandarkan pendapat mereka pada beberapa dalil tidak langsung, mengingat rokok atau tembakau adalah perkara baru yang tidak disebutkan secara eksplisit dalam Al-Qur\'an maupun Hadits.', 'Menimbulkan Bahaya Nyata (Mudharat) bagi TubuhUlama sepakat bahwa setiap zat yang merusak kesehatan hukumnya haram. Medis modern telah membuktikan bahwa rokok mengandung ribuan zat beracun yang memicu penyakit mematikan seperti kanker, serangan jantung, dan gangguan pernapasan. Sifat merusak ini memenuhi unsur larangan dalam QS. Al-Baqarah: 195 untuk tidak menjatuhkan diri dalam kebinasaan.2. Bahayanya Bersifat Multi-Dimensi (Mengenai Orang Lain)Berbeda dengan bawang yang hanya mengganggu lewat bau, rokok menghasilkan asap yang merugikan orang di sekitarnya (perokok pasif). Menyakiti orang lain secara sengaja hukumnya haram berdasarkan hadits nabi: \"Tidak boleh memulai memberi dampak buruk, dan tidak boleh membalas dampak buruk.\"3. Pemborosan Harta yang Sia-Sia (Tabzir)Membeli rokok dikategorikan sebagai tindakan tabzir (membakar harta tanpa manfaat). Dalam fikih, membelanjakan uang untuk sesuatu yang tidak membawa kebaikan bagi agama, badan, maupun dunia adalah haram, sebagaimana Allah melarang perilaku boros dalam QS. Al-Isra: 27.4. Bersifat Adiktif (Menimbulkan Kecanduan)Rokok mengandung nikotin yang menciptakan ketergantungan psikologis dan fisik. Ulama mengharamkannya karena sifat adiktif ini dapat membelenggu akal dan emosi seseorang, sehingga mereka gelisah atau tidak fokus beribadah jika belum merokok.5. Masuk dalam Kategori Al-Khabaith (Sesuatu yang Buruk)Dalam QS. Al-A\'raf: 157, Allah menegaskan bahwa Nabi Muhammad ﷺ mengharamkan segala yang buruk (al-khabaith). Ulama menilai rokok memenuhi kriteria buruk dari segi bau, rasa, asap, hingga dampak buruknya bagi lingkungan.', 'Tidak Ada Dalil yang Sharih (Tegas dan Jelas)Dalam kaidah ushul fikih, perubahan hukum dari boleh (mubah) menjadi haram membutuhkan dalil yang sharih (eksplisit) dan qath\'i (pasti) dari Al-Qur\'an atau Hadits. Karena rokok baru ada berabad-abad setelah zaman Nabi ﷺ, tidak ada teks suci yang melarangnya secara langsung. Maka, tingkat larangannya diturunkan menjadi makruh (makruh tanzih).', 'Menurut saya hukumnya makruh karena secara ushul fikih tidak ada dalil yang sharih atau tertulis jelas di Al-Qur\'an dan Hadits yang melarang rokok. Efek buruknya juga diqiyaskan seperti makan bawang mentah, yaitu bikin bau dan mengganggu kenyamanan, tapi tidak sampai membatalkan iman atau berdosa besar.', '', '', '', '', '', '', '', '', '', '', '2026-06-04 02:28:34'),
(18, '23051044', NULL, 'Syaikh Abdullah ibn Alwi al-Haddad, Syaikh  asy-Syihab al-Qalyubi, Al-Muhaqqiq al-Bujairimi.', 'MUI, Syekh Ihsan bin Muhammad Dahlan Al-Jampasyi, Syaikh Mahmud Syaltut', 'وَاَنْفِقُوْا فِيْ سَبِيْلِ اللّٰهِ وَلَا تُلْقُوْا بِاَيْدِيْكُمْ اِلَى التَّهْلُكَةِۛ وَاَحْسِنُوْاۛ اِنَّ اللّٰهَ يُحِبُّ الْمُحْسِنِيْنَ ۝١٩٥\r\nAl-baqarah ayat 195\r\nإِنَّ اللَّهَ كَرِهَ لَكُمْ ثَلَاثًا: قِيلَ وَقَالَ، وَكَثْرَةَ السُّؤَالِ، وَإِضَاعَةَ الْمَالِ\r\nHadis bukhati dan muslim', '-', 'Haram karena tidak baik bagi kesehatan tubuh sendiri dan bagi tubuh sekitar peroko karena kena asapnya', 'Ulama yang berpendapat makruh memandang bahwa merokok memiliki bau yang tidak sedap (mengganggu orang lain) serta dapat mengurangi kesehatan. Namun, hukum makruh ini bisa berubah menjadi haram jika Dilakukan oleh anak-anak.Dilakukan oleh wanita hamil.Dilakukan di tempat umum yang mengganggu kenyamanan orang lain.', '', '', '', '', '', '', '', '', '', '', '', '2026-06-04 02:26:08'),
(19, '23051086', NULL, '1. MAJELIS TARJIH Muhammadiyah\r\n2. MUI\r\n3. Syaikh Abdul Aziz', '', 'وَيُحِلُّ لَهُمُ الطَّيِّبَاتِ وَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ \r\nQS. Al-A\'raf ayat 157', '', '', '', '', '1. MEMAHAMI FATWA MAJELIS TARJIHMUHAMMADIYAHNo.q/Slr^rmAy2olo TENTANG HLJKLJM ROKOK\r\n\r\n2.', '', '', '', '', '', '', '', '', '', '2026-06-04 02:27:46'),
(20, '23051043', NULL, 'Beberapa lembaga keagamaan dan ulama kontemporer yang menetapkan fatwa haram terhadap rokok antara lain:\r\n\r\nMajelis Tarjih dan Tajdid Pimpinan Pusat Muhammadiyah (Indonesia).\r\n\r\nLembaga Fatwa Arab Saudi (Al-Lajnah Ad-Daimah lil Buhuts Al-Ilmiyyah wal Ifta\').\r\n\r\nDar Al-Ifta Al-Mishriyyah (Lembaga Fatwa Mesir - fatwa resmi yang dikeluarkan oleh Dr. Ali Jum\'ah dan ditegaskan oleh ulama-ulama setelahnya).', 'Pandangan makruh ini umumnya menjadi pendapat klasik atau awal di Indonesia sebelum banyak penelitian medis berkembang, atau dipegang oleh sebagian ulama tradisional:\r\n\r\nLembaga Bahtsul Masail Nahdlatul Ulama (LBM NU) (Secara organisatoris, NU dalam Keputusan Bahsul Masail menetapkan hukum rokok berkisar antara mubah dan makruh, dengan kecondongan kuat pada makruh).\r\n\r\nSyekh Abdul Ghani al-Nabulsi (Ulama mazhab Hanafi).\r\n\r\nSebagian besar ulama Pondok Pesantren Salaf di Indonesia (Sering kali menetapkan hukum makruh bagi perokok yang sehat, namun bisa berubah hukumnya tergantung kondisi fisik).', 'Ulama yang mengharamkan rokok bersandar pada dalil Al-Qur\'an dan Hadis yang melarang perbuatan merusak diri atau membuang harta secara sia-sia.\r\n\r\nSurah Al-Baqarah ayat 195:\r\n\r\nوَاَنْفِقُوْا فِيْ سَبِيْلِ اللّٰهِ وَلَا تُلْقُوْا بِاَيْدِيْكُمْ اِلَى التَّهْلُكَةِۛ وَاَحْسِنُوْاۛ اِنَّ اللّٰهَ يُحِبُّ الْمُحْسِنِيْنَ ۝١٩٥\r\n\r\n Artinya : \"...dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan...\"\r\n\r\nSurah Al-A\'raf ayat 157: \r\n\"...dan menghalalkan bagi mereka segala yang baik dan mengharamkan bagi mereka segala yang buruk (al-khaba\'ith)...\" (Rokok dikategorikan sebagai hal buruk karena merusak kesehatan).\r\n\r\nHadis Riwayat Ibnu Majah dan Ahmad:\r\n\r\n\"Tidak boleh ada bahaya dan tidak boleh membahayakan orang lain.\" (La darara wa la dirar).', 'Ulama yang menetapkan hukum makruh memandang bahwa rokok tidak secara instan membinasakan, melainkan menimbulkan efek bau yang tidak sedap (seperti bawang) dan mengganggu kenyamanan beribadah serta orang di sekitar.\r\n\r\nHadis Riwayat Bukhari dan Muslim tentang bau menyengat:\r\n\r\n\"Barangsiapa yang memakan bawang merah atau bawang putih, maka janganlah ia mendekati masjid kami.\"\r\n(Ulama meng-qiyas-kan [menganalogikan] bau asap rokok yang mengganggu malaikat dan jamaah masjid dengan bau bawang).\r\n\r\nSurah Al-Isra ayat 26-27 (tentang makruhnya tabzir/boros yang belum sampai tahap haram mutlak jika tidak memiskinkan):\r\n\r\n\"Dan janganlah kamu menghambur-hamburkan (hartamu) secara boros.\"', 'Menimbulkan penyakit berbahaya: Secara medis, merokok terbukti merusak organ tubuh secara perlahan dan bisa menyebabkan kematian (bunuh diri pasif).\r\n\r\nMembahayakan orang lain: Asap rokok menjadi racun bagi orang di sekitarnya (perokok pasif).\r\n\r\nPemborosan harta (Tabzir): Membelanjakan uang untuk sesuatu yang murni merusak kesehatan hukumnya haram, bukan lagi sekadar sia-sia.', 'Tidak mematikan secara instan: Dampak buruk rokok tidak terjadi seketika seperti racun, melainkan akumulatif.\r\n\r\nFokus pada bau yang mengganggu: Alasan utamanya disamakan (qiyaf) dengan mengonsumsi bawang mentah, yaitu menimbulkan bau mulut tidak sedap yang mengganggu kenyamanan orang lain/malaikat saat ibadah.\r\n\r\nBelum ada dalil sharih (eksplisit): Al-Qur\'an dan Hadis tidak menyebutkan kata \"rokok\" secara langsung, sehingga ulama berhati-hati untuk tidak terburu-buru menetapkan hukum haram mutlak jika belum disepakati menyeluruh.', '\"Saya memosisikan diri mengikuti pendapat yang mengharamkan. Analisis saya menunjukkan bahwa dampak buruk rokok terhadap kesehatan tubuh (perokok aktif maupun pasif) sudah terbukti secara medis, sehingga selaras dengan prinsip syariat untuk menjaga jiwa (hifdzun nafs) dari kebinasaan', 'Pilihan 1 (Buku Fikih Kontemporer):\r\n\r\n\"Buku Fikih Kontemporer karya Dr. Yusuf Al-Qaradhawi.\"\r\n\r\nhttps://books.google.co.id/books?id=wuSqeQjqAjYC&lpg=PA5&ots=7hbMjWPvN7&dq=info%3Ag2spLBGm9uMJ%3Ascholar.google.com%2F&lr&hl=id&pg=PA5#v=onepage&q&f=false\r\n\r\nPilihan 2 (Keputusan Ormas Keagamaan):\r\n\r\n\"Buku Ahkamul Fuqaha: Solusi Problematika Umat (Keputusan Bahtsul Masail NU).\" \r\n\r\nhttps://sg.docworkspace.com/d/sbPaeeefzRcLwyr5_g5az09yj0hu3gle34t?sa=601.1074\r\n\r\nPilihan 3 (Jurnal Ilmiah):\r\n\r\n\"Jurnal berjudul \'Kontroversi Hukum Rokok dalam Perspektif Ulama Kontemporer\'.\"\r\n\r\n19177-46088-1-PB.pdf https://jurnal.uinsu.ac.id/index.php/ahlana/article/viewFile/19177/7818', '', '', '', '', '', '', '', '', '', '2026-06-04 02:25:57'),
(21, '23051048', NULL, '1. Majelis tarjih dan tajdid Muhammadiyah - dianggap haram karena membahayakan\r\n2. Komisi Fatwah MUI - haram bagi anak” dan wanita hamil\r\n3. Yusuf Al-Qaradawi - perbuatan yang menyia-nyiakan harta', '1. NU - Bathsul Masail NU menetapkan rokok makruh\r\n2. Wahbah Az-Zuhaili - Dalam kitab Al-Fiqh Al-Islami Wa Adillatuhu \r\n3. Ali Jum’ah - Fatwah dan ceramahnya menyebut hukum rokok makruh kecuali jika terbukti membahayakan sehingga menjadi haram', '1. Qs. Al-Baqarah:195 - Dan janganlah kamu menjatuhkan diri sendiri ke dalam kebinasaan', '1. Hadis tentang bau yang mengganggu orang lain ( HR.Al-Bukhori dan Muslim )', '1. Membahayakan kesehatan\r\n2. Membahayakan orang lain\r\n3. Memboroskan harta \r\n4. Termasuk Khabaits ( sesuatu yang buruk )', '1. Hukum asal mubah - tanpa dalil yang tegas, sebagian ulama memilih makruh \r\n2. Bau rokok mengganggu orang lain', 'Bisa Haram bisa makruh, karena dampak dari rokok yang sangat membahayakan tetapi belum ada dalil atau ayat yang jelas tentang pengharaman rokok ', 'Kitab Al-Fiqh al-Islami wa Adillatuhu', '', '', '', '', '', '', '', '', '', '2026-06-04 02:22:21'),
(22, '23051066', NULL, '1.majelis ulama indonesia (untuk kelompok tertentu seperti anak-anak, ibu hamil, dan di tempat umum).\r\n2. muhammadiyah.\r\n3. yusuf Al-Qadarawi.\r\n\r\nsumber: Fatwa MUI Tahun 2009 tentang Rokok; putusan Majelis Tarjih Muhammadiyah No. 6/SM/MTT/III/2010; Yusuf Al-Qaradawi, Al-Halal wa Al-Haram fi Al-Islam.', '1. nahdlatul ulama (mayoritas pendapat menyatakan makruh).\r\n2. wahbah Az-Zuhaili.\r\n3. syekh muhammad Abduh.\r\n\r\nsumber: keputusan Bahtsul Masail NU; Wahbah Az-Zuhaili, Al-Fiqh Al-Islami wa Adiatuhu; muhammad Rasyid Ridha, Tafsir Al-manar (memuat pandangan muhammad Abduh).', 'Latin: \'\'Wa anfiqu fi sabilillahi wa la tulqu bi aidikum ilat-tahlukah, wa ahsinu, innallaha yuhibbul muhsinin.\r\n\r\nartinya: \"dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"(QS.Al- Baqarah ayat 195)\r\n\r\nsumber: Al-Qur\'an surah al-baqarah ayat 195;hr. Ibnu Majah No.2341\r\n\r\n', 'hadist: \"Innallaha kariha lakum qila wa qal...\"\r\n\r\nartinya: \"sesungguhnya Allah membenci bagi kalian perkataan yang tidak bermanfaat (sia-sia).\"\r\n\r\nsumber: Al-Qur\'an Surah Al-A\'raf ayat 157; HR. ukhari No. 2408 dan muslim no.593.', '1. membahayakan kesehatan dan dapat menyebabkan penyakit serius.\r\n2. membahayakan orang lain melalui asapa rokok.\r\n3. bertentangan dengan tujuan syariat dalam menjaga jiwa (hifz an-nafs).\r\n4. termasuk pemborosan harta untuk sesuatu yang merugikan.\r\n\r\nsumber: fatwa muhammadiyah no. 6/sm/mtt/III/2010; fatwa MUI Tahun2009; Yusuf Al-Qaradawi, AL-Hlal wa Al-Haram fi Al-Islam.', '1. tidak ada nash Al-Quran  atau hadist yang secara tegas menyebut rokok.\r\n2. rokok tidak dikenal pada masa Rasulullah.SAW.\r\n3. dalil yang digunakan masih bersifat umum sehingga tidak cukup kuat untuk menetapkan hukum haram.\r\n4. oleh karena itu, hukum yang lebih tepat adalah makruh.\r\n\r\nsumber: keputusan bahtsul masail NU; Wahbah Az-Zuhaili, Al-Fiqh Al-Islami wa Adillatuhu.', 'setelah membandingkan kedua pendapat, saya lebih cenderung mengikuti pendapat yang mengharamkan rokok. Alasannya, bukti medis menujukkan bahwa rokok dapat merusak kesehatan dan membahyakan  orang lain melalui asapnya. selain itu, terdapat kaidah islam yang melarang segala bentuk perbuatan yang menimbulkan bahaya. walaupun rokok tidak disebutkan secara langsung dalam Al-Quran dan hadist, dampak negatifnya yang nyata membuat pendapat yang mengharamkan lebih kuat kuat dan lebih sesuai dengan tujuan syariat Islam untuk menjaga jiwa manusia.\r\n\r\nsumber: fatwa MUI Tahun 2009;fatwa Muhammadiyah No6/ Sm/mtt/III/2010; Yusuf Al-Qaradawi, Al-Halal wa Al-Haram fi Al-Islam.', '', '', '', '', '', '', '', '', '', '', '2026-06-04 02:28:14'),
(23, '23051050', NULL, 'Syaikh Abdul Aziz bin Baz, Syaikh Muhammad bin Shalih Al-Utsaimin, Syaikh Yusuf Al-Qaradawi', 'Syekh Wahbah Az-Zuhaili,Syekh Ali Jum\'ah, Nahdlatul Ulama (NU)', 'لَا ضَرَرَ وَلَا ضِرَارَ\r\n\r\n\"Tidak boleh membahayakan diri sendiri dan tidak boleh membahayakan orang lain.\"\r\n\r\n(HR. Ibnu Majah No. 2341, Malik dalam Al-Muwaththa\')', 'ترك ما لا فائدة فيه أولى\r\n\r\n\"Meninggalkan sesuatu yang tidak bermanfaat lebih utama.\"', 'Membahayakan kesehatan,Membahayakan orang lain,Menyia-nyiakan harta', 'Al-Qur\'an dan hadis tidak secara langsung menyebut rokok.Kaidah hukum asal sesuatu adalah mubah', ' Menurut saya, pendapat yang menyatakan rokok makruh lebih kuat karena tidak adanya dalil khusus yang mengharamkannya secara langsung. Meskipun demikian, merokok tetap sebaiknya dihindari karena dapat menimbulkan dampak negatif bagi kesehatan dan lingkungan sekitar.\n', 'Artikel NU Online: Bahtsul Masail tentang Hukum Merokok, Buku Wahbah Az-Zuhaili', '', '', '', '', '', '', '', '', '', '2026-06-04 02:02:38'),
(24, '23051150', NULL, 'Menurut Muhammadiyyah melalui majlis tarjih dan tajdid, hukum merokok adalah haram karna mudharatnya lebih besar dari pada manfaatnya.\r\nUlama\' yang terkenal mengharamkan rokok contohnya:\r\n1. Yusuf Al-Qaradawi \r\n2. Abdul Aziz bin Baz\r\n3. Muhammad bin Shalih al-Utsaimin\r\n4. Muhammad Nashiruddin al-Abani\r\n4. Muhammad ', 'menurut NU, hukum merokok pada umumnya adalah Makruh, karna tidak terdapat nash yang secara tegas mengharamkan rokok dalam Al-Qur\'an maupun Hadist.\r\n1. Abu Bakar Syatha Ad-Dimyathi\r\n2. Sulaiman Al-Jamal\r\n3. Ibrahim Al-Bajuri\r\n4. Abdul Hamid Asy-Syarwani', 'Majlis tarjih dan tajdid muhammadiyah mengguakan dua dasar dalam menghukumi hukum keharaman rokok tersebut.\r\n1. QS. Al-A\'raf ayat 157:\r\n(Alladzina yattabi\'unar-rasulan-nabiyyal-ummiyyalladzi yajidunahu maktuban \'indahum fit-taurati wal-injili ya\'muruhum bil-ma\'rufi wa yan-hahum \'anil-munkari wa yuhillu lahumuth-thayyiati wa yu-harrimu \'alaihimul-khaba\'itsa wayadla\'u \'an hum ishrahum wal-aghlalallati kanat \'alaihim, falladzina amanu bihi wa \'azzaruhu wa nasharuhu wattaba\'un-nuralladzi unzila ma\'ahu ula\'ika humul muflihun).\r\n2. QS. Al-Baqarah ayat 195 dan An-Nisa\' ayat 29\r\n3. QS. Al-Isra\' ayat 26-27\r\n4. Hadist yang diriwayatkan oleh Ibnu Majjah, Malik, dan Ahmad\r\n(La dharara wa la dhirara)\r\n5. Hadist yang diriwayatkan oleh Ahmad dan Abu Daud', 'Landasan atas makruhnya merokok didasarkan pada kaidah fiqih (segala sesuatu pada asalnya adalah mubah). ditambah juga dengan Qaul \'Abdur Rahman ibn Muhammad ibn \'Umar Ba\'alawy yang tertera dalam Bughyatul Mustarsyidin:\r\n(Wa alladzina yazh-haru in \'arada annahu yuharrimuhu ma lahu binnisbati liman yaddhuru bi \'aqlihi aw fi badanihi aw haraman.....)', '', '', '', '', '', '', '', '', '', '', '', '', '', '2026-06-04 02:27:25'),
(25, '23051053', NULL, 'Imam Syafi\'i\nImam Syihabuddin Al-Qalyubi\nLembaga Tarjih Muhammadiyah', 'Syekh Mansyur\r\nMadzhab Hanafi\r\nMadzhab Maliki', 'Surah Al-Baqarah Ayat 195', 'Hadis Riwayat Bukhari & Muslim: \"Barangsiapa yang memakan tanaman ini (bawang), janganlah ia mendekati masjid kami dan jangan menyakiti kami dengan bau bawangnya.\"', 'Karena memiliki Mudharat yang besar baik terhadap diri sendiri atau orang lain', 'Karena Dampak Kemudharatan gang tidak Instan ', 'Rokok hukumnya Haram', 'Deretan Ulama Klasik yang tak Haramkan Rokok Tembakau\nBy Republika.id\n\nUlama yang Mengharamkan Rokok\nBy Republika.id', '', '', '', '', '', '', '', '', '', '2026-06-04 01:58:46'),
(26, '23051021', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2026-06-04 02:09:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tema_masalah`
--

CREATE TABLE `tema_masalah` (
  `id_tema` int(11) NOT NULL,
  `nama_tema` varchar(255) NOT NULL,
  `kelompok` enum('Masalah Utama','Masalah Kontemporer') NOT NULL,
  `kelas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `nama_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- AUTO_INCREMENT untuk tabel `tb_daftar_soal`
--
ALTER TABLE `tb_daftar_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
