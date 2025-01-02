-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2024 at 12:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asramakita`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int(11) NOT NULL,
  `kode_kamar` varchar(10) NOT NULL,
  `kapasitas` int(11) DEFAULT 3,
  `terisi` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `kode_kamar`, `kapasitas`, `terisi`) VALUES
(1, 'K101', 3, 0),
(2, 'K102', 3, 3),
(3, 'K103', 3, 0),
(4, 'K104', 3, 0),
(5, 'K105', 3, 0),
(6, 'K106', 3, 0),
(7, 'K107', 3, 0),
(8, 'K108', 3, 0),
(9, 'K109', 3, 1),
(10, 'K110', 3, 0),
(11, 'K111', 3, 0),
(12, 'K112', 3, 0),
(13, 'K113', 3, 0),
(14, 'K114', 3, 1),
(15, 'K115', 3, 1),
(16, 'K116', 3, 0),
(17, 'K117', 3, 0),
(18, 'K118', 3, 0),
(19, 'K119', 3, 0),
(20, 'K120', 3, 0),
(21, 'K121', 3, 0),
(22, 'K122', 3, 0),
(23, 'K123', 3, 0),
(26, 'K126', 3, 0);

--
-- Triggers `kamar`
--
DELIMITER $$
CREATE TRIGGER `assign_kode_kamar` AFTER INSERT ON `kamar` FOR EACH ROW BEGIN
    UPDATE mahasiswa
    SET kode_kamar = NEW.kode_kamar
    WHERE mahasiswa.kode_kamar = NEW.kode_kamar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `keluhan`
--

CREATE TABLE `keluhan` (
  `id_keluhan` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `kode_kamar` varchar(10) NOT NULL,
  `tanggal_keluhan` date NOT NULL,
  `keluhan` text NOT NULL,
  `status2` enum('Ditolak','Belum','Proses','Selesai') DEFAULT 'Belum',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keluhan`
--

