-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2026 at 10:58 PM
-- Server version: 11.4.12-MariaDB-cll-lve
-- PHP Version: 8.4.24

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
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nama` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, '6B', '2026-08-15 12:00:00', '2026-08-15 12:00:00'),
(2, '6C', '2026-08-15 12:00:00', '2026-08-15 12:00:00'),
(3, 'PAI-DN-1', '2026-08-15 12:00:00', '2026-08-15 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `isi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jawaban`
--

INSERT INTO `jawaban` (`id`, `mahasiswa_id`, `soal_id`, `isi`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '', '2026-06-11 04:14:00', '2026-06-11 04:26:45'),
(6, 2, 2, '', '2026-06-11 04:19:33', '2026-06-11 04:26:47'),
(10, 2, 4, '', '2026-06-11 04:20:04', '2026-06-11 04:26:50'),
(11, 2, 3, '', '2026-06-11 04:21:03', '2026-06-11 04:26:42'),
(14, 2, 6, '', '2026-06-11 04:24:59', '2026-06-11 04:25:24'),
(27, 49, 1, 'Qunut adalah doa yang dibaca dalam shalat pada posisi berdiri untuk memohon kebaikan, petunjuk, perlundungan dan pertolongan kepada allah.', '2026-06-11 04:44:00', '2026-06-11 05:10:43'),
(31, 49, 2, 'عن انس بن مالك قال: ما زا ل رسو ل الله يقنت في الفجر حتي فارقا الدنيا\n\nArtinya : rasulullah senantiasa berqunut pada sholat subuh hingga beliau wafat.', '2026-06-11 04:49:14', '2026-06-11 05:11:02'),
(71, 49, 3, 'قال: يابني انها بذ عة\n\nArtinya : wahai anakku, sesungguh nya itu  adalah bid\'ah ( sesuatu yang di ada adakan).', '2026-06-11 04:57:01', '2026-06-11 05:11:12'),
(94, 49, 4, '1. Berdasarkan hadist anas bin malik yang mengatakan bahwa nabi melakukan qunut subuh hingga beliah wafat.\n2. Di amalkan oleh sebagan sahabat dan tabi\'in.\n3. Menjadi pendapat resmi oleh madzab syafi\'i dan sebagian ulama\' maszab maliki.', '2026-06-11 05:00:06', '2026-06-11 05:11:25'),
(104, 49, 5, '1. Hadist tentang nabi selalu qunut subuh sampai wafat dikenal lemah (dhaif) oleh banyak ahli hadist.\n2. Riwayat yang lebih kuat menunjukan nabi berqunut ketika terjadi musibah (qunut nazilah).\n3. Abu bakar, umar, dan ustman diriwayatkan tidak membiasakan qunut subuh.', '2026-06-11 05:02:55', '2026-06-11 05:11:37'),
(119, 49, 6, '1. Imam Asy-syafi\'i.\n2. Imam An-nawawi.\n3. Imam malik.', '2026-06-11 05:07:03', '2026-06-11 05:11:44'),
(129, 49, 7, '1. Imam abu hanifah.\n2. Imam ahmad bin hambal.\n2. Syaikh muhammad nashiruddin al-albani.', '2026-06-11 05:08:24', '2026-06-11 05:11:54'),
(156, 34, 1, 'Doa yang dilakukan oleh umat muslim khususnya NU ketika sholat shubuh setelah selesai i\'tidal', '2026-06-11 05:21:28', '2026-06-11 05:23:14'),
(172, 34, 2, 'HR. BUKHORI No 1002.\n, MUSLIM No 677. Yang artinya:\"Sesungguhnya Nabi SAW melakukan Qunut selama sebulan untuk mendoakan keburukan kabilah Arab, kemudian beliau meninggalkannya.', '2026-06-11 05:25:13', '2026-06-11 05:28:40'),
(194, 27, 1, 'Qunut adalah doa yang dibaca dalam sholat pada posisi berdiri (itidal) setelah rukuk pada rakaat tertentu terutama pada sholat subuh menurut sebagian ulama\'', '2026-06-11 05:30:12', '2026-06-11 06:42:58'),
(195, 34, 4, 'Karena itu ajaran dari Rasulullah SAW. HR. ABU DAWUD No 1425.', '2026-06-11 05:30:19', '2026-06-11 05:31:08'),
(196, 27, 2, 'Hadis yang dijadikan dasar:\n\"Dari anas ra nabi senantiasa berqunut pada sholat subuh hingga beliau wafat.\"(HR.Al-Baihaqi)', '2026-06-11 05:30:31', '2026-06-11 06:45:26'),
(204, 34, 5, 'Alasan ulama\' (3 madzahab) tidak mengatakan qunut sunnah karena beliau berpegang pada HR. BUKHORI No 1002. Di hadist tersebut ada jata summa tarokahu yang artinya kemudian meninggalkannya, dan itu ditafsir qunut itu tidak Sunnah.', '2026-06-11 05:34:59', '2026-06-11 05:35:36'),
(208, 34, 6, 'Imam Syafi\'i, Imam Al Ghazali, Imam An Nawi', '2026-06-11 05:45:37', '2026-06-11 05:45:57'),
(211, 34, 7, 'Imam Hanafi, Imam Hambali, Imam Maliki', '2026-06-11 05:46:42', '2026-06-11 05:46:42'),
(212, 34, 3, 'HR.BUKHORI no 1002,', '2026-06-11 05:48:11', '2026-06-11 05:48:11'),
(213, 47, 1, 'Doa yang dibaca pada rakaat kedua sholat shubuh setelah bangun dari rukuk', '2026-06-11 06:28:59', '2026-06-18 02:05:49'),
(218, 47, 2, 'Rasulullah senantiasa melakukan qunut pada sholat shubuh hingga beliau wafat (HR. Ahmad dan al baihaqi)', '2026-06-11 06:29:25', '2026-06-18 01:57:12'),
(260, 27, 3, 'Hadist yang dijadikan dasar:\n\"Dari anas ra nabi berqunut selama satu bulan mendoakan keburukan atas beberapa kabilah arab kemudian beliau meninggalkannya.\"HR. Bukhari dan Muslim).', '2026-06-11 06:45:42', '2026-06-11 06:52:52'),
(274, 27, 4, 'Karena terdapat hadist yang menerangkan bahwa rasulullah SAW terus melakukan qunut pada saat sholat subuh sampai wafat sehingga hukumnya disunahkan.', '2026-06-11 06:47:31', '2026-06-11 06:53:00'),
(285, 27, 5, 'Karena hadist yang lebih kuat menunjukan bahwa nabi SAW hanya berqunut sementara waktu (qunut nazilah) lalu meninggalkannya.', '2026-06-11 06:49:29', '2026-06-11 06:53:06'),
(294, 27, 6, 'Imam syafii\nImam an nawawi\nImam al baihaqi.', '2026-06-11 06:51:04', '2026-06-11 06:53:13'),
(297, 27, 7, 'Imam abu hanifah\nImam ahmad bin hambal\nIbnu taimiyah.', '2026-06-11 06:51:37', '2026-06-11 06:53:18'),
(309, 44, 1, '', '2026-06-11 22:50:15', '2026-06-18 10:55:52'),
(311, 50, 1, 'doa yang dibaca dalam sholat  pada waktu tertentu dengan berdiri khusyuk sebagai bentuk permohonana kepada Allah swt. dalam sholat subuh', '2026-06-12 04:37:48', '2026-06-18 03:29:24'),
(319, 50, 2, '\"Sesungguhnya Rasulullah saw. senantiasa membaca qunut pada sholat subuh hingga beliau wafat.\"', '2026-06-12 04:40:18', '2026-06-12 04:43:20'),
(324, 50, 3, '\"Rasulullah saw. melakukan qunut selama satu bulan mendoakan kebinasaan atas suatu kaum, setelah itu beliau meninggalkannya\"', '2026-06-12 04:41:33', '2026-06-12 04:51:12'),
(336, 50, 4, 'karena terdaoat hadis yang menyebutkan bahwa Rasulullah saw. terus membaca qunut pada sholat subuh hinggal ia wafat. ', '2026-06-12 04:43:43', '2026-06-12 04:44:58'),
(343, 50, 5, 'karena qunut yang dilakukan Rasulullah saw. hanya bersifat sementara (qunut nazilah) karena untuk mendoaan suatu kaum, kemudian beliau meninggalkannya. ', '2026-06-12 04:46:23', '2026-06-12 04:48:00'),
(351, 50, 6, '1. Imam Syafi\'i\n2. Imam Malik\n3. Imim Nawawi', '2026-06-12 04:48:21', '2026-06-12 04:48:38'),
(353, 50, 7, '1. Imam Abu Hanifah\n2. Imam Ahmad bin Hanbal\n3. Syaikhul islam ibnu Taimiyah', '2026-06-12 04:49:12', '2026-06-12 04:50:31'),
(370, 44, 2, '', '2026-06-13 10:38:03', '2026-06-18 02:37:59'),
(371, 44, 3, '', '2026-06-13 10:38:41', '2026-06-18 02:38:19'),
(378, 44, 4, '', '2026-06-13 10:40:39', '2026-06-18 02:38:49'),
(380, 44, 5, '', '2026-06-13 10:41:02', '2026-06-18 02:39:11'),
(382, 31, 1, 'doa yang dibaca dalam sholat pada posisi tertentu, dilakukan setelah rukuk', '2026-06-14 10:03:55', '2026-06-14 10:04:59'),
(390, 31, 2, 'HR. Ahmad\n\nartinya: Rasulullah SAW tetap melakukan qunut pada salat fajar (subuh) hingga beliau meninggal', '2026-06-14 10:05:24', '2026-06-14 10:30:14'),
(397, 31, 4, 'menurut madzhab syafi\'i karena berdasar pada hadist atsar sahabat yang menunjukkan nabi muhammad SAW berqunut pada subuh hingga beliau meninggal', '2026-06-14 10:11:46', '2026-06-14 10:38:16'),
(399, 31, 6, 'imam syafi\'i, ali bin ziyad, an-nawawi', '2026-06-14 10:14:23', '2026-06-14 10:37:10'),
(401, 31, 3, 'hadis riwayat ibnu hibban dan di verifikasi shohih oleh at-tirmidzi\n\nartinya: telah salat aku dibelakang nabi muhammad SAW. maka dia tidak qunut dan aku salat dibelakang abu bakar maka dia tidak qunut dan aku salat dibelakang umar maka dia tidak qunut dan salat aku dibelakang usman maka dia tidak qunut dan salat aku dibelakang ali dia tidak qunut kemudian berkata ayahku: hal anakku! itu adalah perbuatan di ada adakan.', '2026-06-14 10:16:05', '2026-06-14 10:34:46'),
(425, 31, 5, 'menurut riwayat ad-daruqutni dan al-baihaqi dia berkata, \"qunut di dalam salat subuh itu bid\'ah\"', '2026-06-14 10:21:32', '2026-06-14 10:23:32'),
(436, 31, 7, 'madzhab hanafi, ats-tsauri, ibnu mas\'ud', '2026-06-14 10:26:54', '2026-06-14 10:27:49'),
(473, 32, 1, 'Qunut yakni doa khusus yang dibaca dalam salah pada posisi berdiri (biasanya setelah i\'tidal atau sebelum rukuk) untuk memohon kebaikan, perlindungan, atau mengangkat musibah', '2026-06-17 00:53:29', '2026-06-17 00:55:01'),
(491, 32, 2, 'Hadis anas bin malik\n\"Rasulullah SAW terus melakukan qunut pada shalat subuh sampai beliau wafat\"\n( HR. sejumlah ahli hadis, meskipun derajatnya diperselisihkan )', '2026-06-17 00:55:19', '2026-06-17 00:57:09'),
(513, 32, 3, 'Hadis Ibnu Mas\'ud:\n\"Rasulullah SAW melakukan qunut sebulan kemudian meninggalkannya\"\n(HR. Bukhari dan Muslim)', '2026-06-17 00:57:22', '2026-06-17 00:59:16'),
(536, 32, 4, '1. Menganggap hadis anas bin malik menunjukkan praktik yang terus dilakukan nabi\n2. Dipahami bahwa qunut subuh adalah ibadah yang tetap( bukan sementara)\n3. Diamalkan secara terus menerus oleh sebagian sahabat dimadinah', '2026-06-17 00:59:25', '2026-06-17 01:01:29'),
(556, 32, 5, '1. Nabi hanya qunut pada kondisi darurat ( nazilah) bukan rutin subuh\n2. Hadis menunjukkan qunut hanya dilakukan sementara lalu ditinggalkan\n3. Praktik nabi yang lebih umum tidak menunjukkan qunut subuh secara tetap', '2026-06-17 01:01:41', '2026-06-17 01:03:34'),
(577, 32, 6, '1. Imam syafi\' i\n2. Imam nawawi\n3. Ibnu hajar al-haitami ', '2026-06-17 01:03:45', '2026-06-17 01:04:45'),
(585, 32, 7, '1. Imam abu hanifah \n2. Ibnu taimiyah\n3. Ibnu Qayyim al- jauziyah ', '2026-06-17 01:04:56', '2026-06-17 01:05:25'),
(591, 39, 1, 'doa yang dibaca sesudah i tidal / sebelum sujud pada rakaat terakhir', '2026-06-17 03:36:30', '2026-06-17 03:56:30'),
(601, 39, 2, 'dari Anas bin Malik r.a yang artinya\nRasulullah SAW senantiasa melakukan qunut saat sholat subuh hingga beliau wafat\nHR. Ahmad, Ad-dharuquthni dan Al Baihaqi', '2026-06-17 03:39:45', '2026-06-17 04:02:45'),
(635, 28, 1, 'qunut adalah doa yang dibaca dalam solat pada waktu tertentu, biasanya saat berdiri (i\'tidal) atau setelah rukuk.', '2026-06-17 03:47:42', '2026-06-17 03:49:00'),
(643, 28, 2, 'dari anas bin malik: rosulullah saw senantiasa berqunut pada sholat subuh hingga beliau meninggalkan dunia (wafat)r', '2026-06-17 03:50:39', '2026-06-17 03:53:03'),
(664, 28, 3, 'riwayat abdullah bin mas\'ud: rosulullah saw berqunut selama satu bulan kemudian beliau meninggalkannya.', '2026-06-17 03:53:22', '2026-06-17 03:53:45'),
(667, 28, 4, 'ulama yang mengatakan qunut subuh sunnah karena menggabungkan beberapa riwayat yang menurut mereka menunjukkan bahwa nabi muhammad saw terus melakukan qunut.', '2026-06-17 03:54:14', '2026-06-17 03:54:58'),
(677, 28, 5, 'ulama lain yang mengatakan bahwa qunut subuh bukan sunnah karena menurut pendapatnya nabi muhammad saw hanya berqunut ketika terjadi musibah (qunut nazilah) atau pada saat sholat witir sehingga mereka tidak menganggap qunut subuh setiap hari sebagai sunnah', '2026-06-17 03:55:11', '2026-06-17 03:57:05'),
(712, 28, 6, '1. muhammad ibn idris al-shafi\'i\n2. yahya ibn sharaf al-nawawi\n3. jalal al-din al-suyuti', '2026-06-17 03:57:42', '2026-06-17 03:58:20'),
(719, 28, 7, '1. abu hanifah\n2. ahmad ibn hanbal\n3. ibn taymiyyah', '2026-06-17 03:58:24', '2026-06-17 03:59:28'),
(752, 39, 3, 'dari Anas bin Malik r.a yang artinya:\nRasulullah SAW pernah berqunut selama sebulan mendoakan kebinasaan suatu kaum kemudian beliau meninggalkannya\nHR. Bukhari dan muslim', '2026-06-17 04:04:04', '2026-06-17 04:12:01'),
(781, 39, 4, 'karena ada hadits yang menyatakan bahw rasulullah SAw melakukan qunut saat subuh hingga beliau wafat', '2026-06-17 04:12:36', '2026-06-17 04:14:29'),
(790, 39, 5, 'karena qunut yang dilakukan nabi hanya sementara (selama satu bulan) untuk kondisi tertentu bukan amalan rutin dalam shalat subuh', '2026-06-17 04:15:10', '2026-06-17 04:17:49'),
(819, 39, 6, 'Imam Syafi\'i\nImam an-Nawawi\nImam al-Baihaqi', '2026-06-17 04:18:05', '2026-06-17 04:19:43'),
(837, 39, 7, 'Imam Abu Hanifah\nImam Ahmad bin Hambal\nIbnu Taimiyah', '2026-06-17 04:19:56', '2026-06-17 04:21:03'),
(855, 29, 1, 'qunut adalah bacaan yg dibaca waktu sholat shubuh sg wujud permohonan atau pernintaan kepada allah', '2026-06-17 13:42:40', '2026-06-17 13:44:02'),
(862, 29, 2, 'dari bukhori muslim dan abu dawud\n(bahwasannya rasul membaca qunut sewaktu sholat shubuh)', '2026-06-17 13:45:35', '2026-06-17 13:46:06'),
(865, 29, 3, 'dari anas bin malik \n(bahwasannya rasulullah melaksanakan qunit shubuh satu bulan setelah itu menunggalkannya)', '2026-06-17 13:47:13', '2026-06-17 13:47:57'),
(869, 29, 4, '1. bukhori muslim dan abu dawud : rasul melaksanakan qunut shubuh\n2. karena waktu fajar adalah waktu afdhal untuk meminta', '2026-06-17 13:49:00', '2026-06-17 13:51:48'),
(882, 29, 5, '1. anas bin malik : rasul melaksanakan qunut shubuh sebulan lalu meninggalkannnya\n2. tidak turun temurun sahabat nabi mrlaksanakannya', '2026-06-17 13:52:01', '2026-06-17 13:52:32'),
(885, 29, 6, '1. imam syafi\'i\n2. imam baihaqi', '2026-06-17 13:53:06', '2026-06-17 13:53:06'),
(886, 29, 7, '1. abu hanifah ( pendiri madzhab hanafi\n2. ahmad bin hanbal (pendiri madzhab hambali\n', '2026-06-17 13:53:46', '2026-06-17 13:54:32'),
(891, 5, 1, 'Sunnah', '2026-06-17 23:34:40', '2026-06-17 23:34:40'),
(892, 51, 1, 'Qunut adalah doa yang dalam posisi berdiri(i\'tidal) pada sholat tertentu. Dalam fikh, qunut adalah doa yang dibaca setelah bangun dari rukuj pada rakaat kedua sholat subuh.', '2026-06-17 23:46:25', '2026-06-18 02:34:14'),
(903, 51, 2, 'Dari Anas bin Malik r.a.\n\"Bahwasan Nabi Shalallahu alahi wasallam senantiasa berqunut pada sholat subuh hingga beliau wafat\"\nHR Al Bukhori dan Muslim', '2026-06-17 23:52:03', '2026-06-17 23:55:45'),
(916, 51, 3, 'Dari anas bin malik r.a.\nRasullah shalallahu alaihi wasallam pernah berqunjt selama satu bulan mendoakan keburukan atas beberapa kabilah arab, kemudian beliau meinggalkannya\"\nHR Al Bukhori dan Muslim', '2026-06-17 23:54:02', '2026-06-17 23:55:21'),
(921, 9, 15, 'Ala yamassal-qur\'ana illa tahirun\nArtinya: Janganlah menyentuh Al-Qur\'an Kecuali Orang Yanng Suci \n(HR. Malik)', '2026-06-17 23:54:41', '2026-06-18 00:17:25'),
(935, 4, 15, '', '2026-06-17 23:55:46', '2026-06-18 00:30:38'),
(958, 9, 16, 'tidak ada dalil yang tegas dalam menjelskan diperbolehkannya menyentuh mushaf Al-Qur\'an tanpa berwudhu', '2026-06-17 23:57:14', '2026-06-18 00:19:48'),
(964, 4, 16, '', '2026-06-17 23:57:36', '2026-06-18 00:30:16'),
(968, 51, 4, 'Hadis yang menyebutkan bahwa nabi berqunut pada sholat subuh hingga wafat\nPraktik qunut subuh diriwayatkan dari sejumlah sahabat\nQunut subuh telah diamalkan secara berkelanjutan oleh banyak ulama salaf', '2026-06-17 23:59:27', '2026-06-18 00:00:46'),
(985, 51, 5, 'Hadis hadis shohih menunjukkan bahwa qunut yang dilakukan nabi hanyabersifat sementara\nTidak yerdapat riwayat shahih dalam kitab shahih al bukhori dan muslim yang menyatakan nabu terus menerus berqunut subuh sampai wafat\nMayoritas sahabat tidak meriwayatkan praktik qunut subuh secara rutin', '2026-06-18 00:01:28', '2026-06-18 00:02:44'),
(997, 51, 6, 'Imam asy-syafi\'i, imam an-nawawi, dan imam al-baihaqi', '2026-06-18 00:02:54', '2026-06-18 00:03:13'),
(999, 51, 7, 'Imam abu hanifah, imam ahmad bin hanbal, dan ibnu tamiyah', '2026-06-18 00:03:37', '2026-06-18 00:03:37'),
(1003, 8, 15, 'Ibnu Tauimiyyah rahumahukkah berkata :\nwassakhihu fii hadaal baaba maa tsabata assakhaa bata - ridwaanullahi alaihim - wa huwa lladzii dalla alaihil kitaabu wassunnatu wa huwa anna massalmus khafi laa yajuu zu lilmukhditsi\n\npendapat tang tepat dalam masalah ini adalah pendapat para sahabat. itulah pendapat yang sejalan dengan al-qur\'an dan as-sunnah yaitu menyentuh mushaf tidak diperbolehkan bagi yang berhadats. (majmu\'ah al-fatawa, 21:270)', '2026-06-18 00:10:07', '2026-06-18 00:14:27'),
(1018, 16, 15, 'laa yamassuhu illal muthahharun (Qs alwaqiah.79)', '2026-06-18 00:11:36', '2026-06-18 00:15:03'),
(1023, 24, 15, 'QS. Al-Waqiah ayat 79:\n\"La yamassuhu illa al-muthaharun\"\nHadist yang menjadi dalil utama:\n\"Alla yamassa al-qur\'ana illa thahirun\" atau \"La yamassu al-qur\'ana illa thahirun\"', '2026-06-18 00:12:16', '2026-06-18 00:19:03'),
(1068, 16, 16, 'fattakullaha mastatha\'tum (QS at-taghabun ayat 16)', '2026-06-18 00:15:22', '2026-06-18 00:20:56'),
(1070, 22, 21, 'Meskipun ada perbedaan pendapat wudhu sebelum membaca/menyentuh al-qur\'an itu merupakan adab yang dianjurkan. \n\n', '2026-06-18 00:15:38', '2026-06-20 12:28:27'),
(1084, 13, 15, 'عن عمرو بن حزم : ال يمس القران الا طاهر\n', '2026-06-18 00:16:34', '2026-06-18 09:52:56'),
(1097, 16, 17, 'an laa yamassal qurana illa thahhir ', '2026-06-18 00:18:41', '2026-06-18 00:18:41'),
(1100, 22, 15, 'La yamassuhu illal-mutahharun (Qs. Al-waqi\'ah ayat 79)\n', '2026-06-18 00:18:52', '2026-06-20 12:27:52'),
(1118, 8, 20, '1. Ibnu Hazm (ulama besar dari andalusia (spanyol islam) dan tokoh madzab zhahiri. \n2. Dawud Az-Zhahiri (pendiri madzab zhahiri)\n3. Al-Muzani (murid utama imam syafi\'i)', '2026-06-18 00:20:31', '2026-06-18 00:32:51'),
(1124, 9, 17, 'Ala Yamassal-Qur\'ana illa Tahirun\nTetapi ulama tidak menyamakan mushaf Al-Qur\'an dengan Al-Quq\'an yang berada di HP. Sehingga menyentuh layar yang menampilkan Al-Qur\'an di Layar HP tanpa berwudhu diperbolehkan, walaupun berwudhu tetap utama dan menjaga adab terhadap Al-Quran', '2026-06-18 00:20:48', '2026-06-18 00:23:12'),
(1132, 24, 16, 'Ulama\' yang memperbolehkan menyentuh mushaf tanpa wudhu umumnya beragumen bahwa tidak ada dalil yang secara tegas dan shahih menetapkan larangan tersebut. Pada QS. Al-Waqiah ayat 79,mereka berpendapat bahwa ayat ini berbicara tentang al-qur\'an yang berada dilangit (lauh mahfuz) dan yang menyentuhnya adalah para malaikat yang disucikan, bukan tentang hukum manusia yang menyentuh mushaf. penafsiran ini dinisbatkan kepada sejulah ahli tafsir, termasuk Ibnu Abbas dalam sebagian riwayat, serta dipilih oleh At-Tabari pada salah satu penjelasannya.\nMereka menggunakan kaidah \"Al-Ashlu Bara\'atu Adz-Dzimmah\" yang artinya: Hukum asal sesoorang bebas dari beban kewajiban sampai ada dalil yang jelas. karna menurut mereka tidak ada nash yang tegas dan shahih tentang kewajiban wudhu untuk menyentuh mushaf, maka hukum asalnya tetap boleh. ', '2026-06-18 00:21:18', '2026-06-18 01:09:12'),
(1147, 16, 18, 'innal mukminalaa yanjusu (HR.Bukhari muslim)', '2026-06-18 00:22:13', '2026-06-18 00:22:59'),
(1162, 16, 19, 'imam malik, imam asy syafii, imam ahmad bin hanbal  ', '2026-06-18 00:23:18', '2026-06-18 00:24:01'),
(1174, 8, 16, 'La yamassuhu illa al-mutohharun \nartinya : tidak ada yang menyentuhnya selain orang-orang yang disucikan ( QS. Al-Waqiah : 79)\nmenurut Ibnu Hazm, Dawud az-Zhahiri dan Al-Muzani, yang dimaksud \"orang-orang yang disucikan\" adalah malaikat, bukan manusia yang berwudhu. oleh karena itu ayat ini tidak menunjukkan kewajiban berwudhu sebelum menyentuh mushaaf al-qur\'an. ', '2026-06-18 00:24:13', '2026-06-18 00:32:43'),
(1182, 9, 18, 'kana an nabiyyu Shollallahu alaihi wassallam yadzkuru allaha ala kulli ahyanihi \nArtinya Nabi senantiasa berdzikir kepada Allah dalam seluruh keadaan beliau (HR. Sahih Muslim)\nUlama berpendapat bahwa membaca Al-Qur\'an dan berdzikir pada dasarnya diperbolehkan dalam berbagai keadaan.\nPerlu diketahui Mushaf adalah lembaran, dan Al-Qur\'an yang ada di HP tidak termasuk Mushaf, maka menyentuh Al-Qur\'an di HP diperbolehkan tanpa berwudhu', '2026-06-18 00:25:14', '2026-06-18 00:30:16'),
(1187, 16, 20, 'dawud azzahiri, ibnu hazm ,asy syaukani', '2026-06-18 00:25:25', '2026-06-18 00:26:09'),
(1236, 16, 21, 'perbedaan pendapat ini telah lama di bahas oleh para ulama indonesia mayoritas mengikuti mahzab syafi i  pendapat yng lebih banyak berwudhu terlebih dahulu', '2026-06-18 00:28:05', '2026-06-18 00:30:05'),
(1240, 10, 15, '1. Q. s.  Al waqi\'ah : 79 yang berbunyi :\nLaa Yamassuhu Illal Muthohharuun\n2. Alla Yamassal Qur\'ana illa Thohirun (HR. Malik)', '2026-06-18 00:28:34', '2026-06-18 11:52:55'),
(1285, 9, 19, '1. Imam Malik bin Annas\n2. Imam Muhammad bin Idris Asy-Syafi\'i\n3. Imam Ahmad Bin Hanbal', '2026-06-18 00:30:48', '2026-06-18 00:31:23'),
(1295, 9, 21, 'kesimpulannya, Mushaf Al-Qur\'an dan Al-Qur\'an yang di HP itu berbeda, Mushaf Artinya lembaran. dan para ulama melarang menyentuh mushaf tanpa berwudhu. sedangkan menyentuh Layar HP yang menampilkan Al-Qur\'an tanpa berwudhu itu diperbolehkan karena Layar HP tidak sama dengan Mushaf Al-Qur\'an secara Fisik', '2026-06-18 00:32:06', '2026-06-18 00:35:29'),
(1308, 9, 20, '1. Dawud Az-Zahiri\n2. Ibn hazm\n3. Asy-Syaukani', '2026-06-18 00:33:06', '2026-06-18 00:33:06'),
(1324, 24, 17, 'Mayoritas ulama\' kontemmporer yang memperbolehkan menyentuh al-qur\'an di HP tanpa wudhu berpendapat bahwa HP bukanlah mushaf, karna itu, dalil-dalil yang melarang menyentuh mushaf dalam keadaan tanpa wudhu tidak otomatis berlaku pada pada HP. Dalilnya tetap sama yaitu QS Al-Waqiah ayat 79, karna mereka membedakan antara mushaf dan perangkat elektronik. Oleh sebab itu, banyak lembaga fatwa kontemporer seperti; Majma\' Al-Fiqh Al-Islami dan para ulama\' masa kini berpendapat bahwa hukum HP itu tidak sama dengan mushaf. Mereka tetap menganjurkan wudhu saat membaca Al-Qur\'an dari HP sebagai bentuk adab, tapi umumnya tidak diwajibkan. Jadi tidak ada ayat atau hadist khusus yang menyebut HP, karna HP belum ada pada masa nabi.', '2026-06-18 00:36:42', '2026-06-18 00:50:34'),
(1326, 8, 19, '1. madzab asy-syafi\'iyah\n2. madzab al-malikiyah\n3. madzab al-hanafiyah', '2026-06-18 00:36:59', '2026-06-18 00:54:21'),
(1371, 8, 18, 'wa yajuu zu lilmukhdatsi an yaqra a, liannannabiyya lanyakun nyakun nyakhjubuhu an qiraa atil quraani illa annyakuuna junuban fadalla alaa annalkhadatsa blan yam na\'hu (al-mawardi, al-hawi al-kabir (beirut, darul kutub ilmiah :1999), jilid I, halaman 149)\n\nmembaca al-qur\'an melalui aplikasi digital tetap diperbolehkan mesti dalam keadaan tidaak berwudhu, selama tidak dalam keaadaan junub. sebagaimana rasulullah saw yang tetap membaca al-qur\'an dalam keadaan hadats, dan ulama menjelaskan bahwa hadats kecil tidak menghalangi seseorang untuk membaca al-qur\'an. meskipun demikian, menjaga wudhu tetap lebih utama sebagai bentuk adab dan penghormatan terhadap al-quran. ', '2026-06-18 00:41:03', '2026-06-18 01:01:08'),
(1423, 13, 19, 'imam asy syafi\'i\nimam malik bin anas\nimam ahmad bin hanbal', '2026-06-18 00:49:33', '2026-06-18 00:50:26'),
(1441, 13, 20, 'daud az zahiri\nibnu hazm al andalusi\nmuhammad bin jarir ath thabari(imam thabari)', '2026-06-18 00:51:27', '2026-06-18 00:52:56'),
(1444, 24, 18, 'Banyak ulama\' yang memperbolehkan menyentuh Al-Qur\'an di HP tanpa wudhu, karna HP tidak dianggap sebagai mushaf. Dasar yang sering Mereka gunakan bukan ayat atau hadis khusus tentang HP (karna HP belum ada pada masa nabi), melainkan kaidah fiqih bahwa hukum larangan menyentuh mushaf tidak berlaku pada benda yang bukan mushaf. Dalil yang meunjukkan bolehnya membaca Al-Qur\'an dalam keadaan tidak berhadas besar: \"Kana rasulullahi shallallahu \'alaihi wa sallama yadzkurullaha \'ala kulli ahyanih\". karna membaca Al-Qur\'an termasuk dzikir kepada Allah selagi tidak dalam keadaan berjunub maka boleh membacanya tanpa wudhu', '2026-06-18 00:51:58', '2026-06-18 01:03:49'),
(1469, 8, 17, 'tidak ada namun sebagai bentuk penghormatan terhadap firman allah, tetap dianjurkan untuk berwudhu, jika memungkinkan. diperbolehkan tanpa wudhu jika anda membaca al-qur\'an di hp tanpa menyentuh teks secara fisik, seperti membaca tanpa kontak, ini hukumnya diperbolehkan.', '2026-06-18 00:55:25', '2026-06-18 00:57:04'),
(1487, 8, 21, 'dari penjelasan diatas tidak diperbolehkan menyentuh mushaf al-qur\'an ketika dalam keadaan tidak berwudhu maka dari itu diwajibkan untuk berwudhu terlebih dahulu, tetapi kalau dengan aplikasi al-quran yang ada di hp diperbolehkan tanpa berwudhu untuk membacanya tetapi tidak boleh menyentuh ayat al-qur\'annya. ', '2026-06-18 00:58:26', '2026-06-18 01:00:21'),
(1550, 24, 19, '1. Ibnu Abdil Barr\n2. An-Nawawi\n3. Ibnu Qudamah\n4. Al Kasani', '2026-06-18 01:10:43', '2026-06-18 01:13:10'),
(1562, 24, 20, '1. Dawud Az-Zahiri\n2. Ibnu Hazm\n3. Yusuf Al-Qaradawi', '2026-06-18 01:13:50', '2026-06-18 01:15:40'),
(1570, 24, 21, 'Mayoritas Ulama\' (jumhur) seperti imam madzhab empat melarang menyentuh mushaf dalam keadaan tidak berwudhu, mereka berdalil menggunakan QS. Al-Waqi\'ah ayat 79 dan hadist \"La yamassu al-qur\'ana illa thahirun\". Sebagian kecil ulama\' terutama Dawud az-zahiri dan ibnu hazm memperbolehkan menyentuh mushaf tanpa wudhu karna QS. Al-Waqiah ayat 79 berbicara tentang malaikat bukan manusia, hadist yang diatas juga diperselisihkan kekuatan dan maknanya, dan hukum asal sesuatu itu boleh sampai ada dalil tegas yang melarang. Tentang HP (aplikasi Al-Qur\'an) banyak ulama\' kontemporer yang memperbolehkan menyentuh dan membaca Al-Qur\'an tanpa wudhu karna HP tidak dianggap sebagai mushaf.', '2026-06-18 01:17:11', '2026-06-18 01:26:30'),
(1621, 17, 15, 'Laa Yamassuhuu Illal Muthahharun..', '2026-06-18 01:39:59', '2026-06-18 01:40:03'),
(1623, 38, 15, '', '2026-06-18 01:41:56', '2026-06-18 01:42:27'),
(1627, 17, 17, 'Laa Yqmassuhu Illal Muthaharun', '2026-06-18 01:42:45', '2026-06-18 01:43:13'),
(1630, 17, 19, 'Imam Syafi\'i\nImam Hanafi\nImam Maliki', '2026-06-18 01:43:30', '2026-06-18 01:43:42'),
(1632, 17, 16, 'Tidak ada dalil yang kuat yang menunjukkan bahwa Boleh Menyentuh Muehaf dalam keadaan Tidak Ada Wudlu', '2026-06-18 01:44:35', '2026-06-18 01:44:46'),
(1635, 38, 16, '', '2026-06-18 01:45:34', '2026-06-18 01:45:34'),
(1636, 17, 20, 'Dawud Az-Zahiri', '2026-06-18 01:45:55', '2026-06-18 01:45:55'),
(1637, 17, 18, 'Kalau Di HP boleh tanla Wudlu, karena tidak Berbentuk Mushaf Fisik', '2026-06-18 01:46:12', '2026-06-18 01:46:34'),
(1641, 38, 17, '', '2026-06-18 01:46:57', '2026-06-18 01:46:57'),
(1642, 17, 21, 'Menyentuh Mushaf fisik wajib mwmiliki Wudlu, sementqra untuk Al-Qur\'an digital, tidak Wajib Berwudlu', '2026-06-18 01:47:00', '2026-06-18 01:47:29'),
(1649, 38, 18, '', '2026-06-18 01:48:09', '2026-06-18 01:48:09'),
(1650, 20, 19, 'Imam assayafi\'i\nImam malik bin annas \nImam ahmad bin hambal', '2026-06-18 01:48:21', '2026-06-18 01:49:04'),
(1660, 38, 19, '', '2026-06-18 01:49:04', '2026-06-18 01:49:04'),
(1663, 38, 20, '', '2026-06-18 01:49:38', '2026-06-18 01:49:38'),
(1664, 20, 20, 'Imam daud azh-zhahiri\nImam ibnu hamz alhandalusi\nImam hammad bin abi sulaiman ', '2026-06-18 01:49:43', '2026-06-18 01:51:21'),
(1671, 38, 21, 'ad ', '2026-06-18 01:50:51', '2026-06-18 01:51:00'),
(1680, 20, 15, ' ان رسول الله صلى الله عليه وسلم كتب الى اهل  اليمن كتابا وكان فيه لايمس القران الا طاهر', '2026-06-18 01:52:07', '2026-06-18 01:59:01'),
(1782, 47, 3, 'Sesungguhnya nabi berqunut selama satu bulan mendoakan kebinasaan atas suatu kaum, kemudian beliau meninggalkannya (HR. Bukhori dan Muslim)', '2026-06-18 01:57:30', '2026-06-18 01:59:19'),
(1813, 47, 4, 'Terdapat hadist nabi yang menyebutkan nabi terus melakukan qunut sampai beliau wafat. Menjadi pendapat resmi dalam madzhab syafi\'i', '2026-06-18 02:00:08', '2026-06-18 02:00:57'),
(1823, 47, 5, 'Banyak sahabat tidak meriwayatkan qunut shubuh eecara rutin', '2026-06-18 02:01:28', '2026-06-18 02:03:02'),
(1830, 20, 17, 'دع ما يريدك الى ما لا يريبك', '2026-06-18 02:02:17', '2026-06-18 02:05:02'),
(1847, 47, 6, 'Muhammad bin Idris asy syafi\'i\nYahya bin syaraf an nawawi\nIbnu hajar al haitami', '2026-06-18 02:03:15', '2026-06-18 02:03:47'),
(1861, 47, 7, 'Abu hanifah\nAhmad bin hambal\nMuhammad nasiruddin al albani\n', '2026-06-18 02:03:58', '2026-06-18 02:04:29'),
(1872, 48, 1, 'Doa yang dibaca saat berdiri dalam shalat, biasanya dilakukan pada saat sholat subuh.', '2026-06-18 02:08:18', '2026-06-18 02:12:07'),
(1890, 48, 2, 'Artinya: \"Rasulullah SAW senantiasa ber qunut pada shalat subuh sampai beliau wafat\" (HR. Ahmad dan Al - Baihaqi). ', '2026-06-18 02:15:42', '2026-06-18 02:19:47'),
(1916, 48, 3, 'Artinya: \"Rasulullah SAW berqunut selama satu bulan mendoakan keburukan atas beberapa kabilah arab, kemudian beliau meninggalkannya\" (HR. Bukhari dan muslim)', '2026-06-18 02:20:13', '2026-06-18 02:30:19'),
(1924, 12, 15, 'َلايمسُهُ إلاّ اْلمُطَهَرُوْن Qs.al waqiah 79', '2026-06-18 02:24:08', '2026-06-18 02:28:44'),
(1926, 20, 16, 'لا يمسه الا مطهر', '2026-06-18 02:24:52', '2026-06-18 02:25:46'),
(1955, 36, 1, 'Qunut adalah doa yang dibaca dalam sholat subuh setelah bangun dari rukuk', '2026-06-18 02:26:43', '2026-06-18 02:27:54'),
(1992, 12, 16, 'سُبْحَانَ اللّهِ إن المُو مِنَ لاَيَنْجُسُ HR.bukhari 283 dan muslim no 371', '2026-06-18 02:29:33', '2026-06-18 02:33:38'),
(2013, 36, 2, 'Hadist riwayat anas bin malik yang artinya rasulullah senantiasa berqunut pada salat subuh sampai beliau wafat', '2026-06-18 02:30:18', '2026-06-18 02:31:03'),
(2018, 40, 1, 'Doa yang dibaca saat beridiri setelah rukuk dalam sholat', '2026-06-18 02:30:30', '2026-06-18 02:31:17'),
(2031, 36, 3, 'Hadist dari anas bin malik yang memiliki arti nabi berqunut selama satu bulan mendoakan keburukan atas beberapa kabilah arab, kemudian beliau meninggalkannya', '2026-06-18 02:31:23', '2026-06-18 02:32:02'),
(2033, 48, 4, 'Ulama mensunnahkan qunut subuh berpendapat bahwa Rasulullah SAW terus melakukan qunut pada shalat subuh hingga akhir hayatnya. Oleh karena itu, qunut subuh dianggap sebagai sunnah yang di anjurkan untuk dilaksanakan.', '2026-06-18 02:31:29', '2026-06-18 02:36:56'),
(2038, 40, 2, 'Rasullah SAW senantiasa melakukan qunut pada salat shubuh hingga wafat (HR. Ahmad,Al baihaqi)', '2026-06-18 02:31:52', '2026-06-18 02:33:03'),
(2051, 36, 4, 'Menjadikan hadist sebagai hujjah dan menganggap praktik qunut sholat subuh dilakukan secara berkelanjutan', '2026-06-18 02:32:23', '2026-06-18 02:33:06'),
(2059, 20, 18, 'Tidak ada ', '2026-06-18 02:32:34', '2026-06-18 02:32:34'),
(2081, 38, 1, 'Doa yang dibaca saat berdiri setelah rukuk pada rakaat tertentu ,untuk memohon petunjuk\n\n\n', '2026-06-18 02:33:17', '2026-06-18 02:36:22'),
(2088, 40, 3, 'Dari Anas bin Malin ra: Nabi Muhammad SAW pernah berqunut selama satu bulan, mendoakan kebinasaan atas suatu kaum,kemudian beliau meninggalkannya.\nHR .Bukhori dan sahih Muslim', '2026-06-18 02:33:39', '2026-06-18 02:35:54'),
(2090, 36, 5, 'Menilai hadist yang mengatakan qunut subuh sebagai sunnah akan diriwayatkan dengan luas, namun tidak banyak yang meriwayatnya, selain itu mereka menunjukan nabi berqunut karena sebab tertentu', '2026-06-18 02:33:43', '2026-06-18 02:35:04'),
(2122, 36, 6, 'Imam syafi\'i, imam nawawi, jalaludin as syuyuti', '2026-06-18 02:35:12', '2026-06-18 02:35:28'),
(2123, 12, 17, 'ألاَّ يَمَسَّ القُرْأٓنَ إلاَّ طَاهِرُ hadist amr bin hazm', '2026-06-18 02:35:13', '2026-06-18 02:37:49'),
(2135, 42, 1, 'qunut adalah doa yang dibaca saat i\'tidal pada rakaat kedua sholat subuh menurut sebagian ulama', '2026-06-18 02:35:32', '2026-06-24 03:10:31'),
(2141, 36, 7, 'Imam abu hanifah, imam ahmad bin hambal, ibnu taimiyah', '2026-06-18 02:35:46', '2026-06-18 02:35:46'),
(2161, 38, 2, 'Dari anas bin malik RA sesungguhnya nabi muhammad saw senantiasa membaca qunut pada shalat shubuh hingga beliau wafat', '2026-06-18 02:36:40', '2026-06-18 02:37:21'),
(2178, 40, 4, 'Qunut Shubuh hukumnya sunnah dikuatkan oleh mazhab  Syafi i', '2026-06-18 02:37:25', '2026-06-18 02:37:40'),
(2191, 48, 5, 'Ulama yang tidak mensunnahkan qunut subuh berpendapat bahwa qunut yang dilakukan Rasulullah SAW bersifat sementara, yaitu ketika terjadi musibah atau untuk mendoakan suatu kaum. Setelah keadaan tersebut berakhir, Nabi SAW meninggalkan qunut tersebut. Karena itu, mereka berpendapat qunut subuh tidak disunnahkan secara tetap.', '2026-06-18 02:37:50', '2026-06-18 02:45:21'),
(2194, 38, 3, ' rasulullah saw berqunut selama satu bulan untuk mendoakan keburukan atas beberapa kabilah arab kemudian neliau meninggalkannya', '2026-06-18 02:38:09', '2026-06-18 02:39:20'),
(2196, 40, 5, 'Qunut shubuh tidak sunnah tetap untuk kondisi  khusus ( nazilah)', '2026-06-18 02:38:18', '2026-06-18 02:38:58'),
(2213, 12, 18, 'Hr bukhari no 5872', '2026-06-18 02:39:17', '2026-06-18 02:39:33'),
(2216, 40, 6, 'Imam Syafi\nImam nawawi\nImam Al Baihaqi', '2026-06-18 02:39:26', '2026-06-18 02:39:49'),
(2217, 44, 6, '', '2026-06-18 02:39:29', '2026-06-18 02:39:29'),
(2226, 44, 7, '', '2026-06-18 02:39:50', '2026-06-18 02:39:50'),
(2229, 40, 7, 'Imam abu hanifa\nImam malik\nImam Ahmad bin Hanbali', '2026-06-18 02:40:14', '2026-06-18 02:40:39'),
(2232, 12, 19, 'Imam as syafi\'i, imam malik bin an nas, imam ahmad bin hanbal', '2026-06-18 02:40:26', '2026-06-18 02:41:20'),
(2242, 20, 21, '', '2026-06-18 02:40:46', '2026-06-18 02:45:26'),
(2246, 38, 4, 'Alasan karena mereka menilai hadis ini dapat dijadikan hijah bahwa qunut shubuh dilakukan secara terus menerus oleh nabi muhammad saw', '2026-06-18 02:40:57', '2026-06-18 02:42:23'),
(2261, 12, 20, 'Ibnu hazm al andalusi, daud az zahiri, syaik muhammad  nassrihuddin', '2026-06-18 02:41:55', '2026-06-18 02:46:17'),
(2270, 38, 5, 'Mereka memahami bahwa qunut tersebut adalah qunut nazilah (qunut karena musibah) bukan qunut setiap shubuh', '2026-06-18 02:42:39', '2026-06-18 02:43:31'),
(2283, 38, 6, 'Muhammad bin idris al syafii \nYahya bin syaraf annawawi \nJalaluddin assuyuti ', '2026-06-18 02:43:46', '2026-06-18 02:44:27'),
(2296, 38, 7, 'Abu hanifah an nu\'man \nAhmad bin hanbal\nTaqiyuddin ibmu taimiyah', '2026-06-18 02:44:51', '2026-06-18 02:45:09'),
(2303, 48, 6, 'Imam syafi\'i\nImam An- Nawawi\nImam Al- Baihaqi', '2026-06-18 02:45:47', '2026-06-18 02:47:07'),
(2318, 48, 7, 'Imam Abu Hanifah\nImam Ahmad bin Hanbal\nIbnu taimiyah', '2026-06-18 02:47:24', '2026-06-18 02:49:32'),
(2321, 12, 21, 'Mambaca al quran di hptanpa wudhu hukumnya boleh tpi wudhu saat membacanya lebih utama ', '2026-06-18 02:48:25', '2026-06-18 02:49:43'),
(2327, 11, 17, 'Ulama yang melarang menyentuh hp saat aplikasi al quran terbuka tanpa wudhu menyamakan hukum layar hp yang menampilkan ayat al quran dengan mushaf fisik dasar hadis ( la yamassuhu ila tahir )(hr malik dan ak hakim ) ', '2026-06-18 02:50:47', '2026-06-18 02:55:34'),
(2351, 11, 18, 'Hukum boleh ( al baraah - al asliya ) inal muminu la yanjusu ( hr . Bukhari dan muslim ) argumen fiqih ', '2026-06-18 02:56:06', '2026-06-18 03:00:34'),
(2367, 11, 19, 'Imam malik bin anas \nImam syafii \nImam ahmad bin hambal ', '2026-06-18 03:01:50', '2026-06-18 03:02:45'),
(2374, 11, 20, 'Ibnu hazm al andalusi \nDaud adh dhahiri \nSyekh muhammad nashiruddin ', '2026-06-18 03:03:10', '2026-06-18 03:06:28'),
(2386, 11, 21, 'Mayoritas mushaf fisik : ulama yang mewajibkan wudhu sebagai bentuk penghormatan dan ke hati hatian \nMayoritas aplikasi hp : ulama yang boleh menyentuhnya tanpa wudhu demi kemudahan umat untuk membaca al quran di mana saja termasuk bagi wanita yang sedang haid  ', '2026-06-18 03:08:18', '2026-06-18 03:12:02'),
(2407, 19, 15, 'Surat Al-waqi\'ah ayat 79:\n (tidak menyentuhnya kecuali orang-orang disucikan)', '2026-06-18 03:59:28', '2026-06-18 04:00:42'),
(2418, 19, 16, 'Tidak ada hadis/ayat yang memperbolehkan menyentuh mushaf', '2026-06-18 04:02:50', '2026-06-18 04:03:24'),
(2423, 19, 17, 'Tidak dihukumi sebagai mushaf fisik, oleh karena itu diperbolehkan', '2026-06-18 04:04:39', '2026-06-18 04:11:43'),
(2440, 19, 18, 'Tidak adanya larangan mutlak dalam nas al-qur\'an dan hadis mengenai teks digital, serta kaidah ushul fiqih yang meringankan (rukhsah)', '2026-06-18 04:07:40', '2026-06-18 04:08:35'),
(2448, 19, 19, 'Imam syafi\'i\nImam maliki\nImam hanafi', '2026-06-18 04:12:41', '2026-06-18 04:12:59'),
(2450, 19, 20, 'Imam daud az-zahiri\nImam Asy-Sya\'bi', '2026-06-18 04:13:31', '2026-06-18 04:14:24'),
(2457, 19, 21, 'Menyentuh al-qur\'an harus wudlu kecuali mushaf yang bentuknya digital', '2026-06-18 04:17:03', '2026-06-18 04:17:12'),
(2459, 13, 16, 'لا يمسه الا المطهرون', '2026-06-18 08:39:03', '2026-06-18 09:44:37'),
(2461, 13, 17, 'الایمس القران الا طاھر', '2026-06-18 08:42:13', '2026-06-18 08:53:40'),
(2505, 13, 18, 'الاصل في الاشياء الاباحة\n', '2026-06-18 09:32:52', '2026-06-18 09:41:41'),
(2624, 13, 21, 'para ulama berbeda pendapat mengenai hukum menyentuh mushaf tanpa wudhu jumhur ulama (hanafi, maliki, syafi\'i dan hanbali) mengharamkan berdasarkan hadis serta memahami qs al waqiah ayat 79 sebagai dalil pendukung. sementara sebagian ulama seperti imam dawud az zahiri, ibnu hazm, dan imam ath thabari membolehkan karena menilai dalil tersebut tidak menunjukkan larangan secara tegas bagi orang yang tidak berwudhu', '2026-06-18 09:53:28', '2026-06-18 10:09:59'),
(2696, 39, 15, 'Al-Qur\'an:\ntidak menyentuh mushaf kecuali orang² yang disucikan\n(QS. Al-waqiah:79)\nhadis:\nJanganlah menyetuh al-qur\'an kecuali orang yang suci\n(HR.Malik dalam Al-muwaththa)', '2026-06-18 10:53:01', '2026-06-18 11:00:48'),
(2724, 44, 15, '', '2026-06-18 10:56:31', '2026-06-22 23:04:47'),
(2768, 39, 16, 'Allah tidak membebani seseorang melainkan sesuai kemampuannya\n(QS.al-baqarah:286)', '2026-06-18 11:01:15', '2026-06-18 11:07:06'),
(2805, 39, 17, 'QS. al-waqiah:79\nHadits:\nTidak boleh menyentuh alquran kecuali orang yang suci', '2026-06-18 11:07:45', '2026-06-18 11:09:14'),
(2824, 39, 18, 'Tidak ada nash khusus yang melarang menyentuh hp yang berisi alquran oleh karena itu berlaku kaidah:\nhukum asal segala sesuatu adalah boleh', '2026-06-18 11:10:33', '2026-06-18 11:13:02'),
(2858, 39, 19, 'Imam Malik\nImam Syafi\'i\nImam Ahmad bin Hambal', '2026-06-18 11:13:50', '2026-06-18 11:14:36'),
(2870, 39, 20, 'Ibnu Hazm\nDawud Az-Zahiri\nAsy Syaukani', '2026-06-18 11:15:27', '2026-06-18 11:16:46'),
(2895, 39, 21, 'Perbedaan terdapat ulama terjadi karena perbedaan dalam memahami dalil alquran dan hadit s tentang menyentuh mushaf.\nKesimpulanya:\nMayoritas ulama mewajibkan wudhu saat menyentuh mushaf. sedangkan sebagian ulama membolehkan untuk al-qur\'an di hp banyak ulama\' membolehkan menyentuhnya tanpa wudhu', '2026-06-18 11:18:24', '2026-06-18 11:25:11'),
(2907, 10, 16, '1. Ayat Al-Qur\'an : Al-Waqi\'ah : 79, dari dalil ini menimbulkan perbedaan penafsiran, sebagian ulama yang memperblehkan menyentuh mushaf meskipun tidak memiliki wudlu dikarenakan menafsirkan ayat ini sebagai Al-Qur\'an yang dimaksud adalah yang berada di lauhul Mahdudz dan disentuh oleh para malaikat, bukan mushaf yang ada di tangan manusia.\n2. Hadits : Alla yamassal Qur\'ana illa Thohirun (HR. Malik). Disini kata Thahir sebagian ulama menafsirkannya sebagai muslim, bukan harus orang yang sedang berwudlu. Ditambahkan dengan hadits yang berbunyi sebagai berikut : innal mu\'mina laa yanjusu (HR. Bukhari Muslim). hadits ini mengatakan bahwa sesungguhnya seorang muslim tidaklah najis', '2026-06-18 11:20:20', '2026-06-18 11:45:32'),
(2995, 10, 17, 'Tidak ada ayat al-qur\'an atau hadis yang secara eksplisit membahas HP atau Al-Qur\'an Digital, karena teknologi tersebut tidak ada pada zaman nabi. ulama yang melarang menyentuh atau membuka aplikasi Al-Qur\'an di HP Tanpa Wudlu biasanya menggunakan Qiyas (analogi) kepada hukum mushaf dengan dalil Al-Waqi\'ah : 79', '2026-06-18 11:30:27', '2026-06-18 11:31:56'),
(2997, 47, 15, 'لَا يَمَسُّهُ اِلَّا الْمُطَهَّرُوْنَ\nArtinya : Tidak ada yang menyentuh kecuali orang orang yang di sucikan \n(Q.S Al Waqi\'ah :79)', '2026-06-18 11:30:36', '2026-06-18 11:36:57'),
(3019, 10, 18, '1. Kaidah Fikih : Al Ashlu Fiil Asyaa\'il Ibaahati, Karena tidak ada ayat atau hadis yang secara tegas melarang menyentuh HP berisi Al-Qur\'an tanpa wudlu, maka hukumnya tetap boleh sampai ada dalil yang melarang\n2. Hadits : Kaana nabiyyu SAW yadzkurullaha ala kulli ahyaanihi (HR. Muslim). Al-Qur\'an adalah bagian dari dzikir kepada allah. dari hadits ini, mereka memahami bahwa keadaan tidak berwudlu tidak menghalangi seseorang untuk berdzikir dan membaca Al-Qur\'sn (Selama bukan keadaan junub)', '2026-06-18 11:33:13', '2026-06-18 11:36:50'),
(3083, 10, 19, 'Imam Syafi\'i, Imam Maliki, Imam hambali', '2026-06-18 11:37:54', '2026-06-18 11:38:04'),
(3085, 47, 16, 'يَا اَهْلَ الْكِتَابِ تَعَالَوْااِلَى كَلِمَةٍ سَوَاءٍ بَيْنَنَا وَبَيْنَكُمْ\nArtinya : Wahai ahli kitab! Marilah berpegang kepada suatu kalimat (ketetapan) yang tidak ada perselisihan antara kami dan kamu', '2026-06-18 11:39:23', '2026-06-18 11:43:42'),
(3086, 10, 20, 'Daud Az-Zahiri, Ibnu Hazm Al-Andalusi, Al-Imam Al-Qurthubi', '2026-06-18 11:39:25', '2026-06-18 11:39:33'),
(3105, 10, 21, 'Perbedaan pendapat mengenai hukum menyentuh Al-Qur\'an tanpa wudlu muncul karena adanya perbedaan penafsiran terhadap dalil yang digunakan. Mayoritas ulama\' memahami QS. Al-Waqi\'ah : 79 dan hadis \'\"Tidak boleh menyentuh Al-Qur\'an Kecuali orang yang suci\" sebagai dasar kewajiban berwudlu sebelum menyentuh mushaf. Sementara itu, sebagian ulama berpendapat bahwa dalil tersebut tidak secara tegas mengatur mushaf di tangan manusia, sehingga mereka tidak mewajibkan Wudlu. Adapun Pada Al-Qur\'an digital di HP, banyak ulama kontemporer membedakannya dari mushaf karena sifatnya yang tidak permanen dan tersimpan dalam perangkat Multi fungsi.\nKesimpulan :\nMayoritas ulama melarang menyentuh AL-Qur\'an tanpa Wudlu, sedangkan sebagian ulama memperbolehkannya karena perbedaan pemahaman terhadap dalil. Untuk Al-Qur\'an digital pada HP, pendapat yang banyak diikitui saat ini adalah boleh menyentuh Al-Qur\'an dan membacanya tanpa Wudlu karena tidak disamakan dengan mushaf. Namun, Wudlu tetap lebih utama sebagai bentuk penghormatan terhadap Al-Qur\'an.', '2026-06-18 11:41:55', '2026-06-18 11:51:58'),
(3142, 47, 17, 'لَا يَمَسُّهُ اِلَّا الْمُطَهَّرُوْنَ\nArtinya : tidak ada yang menyentuh kecuali orang orang yang di sucikan \n(Q.S Al waqi\'ah :79)\n', '2026-06-18 11:47:06', '2026-06-18 11:48:31'),
(3161, 47, 18, 'يَا اَهْلَ الْكِتَابِ تَعَالَوْااِلَى كَلِمَةٍ سَوَاءٍ بَيْنَنَا وَبَيْنَكُمْ\nArtinya : Wahai alhli kitab! Marilah berpegang kepada suatu kalimat (ketetapan) yang tidak ada perselisihan antara kami dan kamu', '2026-06-18 11:48:43', '2026-06-18 11:51:43'),
(3210, 47, 19, 'Imam Syafi\'i\nImam Malik\nImam Ahmad bin Hambal', '2026-06-18 11:52:06', '2026-06-18 11:52:25'),
(3219, 47, 20, 'Dawud Az zahiri\nIbnu Hazm\nAsy Syaukani', '2026-06-18 11:52:45', '2026-06-18 11:53:04'),
(3223, 47, 21, 'Menurut saya pendapat yang melarang menyentuh mushaf tanpa wudhu itu lebih kuat karena di dukung oleh mayoritas ulama. Kemudian al qur\'an  di hp berbeda dengan mushaf, sehingga lebih kuat pendapat yang membolehkan tanpa wudhu. Mushaf sebaiknya di pegang dalam keadaan berwudhu, kalai al qur\'an di hp boleh tanpa wudhu meskipun lebih utama dalam keadaan suci', '2026-06-18 11:54:24', '2026-06-18 11:57:41'),
(3239, 25, 18, 'Qs.alwaqiah:79.\nDan hadits: la yamsa al quran illa thoir.', '2026-06-20 08:21:26', '2026-06-20 08:22:15'),
(3247, 25, 15, 'Alla yamsa al quran illa thoir.\nSedangkan Qs al waqiah : 79 di gunakan oleh banyak ulama sebagai dalil pendukung atau penguat.', '2026-06-20 08:24:29', '2026-06-20 08:25:55'),
(3256, 25, 17, 'La yamsa al quran illa thoir ', '2026-06-20 08:27:41', '2026-06-20 08:27:56'),
(3259, 25, 19, 'Imam malik,imam syafi\'i,imam ahmad bin hanbal,', '2026-06-20 08:29:01', '2026-06-20 08:29:30'),
(3266, 25, 20, '1.Dawud az,zahiri\n2.Ibnu hazm\n3.Muhammad bin ali asy.syaukani', '2026-06-20 08:31:07', '2026-06-20 08:32:07'),
(3279, 25, 21, 'Menurut saya tidak boleh menetapkan larangan kecuali dengan dalil yang jelas./ Jangan awur awuran..mungkin itu saja ustad.', '2026-06-20 08:34:05', '2026-06-20 08:35:13'),
(3286, 25, 16, 'La yamsa al quran bit thoir', '2026-06-20 08:35:44', '2026-06-20 08:35:59'),
(3288, 22, 16, 'An la yamassal-qur\'ana illa thahir (HR. Malik)\n', '2026-06-20 12:00:13', '2026-06-20 12:27:59'),
(3299, 22, 19, '1. Imam malik 2. Imam asy.syafi\'i 3. Imam ahmad bin handal\n', '2026-06-20 12:14:02', '2026-06-20 12:28:15'),
(3307, 22, 20, '1. Ibnu abbas 2. Dawud 3. Ibnu hazm\n', '2026-06-20 12:15:26', '2026-06-20 12:28:22'),
(3321, 22, 17, 'La yamassul qur\'ana illa thahir (qs. Al-waqi\'ah:79)\n', '2026-06-20 12:23:57', '2026-06-20 12:28:06'),
(3328, 22, 18, 'Al-ashlu fil asyyaa\'i al ibaahah\n', '2026-06-20 12:25:54', '2026-06-20 12:28:11'),
(3343, 42, 15, 'الا يمس القران الا طاهر HR. Malik dalam Al-Muwaththa\', Ad-Daraquthni dan Al-Baihaqi', '2026-06-22 06:07:54', '2026-06-24 02:56:42'),
(3345, 35, 15, 'Surah Al-Waqi\'ah ayat 79', '2026-06-22 19:29:16', '2026-06-22 19:29:44'),
(3347, 35, 16, 'Dari suarah Al - Waqiah ayat 79 memwajibkan berwudhu\nHampir semua ulama memwajibkan kecuali dari madzab dzahiri dan sebagian sahabat (ibnu abbas)\nBoleh menyentuh asal tidak orang sedang junub', '2026-06-22 19:34:27', '2026-06-22 19:46:12'),
(3368, 35, 17, 'Untul dalil utama merujuk al waqiah ayat 79\nYang menjadikan boleh itu di qiyas tapi karena ada alasan begini karena al quran digital beda dari mushaf', '2026-06-22 19:47:57', '2026-06-22 19:49:32'),
(3378, 35, 18, 'Hadis amr bin hazm\nJanganlah seseorang menyentuh al quran kecuali orang yang suci \nArti dari suci/ tahir adalah hadas besar', '2026-06-22 19:51:37', '2026-06-22 19:55:15'),
(3389, 35, 19, 'Imam syafii, imam maliki, imam abu hanifah', '2026-06-22 19:55:48', '2026-06-22 19:56:20'),
(3393, 35, 20, 'Ibnu abbas, dawud al dzahiri , ibnu hazm al- andalusia', '2026-06-22 19:57:05', '2026-06-22 19:57:53'),
(3399, 35, 21, 'Hadis/ayat membolehkan menyentuh mushaf tanpa wudhu, dalil melarang menyentuh al-quran di hp tanpa wudhu, dalil membolehkan menyentuh al- quran di hp tanpa wudhu , makna tahir, ulama yang melarang menyentuh mushaf tanpa wudhu, ulama yang membolehkan menyentuh mushaf tanpa wudhu', '2026-06-22 19:58:24', '2026-06-22 20:02:12'),
(3419, 35, 1, 'Qunut secara bahasa artinya berdoa\nSecara istilah fiqih doa yang dibaca saat sholat setelah ruku\' atau sebelum sujud', '2026-06-22 20:04:40', '2026-06-22 20:06:00'),
(3427, 35, 2, 'Rasulullah SAW senantiasa membaca qunut ketika sholat subuh hingga beliau wafat (HR Ahmad)', '2026-06-22 20:07:05', '2026-06-22 20:08:46'),
(3445, 35, 3, 'Rasulullah SAW melakukan qunut selama sebulan, mendoakan kebinasaan atas kabilah tertentu, kemudian beliau meninggalkannya (HR bukhari dan muslim)', '2026-06-23 06:31:46', '2026-06-23 06:33:07'),
(3455, 35, 4, 'Rasulullah SAW senantiasa membaca qunut dalam sholat subuh hingga beliau wafat (HR Ahmad,Daruquthni)', '2026-06-23 06:33:50', '2026-06-23 06:34:56'),
(3464, 35, 5, 'Rasulullah SAW melakukan qunut selama sebulan, mendoakan kebinasaan atas kabilah tertentu, kemudian beliau meninggalkannya (HR bukhari dan muslim)', '2026-06-23 06:36:55', '2026-06-23 06:38:19'),
(3474, 35, 6, 'Imam syafi\'i\nImam malik bin anas\nImam nawawi', '2026-06-23 06:39:05', '2026-06-23 06:39:24'),
(3477, 35, 7, 'Imam abu hanifah\nImam ahmad bin hambal\nIbnu qayyim al-jauziyyah', '2026-06-23 06:40:00', '2026-06-23 06:40:35'),
(3482, 7, 15, 'لايمسه الا المطهرون\nSurah al waqiah ayat 79\nان لا يمس القران الا طاهر\n(HR. Malik dalam al muwatha\' dan ad darimi)', '2026-06-23 12:03:11', '2026-06-23 12:09:49'),
(3490, 7, 16, 'Al baqarah ayat 185 \nبينات من الهدى والفرقان\nDan\nشهر رمضان الذي انزل فيه القران هدى اللناس', '2026-06-23 12:05:52', '2026-06-23 12:07:52'),
(3535, 7, 19, '4 madzhab\nImam syafii, maliki, hambali, hanafi.', '2026-06-23 12:13:33', '2026-06-23 12:14:06'),
(3538, 7, 20, 'Madzhab zhahiriyah (imam ibnu hamz)', '2026-06-23 12:39:33', '2026-06-23 12:40:37'),
(3546, 7, 18, 'كان انبي صل الله عليه وسلم يذكر الله على كل احيانه \n(HR.Shahih muslim\nلا يمسه الامطهرون', '2026-06-23 12:52:23', '2026-06-23 12:53:53'),
(3565, 7, 17, 'لا يمسه الا امطهرون\nAl-waqiah\nلا يمس القران الا طاهر\n(HR.malik)', '2026-06-23 12:55:41', '2026-06-23 12:56:41'),
(3576, 7, 21, 'Menurut saya, \nMenyentuh mushaf wajib dalam keadaan suci, baik dari hadast kecil maupun besar, kecuali dalam keadaan dhorurot, seperti melihat al quran terjatuh atau ala quran berada di tempat yang tidak layak diperholehkan langsung menyentuh tanpa wudhu dg niat memulyakan al quran.\nBoleh orang berhadas menyentuh al quran tafsir dg catatan tafsirnaya lebih banyak dari ayat atau huruf huruf dalam alquran\nKhusus orang yang junub dilaranng membaca atau menyentuh al quran sebelum mandi wajib, tidak bisa disamakan dg haid dan nifas, karena junub bisa langsung segera bersuci tidak seperti haid dan nifaz yang durasinya lama, \nMenyentuh atau membaca al quran dihp hukumnya boleh tidak berwudhu karena yang dimaksudkan bukan mushaf tapi hp nya, ayat al quran yang ada di hp tidak bisa disamakan dengan mushaf, dia tetaplah hp jadi tidak sampai pada hukum wajib dalam bersuci saat membacanya, tapi dianjurkan jika niat mau membaca dihp tetap dalam keadaan suci untuk menghormati al quran.', '2026-06-23 12:57:01', '2026-06-23 13:03:56'),
(3638, 42, 16, 'لا يمسه الا المطهرون QS. Al-Waqiah : 79', '2026-06-24 02:57:24', '2026-06-24 02:58:23'),
(3646, 42, 17, 'الا يمس القران الا طاهر HR. Malik', '2026-06-24 02:58:43', '2026-06-24 02:59:37'),
(3656, 42, 18, 'كان النبي صلى الله عليه وسلم  يذكر الله على كل احيانه HR. Muslim', '2026-06-24 03:00:09', '2026-06-24 03:02:37'),
(3691, 42, 19, 'Muhammad bin Idris Asy-Syafi\'i, Malik bin Anas, Ahmad bin Hanbal', '2026-06-24 03:03:00', '2026-06-24 03:03:41'),
(3700, 42, 20, 'Dawud az-Zahiri, Ibnu Hazm, Muhammad Nasiruddin al-Albani', '2026-06-24 03:03:54', '2026-06-24 03:04:33'),
(3707, 42, 21, 'Mayoritas ulama melarang menyentuh mushaf tanpa wudhu, sedangkan sebagian ulama membolehkannya. Untuk Al-Qur\'an di hp, banyak ulama membolehkan tanpa wudhu. Saya lebih memilih berwudhu saat menyentuh mushaf sebagai bentuk penghormatan kepada Al-Qur\'an', '2026-06-24 03:05:41', '2026-06-24 03:07:17'),
(3726, 42, 2, 'عن انس ان اللنبي صلى الله عليه وسلم ما  زال يقنت في الفجر حتى فارق الدنيا HR.Ahmad dab Al-Baihaqi', '2026-06-24 03:11:02', '2026-06-24 03:13:50'),
(3758, 42, 3, ' ان النبي صلى الله عليه وسلم قنت شهرا ثم تركه HR. Bukhari dan Muslim', '2026-06-24 03:14:00', '2026-06-24 03:16:26'),
(3778, 42, 4, 'karena terdapat hadist bahwa Nabi SAW terus melakukan qunut aubuh hingga wafat  dan diamalkan oleh sebagian sahabat', '2026-06-24 03:16:37', '2026-06-24 03:17:24'),
(3787, 42, 5, 'karena hadist yang shahih menunjukkan Nabi SAW hanya berqunut sementara waktu ketika terjadi musibah, kemudian meninggalkannya', '2026-06-24 03:17:34', '2026-06-24 03:18:25'),
(3793, 42, 6, 'Muhammad bin Idris As-Syafi\'i, Yahya bin Syaraf An-Nawawi, Ibnu Hajar Al-Haitami', '2026-06-24 03:18:37', '2026-06-24 03:19:17'),
(3798, 42, 7, 'Abu Hanifah, Ahmad bin Hanbal, Muhammad Nasiruddin al-Albani', '2026-06-24 03:19:33', '2026-06-24 03:20:03'),
(3805, 28, 15, '\"tidak ada yang menyentuhnya selain orang-orang yang disucikan\" Q.S al-waqiah : 79', '2026-06-24 22:47:39', '2026-06-24 22:48:31'),
(3811, 28, 16, 'hadis nabi : \n\"sesungguhnya seorang mukmin itu tidak najis\" Hadist Riwayat Bukhori', '2026-06-24 22:49:56', '2026-06-24 22:50:41');
INSERT INTO `jawaban` (`id`, `mahasiswa_id`, `soal_id`, `isi`, `created_at`, `updated_at`) VALUES
(3816, 28, 17, 'tidak ada dalil/hadist yang secara eksplisit melarang menyentuh al-quran di hp dlm keadaan tidak wudhu tapi beberapa ulama tetap berpedoman dengan hadist \"janganlah menyentuh al-qur\'an kecuali orang-orang yang suci\" hadist riwayat imam malik', '2026-06-24 22:52:17', '2026-06-24 22:55:04'),
(3822, 28, 18, 'dalil yang digunakan ulama bukan dalil baru tetapi penafsiran yang berbeda terhadap satu hadist yang sama, sejumlah ulama kontemporer memperbolehkan membolehkan membaca atau menyentuh mushaf didalam hp karna hp adalah perangkat elektronik', '2026-06-24 22:56:55', '2026-06-24 22:58:07'),
(3825, 28, 19, '1. muhammad ibn idris as-syafii\n2. malik ibn anas\n3. ahmad ibn hanbal', '2026-06-24 22:59:37', '2026-06-24 23:00:23'),
(3831, 28, 20, '1. dawud al zahiri\n2. ibn hazm\n3. muhammad nasiriddin al albani', '2026-06-24 23:00:50', '2026-06-24 23:01:20'),
(3834, 28, 21, 'menurut analisis saya, saya setuju dengan pendapat ulama yang melarang menyentuh mushaf tanpa wudhu karna sebagai bentuk penghirmatan kita terhadap al-quran jadi sebaiknya sebelum membaca ataupun menyentuh kita memastikan diri kita suci dari hadas ataupun najis terlebih dahulu', '2026-06-24 23:02:34', '2026-06-24 23:04:02'),
(3836, 31, 15, '\"tidak ada yang menyentuhnya kecuali orang-orang yang disucikan\" (Q.S Al-Waqi\'ah: 79)', '2026-06-24 23:22:59', '2026-06-24 23:24:11'),
(3844, 31, 16, 'anak kecil membawa buku berisi ayat al-qur\'an diperbolehkan oleh para ulama, dan kelompok zhahiriyah menafsirkan al-muthoharun adl para malaikat bukan manusia yang berwudhu.\n\n\n\"dalam kitab yang terpelihara. tidak menyentuhnya kecuali yang disucikan\" (Q.S Al-Waqi\'ah: 78:79)', '2026-06-24 23:25:17', '2026-06-24 23:37:05'),
(3875, 31, 17, 'ulama kontemporer mengqiayaskan aplikasi al-qur\'an digital dengan mushaf, karena kehormatan al-qur\'an dijaga sebegaimana mushaf cetak.\n\n\"tidak boleh menyentuh al-qur\'an kecuali orang yang bersuci\" (HR. malik dan ad-darimi) dalam kitab al-muwatho\'\n\n', '2026-06-24 23:33:58', '2026-06-24 23:41:54'),
(3894, 31, 18, '\"orang-orang yang sedang berhadast tidak haram membaca al-qur\'an di luar hafalan (pakai lisan). namun yang lebih utama adalah dalam keadaan suci\" (abu al-ma\'ali al-juaini)\n\nsyekh KH. Thaiful ali wafa menjelaskan bhw mmbca, mmbuka, mnyntuh al-qur\'an melalui apk digital diperbolehkan tanya wudu, karena tulisan pada layar tidak dihukumi sbg mushaf.\n\n', '2026-06-25 00:00:25', '2026-06-25 00:06:00'),
(3913, 31, 20, 'syekh KH.Thaiful ali wafa, ibnu hazn al-andalusia, dawud az-zahiri', '2026-06-25 00:06:14', '2026-06-25 00:09:36'),
(3916, 31, 19, 'imam syafi\'i, imam malik bin anas, imam abu hanifah', '2026-06-25 00:07:02', '2026-06-25 00:07:17'),
(3924, 31, 21, 'perbedaan pendapat ulama terjadi karena beda dalam menafsirkan terhadap surah al-waqiah ayat 79. ulama jumhur mewajibkan wudu saat menyentuh mushaf, sedangkan ulama zahiriyah menafsirkan ayat tersebut hanya tertuju kepada malaikat, maka bole menyentuh mushaf tidak wudu. pada mushaf digital, mayoritas ulama kontemporer memperbolehkan karena hp tidak dianggap sbg mushaf, meskipun wudu digunakan sebagai bentuk penghormatan kpd al-qur\'an.\n\n', '2026-06-25 00:09:38', '2026-06-25 00:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id` int(11) NOT NULL,
  `tema_id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `jenis` enum('ganda','uraian','file') NOT NULL DEFAULT 'uraian',
  `opsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`opsi`)),
  `urutan` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `tema_id`, `pertanyaan`, `jenis`, `opsi`, `urutan`, `created_at`) VALUES
