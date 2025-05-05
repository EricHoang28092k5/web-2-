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
(1, 1, 'Gà ủ muối', 299000, 'Là một món ăn độc đáo, được chế biến bằng cách ướp thịt gà với muối, các loại gia vị và ủ trong thời gian nhất định. Khi nướng lên, thịt gà sẽ có vị mặn ngọt vừa phải, thịt mềm ngọt và thơm lừng mùi gia vị.', 'ga_u_muoi.jpg', 1, 6),
(2, 2, 'Rau xào ngũ sắc', 60000, 'Rau xào ngũ sắc là món ăn hấp dẫn với sự kết hợp hài hòa của nhiều loại rau củ có màu sắc bắt mắt như cà rốt, ớt chuông, bông cải, đậu cô ve và nấm. Món ăn không chỉ giàu dinh dưỡng mà còn giòn ngon, đậm đà nhờ cách xào nhanh trên lửa lớn cùng gia vị', 'rau-xao-ngu-sac.jpg', 1, 4),
(3, 4, 'Trà đào chanh sả', 40000, 'Trà đào chanh sả là một loại đồ uống giải khát thơm ngon, hấp dẫn với sự kết hợp hoàn hảo của vị ngọt thanh từ đào, vị chua dịu của chanh, và hương thơm sả dịu nhẹ. Món đồ uống này không chỉ mang lại cảm giác sảng khoái mà còn rất tốt cho sức khỏe.', 'tra-dao-chanh-sa.jpg', 1, 22),
(4, 4, 'Nước ép dâu tây', 30000, 'Nước ép dâu tây là thức uống thơm ngon, giàu vitamin C và chất chống oxy hóa, giúp tăng cường sức khỏe và làm đẹp da. Dâu tây tươi được ép cùng một chút đường hoặc mật ong để cân bằng vị chua ngọt', 'nuoc-ep-dau-tay.jpg', 1, 8),
(5, 2, 'Nấm đùi gà cháy tỏi', 69000, 'Nấm đùi gà cháy tỏi là một món ăn đơn giản nhưng vô cùng thơm ngon và bổ dưỡng, rất được ưa chuộng trong các bữa cơm gia đình hoặc làm món ăn nhẹ. Hương vị đặc trưng của nấm giòn ngọt tự nhiên hòa quyện với mùi thơm nồng của tỏi phi ', 'nam-dui-ga-sot-bo-toi.jpg', 1, 1),
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
