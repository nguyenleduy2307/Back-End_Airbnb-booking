/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `binh_luan`;
CREATE TABLE `binh_luan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_phong` int DEFAULT NULL,
  `ma_nguoi_binh_luan` int DEFAULT NULL,
  `ngay_binh_luan` datetime DEFAULT NULL,
  `noi_dung` varchar(1000) NOT NULL,
  `sao_binh_luan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_phong` (`ma_phong`),
  KEY `ma_nguoi_binh_luan` (`ma_nguoi_binh_luan`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`ma_nguoi_binh_luan`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `dat_phong`;
CREATE TABLE `dat_phong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_phong` int DEFAULT NULL,
  `ngay_den` datetime DEFAULT NULL,
  `ngay_di` datetime DEFAULT NULL,
  `so_luong_khach` int DEFAULT NULL,
  `ma_nguoi_dung` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_phong` (`ma_phong`),
  KEY `ma_nguoi_dung` (`ma_nguoi_dung`),
  CONSTRAINT `dat_phong_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`id`),
  CONSTRAINT `dat_phong_ibfk_2` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `nguoi_dung`;
CREATE TABLE `nguoi_dung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL,
  `birthday` varchar(1000) NOT NULL,
  `avatar` varchar(1000) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `role` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `phong`;
CREATE TABLE `phong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_phong` varchar(1000) NOT NULL,
  `khach` int DEFAULT NULL,
  `phong_ngu` int DEFAULT NULL,
  `giuong` int DEFAULT NULL,
  `phong_tam` int DEFAULT NULL,
  `mo_ta` varchar(1000) NOT NULL,
  `gia_tien` int DEFAULT NULL,
  `may_giat` tinyint(1) DEFAULT NULL,
  `ban_la` tinyint(1) DEFAULT NULL,
  `tivi` tinyint(1) DEFAULT NULL,
  `dieu_hoa` tinyint(1) DEFAULT NULL,
  `wifi` tinyint(1) DEFAULT NULL,
  `bep` tinyint(1) DEFAULT NULL,
  `do_xe` tinyint(1) DEFAULT NULL,
  `ho_boi` tinyint(1) DEFAULT NULL,
  `ban_ui` tinyint(1) DEFAULT NULL,
  `ma_vi_tri` int DEFAULT NULL,
  `hinh_anh` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_vi_tri` (`ma_vi_tri`),
  CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`ma_vi_tri`) REFERENCES `vi_tri` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `vi_tri`;
CREATE TABLE `vi_tri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_vi_tri` varchar(1000) NOT NULL,
  `tinh_thanh` varchar(1000) NOT NULL,
  `quoc_gia` varchar(1000) NOT NULL,
  `hinh_anh` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`id`, `ma_phong`, `ma_nguoi_binh_luan`, `ngay_binh_luan`, `noi_dung`, `sao_binh_luan`) VALUES