INSERT INTO `keluhan` (`id_keluhan`, `nama_lengkap`, `nim`, `kode_kamar`, `tanggal_keluhan`, `keluhan`, `status2`, `created_at`) VALUES
(25, 'Firman Tua Parhusip', '220312604345', 'K115', '2024-12-25', 'Lampu tidak bisa nyala', 'Proses', '2024-12-25 07:15:30'),
(26, 'Muhamad Wafiq', '220312609035', 'K109', '2024-12-25', 'Keramik pecah', 'Selesai', '2024-12-25 07:18:55'),
(27, 'Imron', '220312603075', 'K102', '2024-12-25', 'listrik padam', 'Belum', '2024-12-25 07:22:15'),
(28, 'Fadhil Rohimi', '220123746589', 'K114', '2024-12-26', 'jendela rusak', 'Selesai', '2024-12-26 11:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(12) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `fakultas` varchar(20) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `tahunmasuk` int(11) NOT NULL,
  `ttl` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nohp` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kode_kamar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `full_name`, `fakultas`, `jurusan`, `tahunmasuk`, `ttl`, `alamat`, `nohp`, `email`, `password`, `kode_kamar`) VALUES
('220123746589', 'Fadhil Rohimi', 'FMIPA', 'KIMIA', 2022, '2004-11-11', 'Jl.Veteran Malang', '085946749354', 'fadhil12@gmail.com', '$2y$10$nXhHFgVIpWGquj4hjGyPN.E8ze2VjTdVNzPNXTjihMkSOFOzpDUlG', 'K114'),
('220312603075', 'Imron', 'FMIPA', 'MATEMATIKA', 2022, '2004-05-21', 'Jl.Veteran Malang', '085946749354', 'imron@gmail.com', '$2y$10$zL2wRT4rZHa08Nwg3VS5m.D8E6JEqmBjB.7C123XhqFW.bv6RM81a', 'K102'),
('220312604345', 'Firman Tua Parhusip', 'FMIPA', 'MATEMATIKA', 2022, '2004-03-10', 'Jl.Veteran Malang', '085975354799', 'firmanparhusip65@gmail.com', '$2y$10$e0s.1I6eOyUr6eXziVKqD.cMZ0k4c1Am6a2c0N3yPqQdYMAmyZtwm', 'K115'),
('220312605948', 'Affan Dzaki Abrar', 'MIPA', 'KIMIA', 2023, '2004-02-11', 'Jl. Gadang no. 15', '083276473864', 'affan@gmail.com', '$2y$10$tHeSySN4yTcdW.FnHyxfXO3Y076xbDyjZsXdhpS7IKt76KOAsA6H.', 'K102'),
('220312609022', 'Bintang Radinka', 'MIPA', 'FISIKA', 2021, '2003-12-12', 'Jl. Semarang', '082245673874', 'bintang@gmail.com', '$2y$10$.Ne5rxQGfhb2eQt1gzk56uWYBYr/Zs8Ob6mwSZf5bKlqIJUZuKJU2', 'K102'),
('220312609035', 'Muhamad Wafiq', 'FMIPA', 'MATEMATIKA', 2022, '2003-06-18', 'Jl.Veteran Malang', '083876453775', 'wafiq@gmail.com', '$2y$10$3ZrFTiu9869EvqdvcAQCXuLspXuzZn6MnkzS4VP/8y.Tz7rh/drjy', 'K109');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pem` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `Tanggal_pembayaran` datetime NOT NULL DEFAULT current_timestamp(),
  `periode` varchar(20) NOT NULL,
  `total` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status1` enum('Ditolak','Selesai','Proses','Belum') NOT NULL DEFAULT 'Belum',
  `full_name` varchar(50) NOT NULL,
  `kode_kamar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pem`, `nim`, `Tanggal_pembayaran`, `periode`, `total`, `file`, `status1`, `full_name`, `kode_kamar`) VALUES
(17, '220312604345', '2024-12-25 14:13:45', '1', 5000000, 'uploads/1735110825_PEmbayaran2.pdf', 'Selesai', 'Firman Tua Parhusip', 'K115'),
(18, '220312609035', '2024-12-25 14:18:34', '1', 5000000, 'uploads/1735111114_PEmbayaran2.pdf', 'Belum', 'Muhamad Wafiq', 'K109'),
(19, '220312603075', '2024-12-25 14:21:46', '1', 2700000, 'uploads/1735111306_684805987-soal-sem-1-mtk-kelas-2-kurikulum-merdeka.pdf', 'Selesai', 'Imron', 'K102'),
(20, '220312605948', '2024-12-25 14:23:59', '1', 500000, 'uploads/1735111439_PEmbayaran2.pdf', 'Selesai', 'Affan Dzaki Abrar', 'K102'),
(21, '220312609022', '2024-12-25 14:26:03', '1', 5000000, 'uploads/1735111563_PEmbayaran2.pdf', 'Proses', 'Bintang Radinka', 'K102'),
(22, '220123746589', '2024-12-26 18:21:09', '1', 2700000, 'uploads/1735212069_PEmbayaran2.pdf', 'Proses', 'Fadhil Rohimi', 'K114');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pen` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `Tanggal_Pendaftaran` datetime NOT NULL DEFAULT current_timestamp(),
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_pen`, `nim`, `Tanggal_Pendaftaran`, `file`) VALUES
(39, '220312604345', '2024-12-25 14:12:31', 'uploads/1735110751_Pendaftaran.pdf'),
(40, '220312609035', '2024-12-25 14:18:13', 'uploads/1735111093_Pendaftaran.pdf'),
(41, '220312603075', '2024-12-25 14:21:23', 'uploads/1735111283_Pendaftaran.pdf'),
(42, '220312605948', '2024-12-25 14:23:40', 'uploads/1735111420_Pendaftaran.pdf'),
(43, '220312609022', '2024-12-25 14:25:45', 'uploads/1735111545_Pendaftaran.pdf'),
(44, '220123746589', '2024-12-26 18:20:29', 'uploads/1735212029_Pendaftaran.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `pengelola_asrama`
--

CREATE TABLE `pengelola_asrama` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `foto_profil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengelola_asrama`
--

INSERT INTO `pengelola_asrama` (`id`, `nama_lengkap`, `nomor_telepon`, `jabatan`, `status`, `foto_profil`) VALUES
(1, 'Budi Harjono', '08954892400', 'Pengurus 1', 'Aktif', 'admin/image/1734407914_WhatsApp Image 2024-12-17 at 10.29.06_0422e2a5.jpg'),
(2, 'Rianto Wendy', '0982949329', 'Pengurus 2', 'Aktif', 'admin/image/1734408026_WhatsApp Image 2024-12-17 at 10.23.36_91e8edca.jpg'),
(9, 'Sumanto', '0895393687196', 'Pengurus 3', 'Tidak Aktif', 'admin/image/1734408271_WhatsApp Image 2024-12-17 at 10.28.51_2a9bbf53.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kode_kamar`);

--
-- Indexes for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`id_keluhan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pem`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pen`);

--
-- Indexes for table `pengelola_asrama`
--
ALTER TABLE `pengelola_asrama`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `id_keluhan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `pengelola_asrama`
--
ALTER TABLE `pengelola_asrama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
