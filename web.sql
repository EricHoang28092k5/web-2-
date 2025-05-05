-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 08:05 AM
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
-- Database: `web`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `IdHoaDon` int(100) NOT NULL,
  `MaSP` int(100) NOT NULL,
  `SoLuong` int(100) NOT NULL,
  `DonGia` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`IdHoaDon`, `MaSP`, `SoLuong`, `DonGia`) VALUES
(31, 7, 1, 310000),
(32, 3, 1, 40000),
(32, 4, 1, 30000),
(33, 3, 3, 40000),
(33, 2, 1, 60000),
(34, 8, 2, 90000),
(34, 7, 1, 310000),
(35, 7, 2, 310000),
(35, 3, 1, 40000),
(35, 9, 1, 350000),
(36, 7, 1, 310000),
(37, 7, 4, 310000),
(38, 6, 1, 250000),
(39, 8, 1, 90000),
(39, 6, 1, 250000),
(40, 8, 2, 90000),
(40, 7, 1, 310000),
(41, 8, 1, 90000),
(42, 8, 1, 90000),
(43, 7, 1, 310000),
(43, 2, 1, 60000),
(44, 7, 3, 310000),
(45, 3, 1, 40000),
(47, 7, 1, 310000),
(48, 9, 2, 350000),
(48, 4, 3, 30000),
(49, 9, 2, 350000),
(49, 4, 3, 30000),
(50, 3, 1, 40000),
(50, 8, 1, 90000),
(50, 9, 1, 350000),
(50, 4, 1, 30000),
(51, 9, 1, 350000),
(52, 8, 1, 90000),
(53, 9, 1, 350000),
(54, 3, 1, 40000),
(54, 1, 1, 299000),
(55, 3, 1, 40000),
(55, 6, 1, 250000),
(56, 8, 1, 90000),
(57, 8, 1, 90000),
(57, 6, 3, 250000),
(58, 1, 5, 299000),
(59, 7, 1, 310000),
(59, 3, 1, 40000),
(60, 4, 1, 30000),
(60, 3, 1, 40000),
(61, 3, 1, 40000),
(61, 2, 1, 60000),
(62, 3, 1, 40000),
(62, 2, 3, 60000),
(63, 6, 1, 250000),
(64, 3, 12, 40000),
(65, 8, 1, 90000),
(66, 3, 3, 40000),
(67, 4, 3, 30000),
(67, 5, 1, 69000);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `IdHoaDon` int(255) NOT NULL,
  `IdNguoiDung` int(11) NOT NULL,
  `HoTen` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `sdt` varchar(11) NOT NULL,
  `DiaChi` varchar(250) NOT NULL,
  `quan_huyen` varchar(100) NOT NULL,
  `phuong_xa` varchar(100) NOT NULL,
  `NgayDatHang` datetime NOT NULL,
  `TongTien` int(11) NOT NULL DEFAULT 0,
  `PhuongThucTT` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:tiền mặt 2: là chuyển khoản',
  `TrangThai` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:Chưa xác nhận, 2:Đã xác nhận, 3:Giao thành công, 4:Hủy đơn '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`IdHoaDon`, `IdNguoiDung`, `HoTen`, `email`, `sdt`, `DiaChi`, `quan_huyen`, `phuong_xa`, `NgayDatHang`, `TongTien`, `PhuongThucTT`, `TrangThai`) VALUES
