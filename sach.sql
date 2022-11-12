-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2022 lúc 10:50 PM
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
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`id`, `name`, `info`) VALUES
('TG1', 'Yen Linh', 'abc'),
('TG2', 'Nguyen Van Tho', 'abc'),
('TG3', 'Ethel Voynich', 'abc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_info`
--

CREATE TABLE `book_info` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `pub_year` int(11) DEFAULT NULL,
  `author_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `book_info`
--

INSERT INTO `book_info` (`id`, `name`, `genre`, `qty`, `publisher`, `pub_year`, `author_id`) VALUES
('S1', 'Ngay thoi khong cho doi', 'Truyen ngan', 10, 'NXB Tre', 2020, 'TG1'),
('S2', 'Mua thanh pho', 'Tap but', 10, 'NXB Hoi Nha Van', 2021, 'TG2'),
('S3', 'Ruoi trau', 'Truyen ngan', 10, 'NXB Hong Duc', 2021, 'TG3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_info`
--

CREATE TABLE `customer_info` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer_info`
--

INSERT INTO `customer_info` (`id`, `name`, `phone`, `addr`) VALUES
('KH1', 'Nguyen A', '0123456789', 'Ha Noi'),
('KH2', 'Nguyen B', '0123456790', 'Ha Noi'),
('KH3', 'Nguyen C', '0123456791', 'Ha Noi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(10) DEFAULT NULL,
  `book_id` varchar(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(50) DEFAULT NULL,
  `amount` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `transaction_id`, `book_id`, `qty`, `price`, `amount`) VALUES
(1, 'PB1', 'S2', 1, 5000, 5000),
(2, 'PB2', 'S2', 1, 5000, 5000),
(3, 'PB3', 'S3', 1, 5000, 5000),
(4, 'PB4', 'S3', 2, 5000, 10000),
(5, 'PB5', 'S1', 1, 5000, 5000),
(6, 'PM1', 'S1', 1, 10000, 10000),
(7, 'PM2', 'S2', 1, 10000, 10000),
(8, 'PM3', 'S3', 1, 15000, 15000),
(9, 'PM4', 'S3', 2, 10000, 20000),
(10, 'PM5', 'S1', 1, 10000, 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` varchar(10) NOT NULL,
  `act` varchar(10) DEFAULT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `act`, `customer_id`, `_date`) VALUES
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

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book_info`
--
ALTER TABLE `book_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
