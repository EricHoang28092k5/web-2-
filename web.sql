-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 06, 2025 lúc 07:22 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `IdHoaDon` int(100) NOT NULL,
  `MaSP` int(100) NOT NULL,
  `SoLuong` int(100) NOT NULL,
  `DonGia` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`IdHoaDon`, `MaSP`, `SoLuong`, `DonGia`) VALUES
(68, 8, 1, 90000),
(68, 14, 1, 320000),
(69, 13, 3, 75000),
(69, 12, 1, 45000),
(69, 3, 1, 40000),
(70, 2, 1, 60000),
(70, 11, 3, 55000),
(70, 10, 1, 180000),
(71, 18, 1, 35000),
(71, 20, 3, 250000),
(71, 13, 1, 75000),
(72, 15, 1, 299000),
(72, 14, 1, 320000),
(73, 20, 3, 250000),
(73, 12, 1, 45000),
(73, 14, 1, 320000),
(74, 2, 1, 60000),
(74, 13, 1, 75000),
(74, 10, 2, 180000),
(75, 3, 1, 40000),
(75, 8, 1, 90000),
(75, 15, 1, 299000),
(76, 15, 1, 299000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
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
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`IdHoaDon`, `IdNguoiDung`, `HoTen`, `email`, `sdt`, `DiaChi`, `quan_huyen`, `phuong_xa`, `NgayDatHang`, `TongTien`, `PhuongThucTT`, `TrangThai`) VALUES
(68, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', '2025-05-06 10:02:02', 410000, 2, 3),
(69, 12, 'Nguyễn Văn A', 'alphabella@gmail.com', '09876543210', '1596 Võ Văn Kiệt ', 'Quận 6', 'Phường 7', '2025-05-06 10:05:46', 310000, 1, 3),
(70, 15, 'Nguyễn Hòa Bình', 'trandao123@gmail', '09390104532', '688/3 Hương Lộ 2 ', 'Quận Bình Tân', 'Phường Bình Trị Đông A', '2025-05-06 10:28:36', 405000, 1, 3),
(71, 16, 'Võ Hòa Bình', 'binhvo123@gmail.com', '09988776655', '269 Nguyễn Thị Nhỏ ', 'Quận 11', 'Phường 16', '2025-05-06 11:17:30', 860000, 2, 3),
(72, 16, 'Võ Hòa Bình', 'binhvo123@gmail.com', '09988776655', '269 Nguyễn Thị Nhỏ ', 'Quận 11', 'Phường 16', '2025-05-06 11:17:58', 619000, 2, 3),
(73, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận 1', 'Bến Thành', '2025-05-06 11:41:14', 1115000, 2, 3),
(74, 3, 'Nguyễn Phạm Phương Trường', 'truong01@gmail.com', '01234567891', 'đại học sài gòn', 'Quận 1', 'Bến Thành', '2025-05-06 11:42:26', 495000, 1, 3),
(75, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-05-06 11:43:14', 429000, 2, 3),
(76, 9, 'Hoàng Vũ Minh Mẫn', 'man01@gmail.com', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', '2025-05-06 11:43:26', 299000, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSP` int(11) NOT NULL,
  `TenLoaiSP` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSP`, `TenLoaiSP`) VALUES
(1, 'Món Mặn'),
(2, 'Món Chay'),
(3, 'Món Lẩu'),
(4, 'Nước Uống');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
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
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id_nguoidung`, `tenNguoiDung`, `tenDangNhap`, `email`, `password`, `sdt`, `diaChi`, `quan_huyen`, `phuong_xa`, `vaiTro`, `TrangThai`, `ngay_tao`) VALUES
(1, 'Nguyễn Tấn Dũng', 'dũng', '123@gmail.com', '202', '01234567899', '88 Lũy Bán Bích', 'Quận 12', 'Tân Thới Hiệp', 'user', 1, '2025-03-31 17:11:55'),
(3, 'Nguyễn Phạm Phương Trường', 'trường', 'truong01@gmail.com', '123', '01234567891', 'đại học sài gòn', 'Quận 1', 'Bến Thành', 'user', 1, '2025-03-31 17:11:55'),
(9, 'Hoàng Vũ Minh Mẫn', 'mẫn', 'man01@gmail.com', '123', '01234567895', '67 Lê Lợi', 'Quận 1', 'Cầu Kho', 'user', 1, '2025-04-01 10:31:10'),
(10, 'Nguyễn Thái Thùy Dương', 'duongw', 'nttd482005@gmail.com', '123', '0902440220', '226 Lý Thường Kiệt', 'Quận 10', 'Phường 14', 'user', 1, '2025-04-06 15:11:24'),
(11, 'dương', 'dương', 'lalala123@gmail.com', '123', '01234567895', '111 Đường An Dương Vương', 'Huyện Bình Chánh', 'Tân Quý Tây', 'user', 2, '2025-04-16 02:06:54'),
(12, 'Nguyễn Văn A', 'alphabella', 'alphabella@gmail.com', '123', '09876543210', '456/12A, Đường Nguyễn Thị Minh Khai, ', 'Quận 3', 'Phường 5', 'user', 1, '2025-04-18 14:21:36'),
(13, 'Cao Phương Nam', 'nam cao', 'namcao123@gmail.com', '123', '09876543210', '123/11 Nguyễn Kiệm', 'Quận Phú Nhuận', 'Phường 3', 'user', 1, '2025-04-24 02:06:25'),
(14, 'Nguyễn Tấn Dũng', 'admin', 'dungsinbasento@gmail.com', 'admin123', '09213978392', '56/27 Nguyễn Khuyến', '8', '14', 'admin', 1, '2025-05-06 02:33:18'),
(15, 'Trần Hưng Đạo', 'daohung', 'trandao123@gmail', '123', '0987665432', '123 nguyễn trãi', 'Quận 5', 'Phường 9', 'user', 1, '2025-05-06 03:25:57'),
(16, 'Võ Hòa Bình', 'binhvo123', 'binhvo123@gmail.com', '123', '09988776655', '269 Nguyễn Thị Nhỏ ', 'Quận 11', 'Phường 16', 'user', 1, '2025-05-06 04:09:29'),
(17, 'Mai Hồng Phong', 'phongmai', 'hongphong123@gmail.com', '444', '08978965431', '55 Lê Đại Hành', 'Quận 11', 'Phường 13', 'user', 1, '2025-05-06 04:33:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
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
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `MaLoaiSP`, `TenSP`, `DonGia`, `MoTa`, `HinhAnh`, `TrangThai`, `SoLuongBan`) VALUES
(1, 1, 'Gà ủ muối', 299000, 'Là một món ăn độc đáo, được chế biến bằng cách ướp thịt gà với muối, các loại gia vị và ủ trong thời gian nhất định. Khi nướng lên, thịt gà sẽ có vị mặn ngọt vừa phải, thịt mềm ngọt và thơm lừng mùi gia vị.', 'ga_u_muoi.jpg', 1, 6),
(2, 2, 'Rau xào ngũ sắc', 60000, 'Rau xào ngũ sắc là món ăn hấp dẫn với sự kết hợp hài hòa của nhiều loại rau củ có màu sắc bắt mắt như cà rốt, ớt chuông, bông cải, đậu cô ve và nấm. Món ăn không chỉ giàu dinh dưỡng mà còn giòn ngon, đậm đà nhờ cách xào nhanh trên lửa lớn cùng gia vị', 'rau-xao-ngu-sac.jpg', 1, 6),
(3, 4, 'Trà đào chanh sả', 40000, 'Trà đào chanh sả là một loại đồ uống giải khát thơm ngon, hấp dẫn với sự kết hợp hoàn hảo của vị ngọt thanh từ đào, vị chua dịu của chanh, và hương thơm sả dịu nhẹ. Món đồ uống này không chỉ mang lại cảm giác sảng khoái mà còn rất tốt cho sức khỏe.', 'tra-dao-chanh-sa.jpg', 1, 24),
(4, 4, 'Nước ép dâu tây', 30000, 'Nước ép dâu tây là thức uống thơm ngon, giàu vitamin C và chất chống oxy hóa, giúp tăng cường sức khỏe và làm đẹp da. Dâu tây tươi được ép cùng một chút đường hoặc mật ong để cân bằng vị chua ngọt', 'nuoc-ep-dau-tay.jpg', 0, 8),
(5, 2, 'Nấm đùi gà cháy tỏi', 69000, 'Nấm đùi gà cháy tỏi là một món ăn đơn giản nhưng vô cùng thơm ngon và bổ dưỡng, rất được ưa chuộng trong các bữa cơm gia đình hoặc làm món ăn nhẹ. Hương vị đặc trưng của nấm giòn ngọt tự nhiên hòa quyện với mùi thơm nồng của tỏi phi ', 'nam-dui-ga-sot-bo-toi.jpg', 1, 1),
(6, 2, 'Lẩu thái nấm chay', 250000, 'Lẩu Thái nấm chay là một phiên bản thanh đạm nhưng không kém phần đậm đà của món lẩu Thái, rất phù hợp cho những người ăn chay hoặc muốn thưởng thức một món ăn nhẹ nhàng, tốt cho sức khỏe. Với sự kết hợp của nấm tươi, rau củ và các gia vị chua cay, m', 'lau_thai.jpg', 1, 5),
(7, 1, 'Tôm sú rang bơ tỏi', 310000, 'Tôm sú rang bơ tỏi là một món ăn vô cùng thơm ngon và dễ chế biến, thích hợp cho những bữa ăn gia đình hoặc tiệc tùng. Món ăn này có sự kết hợp hoàn hảo giữa vị ngọt tự nhiên của tôm, bơ béo ngậy và mùi thơm nồng của tỏi phi. Hãy thử ngay', 'tom-su-rang-bo-toi.jpeg', 1, 1),
(8, 1, 'Cơm chiên cua', 90000, 'Cơm chiên cua là một món ăn thơm ngon, dễ làm và giàu dinh dưỡng, thường xuất hiện trong các bữa ăn gia đình hoặc thực đơn nhà hàng. Món ăn này kết hợp hương vị của cơm chiên vàng ươm, thịt cua ngọt thanh, cùng các loại rau củ tạo nên sự hấp dẫn khó ', 'com_chien_cua.png', 1, 7),
(9, 3, 'Lẩu thái tomyum', 350000, 'Lẩu Thái Tomyum là một món lẩu đặc trưng của ẩm thực Thái Lan, nổi tiếng với hương vị chua cay đậm đà. Nước lẩu được nấu từ nước dùng xương hầm kết hợp với các loại gia vị đặc trưng như sả, riềng, lá chanh Thái, ớt và nước cốt dừa.', 'lau-thai-tomyum.jpeg', 1, 5),
(10, 1, 'Bò lúc lắc', 180000, 'Bò lúc lắc là món ăn thơm ngon với thịt bò mềm mại, được xào nhanh tay cùng với hành tây, ớt chuông, tạo nên hương vị đậm đà và hấp dẫn.', 'bo-luc-lac.jpg', 1, 10),
(11, 2, 'Đậu hũ chiên sả ớt', 55000, 'Đậu hũ chiên sả ớt là món chay đơn giản nhưng cực kỳ hấp dẫn với vị giòn bên ngoài, mềm bên trong, thấm đẫm hương sả và vị cay nồng của ớt.', 'dau-hu-chien-sa-ot.jpg', 1, 12),
(12, 4, 'Trà vải hoa hồng', 45000, 'Trà vải hoa hồng mang đến hương thơm ngọt ngào của vải hòa quyện cùng mùi thơm thanh mát của hoa hồng, là lựa chọn hoàn hảo để giải nhiệt mùa hè.', 'tra-vai-hoa-hong.jpg', 1, 14),
(13, 2, 'Canh rong biển chay', 75000, 'Canh rong biển chay là món ăn thanh mát, giàu dinh dưỡng với vị ngọt tự nhiên từ rong biển và đậu hũ non, rất thích hợp cho những bữa ăn nhẹ nhàng.', 'canh-rong-bien-chay.jpg', 1, 11),
(14, 1, 'Cá hồi áp chảo sốt chanh leo', 320000, 'Cá hồi áp chảo sốt chanh leo là món ăn đẳng cấp với cá hồi béo ngậy được áp chảo vàng giòn, kết hợp cùng sốt chanh leo chua ngọt, tạo nên hương vị tinh tế khó cưỡng.', 'ca-hoi-ap-chao-chanh-leo.jpg', 1, 7),
(15, 3, 'Lẩu nấm ', 299000, 'Lẩu nấm, một món ăn thanh đạm nhưng đầy quyến rũ, là sự hòa quyện tinh tế của vô vàn loại nấm tươi ngon cùng nước dùng ngọt thanh, mang đến trải nghiệm ẩm thực khó quên.Lẩu nấm không chỉ là món ăn ngon mà còn rất tốt cho sức khỏe. Nấm là nguồn cung c', 'Lau_nam.jpg', 1, 3),
(16, 3, 'Lẩu cua đồng', 399000, 'Lẩu cua đồng mang đến một hương vị hài hòa, tinh tế. Vị ngọt thanh, đậm đà của nước dùng quyện cùng vị béo bùi của riêu cua, chút chua nhẹ của cà chua và sự tươi mát của các loại rau. Khi nhúng thêm các loại thịt và hải sản, nồi lẩu càng trở nên phon', 'Lau_cua_dong.jpg', 1, 0),
(18, 4, 'matcha latte', 35000, 'Thức uống xanh mát, kết hợp hoàn hảo giữa bột trà xanh matcha thượng hạng và sữa tươi mềm mịn. Vị trà thanh tao, hơi ngọt dịu, mang đến cảm giác thư thái và sảng khoái độc đáo, là lựa chọn lý tưởng để khởi đầu ngày mới hoặc thư giãn sau bữa ăn ngon t', 'matcha-latte.jpg', 1, 1),
(19, 3, 'Lẩu gà', 199000, 'Lẩu gà là một món ăn quen thuộc và được yêu thích trong ẩm thực Việt Nam, đặc biệt là trong những ngày se lạnh hoặc những buổi tụ họp gia đình, bạn bè. Món lẩu này hấp dẫn bởi nước dùng ngọt thanh, thịt gà mềm thơm và sự đa dạng của các loại rau, nấm', 'Lau-ga.jpg', 1, 0),
(20, 3, 'Lẩu cá chình', 250000, 'Lẩu cá chình mang đến một hương vị độc đáo và hấp dẫn. Thịt cá chình béo ngậy, dai ngon hòa quyện với nước dùng đậm đà, chua cay hoặc ngọt thanh tùy theo cách chế biến. Các loại rau ăn kèm tạo thêm sự cân bằng và tươi mát cho món ăn.', 'lau-ca-chinh.jpg', 1, 6);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD KEY `IdHoaDon` (`IdHoaDon`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`IdHoaDon`),
  ADD KEY `IdNguoiDung` (`IdNguoiDung`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSP`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id_nguoidung`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaLoaiSP` (`MaLoaiSP`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `IdHoaDon` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLoaiSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id_nguoidung` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`IdHoaDon`) REFERENCES `hoadon` (`IdHoaDon`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`IdNguoiDung`) REFERENCES `nguoidung` (`id_nguoidung`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaLoaiSP`) REFERENCES `loaisanpham` (`MaLoaiSP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
