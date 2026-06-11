-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2026 at 09:35 AM
-- Server version: 11.4.10-MariaDB-cll-lve
-- PHP Version: 8.4.21

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
-- Table structure for table `admin_users`
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
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `must_change_password`, `created_at`, `updated_at`) VALUES
(1, 'zainul', '$2y$10$JYiK0q029eISvxqGA7TbGOj2AQT8/pUvnbwtffXjfx8zPteli3IfK', 1, '2026-04-09 13:40:50', '2026-04-09 13:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `site_content`
--

CREATE TABLE `site_content` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `content_json` longtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_content`
--

INSERT INTO `site_content` (`id`, `content_json`, `updated_at`) VALUES
(1, '{\"site\":{\"title\":\"PAI Multikultural Hub\",\"subtitle\":\"Portofolio jurnal dan artikel untuk Pendidikan Agama Islam yang inklusif, dialogis, dan peka terhadap keragaman sosial-budaya.\",\"description\":\"Platform ini menghimpun tautan jurnal, portal pencarian, dan posting kurasi bertema PAI Multikultural agar proses pencarian referensi lebih cepat, rapi, dan mudah dipublikasikan ulang ke GitHub.\",\"updatedAt\":\"2026-04-09\",\"highlightTopics\":[\"Moderasi beragama\",\"Kelas PAI inklusif\",\"Dialog lintas budaya\",\"Toleransi dan tasamuh\",\"Kurikulum PAI kontekstual\",\"Kearifan lokal\"]},\"journals\":[{\"id\":\"journal-moraref\",\"title\":\"MORAREF\",\"institution\":\"Kementerian Agama Republik Indonesia\",\"level\":\"Portal Nasional\",\"focus\":\"Portal indeks jurnal keislaman dan pendidikan Islam\",\"url\":\"https://moraref.kemenag.go.id/\",\"note\":\"Portal penting untuk menelusuri jurnal-jurnal Islam dan pendidikan. Saat data awal ini dibuat, laman utamanya sedang menampilkan status perbaikan sehingga cocok dipantau ulang secara berkala.\",\"tags\":[\"portal\",\"PAI\",\"pendidikan Islam\"],\"featured\":true},{\"id\":\"journal-garuda\",\"title\":\"GARUDA\",\"institution\":\"Kemendikbudristek\",\"level\":\"Portal Nasional\",\"focus\":\"Indeks artikel ilmiah Indonesia lintas disiplin\",\"url\":\"https://garuda.kemdikbud.go.id/\",\"note\":\"Cocok untuk menelusuri artikel pendidikan, moderasi beragama, dan riset terkait keragaman sosial dalam konteks pembelajaran.\",\"tags\":[\"portal\",\"artikel\",\"pendidikan\"],\"featured\":true},{\"id\":\"journal-doaj\",\"title\":\"DOAJ\",\"institution\":\"Directory of Open Access Journals\",\"level\":\"Portal Internasional\",\"focus\":\"Direktori jurnal akses terbuka lintas bidang\",\"url\":\"https://doaj.org/\",\"note\":\"Portal internasional yang berguna untuk menemukan jurnal open access dan menelusuri artikel yang relevan dengan pendidikan, agama, dan keberagaman.\",\"tags\":[\"open access\",\"portal\",\"internasional\"],\"featured\":true},{\"id\":\"journal-al-jamiah\",\"title\":\"Al-Jami\'ah: Journal of Islamic Studies\",\"institution\":\"UIN Sunan Kalijaga Yogyakarta\",\"level\":\"Internasional\",\"focus\":\"Kajian Islam dan kemasyarakatan\",\"url\":\"https://aljamiah.or.id/index.php/AJIS\",\"note\":\"Berguna untuk menelusuri isu relasi agama, budaya, dan pendidikan Islam di masyarakat plural.\",\"tags\":[\"Islamic studies\",\"pluralitas\",\"pendidikan\"],\"featured\":false},{\"id\":\"journal-qijis\",\"title\":\"QIJIS: Qudus International Journal of Islamic Studies\",\"institution\":\"IAIN Kudus\",\"level\":\"Internasional\",\"focus\":\"Kajian Islam, pendidikan, dan dinamika sosial\",\"url\":\"https://journal.iainkudus.ac.id/index.php/QIJIS\",\"note\":\"Dapat dipantau untuk artikel yang membahas transformasi pendidikan Islam dan relasi antar-komunitas.\",\"tags\":[\"Islamic studies\",\"pendidikan\",\"sosial\"],\"featured\":true},{\"id\":\"journal-edukasia\",\"title\":\"Edukasia: Jurnal Penelitian Pendidikan Islam\",\"institution\":\"IAIN Kudus\",\"level\":\"Nasional\",\"focus\":\"Penelitian pendidikan Islam\",\"url\":\"https://journal.iainkudus.ac.id/index.php/Edukasia\",\"note\":\"Sangat relevan untuk topik strategi pembelajaran PAI, kurikulum, dan pendekatan inklusif di kelas.\",\"tags\":[\"PAI\",\"kurikulum\",\"pembelajaran\"],\"featured\":true},{\"id\":\"journal-google-scholar\",\"title\":\"Google Scholar\",\"institution\":\"Google\",\"level\":\"Portal Internasional\",\"focus\":\"Penelusuran artikel ilmiah lintas bidang\",\"url\":\"https://scholar.google.com/\",\"note\":\"Pintu masuk paling praktis untuk membangun query tema PAI Multikultural, moderasi beragama, dan pembelajaran inklusif.\",\"tags\":[\"portal\",\"artikel\",\"pencarian\"],\"featured\":false},{\"id\":\"journal-jpi\",\"title\":\"Jurnal Pendidikan Islam\",\"institution\":\"UIN Sunan Kalijaga Yogyakarta\",\"level\":\"Nasional\",\"focus\":\"Riset pendidikan Islam dan pengembangan teori-praktik pendidikan\",\"url\":\"https://ejournal.uin-suka.ac.id/tarbiyah/index.php/JPI\",\"note\":\"Bisa dipakai untuk mencari kajian tentang kurikulum, pendidikan karakter, dan pendekatan kontekstual dalam PAI.\",\"tags\":[\"pendidikan Islam\",\"karakter\",\"kurikulum\"],\"featured\":false}],\"posts\":[{\"id\":\"post-kurasi-sekolah-menengah\",\"type\":\"Kurasi Topik\",\"title\":\"PAI Multikultural di Sekolah Menengah\",\"author\":\"Tim Kurasi\",\"year\":\"2026\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=pendidikan+agama+islam+multikultural+sekolah+menengah\",\"summary\":\"Pintu masuk untuk menelusuri riset tentang praktik pembelajaran PAI di lingkungan sekolah menengah yang majemuk secara sosial dan budaya.\",\"tags\":[\"PAI\",\"sekolah\",\"multikultural\"],\"featured\":true},{\"id\":\"post-moderasi-beragama\",\"type\":\"Kurasi Topik\",\"title\":\"Moderasi Beragama dalam Pembelajaran PAI\",\"author\":\"Tim Kurasi\",\"year\":\"2026\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=moderasi+beragama+dalam+pembelajaran+PAI\",\"summary\":\"Kumpulan telusur untuk mencari artikel yang membahas moderasi beragama, sikap berimbang, dan desain materi PAI yang tidak eksklusif.\",\"tags\":[\"moderasi\",\"PAI\",\"agama\"],\"featured\":true},{\"id\":\"post-pai-inklusif\",\"type\":\"Kurasi Topik\",\"title\":\"Strategi PAI Inklusif untuk Kelas Multikultur\",\"author\":\"Tim Kurasi\",\"year\":\"2025\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=pembelajaran+PAI+inklusif+kelas+multikultural\",\"summary\":\"Fokus pada metode pembelajaran, pengelolaan diskusi, dan penumbuhan empati di kelas dengan latar peserta didik yang beragam.\",\"tags\":[\"inklusif\",\"kelas\",\"strategi\"],\"featured\":true},{\"id\":\"post-nilai-tasamuh\",\"type\":\"Kurasi Topik\",\"title\":\"Nilai Tasamuh dan Resolusi Konflik\",\"author\":\"Tim Kurasi\",\"year\":\"2025\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=nilai+tasamuh+dalam+pembelajaran+PAI\",\"summary\":\"Menjembatani pencarian artikel tentang toleransi, tasamuh, akhlak sosial, dan manajemen perbedaan dalam praktik pendidikan Islam.\",\"tags\":[\"tasamuh\",\"toleransi\",\"akhlak\"],\"featured\":false},{\"id\":\"post-identitas-kebangsaan\",\"type\":\"Kurasi Topik\",\"title\":\"PAI, Kebangsaan, dan Pendidikan Kewargaan\",\"author\":\"Tim Kurasi\",\"year\":\"2025\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=PAI+kebangsaan+dan+multikultural\",\"summary\":\"Kurasi untuk mencari artikel yang mempertemukan pendidikan agama, identitas kebangsaan, dan kehidupan demokratis di sekolah.\",\"tags\":[\"kebangsaan\",\"demokrasi\",\"PAI\"],\"featured\":false},{\"id\":\"post-projek-sosial\",\"type\":\"Kurasi Praktik\",\"title\":\"Projek Sosial Berbasis PAI dan Keberagaman\",\"author\":\"Tim Kurasi\",\"year\":\"2024\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=projek+sosial+berbasis+PAI+keberagaman\",\"summary\":\"Pencarian yang dapat dipakai untuk menemukan model praktik projek, pengabdian, dan pembelajaran kontekstual berbasis isu sosial-keagamaan.\",\"tags\":[\"projek\",\"kontekstual\",\"sosial\"],\"featured\":false},{\"id\":\"post-kearifan-lokal\",\"type\":\"Kurasi Topik\",\"title\":\"Kearifan Lokal sebagai Sumber Belajar PAI\",\"author\":\"Tim Kurasi\",\"year\":\"2024\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=kearifan+lokal+dalam+pendidikan+agama+islam\",\"summary\":\"Mengarah pada artikel tentang integrasi budaya lokal, tradisi masyarakat, dan penguatan sikap toleran dalam pembelajaran PAI.\",\"tags\":[\"kearifan lokal\",\"budaya\",\"materi\"],\"featured\":false},{\"id\":\"post-evaluasi-sikap\",\"type\":\"Kurasi Penelitian\",\"title\":\"Evaluasi Sikap Toleransi Peserta Didik\",\"author\":\"Tim Kurasi\",\"year\":\"2024\",\"source\":\"Google Scholar Query\",\"url\":\"https://scholar.google.com/scholar?q=evaluasi+sikap+toleransi+peserta+didik+PAI\",\"summary\":\"Telusur awal untuk metodologi penilaian afektif, indikator toleransi, dan evaluasi hasil pembelajaran PAI berbasis nilai kebersamaan.\",\"tags\":[\"evaluasi\",\"toleransi\",\"peserta didik\"],\"featured\":false}]}', '2026-04-09 13:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `tb_daftar_soal`
--

CREATE TABLE `tb_daftar_soal` (
  `id` int(11) NOT NULL,
  `tema_id` int(11) DEFAULT NULL,
  `teks_soal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_daftar_soal`
--

INSERT INTO `tb_daftar_soal` (`id`, `tema_id`, `teks_soal`) VALUES
(1, 7, 'Tulis 3 ulama/ lembaga yang mengatakan rokok haram!'),
(2, 7, 'Tulis 3 ulama/ lembaga yang mengatakan rokok makruh!'),
(3, 7, 'Tulis ayat atau hadis yang dijadikan dasar oleh ulama yang mengatakan haram!'),
(4, 7, 'Tulis ayat atau hadis yang dijadikan dasar oleh ulama yang mengatakan makruh!'),
(5, 7, 'Tulis alasan ulama yang mengatakan bahwa larangan rokok mencapai derajat haram!'),
(6, 7, 'Tulis alasan ulama yang mengatakan bahwa larangan rokok tidak mencapai derajat haram (hanya makruh)!'),
(7, 7, 'analisis 6 jawaban dari pertanyaan di atas dan tentukan posisimu, apakah mengikuti yang mengharamkan atau mengikuti yang memakruhkan!'),
(8, 7, 'tulis judul buku atau jurnal yang kamu baca untuk menjawab pertanyaan pertanyaan di atas!'),
(9, 44, 'Apa yang dimaksud qunut yang kamu ketahui?'),
(10, 44, 'Tulis hadis yang mengatakan qunut sunnah! tulis dengan transliterasi jika kesulitan mengetik arab!\r\n(transliterasi bukan terjemah, tapi cara baca)'),
(11, 44, 'Tulis hadis yang mengatakan tidak ada sunnah qunut subuh! tulis dengan transliterasi arab jika kesulitan mengetik arab!'),
(12, 44, 'tulis nama 3 ulama yang mengatakan qunut shubuh sunnah (bukan organisasi)'),
(13, 44, 'tulis nama 3 ulama yang mengatakan qunut shubuh bukanlah sunnah (bukan organisasi)'),
(14, 44, 'tulis alasan ulama mengatakan qunut subuh sunnah!'),
(15, 44, 'tulis alasan ulama mengatakan qunut subuh tidak sunnah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
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
-- Dumping data for table `tb_soal`
--

INSERT INTO `tb_soal` (`id`, `nama_mahasiswa`, `tema_id`, `jawaban_1`, `jawaban_2`, `jawaban_3`, `jawaban_4`, `jawaban_5`, `jawaban_6`, `jawaban_7`, `jawaban_8`, `jawaban_9`, `jawaban_10`, `jawaban_11`, `jawaban_12`, `jawaban_13`, `jawaban_14`, `jawaban_15`, `jawaban_16`, `jawaban_17`, `waktu_submit`) VALUES
(7, '23051042', NULL, '', '', '', '', '', '', '', '', ' Qunut adalah doa khusus yang dibaca saat berdiri (i\'tidal) pada rokaat terakhir dalam sholat shubuh', ' landasan hadits yang menyatakan membaca qunut subuh adalah sunnah yaitu dari sahabat anas bin malik yang berbunyi : an anas bin malik annan nabiyya sholallahu alaihi wasallam, kaana yaqnut fii sholaati subhi hatta faaroqo ddunya', 'Maa rowaahul khothiibu min thoriiqi qois bin robi\' an ashim bin sulaiman, qulnaa lianasin : inna qouman yaz\'umuuna annan nabiyya sholallahu alaihi wasallam lam yazal yaqnut fil fajri qoola : kadzabu innamaa qonata syahron wahidan yad\'u alaa hayyin min ahya\'il musyrikina', 'Imam syafi\'i, imam malik, imam ibnu laila', 'Imam abu hanifah, imam ahmad bin hanbal, sufyan ats tsauri', 'Karena berlandaskan hadis nabi kaidah istishhab (menetapkan hukum sesuai dengan kaidah sebelumnya) ', 'Karena nabi hanya berqunut subuh dalam periode tertentu karena suatu sebab bukan sebagai amalan yang dilakukan setiap hari dan juga hadits yang mengatakan qunut itu sunnah dinilai dhaif', '', '', '2026-06-11 02:10:48'),
(8, '23051047', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah doa yang dibaca dalam sholat pada posisi berdiri itidal setelah bangkit dari rukuk pada raka at kedua', 'wa ammal fi shubh falam yazal yaqnut hatta faraqad dunya \r\n', 'An abi malikin al asyjaiyyi qola: qultu li abi ya abati innaka qad sallaita khaifa rasuli ilahi salla ilahu alayhi wa sallam.', 'Imam syafi\'i\r\nImam malik\r\nImam nawawi', 'Imam abu hanifah\r\nImam ahmad bin hanbal\r\nIbnu qayyim al jauziyyah', 'Menurut madzhab syafi\'i qunut subuh berkedudukan sebagai sunnah hai\'ah (sunnah yang di anjurkan). Juka di tinggalkan, tidak membatalkan shalat dan tidak perluh sujud sahwi', 'Madzhab hanafi: memandang qunut subuh tidak di syariadkan sama sekali di luar qunut lazillah. Bahkan sebagaian literatur hanafiah menyebutkan tidak sesuai tuntunan harian ', '', '', '2026-06-11 02:15:30'),
(9, '23051037', NULL, '1. Peserta Ijtima Ulama Komisi Fatwa se-Indonesia III \r\n2. MUI\r\n3. Majlis Muhammadiyah \r\n4.Ulama Mesir, Yordania, Yaman, dan Syria', ' \'Abdur Rahman ibn Muhammad ibn Husain ibn \'Umar Ba\'alawiy di dalam Bughyatul Mustarsyidin (hal.260)\r\nProf Dr Wahbah Az-Zuhailiy di dalam Al-Fiqh al-Islamiy wa Adillatuh (Cet. III, Jilid 6, hal. 166-167)\r\n\r\nMahmud Syaltut di dalam Al-Fatawa (hal.383-384)\r\n Asy-syafi\'i dan madzhab Al Hambali ', 'Firman Allah SWT QS Al-A’raf ayat 157:\r\nأيمرهم ابملعروف وينهاهم عن املنكر وحيل هلم الطيبات وحيرم عليهم اخلبائث \r\n“Nabi itu menyuruh mereka kepada yang makruf, melarang \r\nmereka dari yang munkar, menghalalkan bagi mereka segala yang \r\nbaik dan melarang bagi mereka segala yang buruk.”\r\n2. Firman Allah SWT QS al-Isra’ ayat 26-27:\r\nوال تبذر تبذيرا ان املبذرين كانوا اخوان الشياطني وكان الشيطان لربه كفورا \r\n“Janganlah kamu menghambur-hamburkan hartamu secara \r\nboros”. “Sesungguhnya orang-orang yang berlaku boros itu adalah \r\nsaudara-saudara syaitan. Dan syaitan itu sangat ingkar terhadap \r\nTuhannya.”\r\n3. Hadits Nabi Saw\r\nالضرر وال ضرار\r\n\"Tidak boleh membuat mudlarat kepada diri sendiri dan tidak boleh \r\nmembuat mudlarat kepada orang lain.”\r\n1. Agama Islam (syariah) menghalalkan segala yang baik dan mengharamkan \r\nkhabaist (segala yang buruk), sebagaimana ditegaskan dalam al-Quran, \r\n\r\n\r\n \r\n \r\n\r\n\Z\r\nArtinya: “… dan menghalalkan bagi mereka segala yang baik dan \r\nmengharamkan bagi mereka segala yang buruk … ” [Q. 7:157]. \r\n2. Agama Islam (syariah) melarang menjatuhkan diri ke dalam kebinasaan dan \r\nperbuatan bunuh diri sebagaimana dinyatakan dalam al-Quran, \r\n\r\nArtinya: “Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam \r\nkebinasaan, dan berbuat baiklah, karena sesungguhnya Allah menyukai orang-\r\norang yang berbuat baik” [Q. 2: 195].\r\nArtinya: “Dan janganlah kamu membunuh dirimu; sesungguhnya Allah adalah \r\nMaha Penyayang kepadamu” [Q. 4: 29]. \r\n3. Larangan perbuatan mubazir dalam al-Quran, \r\n\r\nArtinya: “Dan berikanlah kepada keluarga-keluarga yang dekat akan haknya, \r\nkepada orang miskin dan orang yang dalam perjalanan; dan janganlah kamu \r\nmenghambur-hamburkan (hartamu) secara boros, karena sesungguhnya para \r\npemboros adalah saudara-saudara setan, dan setan itu sangat ingkar pada \r\nTuhannya” [Q 17: 26-27]. \r\n4. Larangan menimbulkan mudarat atau bahaya pada diri sendiri dan pada orang \r\nlain dalam hadis riwayat Ibn Majah, Ahmad, dan Malik, \r\n', 'termaktub di dalam Al-Qur\'an dan As-Sunnah sebagai berikut: Al-Qur\'an : وَلاَ تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ وَأَحْسِنُوا إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ. البقرة: 195 Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan, dan berbuat baiklah, karena sesungguhnya Allah menyukai orang-orang yang berbuat baik. (Al-Baqarah: 195) As-Sunnah : عَنْ ابْنِ عَبَّاسٍ قَالَ قَالَ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ لاَ ضَرَرَ وَلاَ ضِرَارَ. رواه ابن ماجه, الرقم: 2331 Dari Ibnu \'Abbas ra, ia berkata ; Rasulullah SAW. bersabda: Tidak boleh berbuat kemudaratan (pada diri sendiri), dan tidak boleh berbuat kemudaratan (pada diri orang lain). (HR. Ibnu Majah, No.2331) Bertolak dari dua nash di atas, ulama\' sepakat mengenai segala sesuatu yang membawa mudarat adalah haram. Akan tetapi yang menjadi persoalan adalah apakah merokok itu membawa mudarat ataukah tidak, dan terdapat pula manfaat ataukah tidak. Dalam hal ini tercetus persepsi yang berbeda dalam meneliti dan mencermati substansi rokok dari aspek kemaslahatan dan kemafsadatan. Perbedaan persepsi ini merupakan babak baru munculnya beberapa pendapat mengenai hukum merokok dengan berbagai argumennya.\r\n', 'Menurut ahli kesehatan, rokok mengandung nikotin dan zat lain yang \r\nmembahayakan kesehatan. Di samping kepada perokok, tindakan \r\nmerokok dapat membahayakan orang lain, khususnya yang berada di \r\nsekitar perokok.\r\nSehingga Ijtima para Ulama Komisi Fatwa se-Indonesia III sepakat bahwa \r\nmerokok hukumnya haram jika dilakukan :\r\na. di tempat umum;\r\nb. oleh anak-anak; dan\r\nc. oleh wanita hamil.\r\nKarena mempertimbangkan besarnya mudhorot yang akan timbul dari pada manfaatnya bagi manusia itu sendiri atau bagi lingkungan sekitarnya.\r\nPendapat majlis Muhammadiyah juga mengeluarkan fatwa yang sama yaitu:\r\nWajib hukumnya mengupayakan pemeliharaan dan peningkatan derajat \r\nkesehatan masyarakat setinggi-tingginya dan menciptakan lingkungan yang \r\nkondusif bagi terwujudnya suatu kondisi hidup sehat yang merupakan hak \r\nsetiap orang dan merupakan bagian dari tujuan syariah (maq±¡id asy-syar³‘ah); \r\n2. Merokok hukumnya adalah haram karena: \r\na. merokok termasuk kategori perbuatan melakukan khab±’i£ yang dilarang 2\r\nb. perbuatan merokok mengandung unsur menjatuhkan diri ke dalam \r\nkebinasaan dan bahkan merupakan perbuatan bunuh diri secara perlahan \r\nsehingga oleh karena itu bertentangan dengan larangan al-Quran dalam Q. \r\n2: 195 dan 4: 29, \r\nc. perbuatan merokok membahayakan diri dan orang lain yang terkena \r\npaparan asap rokok sebab rokok adalah zat adiktif dan berbahaya \r\nsebagaimana telah disepakati oleh para ahli medis dan para akademisi dan \r\noleh karena itu merokok bertentangan dengan prinsip syariah dalam hadis \r\nNabi saw bahwa tidak ada perbuatan membahayakan diri sendiri dan \r\nmembahayakan orang lain, \r\nd. rokok diakui sebagai zat adiktif dan mengandung unsur racun yang \r\nmembahayakan walaupun tidak seketika melainkan dalam beberapa waktu \r\nkemudian sehingga oleh karena itu perbuatan merokok termasuk kategori \r\nmelakukan suatu yang melemahkan sehingga bertentangan dengan hadis \r\nNabi saw yang melarang setiap perkara yang memabukkan dan \r\nmelemahkan. \r\ne. Oleh karena merokok jelas membahayakan kesehatan bagi perokok dan \r\norang sekitar yang terkena paparan asap rokok, maka pembelajaan uang \r\nuntuk rokok berarti melakukan perbuatan mubazir (pemborosan) yang \r\ndilarang dalam Q. 17: 26-27, \r\nf. Merokok bertentangan dengan unsur-unsur tujuan syariah (maq±¡id asy-\r\nsyar³‘ah), yaitu (1) perlindungan agama (¥if§ ad-d³n), (2) perlindungan \r\njiwa/raga (¥if§ an-nafs), (3) perlindungan akal (¥if§ al-‘aql), (4) perlindungan \r\nkeluarga (¥if§ an-nasl), dan (5) perlindungan harta (¥if§ al-m±l). \r\n3. Mereka yang belum atau tidak merokok wajib menghindarkan diri dan \r\nkeluarganya dari percobaan merokok sesuai dengan Q. 66: 6 yang menyatakan, \r\n“Wahai orang-orang beriman hindarkanlah dirimu dan keluargamu dari api \r\nneraka.” \r\n4. Mereka yang telah terlanjur menjadi perokok wajib melakukan upaya dan \r\nberusaha sesuai dengan kemampuannya untuk berhenti dari kebiasaan \r\nmerokok dengan mengingat Q. 29: 69, “Dan orang-orang yang bersungguh-\r\nsungguh di jalan Kami, benar-benar akan Kami tunjukkan kepada mereka jalan-\r\njalan Kami, dan sesungguhnya Allah benar-benar beserta orang-orang yang \r\nberbuat baik,” dan Q. 2: 286, “Allah tidak akan membebani seseorang kecuali \r\nsesuai dengan kemampuannya; ia akan mendapat hasil apa yang ia usahakan \r\ndan memikul akibat perbuatan yang dia lakukan;” dan untuk itu pusat-pusat \r\nkesehatan di lingkungan Muhammadiyah harus mengupayakan adanya fasilitas \r\nuntuk memberikan terapi guna membantu orang yang berupaya berhenti \r\nmerokok. ', 'pandangan kontradiktif dalam menetapkan \'illah:\r\n1.sebagian besar ulama\' terdahulu berpandangan, bahwa merokok itu mubah atau makruh. Mereka pada masa itu lebih bertendensi pada bukti, bahwa merokok tidak membawa mudarat, atau membawa mudarat tetapi relatif kecil.\r\n2.berbeda dengan pandangan sebagian besar ulama\' terdahulu, pandangan sebagian ulama sekarang yang cenderung mengharamkan merokok karena lebih bertendensi pada informasi (bukan bukti) mengenai hasil penelitian medis yang sangat detail dalam menemukan sekecil apa pun kemudaratan yang kemudian terkesan menjadi lebih besar.\r\n3.hukum merokok itu bisa jadi bersifat relatif dan seimbang dengan apa yang diakibatkannya mengingat hukum itu berporos pada \'illah yang mendasarinya. Dengan demikian, pada satu sisi dapat dipahami bahwa merokok itu haram bagi orang tertentu yang dimungkinkan dapat terkena mudaratnya. Akan tetapi merokok itu mubah atau makruh bagi orang tertentu yang tidak terkena mudaratnya atau terkena mudaratnya tetapi kadarnya kecil.\r\n4.kalaulah merokok itu membawa mudarat relatif kecil dengan hukum makruh, kemudian di balik kemudaratan itu terdapat kemaslahatan yang lebih besar, maka hukum makruh itu dapat berubah menjadi mubah. Adapun bentuk kemaslahatan itu seperti membangkitkan semangat berpikir dan bekerja sebagaimana biasa dirasakan oleh para perokok.\r\n', 'Saya secara pribadi mengikuti pendapat makruh, karena segala sesuatu tergantung maksud nya, jika maksudnya agar semangat bekerja dan sebagainya dan dilakukan dalam kadar yang wajar maka madhorotnya relatif kecil, akan tetapi jika dilakukan ditemapt umum yang tertutup, dilakukan oleh anak dibawah umur dan wanita hamil yang akibatnya dapat memperbesar kemadhorotan maka hukumnya menjadi haram. ', 'https://doi.org/10.30983/alhurriyah.v3i1.534 keputusan MUI dan majlis fatwa Indonesia https://ejournal.uinbukittinggi.ac.id/alhurriyah/article/view/534\r\nhttps://repository.uin-suska.ac.id/9616/1/2012_2012224AH.pdf\r\nLampiran keputusan fatwa MUI dan majlis Muhammadiyah \r\nSumber NuOnline', '', '', '', '', '', '', '', '', '', '2026-06-04 02:37:02'),
(12, '23051157', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah do\'a yang dibaca saat berdiri tegak setelah rukuk pada raka\'at terakhir dalam shalat', 'Mazala rosulullah yagnutu fil fajri hatta faraqa ad- dunya', 'Dari sa\'ad bin thariq : fahal kanu yaqnutun fil fajri qolaa ya bunayya muhaddaatsa', 'Imam syafi\'i imam \r\nImam nawawiimam malikbin anas', 'Imam abu hanifah imam bin hambalimam sufyanats syauri', 'Menurut imam syafi\'i qunut shubuh adalah sunnahmuakad (sunnahyang sangat di anjurkan).berdasarkan hadits hadits dan praktik para sahabat yang menunjukkan keberlangsungannya', 'Menurut ulama yang tidak mensunnahkan qunut shubuh secara rutin qunut hanya di syariatkan ketika terjadi musibah besar ( qunut nazilah)', '', '', '2026-06-11 01:57:59'),
(13, '23051041', NULL, '', '', '', '', '', '', '', '', 'Do\'a yang dibaca ketika sholat subuh, dilakukan ketika setelah i\'tidal ', 'An-Nas bin malik radhiyallahu \'anhu, annannabiyya shallallahu \'alaihi wa sallam kana yaqnutu fi sholatin-shubhi hatta faraqad-dun-ya.\r\n\r\nArtinya: dari Anas bin malik Radhiyallahu \'anhu, bahwa sesungguhnya Nabi Shallallahu \'alaihi wwa sallah senantiasa membaca qunut pada shalat subuh sampai beliau wafat', 'An Abi Hurairah qala: Kana Rasulullahi Shallallahu \'alaihi wa sallama kana la yaqnutu-subhi illa an yad\'uwa li-qaumin aw\'ala qaumin.\r\n\r\nArtinya: Dari Abu Hurairah ia berkata: Sesungguhnya Rasulullah SAW tidak qunut dalam sholat Subuh kecuali kalau mendoakan akan kebaikan atau kehancuran suatu kaum. (HR. Ahmad, dan senada dengan hadits riwayat Al-Bukhari)', '- Imam Syafi\'i\r\n- Imam Malik bin Anas\r\n- Ibnu Abi Laila', '- Imam Abu Hanifah\r\n- Sufyan At-Tsauri\r\n- Ibnu Qayyim al-Jauziyyah', 'karena bersandar pada riwayat kuat dari shabat Nabi, Istinbath (pengambilan kesimpulan) hukum dari hadits, serta qiyas dengan qunut nazilah.\r\nHadits yang mendasari kesunnahan qunut shubuh dinilai shahih dan layak menjadi Landasan Ibadah (menurut  Imam Al-Hakim dan imam 6Baihaqi)', 'Menurut ulama yang tidak mengamalkannya, qunut yang pernah dilakukan oleh Nabi Saw murni bersifat Qunut Nazilah, Artinya, doa tersebut hanya dipanjatkan sementara waktu (selama sekitar satu bulan) ketika umat Islam sedang tertimpa musibah.', '', '', '2026-06-11 01:52:30'),
(14, '23051040', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah doa yang dibaca saat berdiri setelah membaca i\'tidal/sebelum sujud pada rakaat terakhir/rakaat ke 2 dalam sholat subuh. ', 'An Anas bin Malik qala : Ma zala Rasullahi yaqnutu fil fajri hatta faaraqaddun ya \r\n\r\nartinya : dari Anas bin Malik radhiyallahu anhu, ia berkata : Rasulullah saw, senantiasa membaca qunut pada sholat fajar (subuh) sampai beliau meninggal dunia (HR. Ahmad)', 'An Ansin annan nabiyya shallallahu alaihi wa sallama kana la yaqnutu illa idza da\'a liqaumin au ala qaumin \r\n\r\nartinya : dari Anas, sesungguhnya Nabi saw tidak pernah berqunut kecuali apabila beliau mendoakan kebaikan untuk suatu kaum atau mendoakan kehancuran bagi suatu kaum. (HR. Bukhari dan Muslim)', '- Imam Asy-Syafi\'i ( pendiri Madzab syafi\'i)\r\n- Imam Malik bin Annas ( pendiri madzab maliki)\r\n- Imam An-Nawawi (salah satu ulama besar dan rujukan utama (muhaqqiq ) dalam madzab syafi\'i )\r\n', '- Imam Abu Hanifah ( pendiri madzab Hanafi)\r\n- Imam Ahmad bin Hanbal ( pendiri madzab Hanbali )\r\n- Syaikh Muhammad bin shahih Al-Utsaimin ( salah satu ulama konteporer terkemukaka)', 'Madzab Syafi\'i dan Maliki menetapkan qunut subuh sebagai sunah berdasarkan dalil dari sahabat nabi, Annas bin Malik. beliau meriwayatkan bahwa Rasulullah Saw senantiasa membaca doa qunut pada sholat subuh setelah ruku (i\'tidal) dirakaat terakhir hingga beliau wafat. ', 'Ulama yang berpendapat bahwa qunut subuh tidak disunnahkan (seperti madzab Hanafi, Hambali, dan Muhammadiyah) beralasan bahwa hadits-hadits yang menyebutkan Nabi Muhammad Saw rutin melakukan qunut pada sholat subuh dinilai dha\'if (lemah). menurut mereka, qunut subuh hanya disyariatkan saat terjadi musibah besar (qunut nazilah) dan dilakukan disemua sholat fardhu. ', '', '', '2026-06-11 02:13:13'),
(15, '23051049', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah do’a yang dibaca dalam sholat ketika berdiri (qiyam), baik pada shalat subuh menurut sebagian ulama’ maupun saat terjadi musibah (qunut nazilah). Dalam perdebatan fikih, qunut subuh menjadi salah satu masalah khilafiyah (perbedaa pendapat) dikalangan ulama’.', '‘An anasibni maaliki qaala: maa zaa la Rasulullahi yaqnutu fil fajri hatta faaraqaaddunya.\r\n\r\nArtinya: “Rasullah SAW senantiasa berkunud pada shalat subuh hingga beliau wafat.”', 'Qana syahron Sallallahu alaihi wasallam anna annabiyya yad’u ala ri’lin wa dzakwan, tsumma tarakahu.\r\n', '1. Imam As-Syafi’i\r\n2. Imam An-Nawawi\r\n3. Imam Al-Baihaqi', '1. Imam Abu Hanifah\r\n2. Imam Ahmad bin Hanbal\r\n3. Ibnu Taimiyah', '1. Berdasarkan hadis Anas bin Malik yang menyebut Nabi SAW berqunut pada shalat subuh hingga wafat.\r\n2. Hadis tersebut dianggap dapat dijadikan hujah oleh ulama’ Syafi’iyah\r\n3. Diamalkan oleh banyak ulama dan generasi setelahnya dalam madzab syafi’i.\r\n4. Tidak ada dalil yang secara tegas menghapus (nasakh) praktik tersebut menurut mereka.', '1. Hadis “berqunut hingga wafat” diperselisihkan kualitasnya oleh ahli hadis.\r\n2. Qunut nabi SAW dipahami sebagai qunut nazilah (karena musibah) bukan amalan rutin setiap subuh.\r\n3. Ada riwayat dari para sahabat yang menunjukkan mereka tidak membiasakan qunut subuh.\r\n4. Tidak ditemukan hadis shahih yang secara tegas menunjukkan Nabi SAW selalu berqunut subuh setiap hari.', '', '', '2026-06-11 02:12:59'),
(16, '23051081', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah doa yang di baca saat sholat pada posisi berdiri (i\'tidal) setelah rukuk. Dalam praktik yang umum di indonesia, dan sering di pakai dalam solat subuh ', 'An anasin radiyallahu \'anhu anna an nabiyya shallallahu alaihi wa sallama ma zaala yaqnutu fil fajri hattta faraqad dunya', 'An abi malikin  al asyjaiyyi qala qultu liabi ya abati innaka qad shallaita khalf rasulillahi wa abi bakrin wa umar wa usman wa aliyyin akanu yaknutuna fil fajri qala la ya bunayya muhdatsun', '1. imam syafi\'i\r\n2. imam an nawawi\r\n3. imam al baihaqi', '1. imam abu hanifah\r\n2. imam malik \r\n3. imam ahmad bin hanbal', 'ulama yang mensunnahkan qunut subuh beralasan bahwa Nabi SAW pernah dan terus membaca qunut pada shalat subuh hingga wafat, sehingga qunut subuh di anggap sebagai amalan sunnah.', 'ulama yang mengatakan qunut subuh tidak sunnah beralasan karena  tidak ada  hadis shahih yang menunnjukkan Nabi SAW  selalu melakukan qunut subuh dan para sahabat juga tidak melakukannya secara rutin ', '', '', '2026-06-11 02:19:34'),
(17, '23051078', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah doa khusus yang di baca di dalam sholat sebagai bentuk permohonan ,ketaatan dan kepasrahan kepada Allah SWT.', ' عن انس بن مالك قال : ما زال رسول الله صلى الله عليه وسلم يقنت في الفجر حتى فارق الدنيا', 'عن ابي مالك الشجعي قال : قلت لء لاءبي:ابت انك قد صليت خلف رسول الله صلى الله عليه و سلم وابي بكروعمروعتمان وعلي هاهنا بلكوفة نحوا من خمس سنين،فكانوا يقنتون في الفجر؟فقال:اي بنيمحدث', 'Imam Malik bin abbas\r\nImam syafi\'i\r\nImam sufyan ats stauri', 'Imam abu hanifah\r\nImam bin hambal\r\nImam abdullah bin almubarok', 'Hadits sohih merujuk pada hadits riwayat imam \r\nAhmad bahwa rasulallah membaca qunut terus menerus sampai wafat', 'Alasan ulama utama menilai qunut subuh bukan sunah adalah  karena mereka memandang riwayat hadits nabi muhammad SAW yang membaca qunut seumur hidup berstatus lemah,serta di perkuat oleh kesaksian sahabat lain yang menyatakaan bahwa rasullulah hanya melakukan qunut saat ada musibah besar saja dan bukan sebagai amalan rutin harian ', '', '', '2026-06-11 02:10:17'),
(18, '23051044', NULL, '', '', '', '', '', '', '', '', 'Qunut itu doa yang dibaca saat itidal (berdiri setelah ruku) di rakaat ke 2 sholat subuh ', ' عَنْ أَنَسِ بْنِ مَالِكِ قَالَ مَازَالَ رَسُوْلُ اْلله يَقْنُتُ فِي الْفَجْرِ حَتَى فَارَقَ الْدُنْيَا\r\n   Hadis tiwayat anas bin malik RA', 'قُلْتُ لِاَبِي يَاأَ بَتِ إِنَّكَ قَدْ صَلَّيْتَ خَلْفَ رَسُولِلّه صَلّى الْله عَلَيْهِ وَسَلم وَأَبِي بَكْرٍ وَعُمَرَ وَعُسْمَانَ وَعَلِيٍّ هاهُنَ بِلْكُفَةٍ نَحْوًا مِن خَمْسِ سِنِنَ فَكَانُوْ يَقْنُتُنَ فِى الفَجْرِ فَقال اَيْ بُنَيَّ مُحْ دَثٌ\r\nHadis riwayat tirmidzi no 368 dan ibnu majjah 1231  ', 'Abu bakar as siddiq , umar bin khattab , utsman bin affan, imam syafi \'i ', 'Ibnu abbas ,ibnu umar, ibnu mas\'ud  imam ahmad bin hanbal ', 'Qunut subuh itu sunnah karena sudah ada hadis yang menjelaskannya bahwa nabi muhammad saw melakukan qunut saat subuh', 'Karena ulama melihat nabi muhammad tidak melakukan qunut secara terus menerus,hanya dilakukan hari  tertentu', '', '', '2026-06-11 02:12:54'),
(19, '23051086', NULL, '', '', '', '', '', '', '', '', 'do\'a yang disunnahkan dibaca pada rakaat kedua sholat subuh, tepatnya ketika iktidal (setelah rukuk) sebelum sujud.', 'Lam yazal Rasulullahi shallallahu \'alaihi wa sallama yaqnutu fil-fajri hatta faraqad-dunya', 'Anna an-nabiyya shallallahu \'alaihi wa sallama qanata syahran yad\'u \'ala aqwamin tsumma tarakahu', 'Imam syafi\'i, imam malik, imam an-nawawi\r\n', 'Imam abu hanifah,\r\nIbnu-tamiyah,\r\nImam-ahmad', 'Berdasarkan hadis anas bin malik yang menyebut nabi muhammad terus berkunut sampai wafat.\r\n', 'Hadis yang lebih kuat menunjukkan nabi berqunut hanya selama satu bulan lalu meninggalkannya.', '', '', '2026-06-11 02:17:05'),
(20, '23051043', NULL, '', '', '', '', '', '', '', '', 'Secara bahasa qunut : Taat tunduk dan diam atau berdiri lama dalam shalat sedangkan secara syariat qunut adalah doa khusus di baca di dalam shalat iktidal berdiri secara rukuk ( rakaat tertentu ) \r\nQunut di bagi menjadi tiga : \r\n1 . Qunut subuh dibaca pada iktidal rakaat ke dua shalat subuh \r\n2. Qunut nazilah : menghadapi bencana , musibah atau ancaman besar \r\n3.  Qunut witir : rakaat akhir shalat witir ', 'maa zaala rasulullahi shallallahu wasallama yaqnutu fish subhi hattta faaraqod dunyaa\r\n ', 'Qultu li abil : yaa abati shallaita khalfa rasulullahi shallallahu alaihi wasallama wa abii bakrin wa umar wa ustmaana wa aliyyin haahuna bil kuffati nahwan min khamsi sinina a - kaanu yaqnutuuna fish subh ? Qala : a bunayya muhdasun ', 'Imam syafi \'i , imam bin anas , imam al anbiya , ', 'Imam abu hanifah , imam bin hanbal , imam syufyan ats tsauri ', 'Landasan hadist shahih\r\nAmalan khulafaur rasyidin ', 'Anggapan telah di hapus ( manshuk )\r\nHadis perkara baru (  muhdas ) ', '', '', '2026-06-11 02:11:25'),
(21, '23051048', NULL, '', '', '', '', '', '', '', '', 'Doa yang dibaca pada sholat subuh dengan posisi berdiri setelah rukuk ( setelah i’tidal )', 'An Anas bin Malik qala: Ma zala Rasulullahi Sallallahu alaihi wa sallama yaqnutu fil-fajri hatta faraqa ad-dunya', 'Qanata syahran Sallallahu alaihi wasallam Anna an-Nabiyya yad’u ala Ri’lin wa Dzakwan, Tsumma Tarakahu ', '1. Imam syafi’i \r\n2. Imam an nawawi \r\n3. Imam al baihaqi', '1. Imam abu hanifah\r\n2. Imam ahmad bin hanbal\r\n3. Syaikhul Islam Ibnu Taimiyah', '1. Imam syafi’i : Karena ada hadis yang mengatakan rasulullah qunut secara terus menerus sampai beliau wafat\r\n2. Imam an nawawi : sunnah menurut madzhab syafi’i dan menyatakan banyak ulama salaf tang melakukannya\r\n3. Imam Al-Baihaqi : banyak mengumpulkan dan meneliti hadis-hadis yang menjadi dasar hukum fiqih, termasuk riwayat tentang qunut subuh ', 'Karena masing masing pendapat memiliki dasar ilmiyah yang kuat menurut pengikutnya, mayoritas ulama menganggap masalah qunut subuh sebagai masalah ijtihadiyah ( khilaf yang dibenarkan ). Orang yang berqunut maupun tidak berqunut tetap mengikuti pendapat ulama yang memiliki landasan dalam syariat ', '', '', '2026-06-11 02:12:59'),
(22, '23051066', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah doa khusus yang dibaca di dalam sholat pada posisi berdiri (iktidal) sebelum sujud. Secara bahasa Qunut berarti ketaatan atau berdiri lama. Tujuannya adalah memohon ampunan, petunjuk, keselamatan, dan perlindungan dari segala mara bahaya kepada Allah SWT.', '\"Ma Zala Rasulullah SAW yaqnutu fil-fajri hatta faraqad-dunya.\"\r\nArtinya: Rasulullah SAW senantiasa membaca qunut ketika sholat shubuh sehingga beliau wafat. HR.Ahmad dan Ad-Daruquthni', 'An Abi-Hurairah qala: Kana Rasulullahi sallallahu alaihi wa sallam la yaqnutu fi salatis-subhi illa an yad\'uva liqaumin aw ala qaumin.\r\n\r\nartinya: Dari Abu Hurairah radhiyallahu anhu, ia berkata: Rasulullah saw. tidak pernah melakukan qunut dalam sholat shubuh, kecuali jika beliau mendoakan kebaikan untuk suatu kaum, atau mendoakan kebaikan untuk suatu kaum, atau mendoakan keburukan (kecelakaan) atas suatu kaum.', '1. Imam Asy-Syafi\'i\r\n2. Imam Malik bin Anas\r\n3. Anas bin Malik', '1. Imam Abu Hanifah\r\n2. Imam Ahmad bin Hanbal\r\n3. Sufyan ats-Tsauri', 'ulama yang mensunnahkan qunut shubuh (Terutama Mazhab Syafi\'i) beralasan bahwa Rasulullah SAW. terus-menerus membaca qunut pada sholat shubuh hingga beliau wafat. mereka juga menjadikan praktik qunut nazilah (doa saat musibah) dan keteladanan khulafaur rasyidin sebagai dalil utamanya.', 'sebagian ulama mengatakan qunut shubuh tidak sunnah karena menurut mereka nabi muhammad saw tidak membacanya secara terus-menerus, melainkan hanya pada keadaan tertentu (qunut nazilah).', '', '', '2026-06-11 02:13:17'),
(23, '23051050', NULL, '', '', '', '', '', '', '', '', 'bacaan pada rakaat ke dua saat sholat subuh\r\n', 'an anasi bin malikin radiyallahu anhu ana annabiya ma zala yaqnutu fi hatta faraqa adunya', 'an naasi bin malikin qala qanata \r\nrasulullah syahran yad\'u ala ahyain minal arab tsuma tarakahu', 'imam syafi\'i\r\nimam an-nawwi\r\nibnu hajjar al haitami', 'abu hanifah ,ahmad bin hanbal ,ibnu taimiyah ', 'ada hadis yang menyebut nabi qunut sampai wafat, tidak ada dalil yang tegas menghapus kebiasaan qunut subuh', 'nabi muhammad pernah berqunut lalu meininggalkanya, khalifah setelah nabi tidak menbiasakanya ', '', '', '2026-06-11 02:08:14'),
(24, '23051150', NULL, '', '', '', '', '', '', '', '', 'Doa yang dibaca dalam sholat pada posisi i\'tidal (berdiri) sebelum sujud ', 'Hadist dari Anas bin Malik:\r\n\"عن أنس بن مالك قال: مازال رسول الله صلى الله عليه وسلم يقنت في الفجر حتى فرق الدنيا\"\r\n\"Ma zala Rasulallahi Sallallahu \'alaihi wa sallama yaqnutu fil-fajri hatta faraqa ad-dunya\".\r\n\r\nHadist ini diriwayatkan oleh Ahmad ibnu Husayn  al bayhaqi dan Abu Bakr al-daraqutni.\r\n', 'Dari Anas bin Malik: \r\n\"كان رسول الله صلى الله عليه وسلم قنت شهرا يدع على رعل وذكوان، ثم تركه\"\r\n\"Kana Rasulallahi sallallahu \'alaihi wa sallama qanata syahran yad\'u \'ala ri\'lin wa dzakwana, tsumma tarakahu\". (Qunut Nazilah: qunut karna musibah besar yang menimpa kaum muslimin).\r\n\r\n\" \'An Abi malik Al-syuja\'i qala: qultu li-abi: ya abati, innaka qad shallaita Khalfa Rasulullahi shallallahu \'alaihi wa sallam wa abi bakrin wa \'umara wa \'utsmana wa \'ali hahuna bil-kufati nahwan min khamsi sinin, akanu yaqnutuna fil-fajri. Qala: la ya bunayya muhdatsun. \"', '1. Malik ibn Anas\r\n2. Yahya ibn Sharaf al-Nawawi\r\n3. Ibnu Hajar al-Haytami \r\n4. Ahmad Zaini Dahlan\r\n5. Muhammad ibn idris as-syafi\'i\r\n6. Shams al-Din al-Ramli', '1. Abu hanifah\r\n2. Ahmad ibn Hambal\r\n3. Ibn Taymiyyah\r\n4. Ibnu Al-Qayyim\r\n5. Muhammad Nashiruddin al-Albani', 'Ulama\' yang mensunnahkan qunut shubuh karna: \r\n1. Ada sebuah hadist yang menunjukkan nabi terus melakukan qunut hingga beliau wafat\r\n2. Ada riwayat amalah sebagian sahabat \r\n3. Hadist tentang \"meninggalkan qunut\" dipahami sebagai qunut nazilah, bukan qunut shubuh rutin\r\n4. Pendapat ini dipegang oleh banyak ulama\' besar, khususnya dalam madzhab Syafi\'i dan sebagian madzhab Maliki', '1. Nabi memang pernah berqunut, tetapi karna musibah (qunut nazilah) \r\n2. Tidak ada hadits shahih yang menunjukkan beliau membiasakan qunut shubuh setiap hari hingga wafat \r\n4 karna itu, qunut shubuh rutin bukan sunnah muakkadah, tetapi qunut nazilah tetap disyariatkan ketika ada kebutuhan. ', '', '', '2026-06-11 02:10:34'),
(25, '23051053', NULL, 'Imam Syafi\'i\nImam Syihabuddin Al-Qalyubi\nLembaga Tarjih Muhammadiyah', 'Syekh Mansyur\r\nMadzhab Hanafi\r\nMadzhab Maliki', 'Surah Al-Baqarah Ayat 195', 'Hadis Riwayat Bukhari & Muslim: \"Barangsiapa yang memakan tanaman ini (bawang), janganlah ia mendekati masjid kami dan jangan menyakiti kami dengan bau bawangnya.\"', 'Karena memiliki Mudharat yang besar baik terhadap diri sendiri atau orang lain', 'Karena Dampak Kemudharatan gang tidak Instan ', 'Rokok hukumnya Haram', 'Deretan Ulama Klasik yang tak Haramkan Rokok Tembakau\nBy Republika.id\n\nUlama yang Mengharamkan Rokok\nBy Republika.id', '', '', '', '', '', '', '', '', '', '2026-06-04 01:58:46'),
(26, '23051021', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2026-06-04 02:09:07'),
(27, '23051076', NULL, '', '', '', '', '', '', '', '', 'Doa yang dibaca dalam sholat pada posisi berdiri setelah rukuk dan biasanya dilakukan pada sholat subuh', 'An Anas bin Malik qala: Ma zala Rasulullahi Sallallahu alaihi wa sallama yaqnutu fil-fajri hatta faraqa ad-dunya', 'An Anas, annan-nabiyya shallallahu \'alaihi wa sallama qanata syahran yad\'u \'alaihim tsumma tarakahu, wa amma fish-shubhi falam yazal yaqnutu hatta faraqa dunya', '1. Imam syafi\'i\r\n2. Imam an nawawi\r\n3. Imam al baihaqi', '1. Imam abu hanifah\r\n2. Imam ahmad bin hanbal\r\n3. Syaikul islam ibnu Taimiyah', '1. Imam syafi\'i : karena ada hadis yang mengatakan rasulullah qunut secara terus menerus sampai beliau wafat\r\n2. Imam an nawawi : sunnah menurut madzhab syafi\'i dan menyatakan banyak ulama salaf tang melakukannya\r\n3. Imam Al-Baihaqi : banyak mengumpulkan dan meneliti hadis-hadis yang me.jadi dasar hukum fiqih, termasuk riwayat tentang qunut subuh', 'Hadis anas bin malik \"Rasulullah SAW pernah berqunut selama satu bulan mendoakan keburukan tas beberapa kabilah arab, kemudian beliau meninggalkannya.\"', '', '', '2026-06-11 02:23:57'),
(28, '23051069', NULL, '1. Yusuf al Qaradawi\r\n2. Abdul Aziz bin Baz\r\n3. Muhammad bin shalih al Utsaimin', '1. Muhammad Nawawi al Bantani\r\n2. Ahmad Khatib al Minangkabawi\r\n3. Wahba az Zuhaili', 'من تخسى سما فقتل نفسه فسمه في يده يتحساه في نار جهنم \r\n', 'فان الملا عكته تتا دي مما يتأدي منه بنو ادم', 'karena membahayakan kesehatan diri sendiri dan orang lain dan pemborosan harta hanya untuk dibakar ', 'Tidak ada dalil nash yang mengatakan itu haram, rokok hanya dianggap bau tidak sedap dan mengganggu', 'Haram, karena itu membahayakan kesehatan diri sendiri dan asap rokoknya membahayakan kesehatan orang lain, selain itu juga termasuk pemborosan uang untuk membeli barang yang punya mudhorot bagi kesehatan', 'Majmu\' Fatawa Wa Maqalat Mutanawwi\'ah dan Bughyah Al Mustarsyidin', '', '', '', '', '', '', '', '', '', '2026-06-04 03:48:24'),
(29, '23051158', NULL, 'Majelis Ulama Indonesia (MUI)\r\nMuhammadiyah\r\nSyaikh Abdul Aziz bin Baz', 'Nahdlatul Ulama (NU)\r\nImam Asy-Syaukani\r\nSyaikh Wahbah Az-Zuhaili', 'وَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ\r\n\"Dan Dia mengharamkan bagi mereka segala yang buruk.\"\r\nQS. Al-A\'raf: 157', 'وَكُلُوا وَاشْرَبُوا وَلَا تُسْرِفُوا\r\n\"Makan dan minumlah, tetapi jangan berlebih-lebihan.\"\r\nQS. Al-A\'raf: 31', 'Rokok terbukti membahayakan kesehatan dan dapat menyebabkan berbagai penyakit.\r\nBertentangan dengan kaidah Islam yang melarang membahayakan diri sendiri dan orang lain (lā ḍarar wa lā ḍirār).\r\nTermasuk perbuatan yang menghamburkan harta untuk sesuatu yang tidak bermanfaat.\r\nAsap rokok juga dapat membahayakan orang di sekitar (perokok pasif).', 'Tidak terdapat nash Al-Qur\'an atau hadis yang secara tegas menyebut rokok sebagai barang haram.\r\nBahaya rokok dianggap tidak selalu langsung dirasakan oleh setiap orang.\r\nRokok dipandang sebagai perbuatan yang kurang baik dan sebaiknya ditinggalkan, tetapi belum memenuhi syarat untuk dihukumi haram secara mutlak.\r\nLebih dekat kepada perbuatan yang sia-sia dan tidak bermanfaat sehingga hukumnya makruh.', 'Setelah menelaah pendapat ulama yang mengharamkan dan memakruhkan rokok, saya lebih cenderung mengikuti pendapat yang mengharamkan rokok. Alasannya, penelitian medis telah membuktikan bahwa rokok dapat merusak kesehatan serta membahayakan orang lain melalui asapnya. Selain itu, islam melarang segala sesuatu yang menimbulkan mudhorot dan pemborosan. Oleh karena itu, pendapat yang mengharamkan rokok menurut saya lebih kuat dan lebih sesuai dengan tujuan syariat untuk menjaga jiwa dan kesehatan.', '1. Fatwa majelis ulama indonesia tentang hukum merokok\r\n2. Keputusan tarjih Muhammadiyah tentang hukum merokok\r\n3. Fikih kotemporer karya wahbah az zuhaili\r\n4. Jurnal kesehatan tentang dampak rokok terhadap kesehatan manusia', '', '', '', '', '', '', '', '', '', '2026-06-04 04:03:59'),
(30, '23051133', NULL, '1. Majelis Tarjih dan Tajdid Muhammadiyah – menetapkan bahwa merokok hukumnya haram. \r\n2. Majelis Ulama Indonesia – mengharamkan rokok bagi anak-anak, ibu hamil, dan di tempat umum. \r\n3. Abdul Aziz bin Abdullah bin Baz – berpendapat bahwa merokok haram karena membahayakan tubuh dan menghamburkan harta.', '1. Nahdlatul Ulama – banyak keputusan Bahtsul Masail menetapkan hukum asal rokok makruh.\r\n2. Wahbah az-Zuhaili – menganggap rokok makruh apabila mudaratnya belum mencapai tingkat yang pasti.\r\n3. Ali Jum\'ah – dalam beberapa fatwanya menyatakan hukum asal rokok makruh, namun dapat menjadi haram jika terbukti membahayakan.', 'ولا تقتلو ا انفسكم. انّ اللّهّ كا ن بكمْ رحيما\r\n\"Dan janganlah kamu membunuh dirimu. Sungguh, Allah Maha Penyayang kepadamu. \" Qs an-nisa ayat 29', '1. QS. Al-A\'raf [7]:157\r\ntentang larangan sesuatu yang termasuk khabaits (buruk), namun menurut sebagian ulama status rokok belum secara pasti masuk kategori tersebut.\r\n2. Kaidah fikih:\r\nAl-ashlu fil asy-ya\' al-ibahah\r\n(Hukum asal segala sesuatu adalah boleh sampai ada dalil yang mengharamkan).\r\n3. Hadis:\r\n\"Sesungguhnya Allah membenci bagi kalian perbuatan yang sia-sia dan pemborosan.\"\r\nMereka menjadikan unsur pemborosan sebagai dasar kemakruhan, bukan keharaman.', '1. Rokok terbukti merusak kesehatan dan dapat menyebabkan penyakit berat.\r\n2. Asap rokok membahayakan orang lain (perokok pasif).\r\n3. Bertentangan dengan tujuan syariat dalam menjaga jiwa (hifz an-nafs).\r\n4. Menghamburkan harta untuk sesuatu yang merugikan.\r\n5. Mengandung zat adiktif yang menyebabkan ketergantungan.', '1. Tidak ada ayat Al-Qur\'an atau hadis yang secara eksplisit menyebut rokok haram.\r\n2. Rokok tidak memabukkan seperti khamar.\r\n3. Sebagian mudaratnya dianggap tidak langsung dan berbeda pada setiap orang.\r\n4. Kaidah hukum asal benda adalah mubah sampai ada dalil yang tegas mengharamkan.\r\n5. Karena lebih dekat kepada perbuatan yang tidak disukai syariat daripada perbuatan yang secara pasti haram.', 'Setelah membandingkan kedua pendapat, saya melihat bahwa:\r\n1. Pendapat yang mengharamkan didukung oleh data medis modern yang menunjukkan bahaya rokok bagi perokok aktif maupun pasif.\r\n2. Kaidah lā dharar wa lā dhirār sangat kuat karena bahaya rokok tidak hanya mengenai diri sendiri tetapi juga orang lain.\r\n3. Fatwa Muhammadiyah dan sebagian keputusan MUI menggunakan pendekatan maqāṣid asy-syarī\'ah (menjaga jiwa dan harta).\r\nKesimpulan analisis:\r\nJika harus memilih salah satu pendapat, saya lebih cenderung mengikuti pendapat yang mengharamkan rokok, karena tingkat mudaratnya saat ini telah dibuktikan secara ilmiah dan luas, sehingga alasan menjaga kesehatan dan mencegah bahaya menjadi lebih kuat daripada alasan kemakruhan.', 'Fikih Islam wa Adillatuhu\r\nHimpunan Putusan Tarjih     Muhammadiyah\r\nFatwa Hukum Merokok Nomor 6/SM/MTT/III/2010 \r\nFatwa Haram Merokok Majlis Tarjih Muhammadiyah \r\nE-JOURNAL\r\nMemahami Fatwa Majelis Tarjih Muhammadiyah No 6/SM/MTT/III/2010 Tentang Hukum Rokok \r\nJurnal IAIN Ponorogo\r\nAnalisis Terhadap Fatwa Majelis Tarjih dan Tajdid PP Muhammadiyah tentang Hukum Merokok dalam Perspektif Hukum Islam ', '', '', '', '', '', '', '', '', '', '2026-06-04 04:04:04'),
(31, '23051122', NULL, '\r\n1 Majelis Ulama Indonesia (MUI)\r\n2 Muhammadiyah\r\n3 Lajnah Daimah', '\r\n1 Nahdlatul Ulama (NU)\r\n2 Imam Nawawi\r\n3 Ibnu Abidin', '1 QS. Al-Baqarah: 195 → “Janganlah kamu menjatuhkan dirimu ke dalam kebinasaan.”\r\n2 QS. Al-A’raf: 157 → “Mengharamkan yang buruk (khaba’its).”\r\n3 Hadis: “Tidak boleh membahayakan diri sendiri dan orang lain.” (HR. Ibnu Majah)', 'يَا بَنِي آدَمَ خُذُوا زِينَتَكُمْ عِندَ كُلِّ مَسْجِدٍ وَكُلُوا وَاشْرَبُوا وَلَا تُسْرِفُوا ۚ إِنَّهُ لَا يُحِبُّ الْمُسْرِفِينَ\r\nArtinya: “Makan dan minumlah, tetapi jangan berlebihan. Sungguh, Allah tidak menyukai orang yang berlebih-lebihan.”', '1 Membahayakan kesehatan (racun, penyakit)\r\n2 Termasuk menjatuhkan diri ke kebinasaan\r\n3 Membahayakan orang lain (perokok pasif)\r\n4 Termasuk sesuatu yang buruk (khaba’its)', 'Tidak ada dalil tegas yang mengharamkan secara langsung\r\nHanya dianggap perbuatan kurang baik\r\nTermasuk pemborosan dan berlebihan', 'Menurut saya, pendapat yang mengharamkan lebih kuat, karena rokok terbukti membahayakan diri dan orang lain, sesuai dengan larangan dalam Al-Qur’an untuk tidak mencelakakan diri.', ' •Fatwa Majelis Ulama Indonesia tentang Rokok\r\n•Himpunan Putusan Tarjih Muhammadiyah\r\n•Fikih Kontemporer tentang Rokok', '', '', '', '', '', '', '', '', '', '2026-06-04 03:35:16'),
(32, '23051105', NULL, 'syekh muhammad fiqh al aini dan syekh abdullah', 'Imam  al-Bajuri,  Syekh  Abd  al-Hamid,  Imam  asy-Syarqawi, Imam al-Kurdi, Al-Jamal ar-Ramli, Muhammad Sa’id Babashil, dan Syekh Muhammad ibn Musa an-Nasawi\r\n', 'Ulama yang mengharamkan rokok umumnya menggunakan hadis berikut:\r\n\r\n> لَا ضَرَرَ وَلَا ضِرَارَ\r\n\"Tidak boleh membahayakan diri sendiri dan tidak boleh membahayakan orang lain.\"\r\n(HR. Ibnu Majah)\r\n\r\n\r\n\r\nSelain itu, mereka juga berdalil dengan Al-Qur\'an:\r\n\r\n> وَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\r\n\r\n\"Janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"\r\n(QS. Al-Baqarah: 195)\r\n\r\n\r\n\r\nKarena rokok terbukti membahayakan kesehatan, sebagian ulama menghukuminya haram berdasarkan dalil-dalil tersebut.', 'Untuk pendapat makruh, hadis yang sering digunakan adalah:\r\n\r\n> لَا ضَرَرَ وَلَا ضِرَارَ\r\n\r\n\r\n\r\n\"Tidak boleh membahayakan diri sendiri dan tidak boleh membahayakan orang lain.\"\r\n(HR. Ibnu Majah)\r\n\r\n\r\n\r\nUlama yang memakruhkan rokok berpendapat bahwa rokok mengandung mudarat dan bau yang tidak sedap, tetapi tidak sampai pada tingkat yang pasti untuk dihukumi haram. Oleh karena itu, hukumnya makruh (lebih baik ditinggalkan).', 'Alasan ulama yang mengharamkan rokok:\r\n\r\n1. Membahayakan kesehatan sehingga termasuk perbuatan yang dilarang dalam Islam.\r\n\r\n\r\n2. Membahayakan orang lain melalui asap rokok.\r\n\r\n\r\n3. Memboroskan harta untuk sesuatu yang tidak bermanfaat.\r\n\r\n\r\n4. Bertentangan dengan tujuan syariat yang menjaga jiwa (hifzh an-nafs).\r\n\r\n\r\n\r\nKarena mudarat rokok dinilai nyata dan terbukti, sebagian ulama berpendapat bahwa larangan merokok mencapai derajat haram.', 'Alasan ulama yang memakruhkan rokok (tidak sampai haram):\r\n\r\n1. Tidak ada ayat Al-Qur\'an atau hadis yang secara tegas mengharamkan rokok.\r\n\r\n\r\n2. Bahaya rokok dianggap tidak selalu langsung dan tidak sama pada setiap orang.\r\n\r\n\r\n3. Rokok lebih dipandang sebagai kebiasaan yang kurang baik daripada perbuatan yang jelas haram.\r\n\r\n\r\n4. Menimbulkan bau yang tidak sedap dan mengganggu orang lain, sehingga lebih tepat dihukumi makruh.\r\n\r\n\r\nMenurut pendapat ini, mudarat rokok belum cukup kuat untuk menetapkannya sebagai haram, sehingga hukumnya makruh (sebaiknya ditinggalkan).', 'mengikuti yg mengharamkan jika ada org yg merokok di sembarang tempat atau di depan orang yg hamil / punya sakit pernafasan ', 'kontrovesi hukum rokok dalam kitab irsyad al-ikhwan  karya syekh ihsan muhammad dahlan', '', '', '', '', '', '', '', '', '', '2026-06-04 04:02:48'),
(33, '23051080', NULL, '1. ulama madzhab al-hanafiyah\r\n2. ulama madzhab al-malikiyah\r\n3. ulama madzhab asy- syafi\'iyah', '1. ulama madzhab al hanafiyah\r\n2. ulama madzhab al malikiyah\r\n3. ulama madzhab asy syafi\'iyah', 'qs. albaqoroh 195\r\n وَاَنْفِقُوْا فِيْ سَبِيْلِ اللّٰهِ وَلَا تُلْقُوْا بِاَيْدِيْكُمْ اِلَى التَّهْلُكَةِ ۛ وَاَحْسِنُوْا ۛ اِنَّ اللّٰهَ يُحِبُّ الْمُحْسِنِيْنَ\r\n\"Dan infakkanlah (hartamu) di jalan Allah, dan janganlah kamu jatuhkan (diri kamu) ke dalam kebinasaan dengan tanganmu sendiri, dan berbuat baiklah. Sungguh, Allah menyukai orang-orang yang berbuat baik.\"', 'Hadis Riwayat Bukhari & Muslim (Kiasan dari Bau Bawang):\r\nمَنْ أَكَلَ ثُومًا أَوْ بَصَلًا فَلْيَعْتَزِلْنَا أَوْ لِيَعْتَزِلْ مَسْجِدَنَا وَلْيَقْعُدْ فِي بَيْتِهِ\r\n\"Barangsiapa yang memakan bawang putih atau bawang merah, maka hendaklah ia menjauhi kami, atau menjauhi masjid kami, dan hendaklah ia duduk di rumahnya.\"\r\n(Ulama mengiaskan bau asap rokok yang menyengat dengan bau bawang yang mengganggu).\"', '1. masalah kesehatan\r\n2. tidak ada manfaat baik \r\n3. membunuh diri secara perlahan', '1. di Al-Qur\'an tidak ada larangan untuk itu\r\n', 'saya mengikuti yang memakruhkan', '\"halal haram rokok\"', '', '', '', '', '', '', '', '', '', '2026-06-04 03:49:14'),
(34, '23051102', NULL, '1. Majelis Tarjih dan Tajdid Muhammadiyah \r\n2. ​Lembaga Fatwa Arab Saudi \r\n​3. Syeikh Muhammad bin Shalih al-Utsaimin (Ulama kontemporer Arab Saudi).', '1. Lembaga Bahtsul Masail Nahdlatul Ulama (LBM NU) (Keputusan Muktamar NU).\r\n2. ​Syeikh Abdurrahman al-Ahdal (Ulama mazhab Syafii).\r\n​3. Syeikh Yasin bin Isa al-Fadani (Ulama besar asal Minangkabau di Makkah).', ' ١.لا ضرروالاضرار\r\n\"Tidak boleh memberikan dampak bahaya (bagi diri sendiri) dan tidak boleh memberikan dampak bahaya untuk orang lain (hadis nabi saw. HR ibnu majah) \r\n٢. ولاثلقوا بايديكم الى التهلكة\r\n\" Dan jangan lah kamu menjatuhkan dirimu ke dalam kebinasaan \" (Al qur\'an, QS. Al Baqarah 195) ', 'Hadis Nabi Muhammad Saw \r\nTidak boleh menimbulkan bahaya bagi diri sendiri dan  orang lain HR. Ibnu majah', '1. Terbukti secara medis merusak kesehatan dan dapat menyebabkan berbagai penyakit serius\r\n2. Termasuk perbuatan membahayakan diri sendiri dan orang lain perokok pasif\r\n3. Memboroskan harta untuk sesuatu yang tidak bermanfaat', '1. Tidak ada nash alquran atau hadis yang secara tegas menyebut rokok\r\n2. Sebagian ulama klasik hidup sebelum penelitian medis modern sehingga belum melihat bahaya rokok sebagai sesuatu yang pasti\r\n3. Kaidah asal segala sesuatu adalah mubah sampai ada dalil yang jelas mengharamkannya', 'Karena tidak ada ayat atau hadis yang secara tegas menyebut rokok haram, dan sebagian ulama berpendapat bahaya rokok tidak selalu langsung serta berbeda pada setiap orang, maka saya cenderung mengikuti pendapat yang menyatakan makruh. Namun menghindari rokok tetap lebih baik', 'Buku\r\n1. Fiqh Al islami wa adillatuhu\r\n2. Al halal wa Al haram fi Al \r\n3. Majmu\' fatawa\r\n', '', '', '', '', '', '', '', '', '', '2026-06-10 09:56:29'),
(35, '23051129', NULL, 'Ulama madzab syafii seperti al qalyubi, syekh Abdul Aziz bin Abdullah bin baz \r\nLembaga mui, ormas muhamadiyah ', 'Madzab Hanafi ibnu abidin, abu as suud dan al laknawi. Madzab Syafii asy syarwani\r\n\r\nLembaga ormas nahdlatul ulama, dll', 'لاَ ضَررَ ولا ضِرارَ', 'الاَصل في الاَشْياء الاباحه حتى يدل الد ليل على التحريم', 'Terbukti secara media merusak organ tubuh hingga penyebab kematian ', 'Tembakau adalah tumbuhan dadi bumi dan tidal ada nas atau dalil yang mengharamkan tersebut.', 'Posisi ku tetap berada pada jalan yang tidak merepotkan diriku sendiri, karena dengan merokok aku bisa meninggalkan keharaman yang lebih besar lagi dan ini caraku mengelola nafsu untuk melakukan kemungkaran. Bismillah ', 'Kitab tuhfatul muhtaj  dan hasyiyahal bujairimi alal khatib ', '', '', '', '', '', '', '', '', '', '2026-06-04 03:42:45'),
(36, '23051138', NULL, '1.MUI (Majelis Ulama Indonesia)\r\n2.Muhammadiyah (Majelis Tarjih dan Tajdid)\r\n3.Syekh Yusuf al-Qaradawi', '1.Syekh Wahbah az-Zuhaili\r\n2.Syekh Ali Jum\'ah\r\n3.Nahdlatul Ulama (NU) melalui Bahtsul Masail', '\"Tidak boleh membahayakan diri sendiri dan tidak boleh membahayakan orang lain.\"\r\n(HR. Ibnu Majah, Malik, Ahmad)\r\nHadis ini menjadi dalil utama karena asap rokok dinilai membahayakan perokok maupun orang di sekitarnya.', 'Dari Abu Hurairah, Rasulullah ﷺ bersabda:\r\n\"Di antara tanda baiknya Islam seseorang adalah meninggalkan sesuatu yang tidak bermanfaat baginya.\"\r\n(HR. Sunan at-Tirmidzi no. 2317)\r\nAlasan penggunaan:\r\nRokok dianggap tidak memberikan manfaat yang jelas sehingga lebih baik ditinggalkan, namun tidak otomatis haram.', 'Menurut ulama yang mengharamkan rokok, hukum rokok bukan sekadar makruh tetapi haram karena memenuhi beberapa sebab pengharaman sekaligus: membahayakan diri, membahayakan orang lain, memboroskan harta, termasuk perkara buruk (khabaits), dan menimbulkan ketergantungan. Oleh karena itu, larangannya dianggap telah mencapai derajat haram.', 'Menurut ulama yang memakruhkan rokok, larangan rokok tidak mencapai derajat haram karena:\r\ntidak ada nash yang tegas mengharamkannya,\r\nbahaya yang dijadikan dasar pengharaman dianggap tidak langsung dan tidak selalu sama,\r\nhukum asal sesuatu adalah boleh,\r\nrokok tidak memabukkan seperti khamar.\r\nKarena itu, mereka menyimpulkan bahwa merokok lebih tepat dihukumi makruh (dibenci dan sebaiknya ditinggalkan), bukan haram.', 'pendapat yang mengharamkan rokok memiliki landasan yang lebih kuat menurut banyak ulama kontemporer. Namun, dalam tradisi fikih Islam, keberadaan pendapat makruh tetap diakui sebagai bagian dari perbedaan ijtihad ulama.', 'Kajian Metodologis Terhadap Fatwa MUI Tentang Rokok oleh Heri Firmansyah, dimuat dalam jurnal Al-Ahkam: Jurnal Ilmu Syari\'ah dan Hukum. Jurnal ini membahas dasar metodologi fatwa rokok dan perbedaan pendapat antara haram dan makruh.', '', '', '', '', '', '', '', '', '', '2026-06-04 03:29:58'),
(37, '23051135', NULL, 'MUI, Pimpinan Pusat Muhammdadiyah, dan Lajnah Daimah (Arab Saudi)', 'Ulama Mahzab Syafi\'i Terdahulu (Klasik), Nahdlatul Ulama, dan Syeh Hasanain Makhluf (Mantan Mufti Mesir)', ' وَيُحِلُّ لَهُمُ الطَّيِّبَاتِ وَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ\r\n\r\ndan (Nabi) yang menghalalkan bagi mereka segala yang baik dan mengharamkan bagi mereka segala yang buruk (Q.S. Al-A\'raf:157)', 'الأَصْلُ فِي الأَشْيَاءِ الإِبَاحَةُ حَتَّى يَدُلَّ الدَّلِيلُ عَلَى التَّحْرِيمِ\r\n\r\n\"Hukum asal dari segala sesuatu adalah boleh (mubah), sampai ada dalil yang menunjukkan keharamannya.\"', '1. Adanya kepastian bahaya medis\r\n2. Bahaya nyata bagi orang lain\r\n3. Sifat kecanduan yang mengikat', '1. Dampak bahaya tidak bersifat instan.\r\n2. Keharaman harus bedasarkan dalil yang jelas.\r\n3. Fleksibilitas hukum berdasarkan kondisi', 'Mengikuti pendapat memakruhkan. Karena hukum makruh sudah menjadi lampu kuning yang kuat agar umat islam menghindari rokok demi kesehatan. Tetapi saya tidak mengharamkan karena tidak ada dalil yang tegas.', 'Fatwa Hukum Merokok dalam Persepektif MUI dan Muhammadiyah\r\n\r\nMerokok dalam Tinjauan Hukum Islam (Studi Nash-Nash antara Haram dan Makhruh)', '', '', '', '', '', '', '', '', '', '2026-06-04 03:54:07'),
(38, '23051146', NULL, '1. Majelis Ulama Indonesia (MUI)\r\n2. Syaikh Abdul Aziz bin Baz\r\n3. Syaikh Muhammad bin Shalih Al-Utsaimin', '1. Nahdlatul Ulama (NU)\r\n2. Syaikh Wahbah Az-Zuhaili\r\n3. Syaikh Yusuf Al-Qaradawi', 'QS. Al-A\'raf: 157\r\nوَيُحِلُّ لَهُمُ الطَّيِّبَاتِ وَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ\r\n\"Dan menghalalkan bagi mereka segala yang baik dan mengharamkan bagi mereka segala yang buruk.\"', 'QS. Al-Baqarah: 29\r\nهُوَ الَّذِي خَلَقَ لَكُمْ مَا فِي الْأَرْضِ جَمِيعًا\r\n\"Dialah Allah yang menciptakan segala apa yang ada di bumi untuk kamu.\"', '● Rokok terbukti membahayakan kesehatan dan dapat menyebabkan berbagai penyakit.\r\n● Rokok termasuk perbuatan yang merusak diri sendiri dan orang lain.\r\nMemboroskan harta untuk sesuatu yang membahayakan.\r\n● Sesuai kaidah syariat: \"Tidak boleh membahayakan diri sendiri dan orang lain.\"', '● Tidak ada nash Al-Qur\'an atau hadis yang secara tegas menyebut rokok haram.\r\n● Bahaya rokok dianggap tidak langsung dan berbeda pada setiap orang.\r\n● Rokok memiliki bau yang tidak sedap sehingga lebih dekat kepada hukum makruh.\r\n● Kaidah asal sesuatu adalah mubah sampai ada dalil yang jelas mengharamkannya.', 'Saya mengikuti pendapat yang memakruhkan karena tidak ada dalil Al-Qur’an atau hadist yabg secara tegas mengharamkannya. Namun, rokok memiliki bau yang tidak sedap dan dapat mengganggu orang lain maka sebaiknya menghindar.', '1. Fatwah Majelis Ulama Indonesia (MUI) tentang hukum merokok.\r\n2. Al-Fiqh al-Islami wa Adillatuhu wahbah az-Zuhali\r\n3. Halal dan haram dalam islam karya yusuf  al-Qaradawi \r\n4. Fiqh Sunnah karya Sayyid Sabiq ', '', '', '', '', '', '', '', '', '', '2026-06-04 04:00:00');
INSERT INTO `tb_soal` (`id`, `nama_mahasiswa`, `tema_id`, `jawaban_1`, `jawaban_2`, `jawaban_3`, `jawaban_4`, `jawaban_5`, `jawaban_6`, `jawaban_7`, `jawaban_8`, `jawaban_9`, `jawaban_10`, `jawaban_11`, `jawaban_12`, `jawaban_13`, `jawaban_14`, `jawaban_15`, `jawaban_16`, `jawaban_17`, `waktu_submit`) VALUES
(39, '23051142', NULL, '1. Majelis Ulama Indonesia (MUI)\r\n2. Syaikh Abdul Aziz bin Baz.\r\n3. Syaikh Muhammad bin Shalih Al-Utsaimin.', '1. Nahdlatul Ulama melalui sebagian keputusan bahtsul masail menyatakan hukum rokok pada dasarnya makruh, terutama bila tidak menimbulkan mudarat yang pasti.\r\n2. Syekh Wahbah az-Zuhaili berpendapat rokok makruh karena termasuk perbuatan yang kurang baik dan sebaiknya dijauhi.\r\n3. Syekh Ali Jum\'ah pernah menjelaskan bahwa rokok bisa makruh, namun dapat berubah menjadi haram bila terbukti membahayakan kesehatan seseorang.', 'اَلَّذِيْنَ يَتَّبِعُوْنَ الرَّسُوْلَ النَّبِيَّ الْاُمِّيَّ الَّذِيْ يَجِدُوْنَهٗ مَكْتُوْبًا عِنْدَهُمْ فِى التَّوْرٰىةِ وَالْاِنْجِيْلِ يَأْمُرُهُمْ بِالْمَعْرُوْفِ وَيَنْهٰىهُمْ عَنِ الْمُنْكَرِ وَيُحِلُّ لَهُمُ الطَّيِّبٰتِ وَيُحَرِّمُ عَلَيْهِمُ الْخَبٰۤىِٕثَ وَيَضَعُ عَنْهُمْ اِصْرَهُمْ وَالْاَغْلٰلَ الَّتِيْ كَانَتْ عَلَيْهِمْۗ\r\nYaitu,) orang-orang yang mengikuti Rasul (Muhammad), Nabi yang ummi (tidak pandai baca tulis) yang (namanya) mereka temukan tertulis di dalam Taurat dan Injil yang ada pada mereka. Dia menyuruh mereka pada yang makruf, mencegah dari yang mungkar, menghalalkan segala yang baik bagi mereka, mengharamkan segala yang buruk bagi mereka, dan membebaskan beban-beban serta belenggu-belenggu yang ada pada mereka\r\n(Q.S Al A\'raf : 157) ', 'اِنَّ الْمُبَذِّرِيْنَ كَانُوْٓا اِخْوَانَ الشَّيٰطِيْنِۗ وَكَانَ الشَّيْطٰنُ لِرَبِّهٖ كَفُوْرًا\r\nSesungguhnya para pemboros itu adalah saudara-saudara setan dan setan itu sangat ingkar kepada Tuhannya.\r\n(Q.S Al Isra\' : 27) ', '- Rokok terbukti membahayakan kesehatan berdasarkan penelitian medis.\r\n- Mengandung unsur pemborosan harta untuk sesuatu yang merusak.\r\n- Asap rokok juga membahayakan orang lain (perokok pasif).', '- Dampak rokok dianggap tidak selalu langsung dan berbeda pada setiap orang.\r\n- Sebagian ulama menganggap rokok hanya termasuk kebiasaan yang kurang baik, bukan benda memabukkan seperti khamar\r\n- Karena itu mereka menetapkan hukum makruh: sebaiknya ditinggalkan tetapi tidak sampai haram.', 'Menurut saya, pendapat yang mengharamkan rokok lebih kuat. Alasannya karena saat ini bukti medis tentang bahaya rokok sudah sangat jelas, baik bagi perokok maupun orang di sekitarnya. . ', '- Al-Fiqh al-Islami wa Adillatuhu\r\n- Majelis Ulama Indonesia — Fatwa tentang Hukum Merokok\r\n- Jurnal: “Pandangan Ulama tentang Hukum Merokok dalam Islam”', '', '', '', '', '', '', '', '', '', '2026-06-04 03:53:40'),
(40, '23051114', NULL, 'MUI, MUHAMMADIYYAH, Lembaga Fatwa Arab Saudi(Al-Lajnah Ad-Da\'imah) ', 'Nahdlatul Ulama (NU), Madzhab SYAFII (Asy-Syarwani, Berpendapat serupa bahwa rokok adalah makruh), Syekh Yusuf Ash-Shafti Memandang Rokok Sebatas makruh karena baunya yang menganggu. ', 'لا ضرر ولا ضرار\r\n\"Tidak boleh melakukan perbuatan yang memudharatkan/membahayakan diri sendiri maupun orang lain (HR.Ibnu Majah) ', 'مَنْ أَكَلَ مِنْ هَذِهِ الشَّجَرَةِ الْمُنْتِنَةِ فَلاَ يَقْرَبَنَّ مَسْجِدَنَا\r\n\"Barang siapa yang memakan tanaman yang berbau busuk ini (bawang merah/bawang putih), maka janganlah ia mendekati masjid kami.\" (HR. Muslim)', 'Ulama\' Klasik Madzab Syafi\'i : Seperti Al- Qalyubi (W. 1069 H) Dan Ibnu \'Alan (W. 1057 H) Yang telah mengharamkan tembakau sejak awal munculnya dengan alasan dapat merusak kesehatan dan membuka jalan timbulnya berbagai penyakit berbahaya. ', 'Ulama\' Klasik Madzab Hanafi (Seperti Ibnu Abidin) : Berpendapat bahwa tembakau makruh karena bau yang mengganggu dan dikategorikan dalam suatu yang belum terbukti membahayakan secara nyata pada zamannya', 'Saya mengikuti yang memakruhkan karena tidak ada ayat Al-qur\'an atau Hadis yang secara pasti mengharamkan tembakau. ', 'Perilaku merokok dalam hukum islam\r\n\r\nFatwa Hukum merokok prespektif MUI Dan MUHAMMADIYAH', '', '', '', '', '', '', '', '', '', '2026-06-04 03:57:33'),
(41, '23051096', NULL, '1. Al-Qurtubi\r\n2. MUI (dengan syarat)\r\n3. Muhammadiyah', 'NU\r\nMUI (dengan syarat)\r\nYusuf Alqordawi', 'QS. Nisa:29\r\n\r\n\"Dan janganlah kamu membunuh diri sendiri\"', 'QS. Al- A\'raf:157 \r\n\r\nTentang menghalalkan yang baik dan mengharamkan yang buruk', '1. Unsur memabukan\r\n2. Rokok itu berbahaya bagi diri sendiri dan orang lain\r\n3. Boros harta\r\n', '1. Tidak ada dalil Al-Qur\'an atau hadis yang secara eksplisit mengharamkan rokok.\r\n2. Rokok tidak memabukkan seperti khamar.', 'Saya cenderung mengikuti pendapat yang mengharamkan rokok, karena penelitian medis modern menunjukkan rokok menyebabkan berbagai penyakit serius dan membahayakan orang lain melalui asap rokok (merugikan diri sendiri dan orang lain)', 'Jurnal hukum islam: hukum merokok dalam islam(studi nas antara haram dan makruh', '', '', '', '', '', '', '', '', '', '2026-06-04 03:58:15'),
(42, '23051068', NULL, 'Majelis Ulama Indonesia (dalam kondisi tertentu dan bagi kelompok tertentu)\r\nMuhammadiyah\r\nAbdul Aziz bin Baz\r\n', 'Nahdlatul Ulama\r\nWahbah az-Zuhaili\r\nYusuf al-Qaradawi (sebagian pendapatnya menyebut makruh, terutama bila belum terbukti membahayakan secara langsung)', 'QS. Al-Baqarah [2]: 195\r\nوَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\r\n\"Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"\r\n\r\nQS. Al-A\'raf [7]: 157\r\nوَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ\r\n\"Dan Dia mengharamkan bagi mereka segala yang buruk.\"\r\n\r\nHadis\r\nلَا ضَرَرَ وَلَا ضِرَارَ\r\n\"Tidak boleh membahayakan diri sendiri dan tidak boleh membahayakan orang lain.\" (HR. Ibnu Majah)', 'Hadis tentang bau yang mengganggu\r\nمَنْ أَكَلَ مِنْ هَذِهِ الشَّجَرَةِ الْخَبِيثَةِ فَلَا يَقْرَبَنَّ مَسْجِدَنَا\r\n\"Barang siapa memakan pohon yang berbau tidak sedap ini (bawang putih/bawang merah), maka janganlah mendekati masjid kami.\" (HR. Bukhari dan Muslim)\r\n\r\nUlama yang memakruhkan rokok sering mengqiyaskan bau rokok dengan bau bawang yang mengganggu orang lain, sehingga hukumnya makruh, terutama ketika berada di tempat umum atau masjid.\r\nKalau ingin lebih lengkap, pada nomor 3 kamu juga bisa menambahkan:\r\nQS. Al-Isra\' [17]: 26–27\r\n\r\nوَلَا تُبَذِّرْ تَبْذِيرًا ۝ إِنَّ الْمُبَذِّرِينَ كَانُوا إِخْوَانَ الشَّيَاطِينِ\r\n\"Dan janganlah kamu menghambur-hamburkan harta secara boros. Sesungguhnya orang-orang yang boros itu adalah saudara-saudara setan.\"', 'Terbukti membahayakan kesehatan.\r\nMengandung zat adiktif yang merusak tubuh.\r\nMembahayakan perokok pasif.\r\nMenyebabkan pemborosan harta.', 'Tidak ada nash yang secara eksplisit menyebut rokok.\r\nDampak buruknya dianggap tidak selalu langsung atau pasti pada setiap orang.\r\nLebih tepat dimasukkan ke perbuatan yang tidak disukai syariat (makruh).', 'saya cenderung mengikuti pendapat yang mengharamkan rokok karena penelitian medis modern menunjukkan bahwa rokok dapat menyebabkan berbagai penyakit serius, membahayakan perokok pasif, dan menghabiskan harta untuk sesuatu yang tidak bermanfaat. Oleh karena itu, mudaratnya lebih besar daripada manfaatnya.', 'Fiqh al-Islami wa Adillatuhu\r\nHalal dan Haram dalam Islam\r\nFatwa Muhammadiyah tentang Hukum Rokok.\r\nFatwa MUI tentang Rokok.', '', '', '', '', '', '', '', '', '', '2026-06-04 03:33:08'),
(43, '23051111', NULL, 'Majelis Tarjih dan Tajdid Muhammadiyah\r\nYusuf al-Qaradawi\r\nWahbah az-Zuhaili', 'Nahdlatul Ulama\r\nAli Mustafa Yaqub\r\nMajelis Ulama Indonesia', 'Al-Qur\'an\r\n\r\nQS. Al-Baqarah: 195\r\n\r\nوَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\r\n\r\n\"Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"\r\n\r\nQS. An-Nisa\': 29\r\n\r\nوَلَا تَقْتُلُوا أَنْفُسَكُمْ ۚ إِنَّ اللَّهَ كَانَ بِكُمْ رَحِيمًا\r\n\r\n\"Dan janganlah kamu membunuh dirimu sendiri.\"\r\n\r\nHadis\r\n\r\nلَا ضَرَرَ وَلَا ضِرَارَ\r\n\r\n\"Tidak boleh membahayakan diri sendiri dan orang lain.\"', 'Hadis\r\n\r\nإِنَّ اللَّهَ كَرِهَ لَكُمْ قِيلَ وَقَالَ وَكَثْرَةَ السُّؤَالِ وَإِضَاعَةَ الْمَالِ\r\n\r\n\"Sesungguhnya Allah membenci banyak bicara sia-sia, banyak bertanya yang tidak perlu, dan menyia-nyiakan harta.\"\r\n\r\n(HR. Bukhari dan Muslim)\r\n\r\nAyat yang sering digunakan:\r\n\r\nQS. Al-A\'raf: 157\r\n\r\nوَيُحِلُّ لَهُمُ الطَّيِّبَاتِ وَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ\r\n\r\n\"Dan menghalalkan bagi mereka segala yang baik dan mengharamkan segala yang buruk.\"', 'Rokok terbukti membahayakan kesehatan dan dapat menyebabkan berbagai penyakit.\r\nAsap rokok juga membahayakan orang lain (perokok pasif).\r\nBertentangan dengan tujuan syariat dalam menjaga jiwa (hifzh an-nafs).\r\nMengandung unsur pemborosan harta.\r\nSesuai kaidah \"tidak boleh membahayakan diri sendiri maupun orang lain\".', 'Tidak ada nash Al-Qur\'an atau hadis yang secara eksplisit menyebut rokok haram.\r\nRokok tidak memabukkan seperti khamar.\r\nSebagian ulama menilai mudaratnya tidak selalu sama pada setiap orang.\r\nKaidah asal muamalah adalah mubah sampai ada dalil yang jelas mengharamkan.\r\nKarena mengandung mudarat dan pemborosan, maka minimal hukumnya makruh.', 'saya memandang rokok dihukumi makruh dengan memandang tidak adanya dalil yang mengatakan haram secara langsung, meski merokok itu terhitung menguras harta dan berbahaya untuk kesehatan, tapi itu dikembalikan pada individu masing² lagi', 'Peran Fatwa Muhammadiyah tentang Hukum Merokok dalam Sikap, Norma Subjektif, dan Kontrol Perilaku terhadap Perilaku Merokok (Jurnal Kesehatan, 2020).\r\nFatwa Haram Merokok Majlis Tarjih Muhammadiyah (Jurnal In Right UIN Sunan Kalijaga).\r\nAnalisis Terhadap Fatwa Majelis Tarjih dan Tajdid PP Muhammadiyah No. 6/SM/MTT/III/2010 Tentang Hukum Merokok dalam Perspektif Hukum Islam (Skripsi UII).', '', '', '', '', '', '', '', '', '', '2026-06-04 03:36:32'),
(44, '23051152', NULL, '1. Majelis Ulama Indonesia\r\n2. Muhammadiyah\r\n3. Yusuf al-Qaradawi', '1. Nahdlatul Ulama\'\r\n2. Wahbah az-Zuhaili\r\n3. Ahmad Hasan', 'QS. Al-Baqarah: 195\r\nوَأَنْفِقُوا فِي سَبِيلِ اللَّهِ وَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\r\n\r\n\"Janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"', 'مَنْ أَكَلَ مِنْ هَذِهِ الشَّجَرَةِ الْخَبِيثَةِ فَلَا يَقْرَبَنَّ مَسْجِدَنَا\r\n\r\n\"Barang siapa memakan tanaman yang berbau tidak sedap (bawang), maka jangan mendekati masjid kami.\" (HR. Bukhari dan Muslim)', '1. Rokok terbukti secara medis merusak kesehatan.\r\n2. Mengandung zat berbahaya seperti nikotin, tar, dan karbon monoksida.\r\n3. Membahayakan perokok pasif.\r\n4. Bertentangan dengan tujuan syariat (maqashid syariah) dalam menjaga jiwa (hifzh an-nafs).\r\n5. Menghamburkan harta untuk sesuatu yang merugikan.\r\n6. Kaidah fikih: ad-dhararu yuzal (bahaya harus dihilangkan).', '1. Tidak terdapat nash Al-Qur\'an maupun hadis yang secara eksplisit menyebut rokok.\r\n2. Pada masa ulama terdahulu, dampak medis rokok belum diketahui secara pasti.\r\n3. Rokok dianggap seperti makanan atau minuman yang berbau tidak sedap.\r\n4. Tidak semua perokok langsung mengalami penyakit serius.\r\n5. Larangannya lebih dekat kepada meninggalkan sesuatu yang kurang baik daripada sesuatu yang pasti haram.', 'Analis pendapat yang mengharamkan rokok saat ini memiliki landasan yang lebih kuat karena didukung oleh :\r\n1. Data medis modern yang menunjukkan bahaya rokok.\r\n2. Kaidah fikih tentang larangan membahayakan diri sendiri dan orang lain.\r\n3. Tujuan syariat untuk menjaga kesehatan dan kehidupan manusia.\r\n\r\nPosisi saya lebih cenderung mengikuti pendapat yang mengharamkan rokok karena bahaya rokok telah terbukti secara ilmiah dan  sesuai dengan prinsip islam dalam menjaga kesehatan dan keselamatan jiwa.\r\n\r\n\r\n', 'Buku : \r\n1. Halal dan haram dalam islam.\r\n2. Fiqh al-islami wa adillatuhu.\r\n3. Fikih kontemporer.\r\n\r\nDokumen fatwa \r\n1. Fatwa majelis tarjih dan tajdid muhammadiyah nomor 6/SM/MTT/III/2010 tentang hukum merokok.\r\n2. Fatwa MUI nomer 6 tahun 2009 tentang rokok.\r\n3. Keputusan batsul masail nahdlatul     ulama tentang rokok.\r\n\r\n', '', '', '', '', '', '', '', '', '', '2026-06-04 03:51:17'),
(45, '23051154', NULL, 'Majelis Ulama Indonesia (MUI), Muhammadiyah, Syaikh Abdul Aziz bin Baz', 'Nahdlatul Ulama (NU), Imam Asy-Syaukani, Syaikh Wahbah Az-Zuhaili', 'QS. Al-Baqarah: 195\r\nوَلَا تُلْقُوا بِأَيْدِيكُمْ إِلَى التَّهْلُكَةِ\r\n\"Dan janganlah kamu menjatuhkan dirimu sendiri ke dalam kebinasaan.\"\r\nQS. An-Nisa\': 29\r\nوَلَا تَقْتُلُوا أَنْفُسَكُمْ ۚ إِنَّ اللَّهَ كَانَ بِكُمْ رَحِيمًا\r\n\"Dan janganlah kamu membunuh dirimu; sungguh Allah Maha Penyayang kepadamu.\"\r\nQS. Al-A\'raf: 157\r\nوَيُحَرِّمُ عَلَيْهِمُ الْخَبَائِثَ\r\n\"Dan Allah mengharamkan bagi mereka segala yang buruk.\"', ' \r\nQS. Al-Baqarah: 168\r\nيَا أَيُّهَا النَّاسُ كُلُوا مِمَّا فِي الْأَرْضِ حَلَالًا طَيِّبًا\r\n\"Wahai manusia! Makanlah dari apa yang ada di bumi yang halal lagi baik.\"\r\nQS. Al-Ma\'idah: 87\r\nيَا أَيُّهَا الَّذِينَ آمَنُوا لَا تُحَرِّمُوا طَيِّبَاتِ مَا أَحَلَّ اللَّهُ لَكُمْ\r\n\"Wahai orang-orang yang beriman! Janganlah kamu haramkan apa yang baik yang telah Allah halalkan bagimu.\"\r\nQS. Al-An\'am: 119\r\nوَقَدْ فَصَّلَ لَكُمْ مَا حَرَّمَ عَلَيْكُمْ\r\n\"Padahal Allah telah menjelaskan kepada kamu apa yang diharamkan-Nya atas kamu.\"', '1. Rokok terbukti membahayakan kesehatan.\r\n2. Asap rokok juga membahayakan orang lain (perokok pasif).\r\n3. Menghabiskan harta untuk sesuatu yang merugikan.\r\n4. Bertentangan dengan tujuan syariat yang menjaga jiwa dan kesehatan manusia.', '1. Tidak ada ayat Al-Qur\'an atau hadis yang secara tegas menyebut rokok haram.\r\n2. Rokok tidak memabukkan seperti khamar.\r\n3. Pada dasarnya sesuatu dianggap boleh sampai ada dalil yang jelas mengharamkannya.\r\n4. Karena menimbulkan mudarat dan bau yang tidak sedap, maka hukumnya makruh dan sebaiknya ditinggalkan.', 'Saya cenderung mengikuti pendapat yang mengharamkan rokok. Alasannya, saat ini telah banyak penelitian yang membuktikan bahwa rokok dapat merusak kesehatan dan membahayakan orang lain melalui asapnya. Selain itu, rokok juga dapat menghabiskan harta tanpa memberikan manfaat yang jelas. Karena mudaratnya lebih besar daripada manfaatnya, saya menilai pendapat yang mengharamkan rokok lebih kuat.\r\n\r\n', '1. Himpunan Fatwa Majelis Ulama Indonesia (MUI).\r\n2. Fatwa Tarjih Muhammadiyah tentang Hukum Merokok.\r\n3. Fiqh al-Islami wa Adillatuhu karya Wahbah Az-Zuhaili', '', '', '', '', '', '', '', '', '', '2026-06-04 03:39:05'),
(46, '23051118', NULL, 'KH Maruf Amin', 'Nahdlatul Ulama\' (NU)', 'Tidak boleh membahayakan diri sendiri dan orang lain', 'QS Al-A\'raf ayat 157\r\n\r\nartinya\r\nallah menghalalkan bagi mereka segala yang baik', 'Rokok terbukti membahayakan kesehatan  dan dapat menimbulkan berbagai penyakit', 'rokok tidak termasuk benda yang memabukkan seperti khamr', 'saya menghormati kedua pendapat karena masing² memiliki dasar metode istinbath yang berbeda', '1. fatwa MUI tentang rokok\r\n2. ahkamul fuqaha NU Online', '', '', '', '', '', '', '', '', '', '2026-06-04 04:00:34'),
(47, '23051141', NULL, '', '', '', '', '', '', '', '', 'Berdoa sebelum sujud waktu rakaat terakhir subuh', ' An anasi bin malikin qala: ma zala rasulullahi shaallahu alaihi wa sallam yaqnutu fil fajri hatta faraqad dunya', 'Qultu li abi : ya abati, innaka qad sallaita khalfa rasulillahi sallallahu alaihi wa sallama, wa abi bakrin, wa umara wa uthmana wa aliyyi bin abi thalibin ha huna wa bil kufati nahwa khamsi sanatin, a fakanu yaqnutuna fil fajri? Qala: ay bunayya, muhdathun', 'Imam asy syafi\'i\r\nImam malik bin anas\r\nImam an nawawi', 'Imam abu hanifah\r\nImam ahmad bin hanbal\r\nSyaikh ibnu utsaimin', 'Menetapkan qunut subuh sebagai sunnah didasarkan pada hadis sahih riwayat imam al hakim dari anas bin malik. Hadis tersebut menyatakan bahwa rasulullah saw terus menerus membaca doa qunut pada shalat subuh hingga beliau wafat', 'Berpendapat bahwa qunut pada shalat subuh bukanlah amalan yang disyariatkan secara rutin, mereka mendasarkan pandangan ini pada beberapa argumen utama terikat dalil dan konteks sejarah', '', '', '2026-06-11 02:10:48'),
(48, '23051034', NULL, '', '', '', '', '', '', '', '', 'Berdoa, yg di baca saat berdiri tegak (i\'tidal), setelah rukuk pada rakaat terkahir sholat, shubuh, dan di baca pada hari 15 tekahir bulan Ramadhan saat sholat terawih', 'عن محمد قال: قلت لاءنس: هل قنت رسول ا الله عليه وسلم في صلاة الصبح؟ قال: نعم بعد الركوع يسير. \r\nرواه مسلم', ' اكانو يقنتون؟ قال : اي بني محدث', 'Imam syafi\'i, Imam malik bin Anas, imam ibnu abi laila', 'Imam abu hanifah, Imam Ahmad bin hanbal, Sufyan Ats-tsauri', 'Bahwa Rasulullah terus-menerus melakukanua hingga wafat', 'Mereka menilai bahwa doa ini tidak di syariatkan secara terus menerus. ', '', '', '2026-06-11 01:50:55'),
(49, '23051035', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah salah satu bagian dari sunnah ab\'ad shalat yang mana dilakukan pada rakaat terkahir shalat shubuh dan dilakukan pada shalat tarawih setengah akhir bulan ramadhan', 'مازال رسول الله صلى الله عليه وسلم يقنت في الفجر حتي فارق الدنيا', 'قال: اكانو يقنتون؟ قال : اي بني محدث \r\nرواه الترميذى والنسائ', 'Imam syafii, imam malik, ibnu abi laila', 'Imam abu hanifah,imam ahmad bin  hanbal,ibnul mubarak', 'Karena ikut dalil bahwa rasulullah itu qunut pada shalat shubuh sampai beliau meninggalkan dunia', 'Ulama yang tidak menyunahkan qunut itu menilai bahwa hadis yg dijadikan dalil oleh ulama yang menganggap qunut itu shunnah adqlah hadis yang dhoif atau lemah', '', '', '2026-06-11 01:41:00'),
(50, '23051036', NULL, '', '', '', '', '', '', '', '', 'Qunut adalah salah satu sunnah ab\'adh dalam solat yang di kerjakan pada rokaat ke 2 sebelum ruku\' saat solat subuh dan pada sholat witir pada rokaat terakhir yang mana di kerjakan pada setiap malam ganjil setengah bulan yang akhir saat bulan Ramadhan', ' يقنت الفجرحتى فارق الدنيا', 'ها هنا با الكوفة  من خمس سنين اكان يقنتون ؟ قال اي بني محدث', 'Imam bukhori, imam muslim, imam abu Hurairah', 'Yazid bin harun, abu malik asy\'jai, imam al-Bukhari', 'Karena para ulama meyakini bahwa qunut ini di contohkan oleh nabi muhammad ', 'Karena mereka berpendapat bahwa hadits² tersebut dhoif', '', '', '2026-06-11 02:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `tema_masalah`
--

CREATE TABLE `tema_masalah` (
  `id_tema` int(11) NOT NULL,
  `nama_tema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tema_masalah`
--

INSERT INTO `tema_masalah` (`id_tema`, `nama_tema`) VALUES
(1, 'Kenapa sesama muslim tapi puasanya beda hari'),
(2, 'Menyentuh lawan jenis apakah membatalkan wudhu'),
(3, 'Membaca basmalah saat sholat (keras/pelan)'),
(4, 'Hukum qunut dalam sholat subuh'),
(5, 'Menyentuh mushaf tanpa wudhu'),
(6, 'Hukum suntik ketika puasa'),
(7, 'Hukum merokok'),
(8, 'Hukum niat puasa'),
(9, 'Hukum memegang mushaf saat haid'),
(10, 'Berkumur saat puasa'),
(11, 'Tadaruss speaker malam hari'),
(12, 'Hukum nikah hamil luar nikah'),
(13, 'Sholat pakai make up merkuri'),
(14, 'Ziarah kubur'),
(15, 'Masalah Waris Al-Musyarakah'),
(16, 'Muslim ikut perayaan non muslim'),
(17, 'Hukum uang trading'),
(18, 'Rokaat Tarawih 8 atau 20'),
(19, 'Hukum Uang Digital/ Crypto'),
(20, 'Bayar zakat online'),
(21, 'Hukum bayi tabung'),
(22, 'Transaksi Shopee'),
(23, 'Aplikasi Quran HP tanpa wudhu'),
(24, 'Hukum main saham'),
(25, 'Zakat Fitrah dengan Uang'),
(26, 'Donor/Bank ASI'),
(27, 'Hukum Pinjol'),
(28, 'Jual Beli Bitcoin'),
(29, 'Penyalahgunaan AI'),
(30, 'Jual beli organ tubuh'),
(31, 'Hukum foto prewed'),
(32, 'Sholawat dibuat DJ'),
(33, 'Hukum Paylater'),
(34, 'Hukum Vaksin'),
(35, 'Masafatul Qoshor'),
(36, 'Jumlah rakaat dalam shalat tarawih'),
(37, 'Menyentuh lawan jenis (bukan mahram) terhadap wudhu'),
(38, 'Nikah tanpa wali'),
(39, 'Riba atau bunga dalam pinjam meminjam'),
(40, 'Hukum talak tiga sekaligus'),
(41, 'Batas aurat laki-laki dan perempuan'),
(42, 'Perbedaan mazhab dalam wudhu'),
(43, 'Menyentuh lawan jenis bukan mahram membatalkan wudhu'),
(44, 'Qunut shalat subuh'),
(45, 'Hukum talak dalam pernikahan'),
(46, 'Khutbah Jumat menggunakan selain bahasa Arab'),
(47, 'Nikah mut’ah'),
(48, 'Mengangkat tangan saat takbir selain takbiratul ihram'),
(49, 'Mengqadha shalat yang sengaja ditinggalkan'),
(50, 'Muamalat sewa-menyewa (ijarah)'),
(51, 'Hukum rokok dan vape'),
(52, 'Hukum musik dalam Islam'),
(53, 'Talak tiga yang diucapkan sekaligus'),
(54, 'Mendengar dan menjawab adzan lebih dari satu'),
(55, 'Membuang rambut atau kuku saat sedang haid'),
(56, 'Hukum E-wallet, Kripto, dan bunga bank'),
(57, 'Hukum operasi plastik'),
(58, 'Nikah beda agama'),
(59, 'Bayi tabung dan rekayasa reproduksi'),
(60, 'Hukum donor organ'),
(61, 'Jual beli online (marketplace)'),
(62, 'Transaksi digital dan E-money (cashless)'),
(63, 'Hukum bunga bank'),
(64, 'Donor organ dan transplantasi'),
(65, 'Hukum bayi tabung dalam kedokteran modern'),
(66, 'Penggunaan dompet digital (ShopeePay)'),
(67, 'Bayi tabung'),
(68, 'Jual beli online'),
(69, 'Menggunakan make-up dan skincare saat puasa'),
(70, 'Transplantasi organ saat hidup atau mati otak'),
(71, 'Kurban online (transfer dana penyembelihan)'),
(72, 'Hukum aplikasi pinjaman online (pinjol)'),
(73, 'Akad nikah secara online'),
(74, 'Bekerja sebagai pegawai bank konvensional'),
(75, 'Hukum suntik atau infus saat puasa');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
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
-- Dumping data for table `tugas`
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
-- Table structure for table `user`
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
-- Dumping data for table `user`
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
(173, '1', '123', 'Zainul', '6B', 'user', '2026-04-09 02:14:47'),
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
(201, '121212', '123', 'aaa', '6B', 'user', '2026-04-23 02:25:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `site_content`
--
ALTER TABLE `site_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_daftar_soal`
--
ALTER TABLE `tb_daftar_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tema_id` (`tema_id`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tema_masalah`
--
ALTER TABLE `tema_masalah`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `fk_user_tugas` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_daftar_soal`
--
ALTER TABLE `tb_daftar_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tema_masalah`
--
ALTER TABLE `tema_masalah`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_daftar_soal`
--
ALTER TABLE `tb_daftar_soal`
  ADD CONSTRAINT `fk_tb_daftar_soal_tema_masalah` FOREIGN KEY (`tema_id`) REFERENCES `tema_masalah` (`id_tema`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fk_user_tugas` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
