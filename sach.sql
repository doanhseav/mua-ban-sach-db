-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2022 lúc 07:12 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_giao_dich`
--

CREATE TABLE `chi_tiet_giao_dich` (
  `ma_giao_dich` varchar(10) NOT NULL,
  `ma_sach` varchar(10) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` int(50) NOT NULL,
  `thanh_tien` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_giao_dich`
--

INSERT INTO `chi_tiet_giao_dich` (`ma_giao_dich`, `ma_sach`, `so_luong`, `don_gia`, `thanh_tien`) VALUES
('PB1', 'S2', 1, 5000, 5000),
('PB2', 'S2', 1, 5000, 5000),
('PB3', 'S3', 1, 5000, 5000),
('PB4', 'S3', 2, 5000, 10000),
('PB5', 'S1', 1, 5000, 5000),
('PM1', 'S1', 1, 10000, 10000),
('PM2', 'S2', 1, 11000, 11000),
('PM3', 'S3', 1, 15000, 15000),
('PM4', 'S3', 2, 10000, 20000),
('PM5', 'S1', 1, 10000, 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giao_dich`
--

CREATE TABLE `giao_dich` (
  `ma_giao_dich` varchar(10) NOT NULL,
  `loai_giao_dich` varchar(10) NOT NULL,
  `ma_khach_hang` varchar(10) NOT NULL,
  `ngay_giao_dich` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `giao_dich`
--

INSERT INTO `giao_dich` (`ma_giao_dich`, `loai_giao_dich`, `ma_khach_hang`, `ngay_giao_dich`) VALUES
('PB1', 'ban', 'KH1', '2022-11-06'),
('PB2', 'ban', 'KH3', '2022-11-07'),
('PB3', 'ban', 'KH1', '2022-11-08'),
('PB4', 'ban', 'KH3', '2022-11-10'),
('PB5', 'ban', 'KH3', '2022-11-11'),
('PM1', 'mua', 'KH1', '2022-11-09'),
('PM2', 'mua', 'KH1', '2022-11-10'),
('PM3', 'mua', 'KH2', '2022-11-10'),
('PM4', 'mua', 'KH3', '2022-11-11'),
('PM5', 'mua', 'KH2', '2022-11-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `ma_khach_hang` varchar(10) NOT NULL,
  `ten_khach_hang` varchar(50) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `dia_chi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`ma_khach_hang`, `ten_khach_hang`, `sdt`, `dia_chi`) VALUES
('KH1', 'Nguyen A', '0123456789', 'Ha Noi'),
('KH2', 'Nguyen B', '0123456790', 'Ha Noi'),
('KH3', 'Nguyen C', '0123456791', 'Ha Noi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tac_gia`
--

CREATE TABLE `tac_gia` (
  `ma_tac_gia` varchar(10) NOT NULL,
  `ten_tac_gia` varchar(50) NOT NULL,
  `thong_tin` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tac_gia`
--

INSERT INTO `tac_gia` (`ma_tac_gia`, `ten_tac_gia`, `thong_tin`) VALUES
('TG1', 'Yen Linh', 'abc'),
('TG2', 'Nguyen Van Tho', 'abc'),
('TG3', 'Ethel Voynich', 'abc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_tin_sach`
--

CREATE TABLE `thong_tin_sach` (
  `ma_sach` varchar(10) NOT NULL,
  `ten_sach` varchar(50) NOT NULL,
  `the_loai` varchar(50) NOT NULL,
  `so_luong` int(10) NOT NULL,
  `NXB` varchar(50) NOT NULL,
  `nam_xuat_ban` int(11) NOT NULL,
  `ma_tac_gia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `thong_tin_sach`
--

INSERT INTO `thong_tin_sach` (`ma_sach`, `ten_sach`, `the_loai`, `so_luong`, `NXB`, `nam_xuat_ban`, `ma_tac_gia`) VALUES
('S1', 'Ngay thoi khong cho doi', 'Truyen ngan', 10, 'NXB Tre', 2020, 'TG1'),
('S2', 'Mua thanh pho', 'Tap but', 10, 'NXB Hoi Nha Van', 2021, 'TG2'),
('S3', 'Ruoi trau', 'Truyen ngan', 10, 'NXB Hong Duc', 2021, 'TG3');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_tiet_giao_dich`
--
ALTER TABLE `chi_tiet_giao_dich`
  ADD PRIMARY KEY (`ma_giao_dich`,`ma_sach`);

--
-- Chỉ mục cho bảng `giao_dich`
--
ALTER TABLE `giao_dich`
  ADD PRIMARY KEY (`ma_giao_dich`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`ma_khach_hang`);

--
-- Chỉ mục cho bảng `tac_gia`
--
ALTER TABLE `tac_gia`
  ADD PRIMARY KEY (`ma_tac_gia`);

--
-- Chỉ mục cho bảng `thong_tin_sach`
--
ALTER TABLE `thong_tin_sach`
  ADD PRIMARY KEY (`ma_sach`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
