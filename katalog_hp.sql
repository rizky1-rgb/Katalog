-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 07, 2026 at 11:42 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `katalog hp`
--

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

CREATE TABLE `merk` (
  `id_merk` tinyint UNSIGNED NOT NULL,
  `merk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `merk`
--

INSERT INTO `merk` (`id_merk`, `merk`) VALUES
(171, 'ZTE Nubia'),
(172, 'Asus'),
(173, 'Samsung'),
(174, 'IQOO'),
(175, 'Xiaomi'),
(176, 'IPhone'),
(177, 'OnePlus'),
(178, 'Infinix'),
(179, 'Vivo'),
(180, 'Asus'),
(181, 'MSI'),
(182, 'HP'),
(183, 'Dell'),
(184, 'Axioo'),
(185, 'Acer'),
(186, 'Apple'),
(187, 'Lenovo'),
(188, 'Infinix');

-- --------------------------------------------------------

--
-- Table structure for table `seri`
--

CREATE TABLE `seri` (
  `id_seri` smallint UNSIGNED NOT NULL,
  `id_tipe` tinyint UNSIGNED NOT NULL,
  `nama_seri` varchar(255) NOT NULL,
  `spek` text NOT NULL,
  `harga` int NOT NULL,
  `gambar1` varchar(255) NOT NULL,
  `gambar2` varchar(255) NOT NULL,
  `gambar3` varchar(255) NOT NULL,
  `status` set('availabel','not availabel','deleted') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seri`
--

INSERT INTO `seri` (`id_seri`, `id_tipe`, `nama_seri`, `spek`, `harga`, `gambar1`, `gambar2`, `gambar3`, `status`) VALUES
(20101, 1, 'Redmagic 9 Pro & 9S Pro', 'Spesifikasi:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 3 (4nm) & GPU Adreno 750\r\n• Layar: 6.8 inci BOE Q9+ AMOLED, FHD+, 120Hz refresh rate, 1600 nits\r\n• Memori: RAM 12GB / 16GB LPDDR5X + ROM 256GB / 512GB UFS 4.0\r\n• Baterai & Charging: 6500 mAh + 80W Fast Charging\r\n• Sistem Pendingin: ICE 13.0 Cooling System dengan kipas internal berkecepatan 22.000 RPM.\r\n• Fitur Gaming: Kamera depan tertanam di bawah layar (True Full Screen), Tombol trigger 520Hz.\r\n• Kamera: Belakang 50MP (OIS) + 50MP (Ultrawide) + 2MP (Macro), Depan 16MP', 14500000, 'https://uk.redmagic.gg/cdn/shop/articles/Blog_9_2976ee7f-24de-42f2-994e-8c5a15bfbafc.png?v=1741751813', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_zzShs4zAxu4nFY6t1CDMtxj7BA_8A2AoRSLLwn6FOg&s=10', 'https://www.yangcanggih.com/wp-content/uploads/2024/07/REDMAGIC-9S-Pro-4.jpg', ''),
(20102, 1, 'Redmagic 10 Pro & 10 Pro+', 'Spesifikasi:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite & chip gaming Red Core 3 Pro\r\n• Layar: 6.85 inci AMOLED BOE X2, 1.5K (2688x1216), 144Hz refresh rate, 2000 nits\r\n• Memori: RAM 12GB / 16GB / 24GB + ROM 256GB / 512GB / 1TB\r\n• Baterai & Charging: 7050 mAh Silicon-Carbon battery + 100W Fast Charging\r\n• Sistem Pendingin: ICE-X system dengan kipas internal 23.000 RPM dan liquid metal cooling.\r\n• Fitur Gaming: Layar penuh tanpa notch generasi baru, getaran 4D, lampu RGB mecha.\r\n• Kamera: Belakang 50MP + 50MP + 2MP, Depan 16MP (di bawah layar)', 18500000, 'https://asset.kompas.com/crops/NPjXzFWNiz2r0oFjUeMnnthnOhU=/581x327:1288x799/1200x800/data/photo/2024/12/06/675277624f751.png', 'https://media.suara.com/pictures/original/2024/11/14/76663-redmagic-10-pro-series.jpg', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/720x0/webp/photo/2025/05/27/38565515.jpg', ''),
(20103, 1, 'Redmagic 11S pro', 'Spesifikasi:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite Gen 5 (3nm) & RedCore R4\r\n• Layar: 6.85 inci BOE X10 AMOLED, 1.5K, 144Hz refresh rate, 2000 nits, proteksi Gorilla Glass\r\n• Memori: RAM 16GB LPDDR5T + ROM 512GB UFS 4.1 Pro (Untuk varian resmi Indonesia). Varian global tersedia hingga RAM 24GB + ROM 1TB.\r\n• Baterai & Charging: 7500 mAh + 80W Fast & Wireless Charging\r\n• Sistem Pendingin: AquaCore Cooling System, pendingin cairan komersial pertama di dunia yang menggabungkan cairan khusus (fluorinated liquid), liquid metal 3.0, serta turbofan 24.000 RPM.\r\n• Fitur Gaming: Sertifikasi tahan air IPX8, pemicu bahu 520Hz, sidik jari ultrasonik 3D di bawah layar.\r\n• Kamera: Belakang 50MP (OIS) + 50MP (Ultrawide) + 2MP, Depan 16MP UDC', 21999000, 'https://global.redmagic.gg/cdn/shop/files/Sleek_Touch-_light_50b7f7f2-cba0-4d08-a2ad-cc8e25262991.jpg?v=1779694563&width=3504', 'https://halokalbar.com/wp-content/uploads/2025/10/redmagic11-860x713.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWLUxUPfqb-08o3KXleTCNy9w7bKoGYJOavdoi3LKkgQ&s=10', ''),
(20104, 2, 'ZTE Nubia Neo 3 5G', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc Tiger T8300 (6nm)\r\n• Layar: 6.8 inci AMOLED, FHD+, 120Hz refresh rate, 1000 nits\r\n• Memori: RAM 8GB (+12GB Virtual RAM) + ROM 256GB\r\n• Baterai & Charging: 6000 mAh + 33W Fast Charging & Bypass Charging\r\n• Fitur Gaming: Dual Gaming Shoulder Triggers, AI Game Space 3.0\r\n• Kamera: Belakang 50MP + 2MP, Depan 16MP', 2750000, 'https://www.nubia.com/content/dam/zte-devices/global/products/smartphones/nubia/nubia-neo-3-5g/pc/3NEW.png', 'https://www.nubia.com/content/dam/zte-devices/global/products/smartphones/nubia/nubia-neo-3-5g/pc/2NEW.png', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSswxkz61ASJVav0jhVU9szPejtZZahEr5IXto40nWzSG23j9o9aTUZX5M&s=10', 'availabel'),
(20105, 2, 'ZTE Nubia Neo GT 3 5G', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T9100 / T8300 (6nm)\r\n• Layar: 6.8 inci AMOLED, FHD+, 120Hz refresh rate, 1300 nits\r\n• Memori: RAM 8GB / 12GB + ROM 256GB\r\n• Baterai & Charging: 6000 mAh + 80W Fast Charging\r\n• Fitur Gaming: Lampu Eagle Eye RGB interaktif, Air Trigger, Multilayer Cooling 4083 mm²\r\n• Kamera: Belakang 50MP + 2MP, Depan 12MP', 4200000, 'https://www.nubia.com/content/dam/zte-devices/global/products/smartphones/nubia/nubia-neo-3-gt-5g/pc/03.png', 'https://www.nubia.com/content/dam/zte-devices/global/products/smartphones/nubia/nubia-neo-3-gt-5g/pc/02.png', 'https://www.nubia.com/content/dam/zte-devices/global/products/smartphones/nubia/nubia-neo-3-gt-5g/pc/07.png', 'availabel'),
(20106, 2, 'ZTE Nubia Neo 5 5G', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T9300 Octa-core 2.4GHz\r\n• Layar: 6.8 inci, FHD+, 120Hz refresh rate, 1000 nits\r\n• Memori: RAM 8GB (+12GB Virtual RAM) + ROM 256GB\r\n• Baterai & Charging: 6050 mAh + 45W Fast Charging & Bypass Charging\r\n• Fitur Gaming: 550Hz Neo Triggers 5.0, Vapor Chamber (VC) Cooling System 20,000mm²\r\n• Kamera: Belakang 50MP + 2MP, Depan 16MP', 4000000, 'https://www.nubia.com/content/dam/zte-devices/site/global/neo5/images/neo-5g/anchor-3.png', 'https://www.nubia.com/content/dam/zte-devices/site/global/neo5/images/neo-5g/ip64.png', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE9Bnfc0T_2ALI8GAASH74aKTr7nJ9CVSX0sqVOlX7lWH77ulGEmsOMfg7&s=10', 'availabel'),
(20107, 2, 'ZTE Nubia Neo GT 5 5G', 'Spesifikasi Utama:\r\n\r\n• Chipset: MediaTek Dimensity 7400 (4nm)\r\n• Layar: 6.8 inci AMOLED, 1.5K, 144Hz refresh rate, kecerahan hingga 4500 nits\r\n• Memori: RAM 12GB (bisa ditambah Dynamic RAM) + ROM 256GB / 512GB\r\n• Baterai & Charging: 6210 mAh + 80W Super Fast Charging & Bypass Charging\r\n• Fitur Gaming: Integrated Active Fan (Kipas internal), Neo Triggers 5.0\r\n• Kamera: Belakang 50MP AI + Depan 16MP', 5250000, 'https://www.nubia.com/content/dam/zte-devices/site/global/neo5/images/neo-5g/anchor-3.png', 'https://www.nubia.com/content/dam/zte-devices/site/global/neo5/images/neo-5g/ip64.png', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE9Bnfc0T_2ALI8GAASH74aKTr7nJ9CVSX0sqVOlX7lWH77ulGEmsOMfg7&s=10', 'availabel'),
(20108, 3, 'ZTE Nubia V60 Design', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T606 (12 nm)\r\n• Layar: 6.6 inci IPS LCD, 90Hz refresh rate\r\n• Memori: RAM 6GB / 8GB + ROM 256GB\r\n• Baterai & Charging: 5000 mAh + 22.5W Fast Charging\r\n• Kamera: Belakang 50MP AI Triple Camera + Depan 8MP\r\n• Fitur Lain: NFC, Side-Fingerprint, Live Island', 1450000, 'https://epiclopedia.id/wp-content/uploads/2024/09/ZTE-nubia-V60-Design-3.jpeg', 'https://techdaily.id/wp-content/uploads/2024/09/Spesifikasi-dan-Fitur-ZTE-Nubia-V60-Design-Cover.webp', 'https://down-id.img.susercontent.com/file/id-11134207-7rasm-m1288a1b6rz3cd', 'availabel'),
(20109, 3, 'ZTE Nubia V60', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T616 Octa-Core\r\n• Layar: 6.72 inci Full HD+ (FHD+), 2.5D Curved Edge, 90Hz\r\n• Memori: RAM 8GB (+12GB Dynamic RAM) + ROM 256GB\r\n• Baterai & Charging: 5000 mAh + 22.5W Fast Charging\r\n• Kamera: Belakang 50MP Main + 2MP + 2MP, Depan 32MP Selfie Camera', 1650000, 'https://epiclopedia.id/wp-content/uploads/2024/09/ZTE-nubia-V60-Design-3.jpeg', 'https://techdaily.id/wp-content/uploads/2024/09/Spesifikasi-dan-Fitur-ZTE-Nubia-V60-Design-Cover.webp', 'https://down-id.img.susercontent.com/file/id-11134207-7rasm-m1288a1b6rz3cd', 'availabel'),
(20111, 3, 'ZTE Nubia V70 Design', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T606 / T616 Octa-core\r\n• Layar: 6.7 inci HD+, 120Hz refresh rate, rasio layar ke bodi 91%\r\n• Memori: RAM 8GB (+12GB Dynamic RAM) + ROM 256GB\r\n• Baterai & Charging: 5000 mAh + 22.5W Fast Charging\r\n• Kamera: Belakang 50MP AI (mendukung Raw Super Night Shot) + Depan 16MP\r\n• Fitur Spesial: Live Island 2.0 (Notifikasi interaktif ala Dynamic Island), pilihan bodi bertekstur kulit atau Sky-Mirror glass.', 1625000, 'https://unboxing.id/wp-content/uploads/2025/03/128GB-@1x.webp', 'https://www.nubia.com/content/dam/zte-devices/global/products/smartphones/blade/zte-blade-v70/pc/07.jpg', 'https://www.ztedevices.com.my/storage/products/68/page_contents/8c908531b71093943c7342f6439e8c2d.png', 'availabel'),
(20112, 3, 'ZTE Nubia V80 MAX (Global Version)', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T7250 Octa-Core (12nm)\r\n• Layar: 6.9 inci IPS LCD, resolusi HD+\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Baterai & Charging: 6000 mAh + 22.5W Fast Charging\r\n• Kamera: Belakang 50MP AI Dual Camera + Depan 16MP', 3450000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHYeJXPs95zGmgnQJVa5gQ04TdhYhL_0CATu9EnUX4rWiH0bH0hwBd9L7&s=10', 'https://www.ztedevices.com/content/dam/nubia/global/products/smartphones/nubia/nubia-v80-max/sp-pics/10.png', 'https://down-id.img.susercontent.com/file/id-11134207-822wp-mmqwv2jz2rr740', 'availabel'),
(20113, 3, 'ZTE Nubia V80 Design', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc Octa-Core (12nm)\r\n• Layar: 6.75 inci IPS LCD, 120Hz refresh rate, kecerahan hingga 1000 nits\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Baterai & Charging: 5000 mAh + 22.5W Fast Charging\r\n• Kamera: Belakang 50MP AI Main Camera + Depan 16MP\r\n• Fitur Spesial: Sertifikasi IP64 (Tahan debu & cipratan air), bodi belakang bermaterial kaca premium.', 2050000, 'https://www.yangcanggih.com/wp-content/uploads/2025/11/nubia-V80-Series-1.jpg', 'https://asset.kompas.com/crops/uYOMg3sEHsm0UmidGABVDE6XGRA=/0x0:1080x720/1200x900/data/photo/2025/11/13/691539a032d64.png', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNjOtMp71XYNBJg7Lh33v2i_JGxZsq2QKVFgl-VxeOkXP-gBmiw3TRjVhd&s=10', 'availabel'),
(20114, 4, 'ZTE Nubia A36', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T7200 Octa-core 1.6GHz\r\n• Layar: 6.75 inci HD+, 90Hz refresh rate, kecerahan 500 nits\r\n• Memori: RAM 4GB + ROM 64GB\r\n• Baterai & Charging: 5000 mAh + 10W\r\n• Kamera: Belakang 13MP AI Lens + Depan 5MP', 999000, 'https://img.lazcdn.com/g/p/08edff33dcb434b0d9b9bbf76f7709a8.jpg_720x720q80.jpg', 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/c8c888f12a0046a0a248d1c59ce5fca0~tplv-aphluv4xwc-resize-jpeg:700:0.jpeg', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/90/MTA-182123217/nubia_zte_nubia_blade_a36_4gb-64gb_-_smartphone_kamera_ai_-_layar_6-75-_90hz_-_5000mah_-_garansi_resmi_full03_qr3dbxag.jpg', 'availabel'),
(20115, 4, 'ZTE Nubia A56', 'Spesifikasi Utama:\r\n\r\n• Layar: 6.75 inci HD+ dengan dukungan Google Gemini AI\r\n• Memori: RAM up to 12GB (Termasuk Virtual RAM) + ROM 128GB\r\n• Baterai: 5000 mAh\r\n• Keamanan: Side Fingerprint Scanner & Face Unlock', 1099000, 'https://www.ztedevices.com.my/storage/products/80/page_contents/e9ac1de6b46882ffd00d68084ea4fc28.jpg', 'https://static.promediateknologi.id/crop/0x0:0x0/1200x0/webp/photo/p1/263/2025/09/13/IMG_20250913_141310-3611395467.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFvR_5Y7IoQ_7lVh07vtLEN0Hgv0mSA6kmokUAxkxmbhC802UofzsOqLg&s=10', 'availabel'),
(20116, 4, 'ZTE Nubia A57', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T7250\r\n• Layar: 6.75 inci IPS LCD, 120Hz refresh rate, 740 nits\r\n• Memori: RAM 4GB + ROM 64GB / 128GB (MicroSD eksternal hingga 2TB)\r\n• Baterai & Charging: 5000 mAh + 22.5W Fast Charging\r\n• Kamera: Belakang 13MP + Depth Sensor, Depan 8MP\r\n• Fitur Spesial: Sertifikasi IP64 (tahan debu & percikan air)', 1900000, 'https://i0.wp.com/neptechie.com/wp-content/uploads/2026/07/ZTE-Nubia-A57-price-in-Nepal.webp', 'https://www.harapanrakyat.com/wp-content/uploads/2026/09/ZTE-nubia-A57-HP-Rp1-Jutaan-dengan-Desain-Kamera-Belakang-Mirip-iPhone-17-Pro.jpg', 'https://prabumulihpos.disway.id/upload/8774eb55517788b1fac685f29fd2849e.jpg', 'availabel'),
(20117, 4, 'ZTE Nubia A76 5G', 'Spesifikasi Utama:\r\n\r\n• Chipset: Unisoc T8300 Octa-Core up to 2.2GHz\r\n• Layar: 6.75 inci HD+, 90Hz refresh rate dengan interaksi Live Island 2.0\r\n• Memori: RAM 8GB (+8GB Dynamic RAM) + ROM 128GB\r\n• Baterai & Charging: 5000 mAh + 10W charging\r\n• Kamera: Belakang 50MP AI Dual Camera + Depan 8MP\r\n• Fitur Lain: NFC, Side Fingerprint, Panggilan tanpa seluler (nubia LinkFree)', 2250000, 'https://media.dinomarket.com/docs/imgTD/2026-06/DM_A1071036CA4D45BEF8ADEFEED0E15EF8_070626140655_ll.jpg', 'https://www.ztedevices.com.my/storage/products/87/14300cebb6294da58a73d440b36cc7c0.png', 'https://www.ztedevices.com.my/storage/products/70/335ce7a15f87a9aa3b58949ef0e157e9.png', 'availabel'),
(20118, 5, 'Asus Zenfone 9', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8+ Gen 1 (4nm)\r\n• Layar: 5.9 inci AMOLED, 120Hz refresh rate, Gorilla Glass Victus\r\n• Memori: RAM 6GB / 8GB / 16GB + ROM 128GB / 256GB\r\n• Baterai & Charging: 4300 mAh + 30W Fast Charging\r\n• Kamera: Belakang 50MP (Gimbal OIS) + 12MP (Ultrawide) | Depan 12MP', 8000000, 'https://cdnpro.eraspace.com/media/mageplaza/blog/post/s/p/spesifikasiasuszenfone9-_primary.jpg', 'https://dlcdnwebimgs.asus.com/gain/d7fdb441-4bb6-4795-9200-adf81fab04bd/', 'https://awsimages.detik.net.id/community/media/visual/2022/07/29/asus-zenfone-9-1_169.jpeg?w=1200', 'availabel'),
(20119, 5, 'Asus Zenfone 10 (8/128GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 2 (4nm)\r\n• Layar: 5.9 inci Samsung AMOLED, FHD+, 144Hz refresh rate, Gorilla Glass Victus\r\n• Memori: RAM 8GB LPDDR5X + ROM 128GB UFS 4.0\r\n• Baterai & Charging: 4300 mAh + 30W HyperCharge & 15W wireless charging\r\n• Kamera: Belakang 50MP (Sony IMX766, 6-Axis Hybrid Gimbal Stabilizer 2.0) + 13MP (Ultrawide) | Depan 32MP RGBW\r\n• Fitur Spesial: Bodi sangat ringan (172 gram), sertifikasi IP68, Audio Jack 3.5mm', 8999000, 'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,f_auto,q_auto:best,w_640/v1634025439/01h43pbchn5c59c4esza7qkp38.jpg', 'https://cdnpro.eraspace.com/media/wysiwyg/artikel/Tahun_2023/Oktober/spesifikasiASUSzenfone10-1.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSclzrTWlCZQwwai-QtAhaYSRIX-j87tpZNY2ej1IeUxvlLbiktnxE4xxc&s=10', 'availabel'),
(20120, 5, 'Asus Zenfone 10 (16/512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 2 (4nm)\r\n• Layar: 5.9 inci Samsung AMOLED, FHD+, 144Hz refresh rate, Gorilla Glass Victus\r\n• Memori: RAM 16GB LPDDR5X + ROM 512GB UFS 4.0\r\n• Baterai & Charging: 4300 mAh + 30W HyperCharge & 15W wireless charging\r\n• Kamera: Belakang 50MP (Sony IMX766, 6-Axis Hybrid Gimbal Stabilizer 2.0) + 13MP (Ultrawide) | Depan 32MP RGBW\r\n• Fitur Spesial: Bodi sangat ringan (172 gram), sertifikasi IP68, Audio Jack 3.5mm', 11999000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSclzrTWlCZQwwai-QtAhaYSRIX-j87tpZNY2ej1IeUxvlLbiktnxE4xxc&s=10', 'https://i0.wp.com/gizmologi.id/wp-content/uploads/2023/10/ASUS-Zenfone-10-201.jpg?resize=1024%2C576&ssl=1', 'https://www.proshop.fi/Images/Asus-Zenfone10-Color.jpg', 'availabel'),
(20121, 5, 'Asus Zenfon 11 Ultra (12/256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 3 (4nm) & GPU Adreno 750\r\n• Layar: 6.78 inci Samsung Flexible AMOLED LTPO, FHD+, 144Hz refresh rate (gaming), kecerahan puncak 2500 nits, Gorilla Glass Victus 2\r\n• Memori: RAM 12GB LPDDR5X + ROM 256GB UFS 4.0\r\n• Baterai & Charging: 5500 mAh + 65W HyperCharge & 15W Qi wireless charging\r\n• Kamera: Belakang 50MP (Sony IMX890, 6-Axis Hybrid Gimbal Stabilizer 3.0) + 32MP (Telephoto, 3x Optical Zoom, OIS) + 13MP (Ultrawide) | Depan 32MP RGBW\r\n• Fitur Spesial: Proteksi tahan air IP68, Audio Jack 3.5mm dengan Dirac Virtuo, Wi-Fi 7', 10500000, 'https://awsimages.detik.net.id/community/media/visual/2024/07/06/asus-zenfone-11-ultra-1_169.jpeg?w=1200', 'https://dlcdnwebimgs.asus.com/files/media/3ca764a1-0115-44b2-9ff1-57b4577d3830/v1/features/images/large/1x/s2/item_2.jpg', 'https://asset.kompas.com/crops/EiIjjMULKRdLh51bnhs8CizGEGw=/3x0:1000x665/1200x800/data/photo/2024/07/24/66a0bee507742.jpg', 'availabel'),
(20122, 5, 'Asus Zenfone 11 Ultra (16/512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 3 (4nm) & GPU Adreno 750\r\n• Layar: 6.78 inci Samsung Flexible AMOLED LTPO, FHD+, 144Hz refresh rate (gaming), kecerahan puncak 2500 nits, Gorilla Glass Victus 2\r\n• Memori: RAM 16GB LPDDR5X + ROM 512GB UFS 4.0\r\n• Baterai & Charging: 5500 mAh + 65W HyperCharge & 15W Qi wireless charging\r\n• Kamera: Belakang 50MP (Sony IMX890, 6-Axis Hybrid Gimbal Stabilizer 3.0) + 32MP (Telephoto, 3x Optical Zoom, OIS) + 13MP (Ultrawide) | Depan 32MP RGBW\r\n• Fitur Spesial: Proteksi tahan air IP68, Audio Jack 3.5mm dengan Dirac Virtuo, Wi-Fi 7', 14500000, 'https://mediaindonesia.gumlet.io/news/2024/06/6b13b73d931d6254365df6b61c6cb422.jpg?w=376&dpr=2.6', 'https://dlcdnwebimgs.asus.com/files/media/3ca764a1-0115-44b2-9ff1-57b4577d3830/v1/features/images/large/1x/s2/item_2.jpg', 'https://cdnpro.eraspace.com/media/mageplaza/blog/post/z/e/zenfone-11-ultra-primary.jpg', 'availabel'),
(20123, 6, 'Asus ROG Phone 9 FE', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 3\r\n• Layar: 6.78 inci AMOLED, FHD+, 144Hz / 165Hz refresh rate\r\n• Memori: RAM 12GB LPDDR5X + ROM 256GB UFS 4.0\r\n• Baterai & Charging: 5500 mAh + 65W HyperCharge\r\n• Kamera: Belakang 50MP Dual Camera + Depan 32MP', 11000000, 'https://static.hub.91mobiles.com/multisite/wp-content/uploads/sites/6/2025/03/asus_rog_9_fe_vs_rog_phone_9_pro-14.jpg?tr=q-70', 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/img/VqbcmM/2025/3/13/182442c2-ed3a-463f-9573-4d93d583788c.png~tplv-aphluv4xwc-resize-jpeg:700:0.png', 'https://gadgetren.com/wp-content/uploads/2025/03/ROG-Phone-9-FE.jpg', 'availabel'),
(20124, 6, 'Asus ROG Phone 9', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm)\r\n• Layar: 6.78 inci AMOLED LTPO, FHD+, 185Hz refresh rate, 2500 nits\r\n• Memori: RAM 12GB / 16GB + ROM 256GB / 512GB\r\n• Baterai & Charging: 5800 mAh + 65W HyperCharge\r\n• Fitur Gaming: Aura RGB Lighting (Logo ROG menyala), AirTrigger, Audio Jack 3.5mm\r\n• Kamera: Belakang 50MP Sony Lytia 700 (Gimbal OIS) + 13MP (Ultrawide) + 5MP (Macro) | Depan 32MP', 14250000, 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/img/VqbcmM/2025/3/13/182442c2-ed3a-463f-9573-4d93d583788c.png~tplv-aphluv4xwc-resize-jpeg:700:0.png', 'https://rog.asus.com/media/173201949530.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtlYno2DxM4DMljlGLlETpPz7Db35jwpJ0t4-MeCoDAeI3spykwJaaqz9W&s=10', 'availabel'),
(20125, 6, 'Asus ROG Phone 9 Pro (16/512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm) & GPU Adreno 830\r\n• Layar: 6.78 inci Samsung Flexible AMOLED LTPO, FHD+, 185Hz refresh rate (melalui Game Genie), kecerahan 2500 nits, Gorilla Glass Victus 2\r\n• Memori: RAM 16GB + ROM 512GB (Varian Pro)\r\n• Baterai & Charging: 5800 mAh + 65W HyperCharge, Wireless Charging, & Bypass Charging\r\n• Sistem Pendingin: GameCool 9 Cooling System dengan struktur lembaran grafit 57% lebih besar serta dukungan kipas eksternal AeroActive Cooler X Pro\r\n• Fitur Gaming: AniMe Vision LED Matrix belakang (648 mini-LED interaktif), tombol ultrasonik AirTrigger, dual speaker stereo magnetik\r\n• Kamera: Belakang 50MP (Sony Lytia 700, 6-Axis Hybrid Gimbal Stabilizer 4.0) + 32MP (Telephoto 3x, OIS) + 13MP (Ultrawide) | Depan 32MP RGBW', 16999000, 'https://cdn-jpr.jawapos.com/images/43/2026/09/13/asus-rog-phone-9-pro-rp21-juta-menawarkan-ram-24-gb-storage-1-tb-layar-185-hz-dan-fitur-gaming-khusus-yang-tidak-biasa-pinterest-TsUq6.webp', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2omxPHxle4O1-ITOZr1WFaqXdMOZvONVv8FcE4YIbp6nz5splSDJwJj4&s=10', 'https://sumeks.disway.id/upload/ec27740de9e2cb43ea273eb4aa596409.jpg', 'availabel'),
(20126, 6, 'Asus ROG Phone 9 Pro Edition (24GB/1TB).', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm) & GPU Adreno 830\r\n• Layar: 6.78 inci Samsung Flexible AMOLED LTPO, FHD+, 185Hz refresh rate (melalui Game Genie), kecerahan 2500 nits, Gorilla Glass Victus 2\r\n• Memori: RAM 24GB LPDDR5X + ROM 1TB UFS\r\n• Baterai & Charging: 5800 mAh + 65W HyperCharge, Wireless Charging, & Bypass Charging\r\n• Sistem Pendingin: GameCool 9 Cooling System dengan struktur lembaran grafit 57% lebih besar serta dukungan kipas eksternal AeroActive Cooler X Pro\r\n• Fitur Gaming: AniMe Vision LED Matrix belakang (648 mini-LED interaktif), tombol ultrasonik AirTrigger, dual speaker stereo magnetik, lengkap dengan bundle pendingin.\r\n• Kamera: Belakang 50MP (Sony Lytia 700, 6-Axis Hybrid Gimbal Stabilizer 4.0) + 32MP (Telephoto 3x, OIS) + 13MP (Ultrawide) | Depan 32MP RGBW', 22500000, 'https://sumeks.disway.id/upload/ec27740de9e2cb43ea273eb4aa596409.jpg', 'https://www.digitaltrends.com/tachyon/2024/11/rog-phone-9-pro-back-hand.jpg?fit=3000%2C2000', 'https://st.gsmarena.com/imgroot/reviews/24/asus-rog-phone-9-pro/lifestyle/-1200w5/gsmarena_007.jpg', 'availabel'),
(20127, 7, 'Samsung S 25 Ultra (12/256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite for Galaxy\r\n• Layar: 6.9 inci Dynamic AMOLED 2X, QHD+, Gorilla Armor 2 (sangat minim pantulan cahaya)\r\n• Memori: RAM 12GB + ROM 256GB\r\n• Kamera Belakang: Quad Camera 200MP (Utama, OIS) + 50MP (Ultrawide) + 50MP (Telephoto 5x Zoom) + 10MP (Telephoto 3x Zoom)\r\n• Baterai & Charging: 5000 mAh + 45W Fast Charging', 22999000, 'https://images.samsung.com/id/smartphones/galaxy-s25-ultra/images/galaxy-s25-ultra-features-kv.jpg?imbypass=true', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/110/MTA-180990567/samsung_samsung_galaxy_s25_ultra_12-256gb_full01_73y2xki.jpg', 'https://images.samsung.com/id/smartphones/galaxy-s25-ultra/buy/kv_global_PC_v2.jpg?imbypass=true', 'availabel'),
(20128, 7, 'Samsung S25 Ultra (12/1TB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite for Galaxy\r\n• Layar: 6.9 inci Dynamic AMOLED 2X, QHD+, Gorilla Armor 2 (sangat minim pantulan cahaya)\r\n• Memori: RAM 12GB + 1TB\r\n• Kamera Belakang: Quad Camera 200MP (Utama, OIS) + 50MP (Ultrawide) + 50MP (Telephoto 5x Zoom) + 10MP (Telephoto 3x Zoom)\r\n• Baterai & Charging: 5000 mAh + 45W Fast Charging', 28999000, 'https://images.samsung.com/id/smartphones/galaxy-s25-ultra/buy/kv_global_PC_v2.jpg?imbypass=true', 'https://awsimages.detik.net.id/community/media/visual/2025/01/25/samsung-galaxy-s25-series.png?w=1200', 'https://cdn.wccftech.com/wp-content/uploads/2024/09/Galaxy-S25-Ultra-renders-5.jpg', 'availabel'),
(20129, 7, 'Samsung S26 (12/256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Exynos 2600 (NPU meningkat hingga 38%)\r\n• Layar: 6.3 inci Dynamic AMOLED 2X, FHD+ (2340x1080), 120Hz\r\n• Memori: RAM 12GB + ROM 256GB\r\n• Kamera Belakang: Triple 50 MP (Utama) + 12 MP (Ultrawide) + 10 MP (Telephoto)\r\n• Baterai & Charging: 4300 mAh + 25W Fast Charging\r\n• Fitur Khusus: Bobot ringan (167 gram), Armor Aluminum, Proteksi Gorilla Glass Victus 2', 16499000, 'https://img.global.news.samsung.com/id/wp-content/uploads/2026/02/10123212/006-product-galaxy-s26ultra-cobaltviolet-black-skyblue-white-1000x750px.jpg', 'https://img.global.news.samsung.com/id/wp-content/uploads/2026/02/27132624/Pre-Order-Samsung-Galaxy-S26-Pre-Order-1000px.jpg', 'https://images.samsung.com/id/smartphones/galaxy-s26/images/galaxy-s26-features-kv.jpg?imbypass=true', 'availabel'),
(20130, 7, 'Samsung S26 (12/512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Exynos 2600 (NPU meningkat hingga 38%)\r\n• Layar: 6.3 inci Dynamic AMOLED 2X, FHD+ (2340x1080), 120Hz\r\n• Memori: RAM 12GB + ROM 512GB\r\n• Kamera Belakang: Triple 50 MP (Utama) + 12 MP (Ultrawide) + 10 MP (Telephoto)\r\n• Baterai & Charging: 4300 mAh + 25W Fast Charging\r\n• Fitur Khusus: Bobot ringan (167 gram), Armor Aluminum, Proteksi Gorilla Glass Victus 2', 19499000, 'https://www.planetgadget.store/media/wysiwyg/blog/S26_web1.png', 'https://daftarsekolah.spmb.teknokrat.ac.id/wp-content/uploads/2026/10/intip-performa-gahar-samsung-galaxy-s26-fe-spesifikasi-gaming-kelas-atas-yang-dinantikan.jpg', 'https://img.us.news.samsung.com/us/wp-content/uploads/2026/08/26111300/1-1.-Galaxy-S26-FE_Main-KV_s-Edited-664x332.jpg', 'availabel'),
(20131, 7, 'Samsung S26 Ultra', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite Gen 5 (Customized for Galaxy)\r\n• Layar: 6.9 inci Anti-Reflective OLED, Quad HD+ (3120 x 1440), 120Hz\r\n• Memori: RAM 12GB / 16GB + ROM 256GB / 512GB / 1TB\r\n• Kamera Belakang: 200 MP (Utama, f/1.4) + 50MP (Periskop Telefoto, 5x Optical Zoom) + Ultrawide + Telefoto 3x\r\n• Baterai & Charging: 5000 mAh + 60W Fast Charging\r\n• Fitur Khusus: Stylus S-Pen internal, Bodi Armor Aluminum, Fitur AI Prompt Foto', 29499000, 'https://cdnpro.eraspace.com/pub/media/wysiwyg/Deskripsi_PDP/ImagePDP2026/Samsung_Galaxy_S26_Ultraa.webp', 'https://images.samsung.com/id/smartphones/galaxy-s26-ultra/images/galaxy-s26-ultra-features-ecosystem-mo.jpg?imbypass=true', 'https://images.samsung.com/africa_en/smartphones/galaxy-s26-ultra/buy/kv_animated_PC.jpg?imbypass=true', 'availabel'),
(20132, 8, 'Samsung Galaxy Z Flip 8 5G (12/256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Exynos 2600 efisien berteknologi NPU AI tinggi\r\n• Layar: Utama 6.9 inci Dynamic AMOLED 2X, 120Hz + Layar Cover 4.1 inci FlexWindow\r\n• Memori: RAM 12GB + ROM 256GB\r\n• Kamera Belakang: Dual 50 MP (Utama, ProVisual Engine) + 12 MP (Ultrawide)\r\n• Baterai & Charging: 4300 mAh + 25W Fast Charging & 15W Wireless', 19999000, 'https://cdn-jjmn.jawapos.com/images/4/2026/06/05/samsung-galaxy-z-flip-8-dirumorkan-hadir-dengan-strategi-dual-chipset-untuk-pasar-global-ilustrasi-ai-E7zsg.webp', 'https://mmc.tirto.id/image/share/socmed/2026/07/24/samsung-galaxy-z-flip-8--2.jpg', 'https://images.samsung.com/id/smartphones/galaxy-z-flip8/images/galaxy-z-flip8-features-kv.jpg?imbypass=true', 'availabel'),
(20133, 8, 'Samsung Galaxy Z Flip 8 5G (12/512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Exynos 2600 efisien berteknologi NPU AI tinggi\r\n• Layar: Utama 6.9 inci Dynamic AMOLED 2X, 120Hz + Layar Cover 4.1 inci FlexWindow\r\n• Memori: RAM 12GB + ROM 512GB\r\n• Kamera Belakang: Dual 50 MP (Utama, ProVisual Engine) + 12 MP (Ultrawide)\r\n• Baterai & Charging: 4300 mAh + 25W Fast Charging & 15W Wireless', 23999000, 'https://images.samsung.com/id/smartphones/galaxy-z-flip8/images/galaxy-z-flip8-features-kv.jpg?imbypass=true', 'https://awsimages.detik.net.id/visual/2026/07/22/samsung-galaxy-z-flip8-1784725858323_169.png?w=650&q=80', 'https://cdn.antaranews.com/cache/1200x800/2026/06/05/galaxy-z-flip7-features-kv.jpg', 'availabel'),
(20134, 8, 'Samsung Galaxy Z Fold 8 5G (12 + 256GB/512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm)\r\n• Layar: Utama 8.0 inci QXGA+ Dynamic AMOLED 2X (Lipat) + Cover Screen 6.5 inci\r\n• Memori: RAM 12GB LPDDR5X + ROM 256GB / 512GB UFS 4.0\r\n• Kamera Belakang: 200 MP ProVisual Camera (Utama, OIS) + 50MP (Telephoto, 5x Optical Zoom) + 12MP (Ultrawide)\r\n• Baterai & Charging: 4400 mAh + 45W Fast Charging\r\n• Fitur Khusus: Sertifikasi tahan air IP68, kompatibel S-Pen, proteksi bodi Armor Aluminum terbaru.', 28499000, 'https://images.samsung.com/id/smartphones/galaxy-z-fold8/images/galaxy-z-fold8-share-image.jpg', 'https://down-id.img.susercontent.com/file/sg-11134201-82596-ms0v68n3r7ygf3', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStzyfWLok9A-utW3meCWp9HE99D_Gfwgu9X_T9KNggByJYfFr1BhnO8udQ&s=10', 'availabel'),
(20135, 8, 'Samsung Galaxy Z Fold 8 5G (16 + 512GB/1TB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm)\r\n• Layar: Utama 8.0 inci QXGA+ Dynamic AMOLED 2X (Lipat) + Cover Screen 6.5 inci\r\n• Memori: RAM 16GB LPDDR5X + ROM 512GB/1TB UFS 4.0\r\n• Kamera Belakang: 200 MP ProVisual Camera (Utama, OIS) + 50MP (Telephoto, 5x Optical Zoom) + 12MP (Ultrawide)\r\n• Baterai & Charging: 4400 mAh + 45W Fast Charging\r\n• Fitur Khusus: Sertifikasi tahan air IP68, kompatibel S-Pen, proteksi bodi Armor Aluminum terbaru.', 40499000, 'https://radarcirebon.disway.id/upload/1ff6202b33c99711e1fdf14782034e22.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStzyfWLok9A-utW3meCWp9HE99D_Gfwgu9X_T9KNggByJYfFr1BhnO8udQ&s=10', 'https://rri-portal-app-assets.obs.ap-southeast-4.myhuaweicloud.com/upload/berita/image/batam/1786201674841190_6eb158a5f9_berita_batam.webp', 'availabel'),
(20136, 9, 'Samsung Galaxy A16 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 6300\r\n• Layar: 6.7 inci Super AMOLED, 90Hz refresh rate\r\n• Memori: RAM 8GB + ROM 128GB / 256GB\r\n• Baterai & Charging: 5000 mAh + 25W Fast Charging', 3750000, 'https://i.ytimg.com/vi/oqY-S9CQ8tk/maxresdefault.jpg', 'https://images.samsung.com/is/image/samsung/p6pim/id/feature/165713390/id-feature-galaxy-a16-5g-sm-a166-544310716?$FB_TYPE_A_MO_JPG$', 'https://asset.kompas.com/crops/FqjTRT14IPj4tWkpgd80SNu3sX4=/0x0:2100x1400/1200x900/data/photo/2024/11/20/673d73e061b02.jpg', 'availabel'),
(20137, 9, 'Samsung Galaxy A27 5G (6GB / 128GB)', '• Chipset: Qualcomm Snapdragon 6 Gen 3\r\n• Layar: 6.7 inci Super AMOLED, 120Hz refresh rate\r\n• Memori: RAM 6GB + ROM 128GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 5 MP (Ultrawide) + 2 MP (Macro) | Depan 12 MP\r\n• Baterai & Charging: 5000 mAh + 25W Fast Charging', 5299000, 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/107/MTA-185028829/samsung_samsung_galaxy_a27_5g_ram_6-128_-_8-256_gb_garansi_resmi_full05_ejy94gbw.webp', 'https://mediaindonesia.gumlet.io/news/2026/07/13/1783933639_61b9215c343ece07fefa.jpg?w=376&dpr=2.6', 'https://img.global.news.samsung.com/id/wp-content/uploads/2026/07/17102621/Samsung-Galaxy-A27-5G-01-Main728px.jpg', 'availabel'),
(20138, 9, 'Samsung Galaxy A27 5G (8GB / 256GB)', '• Chipset: Qualcomm Snapdragon 6 Gen 3\r\n• Layar: 6.7 inci Super AMOLED, 120Hz refresh rate\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 5 MP (Ultrawide) + 2 MP (Macro) | Depan 12 MP\r\n• Baterai & Charging: 5000 mAh + 25W Fast Charging', 6299000, 'https://img.global.news.samsung.com/id/wp-content/uploads/2026/07/17102621/Samsung-Galaxy-A27-5G-01-Main728px.jpg', 'https://img.global.news.samsung.com/id/wp-content/uploads/2026/06/25181702/Samsung-Galaxy-A27-5G-728px.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvsKUGRR5lHbAMoe6oGI9WhU_S5oMFt8oM-PX8k-Qg9Gf1G05QnQ2IsoB&s=10', 'availabel'),
(20139, 9, 'Samsung Galaxy A37 5G (8GB / 128GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Exynos 1480 (Ex-A55) dengan kartu grafis Xclipse 530\r\n• Layar: 6.8 inci Super AMOLED, 120Hz refresh rate\r\n• Memori: RAM 8GB + ROM 128GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 8 MP (Ultrawide) + 5 MP (Macro) | Depan 12 MP\r\n• Baterai & Charging: 5000 mAh + 45W Super Fast Charging (Mendukung kecepatan cas lebih tinggi)', 6299000, 'https://images.samsung.com/is/image/samsung/assets/id/smartphones/galaxy-a37/buy/A37_5G_PDP_720x4801.jpg', 'https://images.samsung.com/is/image/samsung/p6pim/id/feature/167029625/id-feature-awesome-lavender-551657073?$FB_TYPE_K_MO_JPG$', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvsKUGRR5lHbAMoe6oGI9WhU_S5oMFt8oM-PX8k-Qg9Gf1G05QnQ2IsoB&s=10', 'availabel'),
(20140, 9, 'Samsung Galaxy A37 5G (8GB / 256GB)', '• Chipset: Exynos 1480 (Ex-A55) dengan kartu grafis Xclipse 530\r\n• Layar: 6.8 inci Super AMOLED, 120Hz refresh rate\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 8 MP (Ultrawide) + 5 MP (Macro) | Depan 12 MP\r\n• Baterai & Charging: 5000 mAh + 45W Super Fast Charging (Mendukung kecepatan cas lebih tinggi)', 6999000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvsKUGRR5lHbAMoe6oGI9WhU_S5oMFt8oM-PX8k-Qg9Gf1G05QnQ2IsoB&s=10', 'https://asset.tribunnews.com/JhTFKKCnocAfV0-ERCtNY7xqkAc=/1200x675/filters:upscale():quality(30):format(webp):focal(0.5x0.5:0.5x0.5)/batam/foto/bank/originals/Ilustrasi-4-pilihan-warna-Samsung-Galaxy-A37-5G-di-Indonesia-yang-rilis-April-2026.jpg', 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/db617fa508234c8ca39ab1902250cbad~tplv-aphluv4xwc-resize-jpeg:700:0.jpeg', 'availabel'),
(20141, 9, 'Samsung Galaxy A57 5G (8GB / 128GB)', 'Spesifikasi Utama:\r\n\r\n• Chipset: Exynos 1680 dengan kartu grafis Xclipse 550\r\n• Layar: 6.7 inci Super AMOLED Plus, 120Hz refresh rate\r\n• Memori: RAM 8GB + ROM 128GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 12 MP (Ultrawide) + 5 MP (Macro) | Depan 12 MP\r\n• Baterai & Charging: 5000 mAh + 25W Fast Charging', 7299000, 'https://media.dinomarket.com/docs/imgTD/2026-03/DM_4328A60ECCFB503212480073D5E49C13_310326160330_ll.jpg', 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/c6c4cb82b98a4f58a57f09c038b5f094~tplv-aphluv4xwc-resize-jpeg:700:0.jpeg', 'https://images.samsung.com/is/image/samsung/p6pim/id/feature/167029458/id-feature-awesome-gray-551656367?$FB_TYPE_K_MO_JPG$', 'availabel'),
(20142, 9, 'Samsung Galaxy A57 5G (12GB / 256GB)', 'Spesifikasi Utama:\r\n\r\n• Chipset: Exynos 1680 dengan kartu grafis Xclipse 550\r\n• Layar: 6.7 inci Super AMOLED Plus, 120Hz refresh rate\r\n• Memori: 12GB + ROM 256GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 12 MP (Ultrawide) + 5 MP (Macro) | Depan 12 MP\r\n• Baterai & Charging: 5000 mAh + 25W Fast Charging', 8299000, 'https://images.samsung.com/is/image/samsung/p6pim/id/feature/167029458/id-feature-awesome-gray-551656367?$FB_TYPE_K_MO_JPG$', 'https://images.tokopedia.net/img/cache/700/aphluv/1997/1/1/7436a8a23bf4482c9c9c40257526f9d6~.jpeg.webp', 'https://img.global.news.samsung.com/id/wp-content/uploads/2026/04/07133850/07-Samsung-Galaxy-A57-5G-Galaxy-A-Series-Paling-Tipis-dengan-AI-Lebih-Cerdas-dan-Performa-Lebih-Kencang-1000px.jpg', 'availabel'),
(20143, 10, 'Samsung Galaxy M15 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 6100+ (6 nm)\r\n• Layar: 6.5 inci Super AMOLED, FHD+, 90Hz refresh rate, 800 nits\r\n• Memori: RAM 6GB + ROM 128GB (Mendukung RAM Plus hingga 6GB)\r\n• Kamera Belakang: 50 MP (Utama) + 5 MP (Ultrawide) + 2 MP (Macro)\r\n• Baterai & Charging: 6000 mAh + 25W Fast Charging\r\n• Fitur Unggulan: NFC, Jaminan 4x OS Update & 5 Tahun Security Update, Knox Vault', 2500000, 'https://down-id.img.susercontent.com/file/id-11134207-7r98r-lxb24mv09imi1f', 'https://images.samsung.com/is/image/samsung/p6pim/id/feature/165295417/id-feature-galaxy-m15-5g-sm-m156-541878775?$FB_TYPE_A_MO_JPG$', 'https://asset.kompas.com/crops/HOwNI78Ab9oEOI8AcWOht27CqWg=/0x85:4000x2752/1200x800/data/photo/2024/06/24/6678d4eb7e057.jpg', 'availabel'),
(20144, 10, 'Samsung Galaxy M35 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Exynos 1380 (5 nm)\r\n• Layar: 6.6 inci Super AMOLED, FHD+, 120Hz refresh rate\r\n• Memori: RAM 8GB + ROM 128GB / 256GB\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 8 MP (Ultrawide) + 2 MP (Macro)\r\n• Baterai & Charging: 6000 mAh + 25W Fast Charging', 4200000, 'https://images.samsung.com/is/image/samsung/p6pim/in/feature/165506305/in-feature-galaxy-m-542930327?$FB_TYPE_A_MO_JPG$', 'https://awsimages.detik.net.id/community/media/visual/2024/05/28/galaxy-m35_169.png?w=1200', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlr2r5wE_WYNRWTAPgZcY_WcJVrQar9Vqf9HpHYFH_Rqtd3q7dHWR_Sl4&s=10', 'availabel'),
(20145, 10, 'Samsung Galaxy M55 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 7 Gen 1 (4 nm)\r\n• Layar: 6.7 inci Super AMOLED Plus, FHD+, 120Hz refresh rate, 1000 nits\r\n• Memori: RAM 8GB / 12GB + ROM 256GB (MicroSD hingga 1TB)\r\n• Kamera Belakang: 50 MP (Utama, OIS) + 8 MP (Ultrawide) + 2 MP (Macro)\r\n• Kamera Depan: 50 MP Selfie Camera\r\n• Baterai & Charging: 5000 mAh + 45W Fast Charging\r\n• Fitur Unggulan: Samsung Knox Vault, Dual Speaker Dolby Atmos, NFC', 5750000, 'https://images.samsung.com/is/image/samsung/p6pim/in/feature/165183301/in-feature-galaxy-m55-5g-sm-m556-541002802?$FB_TYPE_A_MO_JPG$', 'https://images.samsung.com/is/image/samsung/p6pim/bd/feature/165453089/bd-feature-go-and-capture-the-majestic-542626634?$FB_TYPE_A_MO_JPG$', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc-LWDsdbhJX9eSyvduiZ0PZl3Bri9Z4275_Q04LEpNkI5Pk81anMjQe0&s=10', 'availabel'),
(20146, 11, 'IQOO 13 5G (12GB / 256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm) & Supercomputing Chip Q2\r\n• Layar: 6.82 inci Q10 AMOLED, 2K Ultra Resolution (3168x1440), 144Hz, 4500 nits\r\n• Memori: RAM 12GB + ROM 256GB \r\n• Kamera Belakang: Triple 50 MP Sony IMX921 (OIS) + 50 MP (Ultrawide) + 50 MP (Telephoto)\r\n• Baterai & Charging: 6150 mAh + 120W FlashCharge & Bypass Charging\r\n• Fitur Spesial: Monster Halo Floating Light (Lampu RGB belakang interaktif), 3D Ultrasonic Fingerprint, Proteksi IP68+IP69', 9999000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9VkyPT2-oj7QJOmfAKNESOhitr12ogCFIVxe0mglf8N_IuGKakbdtFR0&s=10', 'https://www.planetgadget.store/media/wysiwyg/blog/post/i/q/iqoo_13_spesifikasi.jpg', 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202412/iqoo-13-13072223-1x1.jpg?VersionId=weF1PTuspdwjBLlMJkhFrZSjzLkbcEg3', 'availabel'),
(20147, 11, 'IQOO 13 5G (16GB / 512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm) & Supercomputing Chip Q2\r\n• Layar: 6.82 inci Q10 AMOLED, 2K Ultra Resolution (3168x1440), 144Hz, 4500 nits\r\n• Memori: RAM 16GB + ROM 512GB\r\n• Kamera Belakang: Triple 50 MP Sony IMX921 (OIS) + 50 MP (Ultrawide) + 50 MP (Telephoto)\r\n• Baterai & Charging: 6150 mAh + 120W FlashCharge & Bypass Charging\r\n• Fitur Spesial: Monster Halo Floating Light (Lampu RGB belakang interaktif), 3D Ultrasonic Fingerprint, Proteksi IP68+IP69', 11999000, 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202412/iqoo-13-13072223-1x1.jpg?VersionId=weF1PTuspdwjBLlMJkhFrZSjzLkbcEg3', 'https://awsimages.detik.net.id/community/media/visual/2024/10/30/iqoo-13_169.webp?w=1200', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlAjfiHy_NqynG2YcYNDmt3rZ4yKlLxZr8nTZqS8KpOjjbeU1KAzHydYe9&s=10', 'availabel'),
(20148, 11, 'IQOO 15R 5G (8GB / 256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 9400 / Snapdragon Kelas Atas\r\n• Layar: 6.78 inci AMOLED, 1.5K, 144Hz Eyecare Display\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Kamera Belakang: 50 MP Sony LYT-700V OIS Main Camera + Auxiliary Lens\r\n• Baterai & Charging: 7600 mAh Silicon Anode Battery + 80W Fast Charging\r\n• Fitur Gaming: 6.5K IceCore VC Cooling System (Suhu sangat adem saat rendering tinggi)', 8699000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPHLnH-3_WL5ghR9QCPvxfAhJrf7h10Gei37XK3QSv-QPpA9gc9QvZ7Co&s=10', 'https://static.hub.91mobiles.com/multisite/wp-content/uploads/sites/6/2026/02/iqoo_15r_hands-on-1.jpg?tr=q-70', 'https://gadget.jagatreview.com/wp-content/uploads/2026/02/iQOO-15R-1.png', 'availabel'),
(20149, 11, 'IQOO 15R 5G (12GB / 512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 9400 / Snapdragon Kelas Atas\r\n• Layar: 6.78 inci AMOLED, 1.5K, 144Hz Eyecare Display\r\n• Memori: RAM 12GB + ROM 512GB\r\n• Kamera Belakang: 50 MP Sony LYT-700V OIS Main Camera + Auxiliary Lens\r\n• Baterai & Charging: 7600 mAh Silicon Anode Battery + 80W Fast Charging\r\n• Fitur Gaming: 6.5K IceCore VC Cooling System (Suhu sangat adem saat rendering tinggi)', 11999000, 'https://gadget.jagatreview.com/wp-content/uploads/2026/02/iQOO-15R-1.png', 'https://file.fin.co.id/uploads/fin-gadget/images/2026/02/21/segera-rilis-ini-prediksi-harga-dan-spesifikasi-iqoo-15r-5g-094854.webp', 'https://media.dinomarket.com/docs/imgmedia/bann_news_02_1802262.jpg', 'availabel'),
(20150, 11, 'IQOO 15 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 9400 / Snapdragon Kelas Atas\r\n• Layar: 6.78 inci AMOLED, 1.5K, 144Hz Eyecare Display\r\n• Memori: RAM 8GB / 12GB + ROM 256GB / 512GB\r\n• Kamera Belakang: 50 MP Sony LYT-700V OIS Main Camera + Auxiliary Lens\r\n• Baterai & Charging: 7600 mAh Silicon Anode Battery + 80W Fast Charging\r\n• Fitur Gaming: 6.5K IceCore VC Cooling System (Suhu sangat adem saat rendering tinggi)', 13999000, 'https://www.gameholic.id/wp-content/uploads/2025/12/3.-iQOO-15-Performance-Beyond.jpg', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/catalog-image/99/MTA-184543416/br-m036969-03485_full01-8d8fcc4f.webp', 'https://gadget.jagatreview.com/wp-content/uploads/2025/09/IQOO-15.jpg', 'availabel'),
(20151, 12, 'IQOO Z11x 5G (6GB / 128GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 7400 Turbo\r\n• Layar: 6.76 inci LCD, 120Hz refresh rate\r\n• Memori: RAM 6GB + ROM 128GB \r\n• Baterai & Charging: 7200 mAh Battery\r\n• Fitur Durabilitas: Sertifikasi IP68 + IP69+ serta Military Grade Durability\r\n• Kamera: Utama 50MP Sony IMX852 + Depan 32MP', 3999000, 'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1779446989992/3de444e09939abc80f9335c9db97d641.jpg', 'https://carisinyal.com/wp-content/uploads/2026/05/kamera-z11x_.webp', 'https://gadgetren.com/wp-content/uploads/2026/05/Rilis-iQOO-Z11x-3.jpg', 'availabel'),
(20152, 12, 'IQOO Z11x 5G (8GB / 256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 7400 Turbo\r\n• Layar: 6.76 inci LCD, 120Hz refresh rate\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Baterai & Charging: 7200 mAh Battery\r\n• Fitur Durabilitas: Sertifikasi IP68 + IP69+ serta Military Grade Durability\r\n• Kamera: Utama 50MP Sony IMX852 + Depan 32MP', 5699000, 'https://papuabarat.disway.id/upload/4f8c278d90242a8f57c561f5fe05d34f.jpg', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/108/MTA-184729554/iqoo_full03_724c7cdc.webp', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/720x0/webp/photo/2026/05/26/1379149180.jpg', 'availabel'),
(20153, 12, 'IQOO 11 5G (8GB / 128GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity Kelas Atas\r\n• Layar: 6.83 inci 1.5K AMOLED Esports Display, 144Hz refresh rate, material Q10+\r\n• Memori: RAM 8GB + ROM 128GB\r\n• Baterai & Charging: 9020 mAh Ultra-Slim Silicon BlueVolt Battery + 90W FlashCharge\r\n• Sistem Pendingin: 7000 mm² Vapor Chamber Cooling System', 5899000, 'https://in-exstatic-vivofs.vivo.com/gdHFRinHEMrj3yPG/product/1788154598380/zip/img/iqooz11-kv-img1-lg-x2.jpg', 'https://media.gadgetbytenepal.com/2026/08/iQOO-Z11-camera.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQevvSQD9oJkgrnIhwze6ufT2C3WiqwJxHCDlZ4fIVaYgI2yHbL3GWa7B7F&s=10', 'availabel'),
(20154, 12, 'IQOO 11 5G (12GB/ 256GB)', 'Spesifikasi lengkap:\r\n\r\n• Chipset: MediaTek Dimensity Kelas Atas\r\n• Layar: 6.83 inci 1.5K AMOLED Esports Display, 144Hz refresh rate, material Q10+\r\n• Memori: RAM 12GB + ROM 256GB\r\n• Baterai & Charging: 9020 mAh Ultra-Slim Silicon BlueVolt Battery + 90W FlashCharge\r\n• Sistem Pendingin: 7000 mm² Vapor Chamber Cooling System', 8399000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQevvSQD9oJkgrnIhwze6ufT2C3WiqwJxHCDlZ4fIVaYgI2yHbL3GWa7B7F&s=10', 'https://st.gsmarena.com/imgroot/news/26/08/iqoo-z11-india-launch-date/inline/-1200/gsmarena_002.jpg', 'https://down-id.img.susercontent.com/file/id-11134207-8224t-mk1xw2p7vjlx26', 'availabel'),
(20155, 13, 'IQOO NEO 10 Pro 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 9400 (3nm)\r\n• Layar: 6.78 inci LTPO AMOLED, 1.5K, 144Hz refresh rate\r\n• Memori: RAM 12GB / 16GB + ROM hingga 512GB\r\n• Baterai & Charging: 6100 mAh Silicon-Carbon + 120W FlashCharge\r\n• Kamera: Dual 50 MP (Utama OIS + Ultrawide)', 11000000, 'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc4/iQoo-Neo-10-Pro.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiw1tSO58o8lPM9wNxvabeUYu2M3DW_DMCL_Jjp5gePbLJDZje5POdzR4&s=10', 'https://asset.kompas.com/crops/jWNo4mzqUSJrDw86EIFktQi7qH4=/46x0:1171x750/1200x800/data/photo/2024/12/02/674d117a683cc.jpg', 'availabel'),
(20156, 13, 'IQOO NEO 10 5G (8GB / 256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8s Gen 4 (4nm) & Chip Q1\r\n• Layar: 6.78 inci C9+ AMOLED, 1.5K Resolusi, 144Hz, kecerahan 5500 nits\r\n• Memori: RAM 8GB LPDDR5X Ultra + ROM 256GB UFS 4.1\r\n• Baterai & Charging: 7000 mAh Gen 3 BlueVolt Battery + 120W FlashCharge\r\n• Fitur Fisik: Ketebalan bodi sangat ramping (8.09 mm), rating IP65', 6699000, 'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/product/1785984761769/zip/img/iqooz10turbo-kv-img1-lg-x2.jpg', 'https://filebroker-cdn.lazada.co.id/kf/Sb754b7b7b4594f23ae332e18103f94714.jpg', 'https://asset-2.tribunnews.com/shopping/foto/bank/images/iQOO-Neo-10-master.jpg', 'availabel'),
(20157, 13, 'IQOO NEO 10 5G (12GB / 256GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8s Gen 4 (4nm) & Chip Q1\r\n• Layar: 6.78 inci C9+ AMOLED, 1.5K Resolusi, 144Hz, kecerahan 5500 nits\r\n• Memori: RAM 12GB LPDDR5X Ultra + ROM 256GB UFS 4.1\r\n• Baterai & Charging: 7000 mAh Gen 3 BlueVolt Battery + 120W FlashCharge\r\n• Fitur Fisik: Ketebalan bodi sangat ramping (8.09 mm), rating IP65', 7699000, 'https://asset-2.tribunnews.com/shopping/foto/bank/images/iQOO-Neo-10-master.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtcUnyBSC9fOH_gWKjeCzIPx5LXuQrCdoz_JxlASQm7f41XiJjaMtXbCs&s=10', 'https://tautekno.id/wp-content/uploads/2025/06/WhatsApp-Image-2025-06-05-at-075040-2-615934869.webp', 'availabel'),
(20158, 13, 'IQOO NEO 11 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite & Supercomputing Chip Q2\r\n• Layar: 6.82 inci 8T LTPO AMOLED, 144Hz refresh rate\r\n• Memori: RAM 12GB / 16GB LPDDR5X + ROM hingga 512GB UFS 4.1\r\n• Baterai & Charging: 7500 mAh + 100W FlashCharge\r\n• Sistem Pendingin: 8K Vapor Chamber Cooling System\r\n• Kamera: Utama 50 MP (Sony LYT-700V, OIS) + 8 MP Ultrawide', 9800000, 'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc5/iQOO-Neo-11-featured.jpg', 'https://i0.wp.com/gizmologi.id/wp-content/uploads/2025/10/iQOO-Neo-11-103.jpg?fit=1200%2C675&ssl=1', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxB0le7aYRlfjDBBPaL5bQ-eIC58ct-2csvKLmq3ulTcTIQW0TDkBwqX8&s=10', 'availabel'),
(20159, 14, 'Xiaomi 14', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 3 (4nm)\r\n• Layar: 6.36 inci LTPO OLED, 120Hz, 3000 nits\r\n• Memori: RAM 12GB + ROM 256GB\r\n• Kamera: Triple 50 MP Leica (Utama + Telephoto + Ultrawide)\r\n• Baterai: 4610 mAh + 90W HyperCharge', 11999000, 'https://i02.appmifile.com/529_operator_sg/18/01/2024/ba1d009234a56edd7aec73a7a80a2258.png', 'https://i02.appmifile.com/mi-com-product/fly-birds/xiaomi-14/M/black.png', 'https://i0.wp.com/gizmologi.id/wp-content/uploads/2024/03/Xiaomi-14-206.jpg?fit=1024%2C576&ssl=1', 'availabel'),
(20160, 14, 'Xiaomy 15 Regular', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm)\r\n• Layar: 6.36 inci AMOLED CrystalRes (2670 x 1200), 120Hz, 3200 nits, bezel tipis 1.38 mm\r\n• Memori: RAM 12GB + ROM 256GB / 512GB\r\n• Sistem Kamera Leica Triple: 50 MP Utama (Light Fusion 900, OIS) + 50 MP Telephoto Zoom + 50 MP Ultrawide\r\n• Baterai & Charging: 5420 mAh + 90W Wired HyperCharge & 50W Wireless Charging\r\n• Fitur Tambahan: Sensor sidik jari ultrasonik di bawah layar, Wi-Fi 7, Rating proteksi IP68', 12599000, 'https://i0.wp.com/gizmologi.id/wp-content/uploads/2024/10/Xiaomi-15_Thumbnail.jpeg?resize=860%2C484&ssl=1', 'https://awsimages.detik.net.id/community/media/visual/2023/10/27/xiaomi-14-dan-xiaomi-14-pro-1_169.png?w=1200', 'https://i02.appmifile.com/mi-com-product/fly-birds/xiaomi-15/m/24eeef14afdab549d2513569bedeaf45.jpg?f=webp', 'availabel'),
(20161, 14, 'Xiaomy 15 Ultra (16GB / 512GB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm, up to 4.32GHz) + NPU AI pintar\r\n• Layar: 6.73 inci AMOLED WQHD+ (3200 x 1440), 120Hz LTPO, kecerahan puncak 3200 nits, dilindungi Xiaomi Shield Glass 2.0\r\n• Memori: RAM 16GB LPDDR5X + ROM 512GB UFS 4.1\r\n• Sistem Kamera Leica Quad:\r\n	• Kamera Utama: 50 MP (1 inci Sony LYT-900, f/1.63, OIS)\r\n	• Kamera Periskop: 200 MP Ultra-Telephoto (Isocell HP9, f/2.6)\r\n	• Kamera Telephoto: 50 MP (70mm floating lens)\r\n	• Kamera Ultrawide: 50 MP (14mm)\r\n	• Kamera Depan: 32 MP\r\n• Baterai & Charging: 5410 mAh + 90W HyperCharge kabel & 80W Wireless Charging\r\n• Fitur Spesial: Sertifikasi kedap air IP68, sasis tangguh Xiaomi Guardian Structure, Android 15 berbalut Xiaomi HyperOS 2', 16999000, 'https://img.lazcdn.com/g/p/96a074895f6cd2149e9957d3c7e29357.jpg_720x720q80.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7pz5vbnwk7tzBt3A1Qzlr8fADydnQ8oBPVqlUdwgSJYvoCkjWQdCP08M&s=10', 'https://static.promediateknologi.id/crop/0x0:0x0/1200x0/webp/photo/p1/1061/2025/03/07/Screenshot_20250307_230923_Chrome-2328073052.jpg', 'availabel'),
(20162, 14, 'Xiaomy 15 Ultra (16GB / 1TB)', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Elite (3nm, up to 4.32GHz) + NPU AI pintar\r\n• Layar: 6.73 inci AMOLED WQHD+ (3200 x 1440), 120Hz LTPO, kecerahan puncak 3200 nits, dilindungi Xiaomi Shield Glass 2.0\r\n• Memori: RAM 16GB LPDDR5X + ROM 1TB UFS 4.1\r\n• Sistem Kamera Leica Quad:\r\n	• Kamera Utama: 50 MP (1 inci Sony LYT-900, f/1.63, OIS)\r\n	• Kamera Periskop: 200 MP Ultra-Telephoto (Isocell HP9, f/2.6)\r\n	• Kamera Telephoto: 50 MP (70mm floating lens)\r\n	• Kamera Ultrawide: 50 MP (14mm)\r\n	• Kamera Depan: 32 MP\r\n• Baterai & Charging: 5410 mAh + 90W HyperCharge kabel & 80W Wireless Charging\r\n• Fitur Spesial: Sertifikasi kedap air IP68, sasis tangguh Xiaomi Guardian Structure, Android 15 berbalut Xiaomi HyperOS 2', 19999000, 'https://static.promediateknologi.id/crop/0x0:0x0/1200x0/webp/photo/p1/1061/2025/03/07/Screenshot_20250307_230923_Chrome-2328073052.jpg', 'https://iziway.cm/images/thumbs/0090889_xiaomi-redmi-15-ultra-256g-rom-8g-ram-5g-673-nano-sim-esim-5410mah-garantie-12-mois-sur-commande-_550.jpeg', 'https://asset.kompas.com/crops/bclD2Zj10ifKUZyQs95pMG0ijZs=/0x272:4160x3045/1200x800/data/photo/2025/03/07/67cab999f33d1.jpeg', 'availabel');
INSERT INTO `seri` (`id_seri`, `id_tipe`, `nama_seri`, `spek`, `harga`, `gambar1`, `gambar2`, `gambar3`, `status`) VALUES
(20163, 15, 'Redmi 15C', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Helio G99 Ultra\r\n• Layar: 6.88 inci IPS LCD, HD+, 120Hz refresh rate\r\n• Memori: RAM 6GB / 8GB + ROM 128GB / 256GB\r\n• Kamera Belakang: 50 MP AI Main Camera\r\n• Baterai & Charging: 6000 mAh + 33W Fast Charging', 2449000, 'https://images.tokopedia.net/img/cache/700/aphluv/1997/1/1/24b8808d66be4683af293ec979b98fce~.jpeg.webp', 'https://i02.appmifile.com/mi-com-product/fly-birds/redmi-15c/m/e23f06742c9544aa3f38036e29971942.png', 'https://i02.appmifile.com/687_operator_sg/13/08/2025/bc56eed25c1e429d683eecfdcc5b6924.png', 'availabel'),
(20164, 15, 'Redmi 15', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Snapdragon 685 (6nm)\r\n• Layar: 6.9 inci FHD+ DotDisplay, 144Hz AdaptiveSync refresh rate\r\n• Memori: RAM 8GB (bisa diperluas hingga 16GB via Virtual RAM) + ROM 128GB / 256GB\r\n• Kamera Belakang: Dual 50 MP AI Camera\r\n• Baterai & Charging: 7000 mAh + 33W Turbo Charge (Mendukung reverse charge 18W)\r\n• Fitur Spesial: Proteksi IP64, Fitur layar basah Wet Touch 2.0, Terintegrasi asisten Google Gemini AI', 2699000, 'https://completeselular.co.id/wp-content/uploads/2026/04/xiaomi-redmi-15-4g-1.jpg', 'https://cdnpro.eraspace.com/pub/media/.renditions/wysiwyg/Deskripsi_PDP/ImagePDP2025/Xiaomi_Redmi_15Ca.jpg', 'https://i02.appmifile.com/687_operator_sg/13/08/2025/bc56eed25c1e429d683eecfdcc5b6924.png', 'availabel'),
(20165, 15, 'Redmi Note 14 Pro 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 7300-Ultra (4nm)\r\n• Layar: 6.67 inci CrystalRes AMOLED, 1.5K, 120Hz, 3000 nits\r\n• Memori: RAM 8GB / 12GB + ROM 256GB / 512GB\r\n• Kamera Belakang: 200 MP (Utama, OIS) + 8 MP + 2 MP\r\n• Baterai & Charging: 5110 mAh + 45W Turbo Charge\r\n• Fitur Spesial: Sertifikasi kedap air IP68, audio stereo Dolby Atmos', 4250000, 'https://plazait.co.id/uploads/products/xiaomi-redmi-note-14-pro-plus-5g.jpg', 'https://i02.appmifile.com/866_item_id/04/06/2025/ded3f90778c6f12cf588c94f3ea9eb29.png?thumb=1&q=85', 'https://i02.appmifile.com/mi-com-product/fly-birds/redmi-note-14-pro-5g/m/b75b58cd13b1b81de29a03dfa2211919.jpg', 'availabel'),
(20166, 15, 'Redmi Note 15 Pro 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 7400-Ultra (4nm)\r\n• Layar: 6.83 inci AMOLED, 1.5K Resolusi (2772 × 1280), 120Hz, kecerahan puncak 3200 nits, proteksi Gorilla Glass Victus 2\r\n• Memori: RAM 8GB / 12GB + ROM 256GB / 512GB\r\n• Kamera Belakang: 200 MP (Utama, Sensor 1/1.4\", OIS) + 8 MP (Ultrawide)\r\n• Baterai & Charging: 6580 mAh + 45W Turbo Charging\r\n• Fitur Spesial: Sertifikasi IP66/IP68/IP69/IP69K (Tahan semprotan air panas bertekanan tinggi), volume speaker hingga 400%, NFC', 5099000, 'https://plazait.co.id/uploads/products/xiaomi-redmi-note-15-pro-5g.webp', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/95/MTA-183832510/xiaomi_xiaomi_redmi_note_15_pro_5g_8-256_12-512_garansi_resmi_no_repack_full01_2e7935d6.webp', 'https://www.notebookcheck.net/fileadmin/_processed_/webp/Notebooks/Xiaomi/Redmi_Note_15_Pro_5G/Xiaomi_Redmi_Note_15_Pro_5G_Test_6-q82-w2560-h.webp', 'availabel'),
(20167, 16, 'Xiaomi POCO M7 Pro 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 7025-Ultra (6nm, up to 2.5 GHz)\r\n• Layar: 6.67 inci AMOLED, FHD+, 120Hz refresh rate, 2100 nits peak, Gorilla Glass 5\r\n• Memori: RAM 8GB + ROM 256GB\r\n• Kamera Belakang: 50 MP (Sony IMX882, f/1.5, OIS) + 2 MP (Depth) | Depan 20 MP\r\n• Baterai & Charging: 5110 mAh + 45W Turbo Charging (60% dalam 30 menit)\r\n• Fitur Lain: IP64 (tahan cipratan air), Dual Stereo Speakers, Audio Jack 3.5mm, NFC', 3399000, 'https://migadget.id/wp-content/uploads/2025/04/POCO-M7-Pro-5G-3-1200x1200.jpg', 'https://i02.appmifile.com/917_operator_sg/21/07/2025/43afbe5db6df13ce9514cdb21f4e2fb7.jpg', 'https://i01.appmifile.com/webfile/globalimg/Discover_/ES_Articles/POCO_M7_Pro_5G/1.png', 'availabel'),
(20168, 16, 'Xiaomi POCO X7 Pro 5G', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: MediaTek Dimensity 8400-Ultra (Skor AnTuTu tembus 1.704.330)\r\n• Layar: 6.67 inci CrystalRes AMOLED, 1.5K Resolusi, 120Hz, 3200 nits peak, Gorilla Glass 7i\r\n• Memori: RAM 12GB LPDDR5X + ROM 512GB UFS 4.0\r\n• Kamera Belakang: 50 MP (Sony IMX882, f/1.5, OIS) + 8 MP (Ultrawide) + Lensa Makro\r\n• Baterai & Charging: 6000 mAh + 90W HyperCharge (100% dalam 42 menit)\r\n• Fitur Spesial: Proteksi tahan air IP68, sistem pendingin POCO 3D IceLoop luas 5000 mm²', 4950000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8VyPtH6RaP_4yMDEuvRjXThT5MDkTb4wvsP88DQZwU43K8YBJx8g8Eup2&s=10', 'https://prioritas.xl.co.id/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Fstatic-cms-prd%2F2025%2F07%2Fpoco-x7-1024x660.png&w=3840&q=75', 'https://static.pasarwarga.com/imagescrop/product/550/product_temp_c1d0a0c7f1bac874ce11993d00365bbd.jpeg', 'availabel'),
(20169, 16, 'Xiaomi POCO F7 Pro', 'Spesifikasi Lengkap:\r\n\r\n• Chipset: Qualcomm Snapdragon 8 Gen 3 (4nm TSMC) dengan sistem pendingin LiquidCool 4.0 IceLoop\r\n• Layar: 6.67 inci 2K Flow AMOLED (3200 x 1440), 120Hz, kecerahan puncak 3200 nits, Gorilla Glass 7i\r\n• Memori: RAM 12GB LPDDR5X + ROM 512GB UFS 4.1\r\n• Kamera Belakang: 50 MP (Sony Light Fusion 800, OIS) + 8 MP (Ultrawide) | Depan 20 MP\r\n• Baterai & Charging: 6000 mAh + 90W HyperCharge (0-100% dalam 37 menit)\r\n• Fitur Spesial: Sertifikasi kedap air IP68 (hingga kedalaman 2.5m selama 30 menit), sidik jari ultrasonik di bawah layar, Wi-Fi 7', 7499000, 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/img/VqbcmM/2025/4/9/5d111b21-2c61-4baf-bdf7-78fd956662a0.jpg~tplv-aphluv4xwc-resize-jpeg:700:0.jpg', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/104/MTA-182488018/xiaomi_xiaomi_poco_f7_pro_5g_ram_12gb_rom_512gb_full10_jp0n7txu.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8i8hQS-92LIbh1OMGXeSRjxh8KQa2gVi33ZCCKOEgGRMYsSTkRUIEr7c&s=10', 'availabel'),
(20170, 17, 'IPhone 16 Series', 'Spesifikasi Lengkap:\r\n\r\nChipset: \r\n• Reguler & Plus: Apple A18 (3nm).\r\n• Pro & Pro Max: Apple A18 Pro (3nm generasi ke-2).\r\n\r\nMemori: 8GB + 128GB/256GB/512GB/1TB\r\n\r\nLayar:\r\n• iPhone 16 Reguler: 6.1 inci (Refresh Rate 60Hz).\r\n• iPhone 16 Plus: 6.7 inci (Refresh Rate 60Hz).\r\n• iPhone 16 Pro: 6.3 inci (Mendukung 120Hz ProMotion & Always-On).\r\n• iPhone 16 Pro Max: 6.9 inci (Mendukung 120Hz ProMotion & Always-On).\r\n\r\nBaterai: Wireless MagSafe 25W\r\n• iPhone 16 Reguler: 3.561 mAh (Hingga 22 jam pemutaran video).\r\n• iPhone 16 Plus: 4.674 mAh (Hingga 27 jam pemutaran video).\r\n• iPhone 16 Pro: 3.582 mAh (Hingga 22–27 jam pemutaran video).\r\n• iPhone 16 Pro Max: 4.685 mAh (Hingga 33 jam pemutaran video).\r\n\r\nFitur Lainnya: Camera Control button (tombol haptik geser untuk zoom/aperture kamera), Action Button, dan sertifikasi tahan air kedap IP68.\r\n\r\n• iPhone 16 Reguler: Mulai dari Rp15.249.000 – Rp16.999.000.\r\n• iPhone 16 Plus: Mulai dari Rp16.249.000 – Rp18.999.000.\r\n• iPhone 16 Pro: Mulai dari Rp17.499.000 – Rp21.999.000.\r\n• iPhone 16 Pro Max: Berada di kisaran Rp20.499.000 (basis) hingga Rp30.999.000.', 19000000, 'https://www.apple.com/v/iphone-16/h/images/meta/iphone-16_specs__bq5wb41xhdle_og.png', 'https://img2.beritasatu.com/cache/jakartaglobe/960x620-w/2024/10/1730128474-1024x683.webp', 'https://img2.beritasatu.com/cache/jakartaglobe/910x580-2/2024/10/1730128474-1024x683.webp', 'availabel'),
(20171, 17, 'IPhone 17 Series', '`Spesifikasi Lengkap:\r\n\r\n• Chipset:\r\n	• Reguler: Apple A19 (Fabrikasi 3nm tingkat lanjut dengan Neural Accelerators).\r\n	• Pro & Pro Max: Apple A19 Pro (Fabrikasi 3nm kustom performa tinggi).\r\n• Memori:\r\n	• RAM: 8 GB/12GB.\r\n	• ROM: 256GB/1TB/2TB.\r\n• Layar:\r\n	• iPhone 17 Reguler: 6.3 inci (120Hz ProMotion).\r\n	• iPhone 17 Pro: 6.3 inci (120Hz ProMotion & Always-On Display).\r\n	• iPhone 17 Pro Max: 6.9 inci (120Hz ProMotion & Always-On Display)\r\n• Baterai: Mendukung sistem pengisian daya nirkabel MagSafe 25W serta pengisian daya kabel yang jauh lebih cepat (40W+ adapter—mampu mengisi daya hingga 50% hanya dalam 20 menit).\r\n	• iPhone 17 Reguler: 3.692 mAh .\r\n	• iPhone 17 Pro & Pro Max: Dibekali kapasitas baterai yang lebih padat dengan efisiensi modem C1X kustom baru untuk maraton pemutaran video hingga 32–35 jam.\r\nFitur Utama Lainnya: Kamera depan naik kelas menjadi 18MP Center Stage, sensor sidik jari ultrasonik di bawah layar, dan peningkatan resolusi lensa Ultra Wide belakang menjadi 48MP.\r\n\r\n• iPhone 17 Reguler: Mulai dari Rp17.999.000.\r\n• iPhone 17 Pro: Mulai dari Rp22.999.000.\r\n• iPhone 17 Pro Max: Berada di kisaran Rp24.999.000 ke atas.\r\n• iPhone Air (Edisi Bodi Tipis Eksklusif): Mulai dari Rp16.999.000.\r\n• iPhone 17e (Edisi Ekonomis): Mulai dari Rp13.499.000.', 20000000, 'https://www.apple.com/id/iphone-17/images/overview/welcome/hero_startframe__e9e7pcnguyqi_xlarge.jpg', 'https://www.planetgadget.store/media/wysiwyg/blog/ChatGPT_Image_Sep_12_2025_05_13_34_PM_1.png', 'https://doss.co.id/cdn/shop/articles/download.webp?v=1757558007', 'availabel');

-- --------------------------------------------------------

--
-- Table structure for table `tipe`
--

CREATE TABLE `tipe` (
  `id_tipe` tinyint UNSIGNED NOT NULL,
  `id_merk` tinyint UNSIGNED NOT NULL,
  `tipe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipe`
--

INSERT INTO `tipe` (`id_tipe`, `id_merk`, `tipe`) VALUES
(1, 171, 'Redmagic\r\n'),
(2, 171, 'Neo Series'),
(3, 171, 'V Series'),
(4, 171, 'A Series'),
(5, 172, 'Zenfone'),
(6, 172, 'ROG Phone'),
(7, 173, 'S Series'),
(8, 173, 'Z Series'),
(9, 173, 'A Series'),
(10, 173, 'M Series'),
(11, 174, 'Flagship Series'),
(12, 174, 'Z Series'),
(13, 174, 'Neo Series'),
(14, 175, 'Xiaomi Series\r\n'),
(15, 175, 'Redmi series'),
(16, 175, 'POCO Series'),
(17, 176, 'IPhone'),
(18, 177, 'Number Series'),
(19, 177, 'Nord Series'),
(20, 177, 'Ace Series'),
(21, 178, 'Hot Series'),
(22, 178, 'Note Series'),
(23, 178, 'GT Series'),
(24, 178, 'Smart Series'),
(25, 178, 'Zero Series'),
(26, 179, 'Y Series'),
(27, 179, 'V Series'),
(28, 179, 'X Series'),
(29, 179, 'T Series'),
(31, 180, 'VivoBook series'),
(32, 180, 'ZenBook'),
(33, 180, 'ProArt'),
(34, 180, 'Republik Of Gamers (ROG)'),
(35, 180, 'TUF Gaming'),
(36, 180, 'ExpertBook'),
(37, 181, 'Titan Series'),
(38, 181, 'Raider Series'),
(39, 181, 'Stealth Series'),
(40, 181, 'Vector Series'),
(41, 181, 'Prestige Series'),
(42, 181, 'Modern Series'),
(43, 181, 'Creator Series'),
(44, 181, 'Katana Series'),
(45, 182, 'Spectre '),
(46, 182, 'Envy'),
(47, 182, 'OmniBook'),
(48, 182, 'Pavilion & Pavilion Plus'),
(49, 182, 'Essential'),
(50, 182, 'NoteBook'),
(51, 182, 'Omen'),
(52, 182, 'Victus'),
(53, 182, 'ProBook'),
(54, 182, 'EliteBook'),
(55, 182, 'Dragonfly'),
(56, 182, 'ZBook'),
(57, 183, 'Inspiron'),
(58, 183, 'XPS'),
(59, 183, 'Latitude'),
(60, 183, 'Vostro'),
(61, 183, 'Alienware & G-Series'),
(62, 184, 'Hype'),
(63, 184, 'Pongo'),
(64, 184, 'Z Series'),
(65, 184, 'Saga'),
(66, 185, 'Swift'),
(67, 185, 'Aspire'),
(68, 185, 'Nitro'),
(69, 185, 'Predator'),
(70, 185, 'Vero'),
(71, 185, 'TravelMate'),
(72, 186, 'MacBook Air'),
(73, 186, 'MacBook Pro'),
(74, 187, 'ThinkPad'),
(75, 187, 'Yoga'),
(76, 187, 'Legion'),
(77, 187, 'LOQ'),
(78, 187, 'IdeaPad'),
(79, 187, 'ThinkBook'),
(80, 188, 'XBook'),
(81, 188, 'GTBook'),
(82, 188, 'INBook');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` tinyint NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `peran` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `peran`) VALUES
(1, 'Mas_Iky', '2d752c4e515fcc286685e013b9bf63fa', 'owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`id_merk`),
  ADD UNIQUE KEY `id_merk` (`id_merk`);

--
-- Indexes for table `seri`
--
ALTER TABLE `seri`
  ADD PRIMARY KEY (`id_seri`);

--
-- Indexes for table `tipe`
--
ALTER TABLE `tipe`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `merk`
--
ALTER TABLE `merk`
  MODIFY `id_merk` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `seri`
--
ALTER TABLE `seri`
  MODIFY `id_seri` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20172;

--
-- AUTO_INCREMENT for table `tipe`
--
ALTER TABLE `tipe`
  MODIFY `id_tipe` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