(1, 1, 'Jelaskan apa yang dimaksud dengan Qunut!', 'uraian', NULL, 0, '2026-06-11 03:50:50'),
(2, 1, 'Tuliskan Hadis yang dipakai dasar oleh ulama yang mengatakan bahwa Qunut Shubuh hukumnya Sunnah!', 'uraian', NULL, 0, '2026-06-11 04:11:24'),
(3, 1, 'Tuliskan Hadis yang dipakai dasar oleh ulama yang mengatakan bahwa tidak ada Sunnah Qunut pada waktu shubuh!', 'uraian', NULL, 0, '2026-06-11 04:11:45'),
(4, 1, 'Tuliskan alasan Ulama yang mengatakan bahwa Qunut Shubuh Hukumnya Sunnah!', 'uraian', NULL, 0, '2026-06-11 04:12:15'),
(5, 1, 'Tuliskan alasan Ulama yang mengatakan bahwa Qunut Shubuh bukanlah Sunnah!', 'uraian', NULL, 0, '2026-06-11 04:12:25'),
(6, 1, 'Tuliskan tiga nama Ulama\' yang mengatakan bahwa Qunut Shubuh Hukumnya Sunnah!\n(Pastikan bukan nama organisasi)', 'uraian', NULL, 0, '2026-06-11 04:13:03'),
(7, 1, 'Tuliskan tiga nama Ulama\' yang mengatakan bahwa Qunut Shubuh bukanlah Sunnah!\n(Pastikan bukan nama organisasi)', 'uraian', NULL, 0, '2026-06-11 04:13:11'),
(8, 2, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk melarang menyentuh Mushaf dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:28:49'),
(9, 2, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk memperbolehkan menyentuh Mushaf dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:29:02'),
(10, 2, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk melarang menyentuh al Qur\'an di hp dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:29:20'),
(11, 2, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk memperbolehkan menyentuh al Qur\'an di hp dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:29:30'),
(12, 2, 'Tulis 3 nama Ulama\' yang melarang menyentuh mushaf al Qur\'an dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:30:03'),
(13, 2, 'Tulis 3 nama Ulama\' yang memperbolehkan menyentuh mushaf al Qur\'an dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:30:11'),
(14, 2, 'Berikan Analisis dan Kesimpulan dari 6 pertanyaan di atas!', 'uraian', NULL, 0, '2026-06-17 23:32:12'),
(15, 3, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk melarang menyentuh Mushaf dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:48:45'),
(16, 3, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk memperbolehkan menyentuh Mushaf dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:48:53'),
(17, 3, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk melarang menyentuh al Qur\'an di hp dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:49:00'),
(18, 3, 'Tulis Hadis/ ayat yang dijadikan dasar para ulama\' untuk memperbolehkan menyentuh al Qur\'an di hp dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:49:08'),
(19, 3, 'Tulis 3 nama Ulama\' yang melarang menyentuh mushaf al Qur\'an dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:49:15'),
(20, 3, 'Tulis 3 nama Ulama\' yang memperbolehkan menyentuh mushaf al Qur\'an dalam keadaan tidak wudlu?', 'uraian', NULL, 0, '2026-06-17 23:49:26'),
(21, 3, 'Berikan Analisis dan Kesimpulan dari 6 pertanyaan di atas!', 'uraian', NULL, 0, '2026-06-17 23:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `urutan` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tema`
--

INSERT INTO `tema` (`id`, `tugas_id`, `nama`, `urutan`, `created_at`) VALUES
(1, 1, 'Hukum Qunut Ketika Shalat Shubuh', 0, '2026-06-11 03:50:39'),
(2, 1, 'Hukum Membuka al Qur\'an di Handphone', 0, '2026-06-17 23:27:36'),
(3, 2, 'Menyentuh Mushaf', 0, '2026-06-17 23:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id`, `judul`, `deskripsi`, `deadline`, `created_at`, `updated_at`) VALUES
(1, 'Mata Kuliah Masail Fiqhiyah', 'Membahas Masalah-Masalah Fiqh', '2026-06-25', '2026-06-11 03:50:26', '2026-06-11 03:58:13'),
(2, 'Masail Fiqhiyah 2', '', '2026-06-25', '2026-06-17 23:48:22', '2026-06-17 23:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT 'NIM untuk mahasiswa',
  `password` varchar(255) NOT NULL,
  `role` enum('admin','mahasiswa') NOT NULL DEFAULT 'mahasiswa',
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(20) DEFAULT NULL COMMENT 'Hanya untuk mahasiswa',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama`, `kelas`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$FYl.aYEyyvQS2r2ITKtiYeO3O6uT875qH.lhJ/WhRU7XUyzb17mya', 'admin', 'Administrator', NULL, '2026-06-11 03:22:41', '2026-06-11 03:30:26'),
(2, '23051021', '$2y$10$JiAKjig.n4pranWcpzS8hexYRUwO72QpjGIwGVQtA9jVdKh09p5v6', 'mahasiswa', 'ahmad dhiya uddin nabhan', '6B', '2026-06-11 03:43:50', '2026-06-11 03:43:50'),
(3, '23051023', '$2y$10$qyzHEFkG1/Z8HPpslLQW9OYKLgs8vthXp60oXILlJCYGq9eIK3WV.', 'mahasiswa', 'Ahmad Fakhrusy syakirin Al Haqiqi', '6B', '2026-06-11 03:43:50', '2026-06-11 03:43:50'),
(4, '23051034', '$2y$10$rdQeQ6oCVFz9Q9.vpBSS8Ov0P5Vjw6nYKvF2Mu5GgLTbuILV5DQAa', 'mahasiswa', 'MOH. SABIQ ANNAUWAL', '6B', '2026-06-11 03:43:51', '2026-06-11 03:43:51'),
(5, '23051035', '$2y$10$OMdaUThYWKnBMzMR9mvgle6TNmVCT9wslVOvQv7o9qp1ovkTIBJcS', 'mahasiswa', 'MUH.SYAHRUL RAMADHAN', '6B', '2026-06-11 03:43:51', '2026-06-11 03:43:51'),
(6, '23051036', '$2y$10$hjagjHNPfx3sXQtBjhb8qekD396dwwld4qBR9K4N1jJrtivv75SU6', 'mahasiswa', 'MOHAMMAD ARJU SYAFA', '6B', '2026-06-11 03:43:51', '2026-06-11 03:43:51'),
(7, '23051037', '$2y$10$mAQRFjGEKMDjtumnjtF0COYcKEs/p6wChj3I..yjIB80ZKhrhy4wa', 'mahasiswa', 'HIDAYATUN NI\'MAH', '6B', '2026-06-11 03:43:51', '2026-06-11 03:43:51'),
(8, '23051040', '$2y$10$kUo4tv6fVPtlw8bEXyVcGeiu.0QjCMZSDT/ZfjMAQDQHr4BlVr9CO', 'mahasiswa', 'OLIVIA MAULIDATUR ROHMA', '6B', '2026-06-11 03:43:51', '2026-06-11 03:43:51'),
(9, '23051041', '$2y$10$7NzobcF6mfJqBnC5KcqFAeLwRHe/6.aJ16tjk05j.1VovHm2YyM42', 'mahasiswa', 'FATIMATUZ ZAHRO', '6B', '2026-06-11 03:43:51', '2026-06-11 03:43:51'),
(10, '23051042', '$2y$10$9lqCUPM2JpjgV0dAliMoxeuGLCaWH4cbhpjxAPV48TXzItVfLgJ5S', 'mahasiswa', 'ROSIKHOTUN NADIYAH', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(11, '23051043', '$2y$10$/gtxxKVkutWUDRPI/PBRyODsZjYDMevxi2SpUzIax5HUT5b.RBNRq', 'mahasiswa', 'Nabilah shouniyah', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(12, '23051044', '$2y$10$Mf.J2dS2r8Sm43gHI1LwveSlq5pQZQ6bFIBJE/LHyvAWT2cdUOTr.', 'mahasiswa', 'MAFTUKHAH', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(13, '23051047', '$2y$10$KmJEcTd5Nm9yXuoYk5.X9e6r.oBDuVoF6.aQ/WRU44SUE9kqqvx1u', 'mahasiswa', 'AHMAD UMAR SYARIFUDDIN', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(14, '23051048', '$2y$10$ALJOeXr3vWE7tWMZOpgMwehPi6TgFLxFzDKhfnXm4hXTsta.NaDay', 'mahasiswa', 'GITA DWI NUR AINI', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(15, '23051049', '$2y$10$DhVOo/Dg4re0m0aDJE6.Qe5KoHM3ANvoKyHIVDO3kKV/nH0FuvQ7q', 'mahasiswa', 'RIFTA AMALIYA KHOIRUN NISA\'', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(16, '23051050', '$2y$10$1/SmGPUe6qe4L9LJt2iZu.NiFSKpJwMLX2vlesXszVkFo1aEXaKwS', 'mahasiswa', 'BAGUS RIZKY SAPUTRA', '6B', '2026-06-11 03:43:52', '2026-06-11 03:43:52'),
(17, '23051053', '$2y$10$VS9bYb2C6n9PiYlV4ogjP.3aRaRCBvTnxHyvtGCJtgmepKuyTo21m', 'mahasiswa', 'AHMAD WAHYUDIN TAMAMI', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(18, '23051066', '$2y$10$fg3sC3DxuTYJxwil3NiHreMM3d.97S4/B702MB7P7XWZDjDl9TG9O', 'mahasiswa', 'Yogi Noviana', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(19, '23051076', '$2y$10$v6v5TvKhL2dBBn2w2ivQHu9weXaPShSngbi.RFaV/WYfMJVEAgkPC', 'mahasiswa', 'Moch. Barik Shohibun Ni\'am', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(20, '23051078', '$2y$10$RPJ8YhLwdo3za4pjUa3nC.7Q9sKBWa53AnhA3kiTfJh8XciNCkOoW', 'mahasiswa', 'KINANTI LADYSA IMANIAR', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(21, '23051081', '$2y$10$xuv25pG7/hnheQ31Cf8wRuILIXa8Vqm9NWCbaNH.KjQqznP4fmFJK', 'mahasiswa', 'NAUROTUN WAFIYAH', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(22, '23051086', '$2y$10$rE/SXxqR7ybk0hS8Ouwr9ug7SzRhUrQ5.L8lBWH4RRLH8cVtFoxIe', 'mahasiswa', 'LISTRI CAHYATI', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(23, '23051141', '$2y$10$wKiFvMkKJ6g6BpcWRYZ15u9yWdlC8bXQDFipN5G9HzlBBoQVQc6Kq', 'mahasiswa', 'MUHAMMAD FARIZI AL LATIEF', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(24, '23051150', '$2y$10$b4/HCPd6QEFQkuIBTIAg.e9OfRANqJHUPI6hb912x.qPsFK0acRI.', 'mahasiswa', 'ALFI ARDILLA', '6B', '2026-06-11 03:43:53', '2026-06-11 03:43:53'),
(25, '23051157', '$2y$10$Qep12QONWIEtEegsUt.8TOY8RMaPxveeFoLg1PBo45JrtH4mU3Iee', 'mahasiswa', 'Sukron ma\'mun', '6B', '2026-06-11 03:43:54', '2026-06-11 03:43:54'),
(26, '23051054', '$2y$10$BiLLeKU9VZ39hdHGqf5m.OIJR2jhKL/HIzx0Vsl6V1BFupf7Q0GG2', 'mahasiswa', 'Ahmad Muzayyan Abul Aula', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(27, '23051068', '$2y$10$KtLLXTOacy58TNRapMnPHexB/1GG8fYyP/T/rJ6mraAipGuhzfrru', 'mahasiswa', 'Zuni jumanasari', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(28, '23051069', '$2y$10$yhP.6rF8C.kIC8tU/wgbxetzneX2UfxFs.mymSSkK5vJupbmWHaSC', 'mahasiswa', 'NICHDAH ROICHATUL JANNAH', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(29, '23051080', '$2y$10$rIOlhgJygYhlR3P0UyNMgO3AIWImMYNFuoBU0ObqeNz.6NUs2MQse', 'mahasiswa', 'Isnaini Alifatur Rohmah', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(30, '23051087', '$2y$10$GDw8o5JfB4XFRbdaxIb7I.H/TWWvNj8g9nNrMLDnWTNlplfteSfeW', 'mahasiswa', 'Widiya Arini Rahmawati', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(31, '23051096', '$2y$10$ibUg3AHQw4Nh/ihiIy7W6uK9zI5UVaP0fEWqoIuTWcWHBjufBU/3y', 'mahasiswa', 'HIMMATUL FITRIA', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(32, '23051102', '$2y$10$YLRYNhe.97K/zwIIvhIgpOBXc2MBtE0.VRh.FJSq563KC8xOdf592', 'mahasiswa', 'Fatimatul hidayah', '6C', '2026-06-11 03:44:48', '2026-06-11 03:44:48'),
(33, '23051105', '$2y$10$PAhokml.wvpV0KS8jm0Ycu.gdaPIM3WV.8O1C2Tl95I13Z726i2FC', 'mahasiswa', 'BETTY RACHMADHANY', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(34, '23051107', '$2y$10$zu1n4Mw65UG4h4qyd/.rve6ihJ2mM.AWFi8EjhI28tEcsbDf6Ghfi', 'mahasiswa', 'FRIPDA BAGUS SETIAWAN', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(35, '23051108', '$2y$10$eKtDMRxclhewIQBg7SA7.O6A4vRDigUAlCff.7Ekj9iB1jHZxAsT2', 'mahasiswa', 'MOH. FAJAR ALFIANSYAH', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(36, '23051111', '$2y$10$cjUjqnxshNiS4lambKXivOD5rr/7Ub7eVl.al8YLYxRDOnYHDvbBi', 'mahasiswa', 'PUTRI AVNITA MAHFUDZOH', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(37, '23051114', '$2y$10$89ydMkTLNyVJAp9qskVfz.Xzp8aXYKXLgygHmLnrVZCheXxMlmnyq', 'mahasiswa', 'MUHAMMAD IZAL FAIZIN', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(38, '23051115', '$2y$10$rUCwNFBzc0SWQwQug.9Ia.Zj0tW5/uW2z/YShg4TpJgJhlPolCCjW', 'mahasiswa', 'IHDINATUL JANNAH', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(39, '23051118', '$2y$10$GI2AxEEOjy9eniBhW5IaDexyeaffMZrw1ee7N0To6Y8aGQlBhCV1q', 'mahasiswa', 'putri isnaini', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(40, '23051122', '$2y$10$YcB/YLie.O.cPtkQje.KGuLQDNB/qnXwWkXsYW1k2wFHOSvpG7Bei', 'mahasiswa', 'Nela Yusnita Anggraeni', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(41, '23051129', '$2y$10$COMT.HFnn7bm9/rjw2BgC.nLjclhrVHVVQakZdUYTGepuClvRNsjy', 'mahasiswa', 'AHMAD ZAINAL AZKY', '6C', '2026-06-11 03:44:49', '2026-06-11 03:44:49'),
(42, '23051130', '$2y$10$7Jz7jnZrMnFnPM5AnRmEqeDbB35.LZzxxnCoIXkJDe6fDDHuF0Y5.', 'mahasiswa', 'Nabilah Arifah El-zahra', '6C', '2026-06-11 03:44:50', '2026-06-11 03:44:50'),
(43, '23051132', '$2y$10$nTYGp.Y..GkQqJEcJbnGRuF0JA7g6GauQQQuHGkxuExfeNE3mEp7u', 'mahasiswa', 'SITI NUR NIKMATUL ZAENAB', '6C', '2026-06-11 03:44:50', '2026-06-11 03:44:50'),
(44, '23051133', '$2y$10$w1LMt1t21.a3mmtn.M/URea7gb7t/Z.WGKoS.cpzSXKTTiQa80Ude', 'mahasiswa', 'Khofifah', '6C', '2026-06-11 03:44:50', '2026-06-11 03:44:50'),
(45, '23051135', '$2y$10$EF0yiWhOibZDvKGnZDC9MOGrqXG7fxzqs0IMn0oKjFditrYPtiHkW', 'mahasiswa', 'AHMAD NUR SIDDIQI', '6C', '2026-06-11 03:44:50', '2026-06-11 03:44:50'),
(46, '23051138', '$2y$10$nd/9rnCd.ZPoQg.HJLvtmeBTsjq37fenStpGGJ.U3nD3o5VTp8Yla', 'mahasiswa', 'SYAFIRA NISAUL ABDILLAH', '6C', '2026-06-11 03:44:50', '2026-06-11 03:44:50'),
(47, '23051142', '$2y$10$JsfhvtZSOU773zFIBE92XesGpFIqMzPcwXCX7D87lu4BqQKCSPmra', 'mahasiswa', 'Muthi\'a Nafisatun Najwa', '6C', '2026-06-11 03:44:51', '2026-06-11 03:44:51'),
(48, '23051146', '$2y$10$ph0LAaiyEAOFS0WCl9.Xc.kxEngFmLpqbWJyEwDgcyd9LKhyb7JCK', 'mahasiswa', 'TUKHIBAH NUR RIZQIA', '6C', '2026-06-11 03:44:51', '2026-06-11 03:44:51'),
(49, '23051152', '$2y$10$2wwCM7kr8cbSrqCBfn0Da.0i/nxg/1R0S9mhwEAIf.Xmv/VH5JCTC', 'mahasiswa', 'RIZKIYAH FITROTUN NISA\'', '6C', '2026-06-11 03:44:51', '2026-06-11 03:44:51'),
(50, '23051154', '$2y$10$X6QRg.5blKx1Xny.nuc3N.fmv4qKR5TUSia1sPvuSvfAK0xtoQPCG', 'mahasiswa', 'Amanda rifqiyah', '6C', '2026-06-11 03:44:51', '2026-06-11 03:44:51'),
(51, '23051158', '$2y$10$yKtHEAcgpS8n.WFw.3RCDeoq0rQVD1DoNX69rOl8V4pUCAnIwdFXe', 'mahasiswa', 'Rani Rusdiana', '6C', '2026-06-11 03:44:51', '2026-06-11 03:44:51'),
(52, '23051159', '$2y$10$5kSfFApaxGBlFuPBfhQ/6.vy0mbMxiVk5GEpdTPgPKRL.jMSapXEC', 'mahasiswa', 'Ainun nabila', '6C', '2026-06-11 03:44:52', '2026-06-11 03:44:52'),
(53, '2026010', '$2y$10$x1TTSJKbAWWiusDPqrkas.AN7pz.P.Q2x9zqEy0Ng0Mkl9IMJCerK', 'mahasiswa', 'QADRI ALIF MULIAWAN', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(54, '2026011', '$2y$10$ibjgnMtjgjTZZ1yPnaLFgui.c3QkP629Zv9o6lXZonNo2jrDHe3cy', 'mahasiswa', 'REINA', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(55, '2026012', '$2y$10$W6n4J2CFidMI2O1TYkJ4UOREmyyP8Uw27dD54mIfRHlOiWDK7XDfC', 'mahasiswa', 'NILA MAULIDIA', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(56, '2026013', '$2y$10$oYytoRaCJpTih03TYCMHG.9XeTEXf2bldc7wWt7z1BZ9nSFJCi6t.', 'mahasiswa', 'YUDI AFRIANTO', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(57, '2026014', '$2y$10$4R9grgaUxU66GWsvHwFJwuZhV2OtlBZECHWRQdaobKM04Um1rnpM2', 'mahasiswa', 'MUHAMMAD CHANDRA', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(58, '2026015', '$2y$10$UQHGO1SDeMuk8anj8m03tOCzDAxaLL31ZBYPYc7tcKjOifqqrgGTy', 'mahasiswa', 'AIDIL YAHYA', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(59, '2026016', '$2y$10$GZYW7FvH7x.SFIOmywUktus//JKlBa46I/GuJ6DPDZ4n0I5FIl0T6', 'mahasiswa', 'KIA FARHAN AT THORIQ', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(60, '2026017', '$2y$10$.DCFA4eEid6kMiHM0a5EtuJ801LP2bDQJwvY7lFIwct3/CqpW9BUy', 'mahasiswa', 'THIN ZAKIAH KULMA', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(61, '2026018', '$2y$10$Ml0H3G6pufSShKt9GayVHeWUtkuFK7Dz3GGZEavgKsUtQdfi0rBO2', 'mahasiswa', 'MUHAMMAD RISKY WAHYUDI', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45'),
(62, '2026019', '$2y$10$F8WSVokB2VxOIsTp8Mlarermrs8FG7mmsMkAdCxhi7JeUjWJgl/em', 'mahasiswa', 'MUHAMMAD QODRI', 'PAI-DN-1', '2026-08-15 15:20:45', '2026-08-15 15:20:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_jawaban` (`mahasiswa_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_nama` (`nama`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tema_id` (`tema_id`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3947;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD CONSTRAINT `jawaban_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `soal` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tema`
--
ALTER TABLE `tema`
  ADD CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