(88, 1, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 1', 1);
INSERT INTO `binh_luan` (`id`, `ma_phong`, `ma_nguoi_binh_luan`, `ngay_binh_luan`, `noi_dung`, `sao_binh_luan`) VALUES
(89, 1, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 2', 4);
INSERT INTO `binh_luan` (`id`, `ma_phong`, `ma_nguoi_binh_luan`, `ngay_binh_luan`, `noi_dung`, `sao_binh_luan`) VALUES
(90, 2, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 3', 5);
INSERT INTO `binh_luan` (`id`, `ma_phong`, `ma_nguoi_binh_luan`, `ngay_binh_luan`, `noi_dung`, `sao_binh_luan`) VALUES
(91, 2, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 4', 2),
(92, 3, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 5', 4),
(93, 4, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 6', 5),
(94, 4, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 7', 3),
(95, 4, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 8', 4),
(96, 5, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 9', 4),
(97, 5, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 10', 4),
(98, 5, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 11', 5),
(99, 6, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 12', 4),
(100, 6, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 13', 4),
(101, 7, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 14', 5),
(102, 8, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 15', 4),
(103, 9, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 16', 3),
(104, 10, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 17', 3),
(105, 11, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 18', 3),
(106, 11, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 19', 4),
(107, 12, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 20', 4),
(108, 13, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 21', 5),
(109, 14, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 22', 5),
(110, 15, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 23', 4),
(111, 15, 1, '2023-10-14 09:09:09', 'Phòng đẹp lắm 24', 5),
(112, 16, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 25', 5),
(113, 17, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 26', 5),
(114, 18, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 27', 3),
(115, 19, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 28', 5),
(116, 20, 2, '2023-10-14 09:09:09', 'Phòng đẹp lắm 29', 5),
(120, 1, 1, '2023-12-09 12:29:16', 'Dep lawm', 4),
(122, 5, 1, '2023-12-09 12:29:16', 'Dep lawm', 4),
(124, 5, 1, '2023-12-09 12:46:47', 'nfg', 7),
(125, 5, 1, '2023-12-09 07:46:47', 'nfg', 7),
(128, 5, 1, '2023-12-13 13:33:24', 'Phong Dep Qua', 2);

INSERT INTO `dat_phong` (`id`, `ma_phong`, `ngay_den`, `ngay_di`, `so_luong_khach`, `ma_nguoi_dung`) VALUES
(1, 1, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1);
INSERT INTO `dat_phong` (`id`, `ma_phong`, `ngay_den`, `ngay_di`, `so_luong_khach`, `ma_nguoi_dung`) VALUES
(2, 2, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2);
INSERT INTO `dat_phong` (`id`, `ma_phong`, `ngay_den`, `ngay_di`, `so_luong_khach`, `ma_nguoi_dung`) VALUES
(3, 3, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2);
INSERT INTO `dat_phong` (`id`, `ma_phong`, `ngay_den`, `ngay_di`, `so_luong_khach`, `ma_nguoi_dung`) VALUES
(4, 4, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1),
(5, 5, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(6, 6, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(7, 7, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1),
(8, 8, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(9, 9, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(10, 10, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(11, 11, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1),
(12, 12, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(13, 13, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1),
(14, 14, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(15, 15, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1),
(16, 16, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 2),
(17, 16, '2024-11-05 00:00:00', '2024-11-07 00:00:00', 5, 1),
(18, 5, '2023-12-09 13:12:37', '2023-12-09 13:12:37', 5, 3),
(20, 8, '2023-12-10 11:19:34', '2023-12-10 11:19:34', 88, 2);

INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `avatar`, `gender`, `role`) VALUES
(1, 'Nguyễn Lê Duy', 'nguyenleduy@gmail.com', '$2b$10$RouKjCIjz0PONeo7piWmIexNBjddkWxQpLX7mHpfl/rkEfYBCkB1y', '0364075533', '23-07-1998', 'avarta1', 1, 'user');
INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `avatar`, `gender`, `role`) VALUES
(2, 'Messi', 'messi@gmail.com', '$2b$10$RouKjCIjz0PONeo7piWmIexNBjddkWxQpLX7mHpfl/rkEfYBCkB1y', '0364075533', '23-07-1987', 'avarta2', 1, 'user');
INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `avatar`, `gender`, `role`) VALUES
(3, 'Nguyễn Văn A', 'b@gmail.com', '$2b$10$/CTvHhhMj5PRMUjm.CrX9eD9qRTY4At/wmQY5IA1XYIX8K90kfkWS', '03456789', '10-10-2023', 'avatar', 1, 'user');
INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `avatar`, `gender`, `role`) VALUES
(5, 'Bruno', 'bruno888888@gmail.com', '1234', '014572', '10-10-23', 'avatar1', 1, 'user'),
(6, 'Nguyen Le Duy', 'nguyenleduy2307@gmail.com', '$2b$10$mq3ycr6QA11LV2Z9ONiz5eJ9.YRxVfsf8HdWkl1Dq6.Czjue5qDEe', '0364075533', '23-07-1998', 'avatar1', 1, 'user');

INSERT INTO `phong` (`id`, `ten_phong`, `khach`, `phong_ngu`, `giuong`, `phong_tam`, `mo_ta`, `gia_tien`, `may_giat`, `ban_la`, `tivi`, `dieu_hoa`, `wifi`, `bep`, `do_xe`, `ho_boi`, `ban_ui`, `ma_vi_tri`, `hinh_anh`) VALUES
(1, 'NewApt D1 - Cozy studio - NU apt - 500m Bui Vien!', 3, 1, 1, 1, 'Tự nhận phòng\r\nTự nhận phòng bằng khóa thông minh.\r\nDinh Long là Chủ nhà siêu cấp\r\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.', 28, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 'https://airbnbnew.cybersoft.edu.vn/images/phong1.jpg');
INSERT INTO `phong` (`id`, `ten_phong`, `khach`, `phong_ngu`, `giuong`, `phong_tam`, `mo_ta`, `gia_tien`, `may_giat`, `ban_la`, `tivi`, `dieu_hoa`, `wifi`, `bep`, `do_xe`, `ho_boi`, `ban_ui`, `ma_vi_tri`, `hinh_anh`) VALUES
(2, 'STUDIO MỚI NETFLIX MIỄN PHÍ/ĐỖ XE MIỄN PHÍ', 2, 1, 1, 1, 'Không gian riêng để làm việc\r\nMột khu vực chung có Wi-fi, phù hợp để làm việc.\r\nTự nhận phòng\r\nTự nhận phòng bằng khóa thông minh.\r\nKim Nam là Chủ nhà siêu cấp\r\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.', 21, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 'https://airbnbnew.cybersoft.edu.vn/images/phong2.png');
INSERT INTO `phong` (`id`, `ten_phong`, `khach`, `phong_ngu`, `giuong`, `phong_tam`, `mo_ta`, `gia_tien`, `may_giat`, `ban_la`, `tivi`, `dieu_hoa`, `wifi`, `bep`, `do_xe`, `ho_boi`, `ban_ui`, `ma_vi_tri`, `hinh_anh`) VALUES
(3, 'Phòng sang trọng với ban công tại D.1 - 200m đến Bitexco', 3, 2, 1, 1, 'Emmy là Chủ nhà siêu cấp\r\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.\r\nTrải nghiệm nhận phòng tuyệt vời\r\n100% khách gần đây đã xếp hạng 5 sao cho quy trình nhận phòng.\r\nHủy miễn phí trước 28 thg 9.', 21, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 'https://airbnbnew.cybersoft.edu.vn/images/phong3.png');
INSERT INTO `phong` (`id`, `ten_phong`, `khach`, `phong_ngu`, `giuong`, `phong_tam`, `mo_ta`, `gia_tien`, `may_giat`, `ban_la`, `tivi`, `dieu_hoa`, `wifi`, `bep`, `do_xe`, `ho_boi`, `ban_ui`, `ma_vi_tri`, `hinh_anh`) VALUES
(4, 'Closer home!!!!', 4, 4, 1, 1, 'Hieu là Chủ nhà siêu cấp\r\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.\r\nĐịa điểm tuyệt vời\r\n100% khách gần đây đã xếp hạng 5 sao cho vị trí này.\r\nTrải nghiệm nhận phòng tuyệt vời\r\n100% khách gần đây đã xếp hạng 5 sao cho quy trình nhận phòng.', 25, 0, 1, 1, 1, 1, 0, 1, 0, 1, 2, 'https://airbnbnew.cybersoft.edu.vn/images/phong4.png'),
(5, 'Toàn bộ quê hương phải của Gi ngay trung tâm Cần Thơ', 5, 5, 1, 1, 'Giang là Chủ nhà siêu cấp\r\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.\r\nĐịa điểm tuyệt vời\r\n94% khách gần đây đã xếp hạng 5 sao cho vị trí này.\r\nTrải nghiệm nhận phòng tuyệt vời\r\n94% khách gần đây đã xếp hạng 5 sao cho quy trình nhận phòng.', 26, 0, 1, 1, 0, 1, 0, 1, 1, 1, 2, 'https://airbnbnew.cybersoft.edu.vn/images/phong5.png'),
(6, 'Ngôi nhà có hoa, nắng đẹp, trung tâm Cần Thơ', 2, 6, 1, 1, 'Tự nhận phòng\r\nTự nhận phòng với hộp khóa an toàn.\r\nDang là Chủ nhà siêu cấp\r\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.', 29, 0, 1, 0, 1, 1, 0, 1, 0, 1, 2, 'https://airbnbnew.cybersoft.edu.vn/images/phong6.png'),
(7, 'Near Hon Chong-Quiet Seaview Studio to beach', 1, 4, 1, 1, 'là nơi ẩn náu mới đưa khách tham quan một hành trình kỳ thú vào bãi biển Nha Trang. Chỉ 2 phút đi bộ ra bãi biển!\r\nCâu chuyện về Trăng tròn được diễn giải lại một cách nghệ thuật theo lối trang trí sang trọng, cổ điển của ngôi nhà – một phiên bản đương đại của thần thoại truyền thống được kể bằng đồ nội thất kết hợp các chi tiết phong cách với các yếu tố Việt cổ. Chúng tôi kết hợp dịch vụ lưu trú truyền thống của châu Á với các tiện ích hiểu biết về công nghệ,', 31, 1, 1, 1, 0, 1, 0, 0, 1, 1, 3, 'https://airbnbnew.cybersoft.edu.vn/images/phong7.png'),
(8, 'Tầng 25 Căn hộ 1 phòng ngủ ấm cúng và hiện đại', 4, 3, 1, 1, 'Phòng ngủ ấm cúng và Morden 1 ở tầng 25. Cảm giác như ở nhà khi qua đêm ở đây! Mọi chi tiết trong căn hộ đều đi kèm với tinh thần nghệ thuật.\r\n\r\nChỗ ở\r\nToàn bộ căn hộ sẽ là của bạn! Sử dụng miễn phí tiện nghi và đồ dùng nhà bếp của chúng tôi', 21, 0, 1, 0, 0, 1, 0, 1, 0, 1, 3, 'https://airbnbnew.cybersoft.edu.vn/images/phong8.png'),
(9, 'Căn hộ mặt tiền Economy Beach với chế độ ngắm bình minh', 3, 1, 1, 1, 'Căn hộ của tôi là căn hộ mặt tiền bãi biển, hướng ra bãi biển. Bạn có thể tận hưởng bình minh từ cửa sổ.\r\nCăn hộ có thể cho thuê tối đa 4 người với 2 giường đôi. Tọa lạc tại trung tâm thành phố với nhiều nhà hàng và siêu thị xung quanh.', 22, 0, 1, 1, 0, 1, 0, 1, 1, 1, 3, 'https://airbnbnew.cybersoft.edu.vn/images/phong9.png'),
(10, 'Hanoi Old Quarter Homestay - Unique Railway View', 2, 1, 1, 1, 'Welcome to our house - a newly renovated apartment & just a step to Old Quarter, Dong Xuan Market, Hoan Kiem Lake...\r\n\r\nYou will get a chance to truly live a Hanoian life with local neighbor, local food & an one-of-a-kind experience of living right beside an unique Hanoi old French style Railway.', 23, 0, 1, 1, 0, 1, 0, 0, 0, 1, 4, 'https://airbnbnew.cybersoft.edu.vn/images/phong10.png'),
(11, 'Studio mới, thang máy, Hoàn Kiếm, gần khu phố cổ', 3, 1, 1, 1, 'Chào mừng bạn đến với Botanicahome! Chúng tôi hân hạnh mời bạn trải nghiệm ngôi nhà của gia đình chúng tôi. Chúng tôi muốn tạo ra một không gian nơi mọi người cảm thấy hoàn toàn thoải mái và như ở nhà. Căn hộ studio nằm trong tòa nhà nhỏ gần khu phố cổ và trung tâm thành phố. Tòa nhà này được xây dựng và được vận hành bởi chính gia đình. Chúng tôi sẽ cố gắng tính toán từng chi tiết, lớn nhỏ để làm bạn hài lòng và mang đến cho bạn một môi trường gọn gàng, sạch sẽ, an toàn, giá cả phải chăng và ấm cúng.', 24, 1, 1, 0, 0, 1, 0, 1, 0, 0, 4, 'https://airbnbnew.cybersoft.edu.vn/images/phong11.png'),
(12, 'Fisherman homestay (phòng 2 người - B)', 2, 1, 1, 1, 'Feel free and make yourself at home\r\n\r\nĐây là nơi để bạn trốn đi những ồn ào, tấp nập của công việc. Nơi bạn có thể tận hưởng cảm giác bình yên, nhẹ nhàng, đón những cơn gió và ngửi được vị mặn của bỉển nhưng vẫn không mang cảm giác xa lạ. Một nơi thân thuộc như chính ngôi nhà của bạn.', 25, 0, 1, 1, 0, 1, 0, 0, 1, 1, 4, 'https://airbnbnew.cybersoft.edu.vn/images/phong12.png'),
(13, 'Tách nhau 2 phòng ngủ tại thị trấn Dương Đông', 3, 1, 1, 1, 'Chào mừng bạn đến với The Yard - nơi cách trung tâm quần đảo Phú Quốc vài bước chân.\r\n\r\nNằm trong khu phố với Thị trấn Dương Đông, Chợ đêm Phú Quốc, Bãi Dài, Chùa,... và được bao quanh bởi nhiều điều địa phương mang bạn đến gần hơn với cuộc sống hàng ngày của công dân đảo.', 26, 1, 0, 0, 1, 1, 0, 1, 1, 1, 5, 'https://airbnbnew.cybersoft.edu.vn/images/phong13.png'),
(14, 'Fisherman homestay', 2, 1, 1, 1, 'Feel free and make yourself at home.\r\n\r\nĐây là nơi để bạn trốn đi những ồn ào, tấp nập của công việc. Nơi bạn có thể tận hưởng cảm giác bình yên, nhẹ nhàng, đón những cơn gió và ngửi được vị mặn của bỉển nhưng vẫn không mang cảm giác xa lạ. Một nơi thân thuộc như chính ngôi nhà của bạn.', 27, 0, 1, 1, 0, 1, 0, 0, 1, 1, 5, 'https://airbnbnew.cybersoft.edu.vn/images/phong14.png'),
(15, 'Studio mới & ấm cúng | Riverside | Bên cạnh Cầu Hàn', 3, 1, 1, 1, 'Chào mừng bạn đến với Ngôi nhà Đậu thứ ba của tôi ở bên bờ sông Hàn, bên cạnh cầu sông Hàn\r\nstudio rộng 25 m2 được trang trí tốt, rộng rãi, rất mới, tươi mới và sạch sẽ.\r\nVị trí tuyệt vời:\r\n- 3 phút đi bộ đến Cầu Hàn, trung tâm thương mại Vincom...\r\n- 2-3 phút bằng taxi đến cầu Rồng, cầu Tình yêu, Chợ đêm Sontra và bãi biển', 28, 0, 1, 1, 0, 1, 0, 1, 1, 1, 5, 'https://airbnbnew.cybersoft.edu.vn/images/phong15.png'),
(16, 'ModernLuxury Studio cách bãi biển 1 phút', 1, 1, 1, 1, 'Đắm chìm trong vẻ đẹp hiện đại và ấm áp của ngôi nhà mới xây này.\r\n* 3 phút đi bộ đến bãi biển Mỹ Khê\r\n* Không giới hạn Internet siêu tốc độ cao riêng tư/ WIFI và TV internet\r\n* Nhà bếp và máy giặt đầy đủ\r\ntiện nghi * Massage và massage phổ biến cạnh tòa nhà (phiếu giảm giá khi có sẵn)\r\n* Giảm giá 30% cho thời gian ở theo tháng', 29, 1, 0, 1, 1, 1, 0, 0, 0, 1, 6, 'https://airbnbnew.cybersoft.edu.vn/images/phong16.png'),
(17, 'Phòng mùa hè', 1, 1, 1, 1, 'Mọi thứ đều trở nên đơn giản tại chỗ ở yên bình và nằm tại vị trí trung tâm này.', 30, 1, 1, 1, 0, 1, 0, 1, 1, 0, 6, 'https://airbnbnew.cybersoft.edu.vn/images/phong17.png'),
(18, 'Căn hộ hiện đại độc đáo của Scandinavia', 3, 1, 1, 1, 'Nơi ở độc đáo này mang một phong cách rất riêng.', 19, 0, 1, 1, 0, 1, 0, 0, 1, 1, 7, 'https://airbnbnew.cybersoft.edu.vn/images/phong18.png'),
(19, 'Hill Lodge Mũi Né - Ngôi nhà nhỏ gần bãi biển', 3, 1, 1, 1, 'Đó sẽ là một ý tưởng chớp nhoáng sau khi tôi quyết định nghỉ việc. Tôi chia sẻ với bạn tôi, một kiến trúc sư, sau đó Hill Lodge được tạo ra. Thành phố này nằm trên sườn đồi trong một bãi biển dài, đó là lý do tại sao chúng tôi gọi “Hill Lodge”.\r\n\r\nChỗ ở\r\nHill Lodge được thiết kế theo phong cách tối giản. Chúng tôi thiết lập một số vật liệu cần thiết trong nhà nghỉ nhỏ. Nó có thể là đủ để sống và ẹnjoy sau một thời gian dài làm việc trong một thành phố bận rộn hoặc chỉ là một chuyến đi', 19, 1, 0, 1, 0, 1, 0, 1, 0, 0, 7, 'https://airbnbnew.cybersoft.edu.vn/images/phong19.png'),
(20, 'Sky Guest House', 4, 1, 1, 1, 'Một số thông tin đã được dịch tự động.', 18, 0, 1, 1, 0, 1, 0, 0, 1, 1, 8, 'https://airbnbnew.cybersoft.edu.vn/images/phong20.png'),
(22, 'ABC', 0, 0, 0, 0, 'string', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 'string');

INSERT INTO `vi_tri` (`id`, `ten_vi_tri`, `tinh_thanh`, `quoc_gia`, `hinh_anh`) VALUES
(1, 'Quận 1', 'Hồ Chí Minh', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt1.jpg');
INSERT INTO `vi_tri` (`id`, `ten_vi_tri`, `tinh_thanh`, `quoc_gia`, `hinh_anh`) VALUES
(2, 'Cái Răng', 'Cần Thơ', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt2.jpg');
INSERT INTO `vi_tri` (`id`, `ten_vi_tri`, `tinh_thanh`, `quoc_gia`, `hinh_anh`) VALUES
(3, 'Hòn Rùa', 'Nha Trang', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt3.jpg');
INSERT INTO `vi_tri` (`id`, `ten_vi_tri`, `tinh_thanh`, `quoc_gia`, `hinh_anh`) VALUES
(4, 'Hoàn Kiếm', 'Hà Nội', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt4.jpg'),
(5, 'Hòn Tằm', 'Phú Quốc', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt5.jpg'),
(6, 'Hải Châu', 'Đà Nẵng', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt6.jpg'),
(7, 'Langbiang', 'Đà Lạt', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt7.jpg'),
(8, 'Mũi Né', 'Phan Thiết', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt8.jpg');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;