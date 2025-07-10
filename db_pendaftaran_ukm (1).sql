-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jul 2025 pada 16.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pendaftaran_ukm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1752070776),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1752070776;', 1752070776);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_divisi` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id`, `nama_divisi`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Umum', 'Divisi yang menangani hal-hal umum dalam kegiatan UKM', NULL, NULL),
(2, 'Humas', 'Divisi yang bertanggung jawab atas hubungan masyarakat dan publikasi', NULL, NULL),
(3, 'Sekretaris', 'Divisi yang menangani pencatatan dan administrasi', NULL, NULL),
(4, 'Bendahara', 'Divisi yang bertanggung jawab terhadap keuangan UKM', NULL, NULL),
(5, 'Acara', 'Divisi yang mengatur penyelenggaraan acara dan kegiatan', NULL, NULL),
(6, 'Dokumentasi', 'Divisi yang mendokumentasikan kegiatan UKM', NULL, NULL),
(7, 'Publikasi', 'Divisi yang menyebarluaskan informasi dan promosi UKM', NULL, NULL),
(8, 'Anggota', 'Divisi untuk anggota biasa UKM', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_01_01_000001_create_ukm_table', 1),
(2, '0001_01_01_000000_create_users_table', 1),
(3, '0001_01_01_000001_create_cache_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2024_01_01_000002_create_divisi_table', 1),
(6, '2024_01_01_000003_create_pendaftar_table', 1),
(7, '2024_01_01_000004_seed_default_data', 1),
(8, '2024_01_01_000005_add_additional_columns', 1),
(9, '2024_01_01_000007_create_pengumuman_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftar`
--

CREATE TABLE `pendaftar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `angkatan` varchar(10) NOT NULL,
  `program_studi` varchar(100) NOT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  `alasan_bergabung` text NOT NULL,
  `status` enum('pending','diterima','ditolak') NOT NULL DEFAULT 'pending',
  `keterangan` text DEFAULT NULL,
  `tanggal_daftar` timestamp NOT NULL DEFAULT current_timestamp(),
  `ukm_id` bigint(20) UNSIGNED NOT NULL,
  `divisi_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pendaftar`
--

INSERT INTO `pendaftar` (`id`, `nama_lengkap`, `nim`, `email`, `no_telp`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `angkatan`, `program_studi`, `foto_path`, `alasan_bergabung`, `status`, `keterangan`, `tanggal_daftar`, `ukm_id`, `divisi_id`, `created_at`, `updated_at`) VALUES
(7, 'Ilham', '0110124254', 'ilham@gmail.com', '06435434', 'L', '2025-07-09', 'Jln. kenangan', '2024', 'sistem informasi', 'fotos/01JZQJTS7G7W2266AMJZN3E95X.webp', 'seru', 'diterima', 'bagus', '2025-07-09 12:33:39', 1, 1, '2025-07-09 05:33:39', '2025-07-09 06:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(200) NOT NULL,
  `konten` text NOT NULL,
  `ukm_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `konten`, `ukm_id`, `tanggal_mulai`, `tanggal_selesai`, `is_active`, `created_at`, `updated_at`) VALUES
(11, 'Open Recruitment Basket', 'Pendaftaran anggota UKM Basket dibuka!', 1, '2025-07-10', '2025-07-20', 0, NULL, '2025-07-09 07:07:48'),
(12, 'Open Recruitment Futsal', 'Ayo bergabung dengan UKM Futsal!', 2, '2025-07-11', '2025-07-21', 1, NULL, NULL),
(13, 'Open Recruitment Badminton', 'UKM Badminton mencari anggota baru.', 3, '2025-07-12', '2025-07-22', 0, NULL, '2025-07-09 07:08:09'),
(14, 'Open Recruitment Teater', 'Bergabunglah dengan UKM Teater dan tampil di panggung!', 4, '2025-07-13', '2025-07-23', 1, NULL, NULL),
(15, 'Open Recruitment Musik', 'UKM Musik membuka audisi untuk anggota baru.', 5, '2025-07-14', '2025-07-24', 1, NULL, NULL),
(16, 'Open Recruitment Tari', 'Daftarkan dirimu di UKM Tari!', 6, '2025-07-15', '2025-07-25', 1, NULL, NULL),
(17, 'Open Recruitment Fotografi', 'UKM Fotografi membuka rekrutmen!', 7, '2025-07-16', '2025-07-26', 0, NULL, '2025-07-09 07:08:28'),
(18, 'Open Recruitment Jurnalistik', 'Jadilah bagian dari tim jurnalistik kampus!', 8, '2025-07-17', '2025-07-27', 1, NULL, NULL),
(19, 'Open Recruitment Basket (Cabang)', 'Pendaftaran Basket cabang lain.', 9, '2025-07-18', '2025-07-28', 1, NULL, NULL),
(20, 'Open Recruitment Futsal (Cabang)', 'Buka pendaftaran Futsal kedua.', 10, '2025-07-19', '2025-07-29', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ek2hFkkjRZ9zHtGrnDX4mfNkpWrTtFKK0oUzfbYs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVQyeXNVZWl4cVdhWVlmNG05aUtad20zSG1KVERZaDRMbDBrc3hjSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbmt1L2xvZ2luIjt9fQ==', 1752071109);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukm`
--

CREATE TABLE `ukm` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ukm` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `ketua_ukm` varchar(100) DEFAULT NULL,
  `max_anggota` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ukm`
--

INSERT INTO `ukm` (`id`, `nama_ukm`, `deskripsi`, `logo_path`, `is_active`, `ketua_ukm`, `max_anggota`, `created_at`, `updated_at`) VALUES
(1, 'Basket', 'keren', 'logos/01JZQ8MEDN1BPQ5J0J77AG8GC9.jpg', 1, 'Ilham', 8, '2025-07-08 23:47:08', '2025-07-09 02:35:25'),
(2, 'Futsal', 'UKM Futsal adalah wadah mahasiswa pecinta futsal.', NULL, 1, 'Budi', 35, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(3, 'Badminton', 'UKM Badminton untuk penggemar bulu tangkis.', NULL, 1, 'Sari', 30, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(4, 'Teater', 'UKM Teater mewadahi bakat seni peran mahasiswa.', NULL, 1, 'Ari', 40, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(5, 'Musik', 'UKM Musik membuka ruang kreativitas bermusik.', NULL, 1, 'Rina', 25, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(6, 'Tari', 'UKM Tari menyalurkan minat mahasiswa dalam seni tari.', NULL, 1, 'Lina', 25, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(7, 'Fotografi', 'UKM Fotografi untuk mahasiswa yang hobi fotografi.', NULL, 1, 'Dewi', 20, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(8, 'Jurnalistik', 'UKM Jurnalistik mengembangkan keterampilan menulis dan peliputan.', NULL, 1, 'Rizal', 22, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(9, 'Basket', 'Unit Kegiatan Mahasiswa yang fokus pada olahraga bola basket. Mengembangkan kemampuan bermain basket dan\r\nsportivitas.', NULL, 1, 'Ahmad Fauzi', 30, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(10, 'Futsal', 'Unit Kegiatan Mahasiswa yang fokus pada olahraga futsal. Membangun kerjasama tim dan prestasi\r\nolahraga.', NULL, 1, 'Budi Santoso', 25, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(11, 'Badminton', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan bermain badminton tingkat universitas.', NULL, 1, 'Sari Dewi', 20, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(12, 'Teater', 'Unit Kegiatan Mahasiswa yang mengembangkan seni peran dan pertunjukan teater.', NULL, 1, 'Rina Maharani', 35, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(13, 'Musik', 'Unit Kegiatan Mahasiswa yang mengembangkan bakat musik dan seni suara mahasiswa.', NULL, 1, 'Dani Pratama', 40, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(14, 'Tari', 'Unit Kegiatan Mahasiswa yang melestarikan dan mengembangkan seni tari tradisional dan modern.', NULL, 1, 'Maya Putri', 25, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(15, 'Fotografi', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan fotografi dan dokumentasi.', NULL, 1, 'Riko Mahendra', 30, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(16, 'Jurnalistik', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan jurnalistik dan media kampus.', NULL, 1, 'Lisa Handayani', 35, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(17, 'Robotika', 'Unit Kegiatan Mahasiswa yang fokus pada pengembangan teknologi robotika dan automasi.', NULL, 1, 'Arif Nugroho', 20, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(18, 'Pecinta Alam', 'Unit Kegiatan Mahasiswa yang fokus pada kegiatan alam terbuka dan konservasi lingkungan.', NULL, 1, 'Eko Purnomo', 45, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(19, 'Basket', 'Unit Kegiatan Mahasiswa yang fokus pada olahraga bola basket. Mengembangkan kemampuan bermain basket dan\r\nsportivitas.', NULL, 1, 'Ahmad Fauzi', 30, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(20, 'Futsal', 'Unit Kegiatan Mahasiswa yang fokus pada olahraga futsal. Membangun kerjasama tim dan prestasi\r\nolahraga.', NULL, 1, 'Budi Santoso', 25, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(21, 'Badminton', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan bermain badminton tingkat universitas.', NULL, 1, 'Sari Dewi', 20, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(22, 'Teater', 'Unit Kegiatan Mahasiswa yang mengembangkan seni peran dan pertunjukan teater.', NULL, 1, 'Rina Maharani', 35, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(23, 'Musik', 'Unit Kegiatan Mahasiswa yang mengembangkan bakat musik dan seni suara mahasiswa.', NULL, 1, 'Dani Pratama', 40, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(24, 'Tari', 'Unit Kegiatan Mahasiswa yang melestarikan dan mengembangkan seni tari tradisional dan modern.', NULL, 1, 'Maya Putri', 25, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(25, 'Fotografi', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan fotografi dan dokumentasi.', NULL, 1, 'Riko Mahendra', 30, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(26, 'Jurnalistik', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan jurnalistik dan media kampus.', NULL, 1, 'Lisa Handayani', 35, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(27, 'Robotika', 'Unit Kegiatan Mahasiswa yang fokus pada pengembangan teknologi robotika dan automasi.', NULL, 1, 'Arif Nugroho', 20, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(28, 'Pecinta Alam', 'Unit Kegiatan Mahasiswa yang fokus pada kegiatan alam terbuka dan konservasi lingkungan.', NULL, 1, 'Eko Purnomo', 45, '2025-07-09 00:23:39', '2025-07-09 00:23:39'),
(29, 'Basket', 'Unit Kegiatan Mahasiswa yang fokus pada olahraga bola basket. Mengembangkan kemampuan bermain basket dan\r\nsportivitas.', NULL, 1, 'Ahmad Fauzi', 30, '2025-07-09 00:24:21', '2025-07-09 00:24:21'),
(30, 'Futsal', 'Unit Kegiatan Mahasiswa yang fokus pada olahraga futsal. Membangun kerjasama tim dan prestasi\r\nolahraga.', NULL, 1, 'Budi Santoso', 25, '2025-07-09 00:24:21', '2025-07-09 00:24:21'),
(31, 'Badminton', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan bermain badminton tingkat universitas.', NULL, 1, 'Sari Dewi', 20, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(32, 'Teater', 'Unit Kegiatan Mahasiswa yang mengembangkan seni peran dan pertunjukan teater.', NULL, 1, 'Rina Maharani', 35, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(33, 'Musik', 'Unit Kegiatan Mahasiswa yang mengembangkan bakat musik dan seni suara mahasiswa.', NULL, 1, 'Dani Pratama', 40, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(34, 'Tari', 'Unit Kegiatan Mahasiswa yang melestarikan dan mengembangkan seni tari tradisional dan modern.', NULL, 1, 'Maya Putri', 25, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(35, 'Fotografi', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan fotografi dan dokumentasi.', NULL, 1, 'Riko Mahendra', 30, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(36, 'Jurnalistik', 'Unit Kegiatan Mahasiswa yang mengembangkan kemampuan jurnalistik dan media kampus.', NULL, 1, 'Lisa Handayani', 35, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(37, 'Robotika', 'Unit Kegiatan Mahasiswa yang fokus pada pengembangan teknologi robotika dan automasi.', NULL, 1, 'Arif Nugroho', 20, '2025-07-09 00:24:22', '2025-07-09 00:24:22'),
(38, 'Pecinta Alam', 'Unit Kegiatan Mahasiswa yang fokus pada kegiatan alam terbuka dan konservasi lingkungan.', NULL, 1, 'Eko Purnomo', 45, '2025-07-09 00:24:22', '2025-07-09 00:24:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukm_divisi`
--

CREATE TABLE `ukm_divisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ukm_id` bigint(20) UNSIGNED NOT NULL,
  `divisi_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `max_anggota` int(11) DEFAULT 10,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ukm_divisi`
--

INSERT INTO `ukm_divisi` (`id`, `ukm_id`, `divisi_id`, `is_active`, `max_anggota`, `created_at`, `updated_at`) VALUES
(512, 1, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(513, 1, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(514, 1, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(515, 1, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(516, 1, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(517, 1, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(518, 1, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(519, 1, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(520, 2, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(521, 2, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(522, 2, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(523, 2, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(524, 2, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(525, 2, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(526, 2, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(527, 2, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(528, 3, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(529, 3, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(530, 3, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(531, 3, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(532, 3, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(533, 3, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(534, 3, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(535, 3, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(536, 4, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(537, 4, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(538, 4, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(539, 4, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(540, 4, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(541, 4, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(542, 4, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(543, 4, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(544, 5, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(545, 5, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(546, 5, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(547, 5, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(548, 5, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(549, 5, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(550, 5, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(551, 5, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(552, 6, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(553, 6, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(554, 6, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(555, 6, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(556, 6, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(557, 6, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(558, 6, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(559, 6, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(560, 7, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(561, 7, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(562, 7, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(563, 7, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(564, 7, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(565, 7, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(566, 7, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(567, 7, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(568, 8, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(569, 8, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(570, 8, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(571, 8, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(572, 8, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(573, 8, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(574, 8, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(575, 8, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(576, 9, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(577, 9, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(578, 9, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(579, 9, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(580, 9, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(581, 9, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(582, 9, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(583, 9, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(584, 10, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(585, 10, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(586, 10, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(587, 10, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(588, 10, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(589, 10, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(590, 10, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(591, 10, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(592, 11, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(593, 11, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(594, 11, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(595, 11, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(596, 11, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(597, 11, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(598, 11, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(599, 11, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(600, 12, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(601, 12, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(602, 12, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(603, 12, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(604, 12, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(605, 12, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(606, 12, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(607, 12, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(608, 13, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(609, 13, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(610, 13, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(611, 13, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(612, 13, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(613, 13, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(614, 13, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(615, 13, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(616, 14, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(617, 14, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(618, 14, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(619, 14, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(620, 14, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(621, 14, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(622, 14, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(623, 14, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(624, 15, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(625, 15, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(626, 15, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(627, 15, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(628, 15, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(629, 15, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(630, 15, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(631, 15, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(632, 16, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(633, 16, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(634, 16, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(635, 16, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(636, 16, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(637, 16, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(638, 16, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(639, 16, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(640, 17, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(641, 17, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(642, 17, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(643, 17, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(644, 17, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(645, 17, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(646, 17, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(647, 17, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(648, 18, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(649, 18, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(650, 18, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(651, 18, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(652, 18, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(653, 18, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(654, 18, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(655, 18, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(656, 19, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(657, 19, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(658, 19, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(659, 19, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(660, 19, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(661, 19, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(662, 19, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(663, 19, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(664, 20, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(665, 20, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(666, 20, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(667, 20, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(668, 20, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(669, 20, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(670, 20, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(671, 20, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(672, 21, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(673, 21, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(674, 21, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(675, 21, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(676, 21, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(677, 21, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(678, 21, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(679, 21, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(680, 22, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(681, 22, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(682, 22, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(683, 22, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(684, 22, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(685, 22, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(686, 22, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(687, 22, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(688, 23, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(689, 23, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(690, 23, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(691, 23, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(692, 23, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(693, 23, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(694, 23, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(695, 23, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(696, 24, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(697, 24, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(698, 24, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(699, 24, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(700, 24, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(701, 24, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(702, 24, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(703, 24, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(704, 25, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(705, 25, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(706, 25, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(707, 25, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(708, 25, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(709, 25, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(710, 25, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(711, 25, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(712, 26, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(713, 26, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(714, 26, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(715, 26, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(716, 26, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(717, 26, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(718, 26, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(719, 26, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(720, 27, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(721, 27, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(722, 27, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(723, 27, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(724, 27, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(725, 27, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(726, 27, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(727, 27, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(728, 28, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(729, 28, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(730, 28, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(731, 28, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(732, 28, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(733, 28, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(734, 28, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(735, 28, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(736, 29, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(737, 29, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(738, 29, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(739, 29, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(740, 29, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(741, 29, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(742, 29, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(743, 29, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(744, 30, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(745, 30, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(746, 30, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(747, 30, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(748, 30, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(749, 30, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(750, 30, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(751, 30, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(752, 31, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(753, 31, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(754, 31, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(755, 31, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(756, 31, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(757, 31, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(758, 31, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(759, 31, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(760, 32, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(761, 32, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(762, 32, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(763, 32, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(764, 32, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(765, 32, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(766, 32, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(767, 32, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(768, 33, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(769, 33, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(770, 33, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(771, 33, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(772, 33, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(773, 33, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(774, 33, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(775, 33, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(776, 34, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(777, 34, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(778, 34, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(779, 34, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(780, 34, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(781, 34, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(782, 34, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(783, 34, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(784, 35, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(785, 35, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(786, 35, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(787, 35, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(788, 35, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(789, 35, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(790, 35, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(791, 35, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(792, 36, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(793, 36, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(794, 36, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(795, 36, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(796, 36, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(797, 36, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(798, 36, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(799, 36, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(800, 37, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(801, 37, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(802, 37, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(803, 37, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(804, 37, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(805, 37, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(806, 37, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(807, 37, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(808, 38, 1, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(809, 38, 2, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(810, 38, 3, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(811, 38, 4, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(812, 38, 5, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(813, 38, 6, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(814, 38, 7, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13'),
(815, 38, 8, 1, 10, '2025-07-09 11:49:13', '2025-07-09 11:49:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','ukm_admin') NOT NULL,
  `ukm_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `ukm_id`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@ukm.ac.id', NULL, '$2y$12$TqSggQXy5vgKBeayQKwOO.d03ERLoyPVx53xwoBfTc0N1ZWlFt9jO', 'admin', NULL, 1, NULL, '2025-07-08 23:47:08', '2025-07-08 23:47:08'),
(2, 'Admin Basket', 'basket@ukm.ac.id', NULL, '$2y$12$Tww9Cr/aeMK03cB8.d14FO68mfQr/6sPvH10vBDRTSVxfSq1ihMAS', 'ukm_admin', 1, 1, NULL, '2025-07-08 23:47:09', '2025-07-08 23:47:09'),
(3, 'Admin Futsal', 'futsal@ukm.ac.id', NULL, '$2y$12$a7/.dtfYwibfKvSTa4pZwuo9XoSOJ5nQd/bUDQf/6laZd1FUxpR2O', 'ukm_admin', 2, 1, NULL, '2025-07-08 23:47:09', '2025-07-08 23:47:09'),
(4, 'Admin Badminton', 'badminton@ukm.ac.id', NULL, '$2y$12$LbisVL5oYZfc99upeOb9Rea81oI7ypEtqkPd46BsVkVCpMxVnRry2', 'ukm_admin', 3, 1, NULL, '2025-07-08 23:47:09', '2025-07-08 23:47:09'),
(5, 'Admin Teater', 'teater@ukm.ac.id', NULL, '$2y$12$gGayAceFnX1xfBZVNgPVgOxfZl/2ArfT3vclASwsfkXP8kcqHt.OK', 'ukm_admin', 4, 1, NULL, '2025-07-08 23:47:10', '2025-07-08 23:47:10'),
(6, 'Admin Musik', 'musik@ukm.ac.id', NULL, '$2y$12$yKppKnAusLKNFGA9AJ2TmeIvexFSCVbl0hMo7rAPQGde2XfBAaqdu', 'ukm_admin', 5, 1, NULL, '2025-07-08 23:47:10', '2025-07-08 23:47:10'),
(7, 'Admin Tari', 'tari@ukm.ac.id', NULL, '$2y$12$sIoeKGlN6zv/bbyh8iXqvOA4Bdd0zWvXzEPgHJ4oz41VJQZdH9HKO', 'ukm_admin', 6, 1, NULL, '2025-07-08 23:47:10', '2025-07-08 23:47:10'),
(8, 'Admin Fotografi', 'fotografi@ukm.ac.id', NULL, '$2y$12$nywCvHZW7wVdh9ZRHhtjuOMiCdpeOgBF7b7L8MjJCrkv2m.8ksPE.', 'ukm_admin', 7, 1, NULL, '2025-07-08 23:47:11', '2025-07-08 23:47:11'),
(9, 'Admin Jurnalistik', 'jurnalistik@ukm.ac.id', NULL, '$2y$12$wgKAN33Z2tADtErtUhBXFOwS5gDzDQHrhNbE.S24PJ89iH9ky5fpG', 'ukm_admin', 8, 1, NULL, '2025-07-08 23:47:11', '2025-07-08 23:47:11'),
(10, 'Admin Robotika', 'robotika@ukm.ac.id', NULL, '$2y$12$LsWw3LY1KEFb63gLYeaKQeUdEMOuq5ISJkucB/HklMAVsEUU380FS', 'ukm_admin', 9, 1, NULL, '2025-07-08 23:47:12', '2025-07-08 23:47:12');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftar_ukm_id_index` (`ukm_id`),
  ADD KEY `pendaftar_divisi_id_index` (`divisi_id`),
  ADD KEY `pendaftar_nim_index` (`nim`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengumuman_ukm_id_foreign` (`ukm_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `ukm`
--
ALTER TABLE `ukm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ukm_divisi`
--
ALTER TABLE `ukm_divisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ukm_id` (`ukm_id`),
  ADD KEY `divisi_id` (`divisi_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_ukm_id_foreign` (`ukm_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `ukm`
--
ALTER TABLE `ukm`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `ukm_divisi`
--
ALTER TABLE `ukm_divisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1023;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD CONSTRAINT `pendaftar_divisi_id_foreign` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendaftar_ukm_id_foreign` FOREIGN KEY (`ukm_id`) REFERENCES `ukm` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ukm_id_foreign` FOREIGN KEY (`ukm_id`) REFERENCES `ukm` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ukm_divisi`
--
ALTER TABLE `ukm_divisi`
  ADD CONSTRAINT `ukm_divisi_ibfk_1` FOREIGN KEY (`ukm_id`) REFERENCES `ukm` (`id`),
  ADD CONSTRAINT `ukm_divisi_ibfk_2` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ukm_id_foreign` FOREIGN KEY (`ukm_id`) REFERENCES `ukm` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