(31, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-13 11:57:29', 310000, 2, 1),
(32, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-13 11:57:52', 70000, 2, 2),
(33, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-13 12:00:02', 180000, 1, 3),
(34, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-13 23:48:34', 490000, 1, 1),
(35, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-14 08:11:16', 1010000, 2, 1),
(36, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '123 nguyễn trãi', 'Thành phố Thủ Đức', 'Phường Hiệp Bình Phước', '2025-04-14 08:12:17', 310000, 2, 1),
(37, 9, 'Nguyễn Thái Thùy Dương', 'man01@gmail.com', '01234567895', '123 nguyễn trãi', 'Quận 12', 'Phường Thạnh Xuân', '2025-04-14 08:27:45', 1240000, 2, 1),
(38, 9, 'Nguyễn Phạm Phương Trường', 'man01@gmail.com', '01234567895', '444 Quang trung', 'Quận Gò Vấp', 'Phường 4', '2025-04-14 08:52:54', 250000, 2, 1),
(39, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-14 09:04:17', 340000, 2, 1),
(40, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '48375 lÊ đẠI hÀNH', 'Thành phố Thủ Đức', 'Phường Hiệp Bình Phước', '2025-04-14 09:16:10', 490000, 1, 1),
(41, 10, 'Nguyễn Thái Thùy Dương', 'nttd482005@gmail.com', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', '2025-04-14 09:19:11', 90000, 1, 1),
(42, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận Bình Tân', 'Phường An Lạc', '2025-04-14 09:47:36', 90000, 1, 1),
(43, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận 1', 'Phường Bến Thành', '2025-04-14 10:16:44', 370000, 2, 1),
(44, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận 1', 'Phường Bến Thành', '2025-04-16 08:33:09', 930000, 1, 1),
(45, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận Tân Phú', 'Phường Tân Sơn Nhì', '2025-04-16 16:53:10', 40000, 2, 1),
(46, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận Tân Phú', 'Phường Tân Sơn Nhì', '2025-04-16 16:53:43', 40000, 2, 1),
(47, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận 4', 'Phường 2', '2025-04-16 19:05:16', 310000, 1, 1),
(48, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-16 21:53:48', 790000, 2, 1),
(49, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-16 21:54:20', 790000, 2, 1),
(50, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '81 Cách Mạng Tháng 8', 'Quận 3', 'Phường 2', '2025-04-16 21:56:04', 510000, 1, 3),
(51, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '365 Lê Đại Hành', 'Quận 11', 'Phường 4', '2025-04-16 22:17:05', 350000, 2, 1),
(52, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-16 22:17:57', 90000, 1, 1),
(53, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-16 22:18:29', 350000, 1, 1),
(54, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-04-16 22:36:35', 339000, 1, 1),
(55, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận 8', 'Phường 3', '2025-04-17 08:24:56', 290000, 2, 1),
(56, 10, 'Nguyễn Thái Thùy Dương', 'nttd482005@gmail.com', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', '2025-04-18 20:52:48', 90000, 1, 1),
(57, 10, 'Nguyễn Thái Thùy Dương', 'nttd482005@gmail.com', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', '2025-04-18 21:04:32', 840000, 2, 1),
(58, 10, 'Nguyễn Thái Thùy Dương', 'nttd482005@gmail.com', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', '2025-04-18 21:06:23', 1495000, 2, 1),
(59, 10, 'Nguyễn Thái Thùy Dương', 'nttd482005@gmail.com', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', '2025-04-18 21:14:38', 350000, 2, 1),
(60, 10, 'Nguyễn Thái Thùy Dương', 'nttd482005@gmail.com', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', '2025-04-18 21:15:24', 70000, 2, 1),
(61, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', '2025-04-18 21:21:59', 100000, 2, 1),
(62, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', '2025-04-18 21:24:43', 220000, 2, 1),
(63, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', '2025-04-20 12:56:42', 250000, 2, 1),
(64, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', '2025-04-20 13:25:52', 480000, 1, 1),
(65, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', '2025-04-23 21:38:26', 90000, 2, 1),
(66, 13, 'Cao Phương Nam', 'namcao123@gmail.com', '09876543210', '123/11 Nguyễn Kiệm', 'Quận Phú Nhuận', 'Phường 3', '2025-04-24 09:09:43', 120000, 2, 4),
(67, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '145 Bến Vân Đồn', 'Quận 4', 'Phường 3', '2025-04-25 22:24:00', 159000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSP` int(11) NOT NULL,
  `TenLoaiSP` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSP`, `TenLoaiSP`) VALUES
(1, 'Món Mặn'),
(2, 'Món Chay'),
(3, 'Món Lẩu'),
(4, 'Nước Uống');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id_nguoidung` int(250) NOT NULL,
  `tenNguoiDung` varchar(250) NOT NULL,
  `tenDangNhap` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(100) NOT NULL,
  `sdt` varchar(11) NOT NULL,
  `diaChi` varchar(250) NOT NULL,
  `quan_huyen` varchar(100) NOT NULL,
  `phuong_xa` varchar(100) NOT NULL,
  `vaiTro` varchar(10) NOT NULL DEFAULT 'user',
  `TrangThai` int(10) NOT NULL DEFAULT 1 COMMENT '1:Còn dùng 2:Khóa ',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`id_nguoidung`, `tenNguoiDung`, `tenDangNhap`, `email`, `password`, `sdt`, `diaChi`, `quan_huyen`, `phuong_xa`, `vaiTro`, `TrangThai`, `ngay_tao`) VALUES
(1, 'Nguyễn Tấn Dũng', 'dũng', '123@gmail.com', '202', '01234567899', '88 Lũy Bán Bích', 'Quận 12', 'Tân Thới Hiệp', 'user', 1, '2025-03-31 17:11:55'),
(3, 'Nguyễn Phạm Phương Trường', 'trường', 'truong01@gmail.com', '123', '01234567891', 'đại học sài gòn', 'Quận 1', 'Bến Thành', 'user', 1, '2025-03-31 17:11:55'),
(9, 'Hoàng Vũ Minh Mẫn', 'chó mẫn', 'man01@gmail.com', '123', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', 'user', 1, '2025-04-01 10:31:10'),
(10, 'Nguyễn Thái Thùy Dương', 'duongw', 'nttd482005@gmail.com', '123', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', 'user', 1, '2025-04-06 15:11:24'),
(11, 'dương', 'dương', 'lalala123@gmail.com', '123', '01234567895', '111 Đường An Dương Vương', 'Huyện Bình Chánh', 'Tân Quý Tây', 'user', 2, '2025-04-16 02:06:54'),
(12, 'Nguyễn Văn A', 'alphabella', 'alphabella@gmail.com', '123', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', 'user', 1, '2025-04-18 14:21:36'),
(13, 'Cao Phương Nam', 'nam cao', 'namcao123@gmail.com', '123', '09876543210', '123/11 Nguyễn Kiệm', 'Quận Phú Nhuận', 'Phường 3', 'user', 1, '2025-04-24 02:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(250) NOT NULL,
  `MaLoaiSP` int(250) NOT NULL,
  `TenSP` varchar(70) NOT NULL,
  `DonGia` int(11) NOT NULL,
  `MoTa` varchar(250) NOT NULL,
  `HinhAnh` varchar(200) NOT NULL,
  `TrangThai` int(10) NOT NULL DEFAULT 1,
  `SoLuongBan` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `MaLoaiSP`, `TenSP`, `DonGia`, `MoTa`, `HinhAnh`, `TrangThai`, `SoLuongBan`) VALUES
(1, 1, 'Gà ủ muối', 299000, 'Là một món ăn độc đáo, được chế biến bằng cách ướp thịt gà với muối, các loại gia vị và ủ trong thời gian nhất định. Khi nướng lên, thịt gà sẽ có vị mặn ngọt vừa phải, thịt mềm ngọt và thơm lừng mùi gia vị.', 'ga_u_muoi.png', 1, 6),
(2, 2, 'Rau xào ngũ sắc', 60000, 'Rau xào ngũ sắc là món ăn hấp dẫn với sự kết hợp hài hòa của nhiều loại rau củ có màu sắc bắt mắt như cà rốt, ớt chuông, bông cải, đậu cô ve và nấm. Món ăn không chỉ giàu dinh dưỡng mà còn giòn ngon, đậm đà nhờ cách xào nhanh trên lửa lớn cùng gia vị', 'rau-xao-ngu-sac.png', 1, 4),
(3, 4, 'Trà đào chanh sả', 40000, 'Trà đào chanh sả là một loại đồ uống giải khát thơm ngon, hấp dẫn với sự kết hợp hoàn hảo của vị ngọt thanh từ đào, vị chua dịu của chanh, và hương thơm sả dịu nhẹ. Món đồ uống này không chỉ mang lại cảm giác sảng khoái mà còn rất tốt cho sức khỏe.', 'tra-dao-chanh-sa.jpg', 1, 22),
(4, 4, 'Nước ép dâu tây', 30000, 'Nước ép dâu tây là thức uống thơm ngon, giàu vitamin C và chất chống oxy hóa, giúp tăng cường sức khỏe và làm đẹp da. Dâu tây tươi được ép cùng một chút đường hoặc mật ong để cân bằng vị chua ngọt', 'nuoc-ep-dau-tay.jpg', 1, 8),
(5, 2, 'Nấm đùi gà cháy tỏi', 69000, 'Nấm đùi gà cháy tỏi là một món ăn đơn giản nhưng vô cùng thơm ngon và bổ dưỡng, rất được ưa chuộng trong các bữa cơm gia đình hoặc làm món ăn nhẹ. Hương vị đặc trưng của nấm giòn ngọt tự nhiên hòa quyện với mùi thơm nồng của tỏi phi ', 'nam-dui-ga-chay-toi.jpeg', 1, 1),
(6, 2, 'Lẩu thái nấm chay', 250000, 'Lẩu Thái nấm chay là một phiên bản thanh đạm nhưng không kém phần đậm đà của món lẩu Thái, rất phù hợp cho những người ăn chay hoặc muốn thưởng thức một món ăn nhẹ nhàng, tốt cho sức khỏe. Với sự kết hợp của nấm tươi, rau củ và các gia vị chua cay, m', 'lau_thai.jpg', 1, 5),
(7, 1, 'Tôm sú rang bơ tỏi', 310000, 'Tôm sú rang bơ tỏi là một món ăn vô cùng thơm ngon và dễ chế biến, thích hợp cho những bữa ăn gia đình hoặc tiệc tùng. Món ăn này có sự kết hợp hoàn hảo giữa vị ngọt tự nhiên của tôm, bơ béo ngậy và mùi thơm nồng của tỏi phi. Hãy thử ngay', 'tom-su-rang-bo-toi.jpeg', 1, 1),
(8, 1, 'Cơm chiên cua', 90000, 'Cơm chiên cua là một món ăn thơm ngon, dễ làm và giàu dinh dưỡng, thường xuất hiện trong các bữa ăn gia đình hoặc thực đơn nhà hàng. Món ăn này kết hợp hương vị của cơm chiên vàng ươm, thịt cua ngọt thanh, cùng các loại rau củ tạo nên sự hấp dẫn khó ', 'com_chien_cua.png', 1, 5),
(9, 3, 'Lẩu thái tomyum', 350000, 'Lẩu Thái Tomyum là một món lẩu đặc trưng của ẩm thực Thái Lan, nổi tiếng với hương vị chua cay đậm đà. Nước lẩu được nấu từ nước dùng xương hầm kết hợp với các loại gia vị đặc trưng như sả, riềng, lá chanh Thái, ớt và nước cốt dừa.', 'lau-thai-tomyum.jpeg', 1, 5),
(10, 1, 'Bò lúc lắc', 180000, 'Bò lúc lắc là món ăn thơm ngon với thịt bò mềm mại, được xào nhanh tay cùng với hành tây, ớt chuông, tạo nên hương vị đậm đà và hấp dẫn.', 'bo-luc-lac.jpg', 1, 7),
(11, 2, 'Đậu hũ chiên sả ớt', 55000, 'Đậu hũ chiên sả ớt là món chay đơn giản nhưng cực kỳ hấp dẫn với vị giòn bên ngoài, mềm bên trong, thấm đẫm hương sả và vị cay nồng của ớt.', 'dau-hu-chien-sa-ot.jpg', 1, 9),
(12, 4, 'Trà vải hoa hồng', 45000, 'Trà vải hoa hồng mang đến hương thơm ngọt ngào của vải hòa quyện cùng mùi thơm thanh mát của hoa hồng, là lựa chọn hoàn hảo để giải nhiệt mùa hè.', 'tra-vai-hoa-hong.jpg', 1, 12),
(13, 2, 'Canh rong biển chay', 75000, 'Canh rong biển chay là món ăn thanh mát, giàu dinh dưỡng với vị ngọt tự nhiên từ rong biển và đậu hũ non, rất thích hợp cho những bữa ăn nhẹ nhàng.', 'canh-rong-bien-chay.jpg', 1, 6),
(14, 1, 'Cá hồi áp chảo sốt chanh leo', 320000, 'Cá hồi áp chảo sốt chanh leo là món ăn đẳng cấp với cá hồi béo ngậy được áp chảo vàng giòn, kết hợp cùng sốt chanh leo chua ngọt, tạo nên hương vị tinh tế khó cưỡng.', 'ca-hoi-ap-chao-chanh-leo.jpg', 1, 4);


--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD KEY `IdHoaDon` (`IdHoaDon`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`IdHoaDon`),
  ADD KEY `IdNguoiDung` (`IdNguoiDung`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSP`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id_nguoidung`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaLoaiSP` (`MaLoaiSP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `IdHoaDon` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLoaiSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id_nguoidung` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`IdHoaDon`) REFERENCES `hoadon` (`IdHoaDon`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham`(`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`IdNguoiDung`) REFERENCES `nguoidung` (`id_nguoidung`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaLoaiSP`) REFERENCES `loaisanpham` (`maLoaiSP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
