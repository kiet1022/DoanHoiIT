-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 13, 2019 lúc 06:38 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doanhoi_it`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `statis_student_by_class` (IN `class` INT)  BEGIN
	select count(*) as SoLuong from students where class_id = class and is_study = 1
    union all select count(*)  from students where class_id = class and is_study = 2
	union all select count(*)  from students where class_id = class and is_study = 3
    union all select count(*)  from students where class_id = class and is_study = 4;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `statis_student_by_class_and_year` (IN `years` INT, IN `class` INT)  BEGIN
	select count(*) as SoLuong from students where class_id = class and school_year_id = years and is_study = 1
    union all select count(*)  from students where class_id = class and school_year_id = years and is_study = 2
	union all select count(*)  from students where class_id = class and school_year_id = years and is_study = 3
    union all select count(*)  from students where class_id = class and school_year_id = years and is_study = 4;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `statis_student_by_schoolyear` (IN `schoolYear` INT)  BEGIN
	select count(*) as SoLuong from students where school_year_id = schoolYear and is_study = 1
    union all select count(*)  from students where school_year_id = schoolYear and is_study = 2
	union all select count(*)  from students where school_year_id = schoolYear and is_study = 3
    union all select count(*)  from students where school_year_id = schoolYear and is_study = 4;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `statis_union_fee` (IN `schoolYear` INT)  BEGIN
	select count(*) as SoLuong from students where school_year_id = schoolYear and is_payed_union_fee = 1
    union all select count(*)  from students where school_year_id = schoolYear and is_payed_union_fee = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `statis_union_fee_by_class` (IN `class` INT)  BEGIN
	select count(*) as SoLuong from students where class_id = class and is_payed_union_fee = 1
    union all select count(*)  from students where class_id = class and is_payed_union_fee = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `semester` int(11) NOT NULL DEFAULT '1' COMMENT '1: ky 1, 2: ky 2',
  `start_regis_date` date NOT NULL,
  `end_regis_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `practise_marks` tinyint(4) DEFAULT '0',
  `social_marks` tinyint(4) DEFAULT '0',
  `register_number` int(11) DEFAULT NULL,
  `leader` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `plan_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fund_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activities`
--

INSERT INTO `activities` (`id`, `name`, `year`, `semester`, `start_regis_date`, `end_regis_date`, `start_date`, `end_date`, `content`, `practise_marks`, `social_marks`, `register_number`, `leader`, `plan_url`, `fund_url`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `image`) VALUES
(2, 'MIT', '2018-2019', 1, '2019-04-23', '2019-04-24', '2019-04-29', '2019-05-04', NULL, NULL, NULL, 0, '15110237', '', '', '2019-04-29 08:00:36', '2019-05-30 08:17:24', NULL, NULL, '2019-05-30 08:17:24', NULL),
(3, 'Mastering IT 2019', '2018 - 2019', 2, '2019-04-18', '2019-04-20', '2019-07-01', '2019-07-04', '<p><span style=\"color:#2ecc71;\">Kh&ocirc;ng c&oacute; nội dung</span></p>', 20, 0, 2, '18133064', '', '', '2019-04-29 08:02:31', '2019-07-06 01:56:23', NULL, 187, NULL, NULL),
(4, 'MIT 2019 nè mày ơi', '2016 - 2017', 2, '2019-04-25', '2019-04-30', '2019-05-02', '2019-05-03', '<p><span style=\"color:#1abc9c;\">MIT</span> <strong>năm 2019</strong></p>', 5, 0, 0, '16110376', 'GFSo_DHSPKT-Uu-dai-1.docx', '1XYx_[OK]DuTruKinhPhiDoan2017-2018.doc', '2019-05-01 05:34:56', '2019-05-23 07:18:31', NULL, 1, '2019-05-23 07:18:31', NULL),
(5, 'Hội Thao 2019', '2015 - 2016', 1, '2019-04-29', '2019-04-30', '2019-06-01', '2019-06-03', '<p><strong>Nội dung</strong> đ&acirc;y</p>', 5, 0, 0, '18110371', '', '', '2019-05-01 06:47:34', '2019-06-01 22:25:12', NULL, 1, NULL, NULL),
(6, 'tEST', '2015 - 2016', 2, '2019-05-01', '2019-05-02', '2019-05-04', '2019-05-26', NULL, NULL, NULL, 0, '15110237', '', '', '2019-05-01 07:39:26', '2019-05-30 08:17:24', NULL, NULL, '2019-05-30 08:17:24', NULL),
(7, 'Tập Huấn kỹ năng 2019', '2018 - 2019', 2, '2019-05-23', '2019-05-30', '2019-06-02', '2019-06-03', NULL, 0, 5, 0, '15110237', '', '', '2019-05-23 08:00:09', '2019-07-04 07:54:25', 1, 187, NULL, NULL),
(8, 'Chào đón tân sinh viên', '2018 - 2019', 1, '2019-06-01', '2019-06-01', '2019-07-01', '2019-07-05', NULL, NULL, 5, 1, '15110237', '', '', '2019-05-31 21:06:48', '2019-07-06 20:50:32', 1, 1, NULL, NULL),
(9, 'Mùa Hè Xanh', '2018 - 2019', 2, '2019-06-09', '2019-07-31', '2019-07-07', '2019-07-13', '<p><strong><strong>V&agrave;o 02 ng&agrave;y 23 &amp; 24/11/2018, Trường Đại học Sư phạm Kỹ thuật Tp.HCM (ĐHSPKT TPHCM) phối hợp c&ugrave;ng Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo tổ chức &ldquo;Hội thảo quốc tế C&ocirc;ng nghệ xanh ph&aacute;t triển bền vững lần thứ 4&rdquo; năm 2018 tại tầng 6 v&agrave; tầng 12 T&ograve;a nh&agrave; Trung t&acirc;m trường ĐH Sư phạm Kỹ thuật Tp. HCM.</strong><br />\r\n<br />\r\nVề tham dự buổi lễ, c&oacute; sự hiện diện của PGS.TS Ng&ocirc; Văn Thuy&ecirc;n, Chủ tịch hội đồng trường, trường ĐHSPKTTPHCM; PGS.TS L&ecirc; Hiếu Giang, Ph&oacute; Hiệu Trưởng trường ĐHSPKT TPHCM;&nbsp; GS. TS. Yo-Ping Huang, NTUT, Đ&agrave;i Loan v&agrave; c&aacute;c đại biểu l&agrave; t&aacute;c giả b&agrave;i viết.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H1.JPG\" /></strong></p>\r\n\r\n<p><strong><em>Hội nghị thu h&uacute;t đ&ocirc;ng đảo c&aacute;c học giả, nh&agrave; nghi&ecirc;n cứu, nh&agrave; khoa học,&hellip;</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Về ph&iacute;a kh&aacute;ch mời danh dự c&oacute; c&aacute;c vị đại biểu: TS. K.Srikar Reddy, Tổng l&atilde;nh Sự qu&aacute;n Ấn Độ tại TPHCM, Việt Nam; TS. Trần Nam T&uacute;, đại diện Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo; GS.TS Yan-Kuin Su, Nguy&ecirc;n Hiệu trưởng trường đại học Kun Shan, Đ&agrave;i Loan; GS.TS Chang &ndash;Ren Chen, Trường đại học Kun Shan, Đ&agrave;i Loan; GS. TS Kai &ndash; Yew Lum, Đại học Quốc gia Chi nan, Đ&agrave;i Loan; Mr. Andreas Wade, Gi&aacute;m đốc ph&aacute;t triển bền vững to&agrave;n cầu, First Solar; PGS.TS Jau Huai Lu, Đại học quốc gia Chung Hsing Đ&agrave;i Loan; &Ocirc;ng Cao Ph&uacute; Hải, Gi&aacute;m đốc sản xuất c&ocirc;ng ty ABB, Việt Nam; c&ugrave;ng c&aacute;c đại biểu đến từ Đ&agrave;i Loan, Nhật Bản, Trung Quốc, H&agrave;n Quốc, Th&aacute;i Lan, Bangladesh, Kazakhstan, Nga v&agrave; Việt Nam.&nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H2.JPG\" /></strong></p>\r\n\r\n<p><strong><em>Đại diện c&aacute;c trường Đại học từ trong v&agrave; ngo&agrave;i nước tham dự Hội nghị</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Trong hơn mười năm trở lại đ&acirc;y, kh&aacute;i niệm về &ldquo;C&ocirc;ng nghệ xanh&rdquo; v&agrave; &ldquo;Ph&aacute;t triển bền vững&rdquo; đ&atilde; trở n&ecirc;n hết sức được ch&uacute; trọng, nhất l&agrave; khi mối đe dọa về sự thiếu hụt nguồn năng lượng v&agrave; biến đổi kh&iacute; hậu to&agrave;n cầu ng&agrave;y c&agrave;ng trở n&ecirc;n nghi&ecirc;m trọng hơn. Theo đ&oacute;, c&aacute;c &quot;giải ph&aacute;p xanh&quot; trong kinh tế v&agrave; c&ocirc;ng nghệ li&ecirc;n quan đến sự ph&aacute;t triển bền vững đ&atilde; v&agrave; đang trở th&agrave;nh một trong những đề t&agrave;i được quan t&acirc;m nhất hiện nay, đặc biệt l&agrave; ở những nước đang vươn m&igrave;nh ph&aacute;t triển nhanh ch&oacute;ng như Trung Quốc, Ấn Độ, Việt Nam&hellip; &ldquo;Hội thảo quốc tế C&ocirc;ng nghệ xanh ph&aacute;t triển bền vững lần thứ 4&rdquo; đ&atilde; trở th&agrave;nh diễn đ&agrave;n hấp dẫn cho những chuy&ecirc;n gia, nh&agrave; nghi&ecirc;n cứu v&agrave; những người quan t&acirc;m cả trong lẫn ngo&agrave;i nước gặp gỡ v&agrave; chia những kết quả nghi&ecirc;n cứu mới, những giải ph&aacute;p mang t&iacute;nh to&agrave;n cầu nhằm trong lĩnh vực c&ocirc;ng nghệ xanh v&agrave; ph&aacute;t triển bền vững.&nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H3%20(1).JPG\" /></strong></p>\r\n\r\n<p><strong><em>PGS.TS L&ecirc; Hiếu Giang &ndash; Ph&oacute; B&iacute; thư Đảng ủy, Ph&oacute; Hiệu trưởng ĐHSPKT TPHCM&nbsp;<br />\r\nph&aacute;t biểu ch&agrave;o mừng tại Hội thảo</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Đ&acirc;y l&agrave; hội thảo lần thứ 4 nằm trong chuỗi hội thảo quốc tế C&ocirc;ng nghệ Xanh v&agrave; Ph&aacute;t triển bền vững được tổ chức định kỳ hai năm/lần. Đồng tổ chức Hội thảo gồm Trường đại học Sư phạm Kỹ thuật TPHCM, Sở Khoa học v&agrave; C&ocirc;ng nghệ TPHCM, Viện năng lượng mặt trời, Ấn Độ; Trường đại học Kun Shan, Đ&agrave;i Loan.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H4.JPG\" /></strong></p>\r\n\r\n<p><strong><em>TS. Trần Nam T&uacute; - đại diện Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Ph&aacute;t biểu tại Hội nghị, TS. Trần Nam T&uacute;, đại diện Vụ Khoa học, C&ocirc;ng ngh&ecirc; v&agrave; M&ocirc;i trường - Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo, đề cập đến vấn đề về m&ocirc;i trường v&agrave; &ocirc; nhiễm đang c&oacute; những t&aacute;c động xấu đến sự ph&aacute;t triển bền vững của Việt Nam cũng như thế giới. Do đ&oacute;, &ocirc;ng đ&aacute;nh gi&aacute; rất cao về tầm nh&igrave;n v&agrave; vai tr&ograve; của Hội nghị lần n&agrave;y: &ldquo;B&ecirc;n cạnh &yacute; nghĩa khoa học, hội thảo l&agrave; cực kỳ quan trọng trong hội nhập v&agrave; hợp t&aacute;c quốc tế. Hội nghị l&agrave; cơ hội cho c&aacute;c nh&agrave; khoa học Việt Nam v&agrave; quốc tế, c&aacute;c tổ chức học thuật tr&ecirc;n thế giới chia sẻ kiến thức, kinh nghiệm, kết quả nghi&ecirc;n cứu li&ecirc;n quan đến c&ocirc;ng nghệ xanh v&agrave; ph&aacute;t triển bền vững. Đ&acirc;y l&agrave; một đ&oacute;ng g&oacute;p quan trọng cho hoạt động nghi&ecirc;n cứu v&agrave; đ&agrave;o tạo trong gi&aacute;o dục đại học cũng như tham gia ph&aacute;t triển kinh tế - x&atilde; hội, bảo vệ m&ocirc;i trường bền vững&rdquo;. Qua đ&oacute;, &ocirc;ng cũng nhấn mạnh về định hướng chiến lược của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo Việt Nam l&agrave; đẩy nhanh việc chuyển giao kết quả nghi&ecirc;n cứu v&agrave;o sản xuất, trong đ&oacute; c&ocirc;ng nghệ xanh v&agrave; ph&aacute;t triển bền vững l&agrave; một ưu ti&ecirc;n h&agrave;ng đầu: &ldquo;T&ocirc;i hy vọng th&ocirc;ng qua hội thảo n&agrave;y, ch&uacute;ng ta c&oacute; thể tạo ra một sự tiến bộ cho sự hợp t&aacute;c chung về C&ocirc;ng nghệ v&agrave; Gi&aacute;o dục, đặc biệt l&agrave; th&agrave;nh phố Hồ Ch&iacute; Minh v&agrave; c&aacute;c trường đại học kh&aacute;c sẽ tiếp tục duy tr&igrave; tổ chức chuỗi hội thảo n&agrave;y trong tương lai.&rdquo;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H5%20(1).JPG\" /></strong></p>\r\n\r\n<p><strong><em>GS.TS Yan-Kuin Su, Nguy&ecirc;n Hiệu trưởng trường đại học Kun Shan, Đ&agrave;i Loan ph&aacute;t biểu</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Hội thảo đ&atilde; thu h&uacute;t hơn 250 b&agrave;i b&aacute;o l&agrave; kết quả nghi&ecirc;n cứu từ c&aacute;c nh&agrave; khoa học, học giả. Sau qu&aacute; tr&igrave;nh phản biện, hội thảo c&ograve;n 162 b&agrave;i viết được mời b&aacute;o c&aacute;o, chia sẻ tại 11 ph&acirc;n ban trong hội nghị.&nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H6.JPG\" /></strong></p>\r\n\r\n<p><strong><em><img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H6a.JPG\" /><br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H6c.JPG\" /><br />\r\nC&aacute;c nh&agrave; khoa học, diễn giả tr&igrave;nh b&agrave;y v&agrave; thảo luận tại Hội nghị</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Nội dung Hội thảo xoay quanh c&aacute;c vấn đề: Năng lượng t&aacute;i tạo, Kỹ thuật Điện-Điện tử, Kỹ thuật d&acirc;n dụng, Tự động h&oacute;a, Hệ thống th&ocirc;ng tin, khoa học ứng dụng, C&ocirc;ng nghệ nhiệt, Ph&aacute;t triển nền kinh tế, gi&aacute;o dục bền vững, C&ocirc;ng nghệ h&oacute;a v&agrave; m&ocirc;i trường, C&ocirc;ng nghệ Kỹ thuật cơ kh&iacute;.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H7.JPG\" /></strong></p>\r\n\r\n<p><strong><em>C&aacute;c đại biểu chụp ảnh lưu niệm tại lễ khai mạc Hội thảo</em></strong></p>', NULL, 20, NULL, '15110347', '', '', '2019-07-06 22:23:14', '2019-07-06 22:23:14', 187, NULL, NULL, ''),
(10, 'CT TEST', '2018 - 2019', 2, '2019-07-01', '2019-07-04', '2019-07-08', '2019-07-12', NULL, NULL, NULL, NULL, '15110237', '', '', '2019-07-06 22:50:36', '2019-07-06 23:23:15', 187, 187, NULL, 'zqeN_4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_funds`
--

CREATE TABLE `activity_funds` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `initial_funds` bigint(20) NOT NULL,
  `actual_funds` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0: chưa thanh toán, 1: đã thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activity_funds`
--

INSERT INTO `activity_funds` (`id`, `activity_id`, `initial_funds`, `actual_funds`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `status`) VALUES
(9, 2, 300000, 0, '2019-05-18 19:55:06', '2019-05-19 07:56:07', 1, NULL, '2019-05-19 07:56:07', 0),
(10, 2, 800000, 0, '2019-05-19 08:02:47', '2019-05-19 08:11:27', 1, NULL, '2019-05-19 08:11:27', 0),
(11, 2, 100000, 0, '2019-05-19 08:17:57', '2019-05-19 08:44:47', 1, NULL, '2019-05-19 08:44:47', 0),
(12, 3, 6400000, 0, '2019-05-19 08:46:21', '2019-06-06 08:40:27', 1, NULL, NULL, 1),
(13, 5, 100000, 0, '2019-05-19 08:47:00', '2019-05-19 08:50:51', 1, NULL, '2019-05-19 08:50:51', 0),
(14, 4, 1111111, 0, '2019-05-19 08:50:20', '2019-05-23 07:18:31', 1, NULL, '2019-05-23 07:18:31', 0),
(15, 5, 1000000, 0, '2019-05-20 08:34:41', '2019-06-01 22:25:12', 1, NULL, NULL, 0),
(16, 7, 1050000, 0, '2019-05-23 08:01:51', '2019-06-26 07:31:26', 187, NULL, NULL, 1),
(17, 8, 700000, 500000, '2019-06-21 23:44:01', '2019-07-13 07:52:13', 187, NULL, NULL, 0),
(18, 9, 1000000, 0, '2019-07-13 08:11:56', '2019-07-13 08:11:56', 187, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_fund_details`
--

CREATE TABLE `activity_fund_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `fund_id` int(10) UNSIGNED NOT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung chi',
  `expected_value` bigint(20) NOT NULL COMMENT 'Thành tiền (dự tính)',
  `actual_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Thực chi',
  `payment_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hình thức thanh toán: Hóa đơn, Ký nhận',
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Đơn vị tính',
  `amount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số lượng',
  `unit_price` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activity_fund_details`
--

INSERT INTO `activity_fund_details` (`id`, `fund_id`, `content`, `expected_value`, `actual_value`, `payment_type`, `unit`, `amount`, `unit_price`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(11, 9, 'Nước uống', 100000, 0, 'Hóa đơn đỏ', 'Thùng', NULL, 100000, '2019-05-18 19:55:06', '2019-05-19 07:56:07', 1, NULL, '2019-05-19 07:56:07'),
(12, 9, 'Quà', 200000, 0, 'Hóa đơn đỏ', 'cái', NULL, 100000, '2019-05-18 19:55:06', '2019-05-19 07:56:07', 1, NULL, '2019-05-19 07:56:07'),
(13, 10, 'Background', 200000, 0, 'Hóa đơn đỏ', 'cái', '2', 100000, '2019-05-19 08:02:47', '2019-05-19 08:11:27', 1, NULL, '2019-05-19 08:11:27'),
(14, 10, 'Quà', 100000, 0, 'Hóa đơn đỏ', NULL, '1', 100000, '2019-05-19 08:02:47', '2019-05-19 08:11:27', 1, NULL, '2019-05-19 08:11:27'),
(15, 10, 'Nước uống', 500000, 0, 'Hóa đơn đỏ', 'Thùng', '5', 100000, '2019-05-19 08:02:47', '2019-05-19 08:11:27', 1, NULL, '2019-05-19 08:11:27'),
(16, 11, 'Nước uống', 100000, 0, 'Hóa đơn đỏ', 'Thùng', '1', 100000, '2019-05-19 08:17:57', '2019-05-19 08:44:47', 1, NULL, '2019-05-19 08:44:47'),
(17, 12, 'Nước uống', 500000, 0, 'Hóa đơn đỏ', 'Thùng', '5', 100000, '2019-05-19 08:46:21', '2019-06-01 22:27:28', 1, NULL, NULL),
(18, 12, 'Quà', 200000, 0, 'Hóa đơn đỏ', 'Phần', '2', 100000, '2019-05-19 08:46:21', '2019-06-01 22:27:28', 1, NULL, NULL),
(19, 13, 'Nước uống', 100000, 0, 'Hóa đơn đỏ', 'Thùng', '1', 100000, '2019-05-19 08:47:00', '2019-05-19 08:50:50', 1, NULL, '2019-05-19 08:50:50'),
(20, 14, 'Nước uống', 1111111, 0, 'Hóa đơn đỏ', 'Thùng', '1', 100000, '2019-05-19 08:50:20', '2019-05-23 07:18:31', 1, NULL, '2019-05-23 07:18:31'),
(21, 15, 'Detail 1', 200000, 0, 'Ký nhận', 'Cái', '2', 100000, '2019-05-20 08:34:41', '2019-06-01 22:25:12', 1, NULL, NULL),
(22, 15, 'Detai 231', 300000, 0, 'Ký nhận', 'Thùng', '3', 100000, '2019-05-20 08:34:41', '2019-06-01 22:25:12', 1, NULL, NULL),
(23, 15, 'Detai Thêm', 200000, 0, 'Hóa đơn đỏ', 'Hộp', '2', 100000, '2019-05-20 08:42:33', '2019-06-01 22:25:12', 1, NULL, NULL),
(24, 15, 'Nước uống', 200000, 0, 'Hóa đơn đỏ', 'Thùng', '2', 100000, '2019-05-20 08:43:26', '2019-06-01 22:25:12', 1, NULL, NULL),
(25, 15, 'Background', 100000, 0, 'Hóa đơn đỏ', 'Cái', '1', 100000, '2019-05-20 08:43:26', '2019-06-01 22:25:12', 1, NULL, NULL),
(26, 16, 'Bạc trại', 350000, 0, 'Hóa đơn đỏ', 'bộ', '5', 70000, '2019-05-23 08:01:51', '2019-06-26 07:31:26', 187, NULL, NULL),
(27, 16, 'Nước uống', 350000, 0, 'Hóa đơn đỏ', 'Thùng', '2', 70000, '2019-05-23 08:01:51', '2019-06-26 07:31:26', 187, NULL, NULL),
(29, 16, 'Cơm trưa', 350000, 0, 'Ký nhận', 'Phần', '100', 70000, '2019-05-23 08:04:15', '2019-06-26 07:31:26', 187, NULL, NULL),
(30, 12, 'Bánh kẹo', 200000, 0, 'Hóa đơn đỏ', 'Phần', '1', 200000, '2019-05-31 21:25:49', '2019-06-01 22:27:28', 1, NULL, NULL),
(31, 12, 'Detai Thêm', 500000, 0, 'Ký nhận', 'Hộp', '10', 50000, '2019-05-31 21:52:17', '2019-06-01 22:36:07', 1, NULL, NULL),
(32, 12, 'Detail thêm nữa', 5000000, 0, 'Hóa đơn đỏ', 'Tá', '10', 500000, '2019-06-03 07:45:55', '2019-06-03 07:45:55', 1, NULL, NULL),
(33, 17, 'Bột màu', 200000, 100000, 'Hóa đơn đỏ', 'ký', '2', 100000, '2019-06-21 23:44:01', '2019-07-13 07:52:13', 187, NULL, NULL),
(34, 17, 'Bong bóng', 500000, 400000, 'Hóa đơn đỏ', 'Bịch', '10', 50000, '2019-06-21 23:44:01', '2019-07-13 07:52:13', 187, NULL, NULL),
(35, 18, 'Dây nhợ', 500000, 0, 'Ký nhận', 'bộ', '5', 100000, '2019-07-13 08:11:56', '2019-07-13 08:11:56', 187, NULL, NULL),
(36, 18, 'Cáp', 500000, 0, 'Ký nhận', 'bộ', '10', 50000, '2019-07-13 08:11:56', '2019-07-13 08:11:56', 187, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `association_ec`
--

CREATE TABLE `association_ec` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '0: UV BCH, 1: LCH Trưởng, 2: LCH Phó',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `association_ec`
--

INSERT INTO `association_ec` (`id`, `student_id`, `level`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, '15110347', 1, NULL, '2019-05-04 06:19:25', NULL, 1, NULL),
(2, '15110289', 2, NULL, '2019-04-13 10:19:57', NULL, 1, NULL),
(3, '17110356', 2, NULL, '2019-06-14 20:21:11', NULL, 1, NULL),
(4, '15110268', 0, NULL, NULL, NULL, NULL, NULL),
(5, '15110176', 0, NULL, NULL, NULL, NULL, NULL),
(6, '16110294', 0, NULL, NULL, NULL, NULL, NULL),
(7, '16110324', 0, NULL, NULL, NULL, NULL, NULL),
(8, '16110299', 0, NULL, NULL, NULL, NULL, NULL),
(9, '17110393', 0, NULL, NULL, NULL, NULL, NULL),
(10, '17110398', 0, NULL, NULL, NULL, NULL, NULL),
(11, '17110340', 0, NULL, NULL, NULL, NULL, NULL),
(12, '17110337', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attenders`
--

CREATE TABLE `attenders` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attenders`
--

INSERT INTO `attenders` (`id`, `student_id`, `activity_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(85, '15110204', 3, NULL, NULL, NULL, NULL, NULL),
(86, '18110371', 3, NULL, NULL, NULL, NULL, NULL),
(87, '15110370', 3, NULL, NULL, NULL, NULL, NULL),
(88, '15110237', 3, '2019-07-06 01:56:23', '2019-07-06 01:56:23', NULL, NULL, NULL),
(89, '15110237', 8, '2019-07-06 20:50:32', '2019-07-06 20:50:32', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkin`
--

CREATE TABLE `checkin` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int(10) UNSIGNED DEFAULT NULL,
  `year` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '0: DRL, 1:CTXH',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `marks` int(11) DEFAULT NULL COMMENT 'điểm cộng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `checkin`
--

INSERT INTO `checkin` (`id`, `content`, `activity_id`, `year`, `type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `marks`) VALUES
(7, 'Điểm danh cộng tác viên', 7, '2018 - 2019', 1, '2019-05-26 07:43:08', '2019-05-26 07:43:08', 1, NULL, NULL, 5),
(8, 'Điểm danh ban tổ chức', 7, '2018 - 2019', 1, '2019-05-26 07:43:19', '2019-05-26 07:43:19', 1, NULL, NULL, 5),
(9, 'Điểm danh sinh viên tham gia chương trình', 7, '2018 - 2019', 0, '2019-05-26 07:43:33', '2019-05-26 07:43:33', 1, NULL, NULL, 3),
(10, 'Điểm danh sinh viên tham gia chương trình', 7, '2018 - 2019', 0, '2019-05-27 06:48:49', '2019-05-27 06:48:49', 1, NULL, NULL, 5),
(11, 'Điểm danh cộng tác viên', 7, '2018 - 2019', 1, '2019-05-27 09:10:03', '2019-05-27 09:10:03', 1, NULL, NULL, 3),
(13, 'Cộng điểm BCH', NULL, '2018 - 2019', 0, '2019-05-29 07:18:38', '2019-05-29 07:18:38', 1, NULL, NULL, 6),
(14, 'Điểm danh sinh viên tham gia chương trình', 5, '2018 - 2019', 0, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL, 5),
(15, 'Điểm danh sinh viên tham gia chương trình', 8, '2018 - 2019', 1, '2019-05-31 21:55:42', '2019-05-31 21:55:42', 1, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkin_details`
--

CREATE TABLE `checkin_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `checkin_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `checkin_details`
--

INSERT INTO `checkin_details` (`id`, `student_id`, `checkin_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(22, '18110371', 7, '2019-05-26 07:43:08', '2019-05-26 07:43:08', 1, NULL, NULL),
(23, '15110370', 8, '2019-05-26 07:43:19', '2019-05-26 07:43:19', 1, NULL, NULL),
(24, '15110237', 9, '2019-05-26 07:43:33', '2019-05-26 07:43:33', 1, NULL, NULL),
(25, '15110204', 10, '2019-05-27 06:48:49', '2019-05-27 06:48:49', 1, NULL, NULL),
(26, '15110237', 10, '2019-05-27 06:48:49', '2019-05-27 06:48:49', 1, NULL, NULL),
(27, '15110370', 10, '2019-05-27 06:48:49', '2019-05-27 06:48:49', 1, NULL, NULL),
(28, '18110371', 10, '2019-05-27 06:48:49', '2019-05-27 06:48:49', 1, NULL, NULL),
(29, '154545454545', 11, '2019-05-27 09:10:03', '2019-05-27 09:10:03', 1, NULL, NULL),
(34, '15110237', 13, '2019-05-29 07:18:38', '2019-05-29 07:18:38', NULL, NULL, NULL),
(35, '18110370', 13, '2019-05-29 07:18:38', '2019-05-29 07:18:38', NULL, NULL, NULL),
(36, '18110371', 13, '2019-05-29 07:18:38', '2019-05-29 07:18:38', NULL, NULL, NULL),
(37, '15110370', 13, '2019-05-29 07:18:38', '2019-05-29 07:18:38', NULL, NULL, NULL),
(38, '15110237', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(39, '18110371', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(40, '18110372', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(41, '15110236', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(42, '15110238', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(43, '15110204', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(44, '15110370', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(45, '18110369', 14, '2019-05-30 08:21:52', '2019-05-30 08:21:52', 1, NULL, NULL),
(46, '15110237', 15, '2019-05-31 21:55:42', '2019-05-31 21:55:42', 1, NULL, NULL),
(47, '18110372', 15, '2019-05-31 21:55:42', '2019-05-31 21:55:42', 1, NULL, NULL),
(48, '18110371', 15, '2019-05-31 21:55:42', '2019-05-31 21:55:42', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_year_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `school_year_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, '151101', 1, NULL, NULL, NULL, NULL, NULL),
(2, '151102', 1, NULL, NULL, NULL, NULL, NULL),
(3, '151103', 1, NULL, NULL, NULL, NULL, NULL),
(4, '159100', 1, NULL, NULL, NULL, NULL, NULL),
(5, '161101', 2, NULL, NULL, NULL, NULL, NULL),
(6, '161102', 2, NULL, NULL, NULL, NULL, NULL),
(7, '169100', 2, NULL, NULL, NULL, NULL, NULL),
(8, '171101', 3, NULL, NULL, NULL, NULL, NULL),
(9, '171102', 3, NULL, NULL, NULL, NULL, NULL),
(10, '179100', 3, NULL, NULL, NULL, NULL, NULL),
(11, '171330', 3, NULL, NULL, NULL, NULL, NULL),
(12, '181101', 4, NULL, NULL, NULL, NULL, NULL),
(13, '181102', 4, NULL, NULL, NULL, NULL, NULL),
(14, '181330', 4, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `collaborators`
--

CREATE TABLE `collaborators` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exec_comm`
--

CREATE TABLE `exec_comm` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) DEFAULT NULL COMMENT '0: UV BCH Đoàn, 1: Bí Thư, 2: Phó bí thư, 3:Phó BT+LCH Trưởng',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `exec_comm`
--

INSERT INTO `exec_comm` (`id`, `student_id`, `level`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, '15110237', 1, NULL, '2019-04-13 21:44:27', NULL, 1, NULL),
(2, '15110347', 3, NULL, '2019-05-04 06:19:25', NULL, 1, NULL),
(3, '16110423', 2, NULL, NULL, NULL, NULL, NULL),
(4, '16110294', 0, NULL, NULL, NULL, NULL, NULL),
(5, '16110539', 0, NULL, NULL, NULL, NULL, NULL),
(6, '16110376', 0, NULL, NULL, NULL, NULL, NULL),
(7, '16110440', 0, NULL, NULL, NULL, NULL, NULL),
(8, '17110386', 0, NULL, NULL, NULL, NULL, NULL),
(9, '17110356', 0, NULL, NULL, NULL, NULL, NULL),
(10, '18110362', 0, NULL, NULL, NULL, NULL, NULL),
(11, '18110371', 0, NULL, NULL, NULL, NULL, NULL),
(12, '18133064', 0, NULL, NULL, NULL, NULL, NULL),
(13, '18110258', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `student_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL,
  `old_data` text COLLATE utf8_unicode_ci NOT NULL,
  `new_data` text COLLATE utf8_unicode_ci NOT NULL,
  `time_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `agent` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `logs`
--

INSERT INTO `logs` (`id`, `student_id`, `student_name`, `role`, `action`, `old_data`, `new_data`, `time_id`, `url`, `agent`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 'dsdsdsd', '4554554', 'Admin', 'Cập nhật BCH', 'MSSV: 15110347<br>Chức vụ: 3<br>', 'MSSV: 18110371<br>Chức vụ: 3<br>', '2019-04-15 07:57:59', 'http://localhost:8080/DoanHoi/public/admin/exec-com/save-info.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24', '2019-04-15 00:57:59', '2019-04-15 00:57:59', NULL, NULL, NULL),
(2, '000000', '4554554', 'Admin', 'Cập nhật BCH', 'MSSV: 18110371<br>Chức vụ: 3<br>', 'MSSV: 15110347<br>Chức vụ: 3<br>', '2019-04-15 07:59:35', 'http://localhost:8080/DoanHoi/public/admin/exec-com/save-info.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24', '2019-04-15 00:59:35', '2019-04-15 00:59:35', NULL, NULL, NULL),
(3, '000000', 'Test', 'Admin', 'Cập nhật BCH', 'MSSV: 15110347<br>Chức vụ: 3<br>', 'MSSV: 18110371<br>Chức vụ: 3<br>', '2019-04-14 08:00:44', 'http://localhost:8080/DoanHoi/public/admin/exec-com/save-info.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24', '2019-04-15 01:00:44', '2019-04-15 01:00:44', NULL, NULL, NULL),
(4, '000000', 'Test', 'Admin', 'Thêm chương trình', '', 'Tên Chương trình: Hội Thao 2019<br>Sinh viên đứng chính: 18110371<br>Thời gian bắt đầu: 01/05/2019<br>Thời gian kết thúc: 02/05/2019<br>', '2019-05-01 13:47:34', 'http://localhost:8080/DoanHoi/public/admin/activities/add', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.0 Safari/537.36 Edg/75.0.139.1', '2019-05-01 06:47:34', '2019-05-01 06:47:34', NULL, NULL, NULL),
(5, '000000', 'Test', 'Admin', 'Thêm chương trình', '', 'Tên Chương trình: tEST<br>Sinh viên đứng chính: 15110237<br>Thời gian bắt đầu: 04/05/2019<br>Thời gian kết thúc: 06/05/2019<br>', '2019-05-01 14:39:26', 'http://localhost:8080/DoanHoi/public/admin/activities/add.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.0 Safari/537.36 Edg/75.0.139.1', '2019-05-01 07:39:26', '2019-05-01 07:39:26', NULL, NULL, NULL),
(6, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Tên Chương trình: MIT 2019 nè<br>Sinh viên đứng chính: 16110423<br>Nội dung: <p><span style=\"color:#1abc9c;\">MIT</span> <strong>năm 2019</strong></p><br>', 'Tên Chương trình: MIT 2019 nè<br>Sinh viên đứng chính: 16110423<br>Nội dung: <p><span style=\"color:#1abc9c;\">MIT</span> <strong>năm 2019</strong></p>\r\n\r\n<p><strong>Năm nỳ</strong></p><br>', '2019-05-04 06:03:48', 'http://localhost:8080/DoanHoi/public/admin/activities/edit/4-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.18 Safari/537.36 Edg/75.0.139.4', '2019-05-03 23:03:48', '2019-05-03 23:03:48', NULL, NULL, NULL),
(7, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Tên Chương trình: MIT 2019 nè<br>Sinh viên đứng chính: 16110423<br>Ngày bắt đầu: 01/05/2019<br>Ngày kết thúc: 02/05/2019<br>Ngày bắt đầu đăng ký: 24/04/2019<br>Nội dung: <p><span style=\"color:#1abc9c;\">MIT</span> <strong>năm 2019</strong></p>\r\n\r\n<p><strong>Năm nỳ</strong></p><br>Điểm rèn luyện: <p><span style=\"color:#1abc9c;\">MIT</span> <strong>năm 2019</strong></p><br>Điểm CTXH: 5<br>Số lượng đăng ký tối đa: 50<br>Năm học: 2018 - 2019<br>', 'Tên Chương trình: MIT 2019 nè mày ơi<br>Sinh viên đứng chính: 16110376<br>Ngày bắt đầu: 02/05/2019<br>Ngày bắt đầu: 02/05/2019<br>Ngày bắt đầu đăng ký: 25/04/2019<br>Nội dung: <p><span style=\"color:#1abc9c;\">MIT</span> <strong>năm 2019</strong></p><br>Điểm rèn luyện: 5<br>Điểm CTXH: 10<br>Số lượng đăng ký tối đa: 100<br>Năm học: 2016 - 2017<br>', '2019-05-04 06:07:34', 'http://localhost:8080/DoanHoi/public/admin/activities/edit/4-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.18 Safari/537.36 Edg/75.0.139.4', '2019-05-03 23:07:34', '2019-05-03 23:07:34', NULL, NULL, NULL),
(8, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Tên Chương trình: MIT<br>Sinh viên đứng chính: 15110237<br>Nội dung: <br>Điểm rèn luyện: <br>Điểm CTXH: <br>Số lượng đăng ký tối đa: <br>Năm học: <br>Học kỳ: 1<br>', 'Tên Chương trình: MIT này test<br>Sinh viên đứng chính: 18133064<br>Nội dung: <p><span style=\"color:#2ecc71;\">Kh&ocirc;ng c&oacute; nội dung</span></p><br>Điểm rèn luyện: 20<br>Điểm CTXH: 5<br>Số lượng đăng ký tối đa: 100<br>Năm học: 2018 - 2019<br>Học kỳ: 2<br>', '2019-05-04 06:12:59', 'http://localhost:8080/DoanHoi/public/admin/activities/edit/3-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.18 Safari/537.36 Edg/75.0.139.4', '2019-05-03 23:12:59', '2019-05-03 23:12:59', NULL, NULL, NULL),
(9, '000000', 'Test', 'Admin', 'Cập nhật BCH', 'MSSV: 18110371<br>Chức vụ: 3<br>', 'MSSV: 15110347<br>Chức vụ: 3<br>', '2019-05-04 13:19:25', 'http://localhost:8080/DoanHoi/public/admin/exec-com/save-info.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.18 Safari/537.36 Edg/75.0.139.4', '2019-05-04 06:19:25', '2019-05-04 06:19:25', NULL, NULL, NULL),
(10, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Nội dung: <br>', 'Nội dung: <p><strong>Nội dung</strong> đ&acirc;y</p><br>', '2019-05-04 13:27:43', 'http://localhost:8080/DoanHoi/public/admin/activities/edit/5-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.18 Safari/537.36 Edg/75.0.139.4', '2019-05-04 06:27:43', '2019-05-04 06:27:43', NULL, NULL, NULL),
(11, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-05-05 13:14:30', 'http://localhost:8080/DoanHoi/public/admin/activities/edit/4-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.18 Safari/537.36 Edg/75.0.139.4', '2019-05-05 06:14:30', '2019-05-05 06:14:30', NULL, NULL, NULL),
(12, '000000', 'Test', 'Admin', 'Thêm chương trình', '', 'Tên Chương trình: Tập Huấn kỹ năng 2019<br>Sinh viên đứng chính: 17110393<br>Thời gian bắt đầu: 01/06/2019<br>Thời gian kết thúc: 02/06/2019<br>', '2019-05-23 15:00:09', 'http://localhost:8080/DoanHoiIT/public/admin/activities/add.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3789.0 Safari/537.36 Edg/76.0.159.0', '2019-05-23 08:00:09', '2019-05-23 08:00:09', NULL, NULL, NULL),
(13, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Ngày bắt đầu: 01/05/2019<br>Ngày kết thúc: 02/05/2019<br>', 'Ngày bắt đầu: 01/06/2019<br>Ngày kết thúc: 03/06/2019<br>', '2019-05-30 15:20:37', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/5-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3800.0 Safari/537.36 Edg/76.0.167.1', '2019-05-30 08:20:37', '2019-05-30 08:20:37', NULL, NULL, NULL),
(14, '000000', 'Test', 'Admin', 'Thêm chương trình', '', 'Tên Chương trình: Chào đón tân sinh viên<br>Sinh viên đứng chính: 15110237<br>Thời gian bắt đầu: 04/06/2019<br>Thời gian kết thúc: 05/06/2019<br>', '2019-06-01 04:06:48', 'http://localhost:8080/DoanHoiIT/public/admin/activities/add.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3800.0 Safari/537.36 Edg/76.0.172.0', '2019-05-31 21:06:48', '2019-05-31 21:06:48', NULL, NULL, NULL),
(15, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Sinh viên đứng chính: 17110393<br>Ngày kết thúc đăng ký: 31/05/2019<br>', 'Sinh viên đứng chính: 15110237<br>Ngày kết thúc đăng ký: 30/05/2019<br>', '2019-06-16 08:49:40', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/7-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.12 Safari/537.36 Edg/76.0.182.6', '2019-06-16 01:49:40', '2019-06-16 01:49:40', NULL, NULL, NULL),
(16, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-06-16 08:51:18', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/7-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.12 Safari/537.36 Edg/76.0.182.6', '2019-06-16 01:51:18', '2019-06-16 01:51:18', NULL, NULL, NULL),
(17, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Ngày bắt đầu: 29/04/2019<br>Ngày kết thúc: 30/04/2019<br>', 'Ngày bắt đầu: 01/07/2019<br>Ngày kết thúc: 03/07/2019<br>', '2019-06-22 02:39:34', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/3-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3818.0 Safari/537.36 Edg/77.0.189.3', '2019-06-21 19:39:34', '2019-06-21 19:39:34', NULL, NULL, NULL),
(18, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Ngày bắt đầu: 01/07/2019<br>Ngày kết thúc: 03/07/2019<br>', 'Ngày bắt đầu: 21/06/2019<br>Ngày kết thúc: 23/06/2019<br>', '2019-06-22 02:53:31', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/3-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3818.0 Safari/537.36 Edg/77.0.189.3', '2019-06-21 19:53:31', '2019-06-21 19:53:31', NULL, NULL, NULL),
(19, '000000', 'Test', 'Admin', 'Chỉnh sửa chương trình', 'Ngày bắt đầu: 04/06/2019<br>Ngày kết thúc: 05/06/2019<br>', 'Ngày bắt đầu: 01/07/2019<br>Ngày kết thúc: 05/07/2019<br>', '2019-06-22 02:54:12', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/8-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3818.0 Safari/537.36 Edg/77.0.189.3', '2019-06-21 19:54:12', '2019-06-21 19:54:12', NULL, NULL, NULL),
(20, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm loại tin', ' ', 'Type: Thông tin đoàn hội<br>', '2019-06-30 13:19:09', 'http://localhost:8080/DoanHoiIT/public/admin/news/type/addType.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 06:19:09', '2019-06-30 06:19:09', NULL, NULL, NULL),
(21, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 1<br>\r\n		Title: Hội thi MIT thành công tốt đẹp<br>\r\n		Sumary: Hội thi MIT thành công tốt đẹp<br>\r\n		Content: ', '2019-06-30 13:19:59', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 06:19:59', '2019-06-30 06:19:59', NULL, NULL, NULL),
(22, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 1<br>\r\n		Title: Chào đón tân sinh viên<br>\r\n		Sumary: Chào đón tân sinh viên<br>\r\n		Content: ', '2019-06-30 13:22:34', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 06:22:34', '2019-06-30 06:22:34', NULL, NULL, NULL),
(23, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 1<br>\r\n		Title: Ngày hội mở<br>\r\n		Sumary: Ngày mở 2019<br>\r\n		Content: ', '2019-06-30 13:24:32', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 06:24:32', '2019-06-30 06:24:32', NULL, NULL, NULL),
(24, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 1<br>\r\n		Title: Layout - OrgChart JS | BALKANGraph<br>\r\n		Sumary: zsdgdfhfcghcfgh<br>\r\n		Content: ', '2019-06-30 13:30:27', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 06:30:27', '2019-06-30 06:30:27', NULL, NULL, NULL),
(25, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 1<br>\r\n			Old Title: Hội thi MIT thành công tốt đẹp<br>\r\n			Old sumary: Hội thi MIT thành công tốt đẹp<br>\r\n			Old content: <p><strong>Hội thi MIT th&agrave;nh c&ocirc;ng tốt đẹp</strong></p>', 'New type_id: 1<br>\r\n			New Title: Hội thi MIT thành công tốt đẹp<br>\r\n			New sumary: Hội thi MIT thành công tốt đẹp<br>\r\n			New content: ', '2019-06-30 13:31:42', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/1.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 06:31:42', '2019-06-30 06:31:42', NULL, NULL, NULL),
(26, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 1<br>\r\n			Old Title: Layout - OrgChart JS | BALKANGraph<br>\r\n			Old sumary: zsdgdfhfcghcfgh<br>\r\n			Old content: <p>dfgdfgdfgfdg</p>', 'New type_id: 1<br>\r\n			New Title: Layout - OrgChart JS | BALKANGraph<br>\r\n			New sumary: zsdgdfhfcghcfgh<br>\r\n			New content: ', '2019-06-30 14:33:46', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/4.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 07:33:46', '2019-06-30 07:33:46', NULL, NULL, NULL),
(27, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 1<br>\r\n			Old Title: Layout - OrgChart JS | BALKANGraph<br>\r\n			Old sumary: zsdgdfhfcghcfgh<br>\r\n			Old content: <p>dfgdfgdfgfdg</p>', 'New type_id: 1<br>\r\n			New Title: Layout - OrgChart JS | BALKANGraph<br>\r\n			New sumary: zsdgdfhfcghcfgh<br>\r\n			New content: ', '2019-06-30 14:36:56', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/4.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 07:36:56', '2019-06-30 07:36:56', NULL, NULL, NULL),
(28, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 1<br>\r\n			Old Title: Ngày hội mở<br>\r\n			Old sumary: Ngày mở 2019<br>\r\n			Old content: <p>sfdhghfdghdgfhdfghfdghdfghdfghdfgh</p>', 'New type_id: 1<br>\r\n			New Title: Ngày hội mở<br>\r\n			New sumary: Ngày mở 2019<br>\r\n			New content: ', '2019-06-30 14:44:53', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/3.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-06-30 07:44:53', '2019-06-30 07:44:53', NULL, NULL, NULL),
(29, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', 'Ngày bắt đầu: 21/06/2019<br>Ngày kết thúc: 23/06/2019<br>', 'Ngày bắt đầu: 01/07/2019<br>Ngày kết thúc: 04/07/2019<br>', '2019-07-01 13:34:47', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/3-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-01 06:34:47', '2019-07-01 06:34:47', NULL, NULL, NULL),
(30, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', 'Ngày bắt đầu: 01/06/2019<br>Ngày kết thúc: 02/06/2019<br>', 'Ngày bắt đầu: 02/06/2019<br>Ngày kết thúc: 03/06/2019<br>', '2019-07-01 13:35:04', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/7-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-01 06:35:04', '2019-07-01 06:35:04', NULL, NULL, NULL),
(31, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm loại tin', ' ', 'Type: Hoạt động nổi bật<br>', '2019-07-01 13:48:53', 'http://localhost:8080/DoanHoiIT/public/admin/news/type/addType.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-01 06:48:53', '2019-07-01 06:48:53', NULL, NULL, NULL),
(32, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm loại tin', ' ', 'Type: Gương sinh viên 5 tốt<br>', '2019-07-01 13:49:10', 'http://localhost:8080/DoanHoiIT/public/admin/news/type/addType.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-01 06:49:10', '2019-07-01 06:49:10', NULL, NULL, NULL),
(33, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm loại tin', ' ', 'Type: Hoạt động cơ sở<br>', '2019-07-01 13:51:32', 'http://localhost:8080/DoanHoiIT/public/admin/news/type/addType.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-01 06:51:32', '2019-07-01 06:51:32', NULL, NULL, NULL),
(34, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 1<br>\r\n			Old Title: Layout - OrgChart JS | BALKANGraph<br>\r\n			Old sumary: zsdgdfhfcghcfgh<br>\r\n			Old content: <p>dfgdfgdfgfdg</p>', 'New type_id: 1<br>\r\n			New Title: Layout - OrgChart JS | BALKANGraph<br>\r\n			New sumary: zsdgdfhfcghcfgh<br>\r\n			New content: ', '2019-07-02 13:41:23', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/4.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-02 06:41:23', '2019-07-02 06:41:23', NULL, NULL, NULL),
(35, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm chương trình', '', 'Tên Chương trình: Mùa Hè Xanh<br>Sinh viên đứng chính: 15110347<br>Thời gian bắt đầu: 07/07/2019<br>Thời gian kết thúc: 13/07/2019<br>', '2019-07-07 05:23:14', 'http://localhost:8080/DoanHoiIT/public/admin/activities/add.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 22:23:14', '2019-07-06 22:23:14', NULL, NULL, NULL),
(36, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 3<br>\r\n		Title: Sinh viên 5 tốt<br>\r\n		Sumary: Blabla<br>\r\n		Content: ', '2019-07-07 05:42:02', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 22:42:02', '2019-07-06 22:42:02', NULL, NULL, NULL),
(37, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 3<br>\r\n			Old Title: Sinh viên 5 tốt<br>\r\n			Old sumary: Blabla<br>\r\n			Old content: <p><strong>dfdfsdfsdf</strong></p>', 'New type_id: 3<br>\r\n			New Title: Sinh viên 5 tốt<br>\r\n			New sumary: Blabla<br>\r\n			New content: ', '2019-07-07 05:46:01', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/5.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 22:46:01', '2019-07-06 22:46:01', NULL, NULL, NULL),
(38, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 3<br>\r\n			Old Title: Sinh viên 5 tốt<br>\r\n			Old sumary: Blabla<br>\r\n			Old content: <p><strong>dfdfsdfsdf</strong></p>', 'New type_id: 3<br>\r\n			New Title: Sinh viên 5 tốt<br>\r\n			New sumary: Blabla<br>\r\n			New content: ', '2019-07-07 05:47:00', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/5.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 22:47:00', '2019-07-06 22:47:00', NULL, NULL, NULL),
(39, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm chương trình', '', 'Tên Chương trình: CT TEST<br>Sinh viên đứng chính: 15110237<br>Thời gian bắt đầu: 08/07/2019<br>Thời gian kết thúc: 12/07/2019<br>', '2019-07-07 05:50:36', 'http://localhost:8080/DoanHoiIT/public/admin/activities/add.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 22:50:36', '2019-07-06 22:50:36', NULL, NULL, NULL),
(40, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-07-07 06:06:33', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/10-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 23:06:33', '2019-07-06 23:06:33', NULL, NULL, NULL),
(41, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-07-07 06:17:52', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/10-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 23:17:52', '2019-07-06 23:17:52', NULL, NULL, NULL),
(42, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-07-07 06:22:34', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/10-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 23:22:34', '2019-07-06 23:22:34', NULL, NULL, NULL),
(43, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-07-07 06:22:49', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/10-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 23:22:49', '2019-07-06 23:22:49', NULL, NULL, NULL),
(44, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa chương trình', '', '', '2019-07-07 06:23:15', 'http://localhost:8080/DoanHoiIT/public/admin/activities/edit/10-activity.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-06 23:23:15', '2019-07-06 23:23:15', NULL, NULL, NULL),
(45, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 2<br>\r\n		Title: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n		Sumary: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n		Content: ', '2019-07-07 08:52:28', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-07 01:52:28', '2019-07-07 01:52:28', NULL, NULL, NULL),
(46, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Thêm bài viết', '', 'Type id: 4<br>\r\n		Title: Chào mừng<br>\r\n		Sumary: Hello<br>\r\n		Content: ', '2019-07-07 08:55:11', 'http://localhost:8080/DoanHoiIT/public/admin/news/addNew.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-07 01:55:11', '2019-07-07 01:55:11', NULL, NULL, NULL),
(47, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 2<br>\r\n			Old Title: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n			Old sumary: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n			Old content: <p><span style=\"color:#27ae60;\"><strong>Ch&agrave;o mừng 11 năm th&agrave;nh lập khoa c&ocirc;ng nghệ th&ocirc;ng tin.</strong></span></p>', 'New type_id: 2<br>\r\n			New Title: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n			New sumary: Chào mừng 11 năm thành lập khoa công nghệ thông tin nef<br>\r\n			New content: ', '2019-07-07 09:07:29', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/6.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-07 02:07:29', '2019-07-07 02:07:29', NULL, NULL, NULL),
(48, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa bài viết', 'Old type_id: 2<br>\r\n			Old Title: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n			Old sumary: Chào mừng 11 năm thành lập khoa công nghệ thông tin nef<br>\r\n			Old content: <p><span style=\"color:#27ae60;\"><strong>Ch&agrave;o mừng 11 năm th&agrave;nh lập khoa c&ocirc;ng nghệ th&ocirc;ng tin.</strong></span></p>', 'New type_id: 2<br>\r\n			New Title: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n			New sumary: Chào mừng 11 năm thành lập khoa công nghệ thông tin<br>\r\n			New content: ', '2019-07-07 09:08:57', 'http://localhost:8080/DoanHoiIT/public/admin/news/edit/6.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-07 02:08:57', '2019-07-07 02:08:57', NULL, NULL, NULL),
(49, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa loại tin', 'Old Type: Thông tin đoàn hội', 'New Type: Thông tin đoàn hội nè<br>', '2019-07-07 09:21:32', 'http://localhost:8080/DoanHoiIT/public/admin/news/type/saveType.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-07 02:21:32', '2019-07-07 02:21:32', NULL, NULL, NULL),
(50, '15110237', 'Dương Tuấn Kiệt', 'Admin', 'Chỉnh sửa loại tin', 'Old Type: Thông tin đoàn hội nè', 'New Type: Thông tin đoàn hội<br>', '2019-07-07 09:21:42', 'http://localhost:8080/DoanHoiIT/public/admin/news/type/saveType.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3829.0 Safari/537.36 Edg/77.0.197.1', '2019-07-07 02:21:42', '2019-07-07 02:21:42', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2019_03_08_170435_create_roles_table', 1),
(7, '2019_03_08_170509_create_users_table', 1),
(8, '2019_03_08_170543_create_password_resets_table', 1),
(9, '2019_03_08_170705_create_classes_table', 1),
(10, '2019_03_08_170735_create_shool_years_table', 1),
(11, '2019_03_08_170859_create_activities_table', 1),
(12, '2019_03_08_170930_create_workflows_table', 1),
(13, '2019_03_08_171037_create_activity_funds_table', 1),
(14, '2019_03_08_171124_create_provinces_table', 1),
(15, '2019_03_08_171144_create_districts_table', 1),
(16, '2019_03_08_171309_create_activity_fund_details_table', 1),
(17, '2019_03_08_171335_create_attenders_table', 1),
(18, '2019_03_08_171406_create_checkin_table', 1),
(19, '2019_03_08_171510_create_practise_marks_table', 1),
(20, '2019_03_08_171534_create_social_marks_table', 1),
(21, '2019_03_08_171649_create_yearly_funds_table', 1),
(22, '2019_03_08_171712_create_news_types_table', 1),
(23, '2019_03_08_171724_create_news_table', 1),
(24, '2019_03_08_171748_create_union_fees_table', 1),
(25, '2019_03_08_171839_create_wards_table', 1),
(26, '2019_03_09_064015_create_students_table', 1),
(27, '2019_03_09_133158_create_user_roles_table', 1),
(28, '2019_03_11_132555_create_notifications_table', 2),
(29, '2019_03_12_131821_create_course_table', 3),
(31, '2019_04_09_140841_create_exec_comm_table', 4),
(32, '2019_04_13_134721_create_association_ec_table', 5),
(33, '2019_04_13_140223_create_collaborators_table', 6),
(35, '2019_04_14_081243_create_table_logs', 7),
(36, '2019_06_29_061937_alter_users_table', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `sumary` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `sumary`, `content`, `title`, `image`, `type_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 'Cuộc thi Học thuật Mastering IT 2019 là một trong những sân chơi vô cùng bổ ích và thú vị dành cho các bạn sinh viên có niềm đam mê và yêu thích trong lĩnh vực Công nghệ, không chỉ dành riêng cho sinh viên Khoa Công Nghệ Thông Tin, mà còn cho tất cả sinh viên trường ĐH Sư Phạm Kỹ Thuật TP HCM.', '<p><strong>&nbsp;&nbsp;Cuộc thi Học thuật Mastering IT 2019 l&agrave; một trong những s&acirc;n chơi v&ocirc; c&ugrave;ng bổ &iacute;ch v&agrave; th&uacute; vị d&agrave;nh cho c&aacute;c bạn sinh vi&ecirc;n c&oacute; niềm đam m&ecirc; v&agrave; y&ecirc;u th&iacute;ch trong lĩnh vực C&ocirc;ng nghệ, kh&ocirc;ng chỉ d&agrave;nh ri&ecirc;ng cho sinh vi&ecirc;n Khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin, m&agrave; c&ograve;n cho tất cả sinh vi&ecirc;n trường ĐH Sư Phạm Kỹ Thuật TP HCM.</strong></p>\r\n\r\n<figure><img alt=\"\" height=\"280\" src=\"https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.15752-0/p280x280/59851906_290876985193574_5731450933854863360_n.png?_nc_cat=111&amp;_nc_ht=scontent.fsgn3-1.fna&amp;oh=c3e4f763053407aa33edc695b5f8be44&amp;oe=5D66E922\" width=\"498\" />\r\n<figcaption>Mastering IT 2019</figcaption>\r\n</figure>\r\n\r\n<p>Với mong muốn tạo điều kiện cho c&aacute;c bạn sinh vi&ecirc;n ph&aacute;t huy khả năng tư duy v&agrave; kiến thức về C&ocirc;ng nghệ, tăng khả năng l&agrave;m việc nh&oacute;m v&agrave; bản lĩnh tự tin, Mastering IT 2019 đ&atilde; được tổ chức diễn ra với 2 v&ograve;ng thi:&nbsp;<em>V&ograve;ng Sơ loại</em>&nbsp;v&agrave;&nbsp;<em>V&ograve;ng Chung kết</em>&nbsp;với giải thưởng v&ocirc; c&ugrave;ng hấp dẫn.</p>\r\n\r\n<p><strong>Mastering IT</strong>&nbsp;l&agrave; cuộc thi thường ni&ecirc;n với quy m&ocirc; lớn của khoa C&ocirc;ng nghệ Th&ocirc;ng tin. Năm nay, đồng h&agrave;nh xuy&ecirc;n suốt chương tr&igrave;nh, kh&ocirc;ng thể kh&ocirc;ng kể đến 2 nh&agrave; t&agrave;i trợ ch&iacute;nh l&agrave;&nbsp;<em><strong>FPT Sofware</strong></em>&nbsp;v&agrave;&nbsp;<strong><em>Fujinet Systems SJC</em></strong>, đ&atilde; g&oacute;p phần quan trọng tạo n&ecirc;n sự th&agrave;nh c&ocirc;ng của chương tr&igrave;nh.</p>\r\n\r\n<figure><img alt=\"\" height=\"280\" src=\"https://scontent.fsgn4-1.fna.fbcdn.net/v/t1.15752-0/p280x280/59632152_442460659659888_7303559730427854848_n.jpg?_nc_cat=101&amp;_nc_ht=scontent.fsgn4-1.fna&amp;oh=39d740b97a7aa4f406bf97d832aa2491&amp;oe=5D777E7B\" width=\"420\" />\r\n<figcaption>V&ograve;ng Sơ loại MIT</figcaption>\r\n</figure>\r\n\r\n<p><em>&nbsp; &nbsp; &nbsp;V&ograve;ng Sơ loại</em>&nbsp;kịch t&iacute;nh vừa diễn ra v&agrave;o ng&agrave;y 6/5/2019 vừa qua, đ&atilde; chọn được 4 đội Kh&ocirc;ng Chuy&ecirc;n v&agrave; 4 đội Chuy&ecirc;n xứng đ&aacute;ng để bước tiếp v&agrave;o&nbsp;<em>V&ograve;ng Chung kết</em>, sẽ được diễn ra v&agrave;o ng&agrave;y 12/5/2019 tại Hội trường lớn khu A trường ĐH Sư Phạm Kỹ Thuật TP HCM.</p>\r\n\r\n<figure><img alt=\"\" height=\"280\" src=\"https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.15752-0/p280x280/59566800_325739818116728_9120186061748699136_n.jpg?_nc_cat=107&amp;_nc_ht=scontent.fsgn3-1.fna&amp;oh=9a521180baa8e8b776224d3ba1c84848&amp;oe=5D5C8661\" width=\"420\" />\r\n<figcaption>V&ograve;ng Sơ loại MIT 2019</figcaption>\r\n</figure>\r\n\r\n<p>C&oacute; thể thấy, trong suốt 45 ph&uacute;t thi&nbsp;<em>v&ograve;ng Sơ loại</em>, với h&igrave;nh thức l&agrave;m trắc nghiệm trực tuyến, tự m&igrave;nh đối mặt với đề thi v&agrave; m&aacute;y t&iacute;nh, c&aacute;c bạn đ&atilde; chứng tỏ được sự tự tin v&agrave; vốn hiểu biết trong kh&ocirc;ng chỉ lĩnh vực học thuật, m&agrave; c&ograve;n cả trong thực tế của nền C&ocirc;ng nghệ hiện nay.</p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp;H&atilde;y c&ugrave;ng Khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin theo d&otilde;i V&ograve;ng Chung kết, hứa hẹn sẽ mang đến những cung bậc cảm x&uacute;c v&ocirc; c&ugrave;ng kịch t&iacute;nh v&agrave; b&ugrave;ng nổ, chắc chắn sẽ kh&ocirc;ng l&agrave;m bạn thất vọng!</strong></p>', 'CUỘC THI HỌC THUẬT MASTERING IT 2019', 'Cmz1_59851906_290876985193574_5731450933854863360_n.png', 1, '2019-06-29 23:19:59', '2019-07-11 02:26:25', 187, 187, NULL),
(2, 'Chào đón tân sinh viên', '<p><a data-caption=\"\" href=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293.jpg\"><img alt=\"\" height=\"464\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293-696x464.jpg\" srcset=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293-696x464.jpg 696w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293-768x512.jpg 768w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293-1024x683.jpg 1024w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293-1068x712.jpg 1068w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9293-630x420.jpg 630w\" title=\"IMG_9293\" width=\"696\" /></a></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;<em><strong>&nbsp;Sau 1 th&aacute;ng tuyển qu&acirc;n v&agrave; chuẩn bị, v&agrave;o ng&agrave;y 4, th&aacute;ng 7, năm 2019, tại hội trường lớn khu A, trường ĐH SPKT TP HCM, c&aacute;c chiến sĩ M&ugrave;a h&egrave; xanh năm 2019 đ&atilde; ch&iacute;nh thức ra qu&acirc;n.</strong></em></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; Buổi lễ đ&atilde; được diễn ra với sự g&oacute;p mặt của 2 nh&agrave; t&agrave;i trợ lớn BIDV v&agrave; SOUNDMAX, Th&agrave;nh Đo&agrave;n TP HCM, thầy Đỗ Văn Dũng &ndash; hiệu trưởng trường ĐH SPKT, đ/c L&ecirc; Xu&acirc;n Th&acirc;n &ndash; chỉ huy trưởng chiến dịch MHX năm 2019, ban chỉ huy chiến dịch c&ugrave;ng với hơn 300 chiến sĩ t&igrave;nh nguyện v&agrave; đặc biệt hơn hết, đ&oacute; ch&iacute;nh l&agrave; đại sứ chiến dịch M&ugrave;a h&egrave; xanh trường ĐH SPKT &ndash; hoa hậu Trần Tiểu Vy.</p>\r\n\r\n<p><img alt=\"Thầy Đỗ Văn Dũng và hoa hậu Trần Tiểu Vy\" height=\"464\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9411-1024x683.jpg\" srcset=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9411-1024x683.jpg 1024w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9411-768x512.jpg 768w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9411-696x464.jpg 696w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9411-1068x712.jpg 1068w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9411-630x420.jpg 630w\" width=\"696\" /></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; Mở đầu buổi lễ l&agrave; c&aacute;c tiết mục văn nghệ đặc sắc đến từ đội Văn nghệ thanh ni&ecirc;n xung k&iacute;ch, một phần đ&atilde; tiếp th&ecirc;m năng lượng cho c&aacute;c bạn chiến sĩ về mặt tinh thần để khởi h&agrave;nh tới c&aacute;c mặt trận tr&ecirc;n mọi miền Đất nước. Đến với buổi lễ, đ/c L&ecirc; Xu&acirc;n Th&acirc;n đ&atilde; đọc ph&aacute;t biểu khai mạc, khẳng định lại mục ti&ecirc;u của chiến dịch v&agrave; đưa ra những lời khuy&ecirc;n cho c&aacute;c bạn chiến sĩ.</p>\r\n\r\n<figure aria-describedby=\"caption-attachment-5666\" id=\"attachment_5666\"><img alt=\"CLB Văn nghệ\" height=\"464\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9335-1024x683.jpg\" srcset=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9335-1024x683.jpg 1024w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9335-768x512.jpg 768w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9335-696x464.jpg 696w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9335-1068x712.jpg 1068w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9335-630x420.jpg 630w\" width=\"696\" />\r\n<figcaption id=\"caption-attachment-5666\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; CLB Văn nghệ xung k&iacute;ch</figcaption>\r\n</figure>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; Tiếp sau đ&oacute; l&agrave; phần chia sẻ của thầy Đỗ Văn Dũng, thầy đ&atilde; gi&uacute;p c&aacute;c bạn hiểu hơn về cuộc sống của c&aacute;c v&ugrave;ng ngh&egrave;o kh&oacute;, tiếp th&ecirc;m sự thấu hiểu v&agrave; đồng cảm cho c&aacute;c bạn sinh vi&ecirc;n đối với người d&acirc;n ngh&egrave;o ở c&aacute;c v&ugrave;ng kh&oacute; khăn xa x&ocirc;i.</p>\r\n\r\n<figure aria-describedby=\"caption-attachment-5668\" id=\"attachment_5668\"><img alt=\"Thầy Đỗ Văn Dũng đang phát biểu\" height=\"464\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9361-1024x683.jpg\" srcset=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9361-1024x683.jpg 1024w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9361-768x512.jpg 768w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9361-696x464.jpg 696w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9361-1068x712.jpg 1068w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9361-630x420.jpg 630w\" width=\"696\" />\r\n<figcaption id=\"caption-attachment-5668\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Thầy Đỗ Văn Dũng ph&aacute;t biểu chỉ đạo trước khi c&aacute;c chiến sĩ l&ecirc;n đường</figcaption>\r\n</figure>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; Tiếp theo của buổi lễ, bạn B&ugrave;i Minh Nhật đ&atilde; thay mặt hơn 300 bạn chiến sĩ đọc lời hứa l&ecirc;n d&acirc;y c&oacute;t tinh thần để l&ecirc;n đường thực hiện nhiệm vụ. B&ecirc;n cạnh đ&oacute;, Hoa hậu Việt Nam 2018 &ndash; Trần Tiểu Vy cũng chia sẻ th&ecirc;m, &ldquo;Vy cảm nhận được cuộc sống c&oacute; rất nhiều &yacute; nghĩa khi tham gia chiến dịch t&igrave;nh nguyện M&ugrave;a h&egrave; xanh, bởi v&igrave; đ&acirc;y l&agrave; một chiến dịch đầy nh&acirc;n văn v&agrave; t&igrave;nh người.&rdquo;.</p>\r\n\r\n<figure aria-describedby=\"caption-attachment-5669\" id=\"attachment_5669\"><img alt=\"Bạn Bùi Minh Nhật\" height=\"619\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9372-683x1024.jpg\" width=\"414\" />\r\n<figcaption id=\"caption-attachment-5669\">&nbsp; &nbsp; Chiến sĩ B&ugrave;i Minh Nhật đại diện hơn 300 ph&aacute;t biểu tuy&ecirc;n thệ&nbsp;</figcaption>\r\n</figure>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; Chiến dịch MHX năm nay c&oacute; nhiều t&agrave;i trợ lớn gi&uacute;p đỡ v&agrave; đ&oacute;ng g&oacute;p để chiến dịch được trọn vẹn, biết được điều đ&oacute;, nh&agrave; trường đ&atilde; trao tặng c&aacute;c phần qu&agrave; &yacute; nghĩa để tỏ l&ograve;ng biết ơn đến c&aacute;c nh&agrave; t&agrave;i trợ.</p>\r\n\r\n<figure aria-describedby=\"caption-attachment-5673\" id=\"attachment_5673\"><img alt=\"Trưởng chiến dịch trao thư cảm ơn cho nhà tài trợ\" height=\"464\" sizes=\"(max-width: 696px) 100vw, 696px\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9388-1-1024x683.jpg\" srcset=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9388-1-1024x683.jpg 1024w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9388-1-768x512.jpg 768w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9388-1-696x464.jpg 696w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9388-1-1068x712.jpg 1068w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9388-1-630x420.jpg 630w\" width=\"696\" />\r\n<figcaption id=\"caption-attachment-5673\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Chỉ huy trưởng chiến dịch trao thư cảm ơn cho nh&agrave; t&agrave;i trợ</figcaption>\r\n</figure>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; Kh&eacute;p lại buổi lễ l&agrave; phần trao tặng hoa cho c&aacute;c chỉ huy trưởng của c&aacute;c mặt trận v&agrave; phất l&aacute; cờ l&agrave; biểu tượng của chiến dịch t&igrave;nh nguyện M&ugrave;a h&egrave; xanh, b&aacute;o hiệu chiến dịch ch&iacute;nh thức bắt đầu.</p>\r\n\r\n<figure aria-describedby=\"caption-attachment-5671\" id=\"attachment_5671\"><img alt=\"Lá cờ của chiến dịch Mùa hè xanh đã được phất lên\" height=\"548\" sizes=\"(max-width: 821px) 100vw, 821px\" src=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9409.jpg\" srcset=\"https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9409.jpg 821w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9409-768x513.jpg 768w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9409-696x465.jpg 696w, https://tuoitre.hcmute.edu.vn/wp-content/uploads/2019/07/img_9409-629x420.jpg 629w\" width=\"821\" />\r\n<figcaption id=\"caption-attachment-5671\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; L&aacute; cờ của chiến dịch M&ugrave;a h&egrave; xanh đ&atilde; được phất l&ecirc;n</figcaption>\r\n</figure>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; V&agrave; cũng trong ng&agrave;y h&ocirc;m nay, c&aacute;c bạn chiến sĩ tại mặt trận Nh&agrave; B&egrave; đ&atilde; l&ecirc;n xe để thực hiện nhiệm vụ đầu ti&ecirc;n của m&ugrave;a h&egrave; năm&nbsp;2019.</p>', 'LỄ RA QUÂN CHIẾN DỊCH TÌNH NGUYỆN MÙA HÈ XANH', 'soXe_faculty_banner.png', 1, '2019-06-29 23:22:34', '2019-07-11 02:27:33', 187, 187, NULL),
(3, 'Thông tin về cuộc thi Location Tech Hackathon 2018', '<p>Th&ocirc;ng tin cuộc thi Hackathon phối hợp c&ugrave;ng với HERE.com</p>\r\n\r\n<p>Link th&ocirc;ng tin cuộc thi:&nbsp;<a data-saferedirecturl=\"https://www.google.com/url?q=http://shtpic.org/locationhackathon2018/&amp;source=gmail&amp;ust=1541080832470000&amp;usg=AFQjCNFplWWnYhqdmOEFfZWK4JrNNmTrOQ\" href=\"http://shtpic.org/locationhackathon2018/\" rel=\"noreferrer\" target=\"_blank\">Hackathon Information Page</a></p>\r\n\r\n<p>Link facebook về cuộc thi:&nbsp;<a data-saferedirecturl=\"https://www.google.com/url?q=https://www.facebook.com/events/468239786998329&amp;source=gmail&amp;ust=1541080832470000&amp;usg=AFQjCNHVK447ZCMglClCG3v4OLmlWiJ0tg\" href=\"https://www.facebook.com/events/468239786998329\" rel=\"noreferrer\" target=\"_blank\">Hackathon Facebook page</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>H&igrave;nh ảnh sự kiện đ&iacute;nh k&egrave;m file.<br />\r\n<img alt=\"\" src=\"http://fit.hcmute.edu.vn/Resources/Images/SubDomain/fit/20182019/HKI/HACKTHON.jpg\" /></p>', 'Thông tin về cuộc thi Location Tech Hackathon 2018', 'nklo_HACKTHON.jpg', 5, '2019-06-29 23:24:32', '2019-07-11 02:34:08', 187, 187, NULL),
(4, 'Vào 02 ngày 23 & 24/11/2018, Trường Đại học Sư phạm Kỹ thuật Tp.HCM (ĐHSPKT TPHCM) phối hợp cùng Bộ Giáo dục và Đào tạo tổ chức “Hội thảo quốc tế Công nghệ xanh phát triển bền vững lần thứ 4” năm 2018 tại tầng 6 và tầng 12 Tòa nhà Trung tâm trường ĐH Sư phạm Kỹ thuật Tp. HCM.', '<p><strong><strong>V&agrave;o 02 ng&agrave;y 23 &amp; 24/11/2018, Trường Đại học Sư phạm Kỹ thuật Tp.HCM (ĐHSPKT TPHCM) phối hợp c&ugrave;ng Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo tổ chức &ldquo;Hội thảo quốc tế C&ocirc;ng nghệ xanh ph&aacute;t triển bền vững lần thứ 4&rdquo; năm 2018 tại tầng 6 v&agrave; tầng 12 T&ograve;a nh&agrave; Trung t&acirc;m trường ĐH Sư phạm Kỹ thuật Tp. HCM.</strong><br />\r\n<br />\r\nVề tham dự buổi lễ, c&oacute; sự hiện diện của PGS.TS Ng&ocirc; Văn Thuy&ecirc;n, Chủ tịch hội đồng trường, trường ĐHSPKTTPHCM; PGS.TS L&ecirc; Hiếu Giang, Ph&oacute; Hiệu Trưởng trường ĐHSPKT TPHCM;&nbsp; GS. TS. Yo-Ping Huang, NTUT, Đ&agrave;i Loan v&agrave; c&aacute;c đại biểu l&agrave; t&aacute;c giả b&agrave;i viết.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H1.JPG\" /></strong></p>\r\n\r\n<p><strong><em>Hội nghị thu h&uacute;t đ&ocirc;ng đảo c&aacute;c học giả, nh&agrave; nghi&ecirc;n cứu, nh&agrave; khoa học,&hellip;</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Về ph&iacute;a kh&aacute;ch mời danh dự c&oacute; c&aacute;c vị đại biểu: TS. K.Srikar Reddy, Tổng l&atilde;nh Sự qu&aacute;n Ấn Độ tại TPHCM, Việt Nam; TS. Trần Nam T&uacute;, đại diện Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo; GS.TS Yan-Kuin Su, Nguy&ecirc;n Hiệu trưởng trường đại học Kun Shan, Đ&agrave;i Loan; GS.TS Chang &ndash;Ren Chen, Trường đại học Kun Shan, Đ&agrave;i Loan; GS. TS Kai &ndash; Yew Lum, Đại học Quốc gia Chi nan, Đ&agrave;i Loan; Mr. Andreas Wade, Gi&aacute;m đốc ph&aacute;t triển bền vững to&agrave;n cầu, First Solar; PGS.TS Jau Huai Lu, Đại học quốc gia Chung Hsing Đ&agrave;i Loan; &Ocirc;ng Cao Ph&uacute; Hải, Gi&aacute;m đốc sản xuất c&ocirc;ng ty ABB, Việt Nam; c&ugrave;ng c&aacute;c đại biểu đến từ Đ&agrave;i Loan, Nhật Bản, Trung Quốc, H&agrave;n Quốc, Th&aacute;i Lan, Bangladesh, Kazakhstan, Nga v&agrave; Việt Nam.&nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H2.JPG\" /></strong></p>\r\n\r\n<p><strong><em>Đại diện c&aacute;c trường Đại học từ trong v&agrave; ngo&agrave;i nước tham dự Hội nghị</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Trong hơn mười năm trở lại đ&acirc;y, kh&aacute;i niệm về &ldquo;C&ocirc;ng nghệ xanh&rdquo; v&agrave; &ldquo;Ph&aacute;t triển bền vững&rdquo; đ&atilde; trở n&ecirc;n hết sức được ch&uacute; trọng, nhất l&agrave; khi mối đe dọa về sự thiếu hụt nguồn năng lượng v&agrave; biến đổi kh&iacute; hậu to&agrave;n cầu ng&agrave;y c&agrave;ng trở n&ecirc;n nghi&ecirc;m trọng hơn. Theo đ&oacute;, c&aacute;c &quot;giải ph&aacute;p xanh&quot; trong kinh tế v&agrave; c&ocirc;ng nghệ li&ecirc;n quan đến sự ph&aacute;t triển bền vững đ&atilde; v&agrave; đang trở th&agrave;nh một trong những đề t&agrave;i được quan t&acirc;m nhất hiện nay, đặc biệt l&agrave; ở những nước đang vươn m&igrave;nh ph&aacute;t triển nhanh ch&oacute;ng như Trung Quốc, Ấn Độ, Việt Nam&hellip; &ldquo;Hội thảo quốc tế C&ocirc;ng nghệ xanh ph&aacute;t triển bền vững lần thứ 4&rdquo; đ&atilde; trở th&agrave;nh diễn đ&agrave;n hấp dẫn cho những chuy&ecirc;n gia, nh&agrave; nghi&ecirc;n cứu v&agrave; những người quan t&acirc;m cả trong lẫn ngo&agrave;i nước gặp gỡ v&agrave; chia những kết quả nghi&ecirc;n cứu mới, những giải ph&aacute;p mang t&iacute;nh to&agrave;n cầu nhằm trong lĩnh vực c&ocirc;ng nghệ xanh v&agrave; ph&aacute;t triển bền vững.&nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H3%20(1).JPG\" /></strong></p>\r\n\r\n<p><strong><em>PGS.TS L&ecirc; Hiếu Giang &ndash; Ph&oacute; B&iacute; thư Đảng ủy, Ph&oacute; Hiệu trưởng ĐHSPKT TPHCM&nbsp;<br />\r\nph&aacute;t biểu ch&agrave;o mừng tại Hội thảo</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Đ&acirc;y l&agrave; hội thảo lần thứ 4 nằm trong chuỗi hội thảo quốc tế C&ocirc;ng nghệ Xanh v&agrave; Ph&aacute;t triển bền vững được tổ chức định kỳ hai năm/lần. Đồng tổ chức Hội thảo gồm Trường đại học Sư phạm Kỹ thuật TPHCM, Sở Khoa học v&agrave; C&ocirc;ng nghệ TPHCM, Viện năng lượng mặt trời, Ấn Độ; Trường đại học Kun Shan, Đ&agrave;i Loan.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H4.JPG\" /></strong></p>\r\n\r\n<p><strong><em>TS. Trần Nam T&uacute; - đại diện Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Ph&aacute;t biểu tại Hội nghị, TS. Trần Nam T&uacute;, đại diện Vụ Khoa học, C&ocirc;ng ngh&ecirc; v&agrave; M&ocirc;i trường - Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo, đề cập đến vấn đề về m&ocirc;i trường v&agrave; &ocirc; nhiễm đang c&oacute; những t&aacute;c động xấu đến sự ph&aacute;t triển bền vững của Việt Nam cũng như thế giới. Do đ&oacute;, &ocirc;ng đ&aacute;nh gi&aacute; rất cao về tầm nh&igrave;n v&agrave; vai tr&ograve; của Hội nghị lần n&agrave;y: &ldquo;B&ecirc;n cạnh &yacute; nghĩa khoa học, hội thảo l&agrave; cực kỳ quan trọng trong hội nhập v&agrave; hợp t&aacute;c quốc tế. Hội nghị l&agrave; cơ hội cho c&aacute;c nh&agrave; khoa học Việt Nam v&agrave; quốc tế, c&aacute;c tổ chức học thuật tr&ecirc;n thế giới chia sẻ kiến thức, kinh nghiệm, kết quả nghi&ecirc;n cứu li&ecirc;n quan đến c&ocirc;ng nghệ xanh v&agrave; ph&aacute;t triển bền vững. Đ&acirc;y l&agrave; một đ&oacute;ng g&oacute;p quan trọng cho hoạt động nghi&ecirc;n cứu v&agrave; đ&agrave;o tạo trong gi&aacute;o dục đại học cũng như tham gia ph&aacute;t triển kinh tế - x&atilde; hội, bảo vệ m&ocirc;i trường bền vững&rdquo;. Qua đ&oacute;, &ocirc;ng cũng nhấn mạnh về định hướng chiến lược của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo Việt Nam l&agrave; đẩy nhanh việc chuyển giao kết quả nghi&ecirc;n cứu v&agrave;o sản xuất, trong đ&oacute; c&ocirc;ng nghệ xanh v&agrave; ph&aacute;t triển bền vững l&agrave; một ưu ti&ecirc;n h&agrave;ng đầu: &ldquo;T&ocirc;i hy vọng th&ocirc;ng qua hội thảo n&agrave;y, ch&uacute;ng ta c&oacute; thể tạo ra một sự tiến bộ cho sự hợp t&aacute;c chung về C&ocirc;ng nghệ v&agrave; Gi&aacute;o dục, đặc biệt l&agrave; th&agrave;nh phố Hồ Ch&iacute; Minh v&agrave; c&aacute;c trường đại học kh&aacute;c sẽ tiếp tục duy tr&igrave; tổ chức chuỗi hội thảo n&agrave;y trong tương lai.&rdquo;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H5%20(1).JPG\" /></strong></p>\r\n\r\n<p><strong><em>GS.TS Yan-Kuin Su, Nguy&ecirc;n Hiệu trưởng trường đại học Kun Shan, Đ&agrave;i Loan ph&aacute;t biểu</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Hội thảo đ&atilde; thu h&uacute;t hơn 250 b&agrave;i b&aacute;o l&agrave; kết quả nghi&ecirc;n cứu từ c&aacute;c nh&agrave; khoa học, học giả. Sau qu&aacute; tr&igrave;nh phản biện, hội thảo c&ograve;n 162 b&agrave;i viết được mời b&aacute;o c&aacute;o, chia sẻ tại 11 ph&acirc;n ban trong hội nghị.&nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H6.JPG\" /></strong></p>\r\n\r\n<p><strong><em><img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H6a.JPG\" /><br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H6c.JPG\" /><br />\r\nC&aacute;c nh&agrave; khoa học, diễn giả tr&igrave;nh b&agrave;y v&agrave; thảo luận tại Hội nghị</em></strong></p>\r\n\r\n<p><br />\r\n<strong>Nội dung Hội thảo xoay quanh c&aacute;c vấn đề: Năng lượng t&aacute;i tạo, Kỹ thuật Điện-Điện tử, Kỹ thuật d&acirc;n dụng, Tự động h&oacute;a, Hệ thống th&ocirc;ng tin, khoa học ứng dụng, C&ocirc;ng nghệ nhiệt, Ph&aacute;t triển nền kinh tế, gi&aacute;o dục bền vững, C&ocirc;ng nghệ h&oacute;a v&agrave; m&ocirc;i trường, C&ocirc;ng nghệ Kỹ thuật cơ kh&iacute;.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://hcmute.edu.vn/Resources/Images/SubDomain/HomePage/tin%20tuc/Nam%202018/Thang%2011-2018/Cong%20nghe%20xanh/H7.JPG\" /></strong></p>\r\n\r\n<p><strong><em>C&aacute;c đại biểu chụp ảnh lưu niệm tại lễ khai mạc Hội thảo</em></strong></p>', 'TIN TỨC - SỰ KIỆN “Hội thảo quốc tế Công nghệ xanh phát triển bền vững lần thứ 4” năm 2018', '3zvl_H6a.jpg', 2, '2019-06-29 23:30:27', '2019-07-11 02:33:23', 187, 187, NULL),
(5, NULL, '<p>HD Bank tuyển dụng thực tập</p>\r\n\r\n<p>Nh&acirc;n vi&ecirc;n thực tập kiểm thử ứng dụng &ndash; P. NHĐT<br />\r\nM&ocirc; Tả C&ocirc;ng Việc<br />\r\n&bull; Kiểm thử ứng dụng phần mềm thuộc c&aacute;c dự &aacute;n mBanking, iBanking v&agrave; dự &aacute;n Digital Banking của ng&acirc;n h&agrave;ng.&nbsp;<br />\r\n&bull; T&igrave;m hiểu c&aacute;c sản phẩm, quy tr&igrave;nh nghiệp vụ của Ng&acirc;n h&agrave;ng.<br />\r\n&bull; T&igrave;m hiểu c&aacute;c ứng dụng của Ng&acirc;n h&agrave;ng.<br />\r\n&bull; Tham gia viết kịch bản kiểm thử, lập kế hoạch kiểm thử cho c&aacute;c sản phẩm, ứng dụng.</p>\r\n\r\n<p>Y&ecirc;u Cầu C&ocirc;ng Việc<br />\r\n&bull; Sinh vi&ecirc;n năm cuối chuy&ecirc;n ng&agrave;nh C&ocirc;ng nghệ Th&ocirc;ng tin.<br />\r\n&bull; C&oacute; kiến thức về: kiểm thử, cơ cở dữ liệu, lập tr&igrave;nh.<br />\r\n&bull; Kỹ năng l&agrave;m việc nh&oacute;m tốt.<br />\r\n&bull; Cẩn thận, tỉ mỉ, c&oacute; tr&aacute;ch nhiệm với c&ocirc;ng việc, khả năng chịu được &aacute;p lực c&ocirc;ng việc cao.<br />\r\n&bull; Đọc, hiểu tiếng Anh chuy&ecirc;n ng&agrave;nh.<br />\r\n&bull; Ưu ti&ecirc;n sinh vi&ecirc;n c&oacute; tham gia c&aacute;c kh&oacute;a kiểm thử phần mềm.<br />\r\n&bull; Lương: 2,000,000VND/người/th&aacute;ng.</p>\r\n\r\n<p>Li&ecirc;n hệ nộp hồ sơ:</p>\r\n\r\n<p>TRẦN THỊ TỐ T&Acirc;M | Trưởng Bộ phận - Ph&ograve;ng Tuyển dụng | Khối Nh&acirc;n sự</p>\r\n\r\n<p>E: tamttt3@hdbank.com.vn</p>\r\n\r\n<p>M: 0944 05 11 83</p>\r\n\r\n<p>W:&nbsp;<a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.hdbank.com.vn%2F%3Ffbclid%3DIwAR0MnmPfVKYdPr2fakZabviimd1VUU0DcKgXr1Iio9lywrRXCnvv46wtvao&amp;h=AT14LRoRBvc20KoQzDnJbM3Lp-SoyVpjLcn83tXtshyY9g-EqMAewcVdcppcyYPr-ggzCXjq1RMVlFOaSeL0k-YjiXj9BGk4_5rEhxyvkkDMNHWtcBpe4gCSzFvCjD6iWWIhu13ea44zOMhp2zRlI-pi08I5WNt-UNb2jodyukuLGv8MMPocHCQBcZbjwrv2bfHf4Da4VQxv--CrMqh9SrYtK8VY3wEwLc7acbHy04ZduZBEOC07ZyOlNIviywXTvVoXnb7IQDtU3kqExUJwV01NMQ41klfRgiKq06FH75a4CkkttZBGtq81pMZA3haY-AYwCCa7bfjth-Ikz0qggnzyTUAZYP72aZuuMWAXxhZao_qLEMR0vRcjSxXQQG4jYkgu34VM4IVbUCXw30m6G7VgyrIZlIU7g6vN1Jc2bQpm-i_OOZYH52KYY0_Yz2wRDgQIPZlc91YnXf3RyHWhWV8kuC753Z-delg44DsuDPu88BgcHCmDpFoYnvsWlHY_AUUj8aqBdNJSbAdLkIqBxumUmJQt-PY7L1SR1cuhs7-i3NSSptz_g_Vm_D4Gl5Ivzdyj3yTVe89WQCC1fOvMeW9gAzLcoh0o1CijuM4EuYAUp35xh2eA9cOV0zRks2k3WyIVSA\" rel=\"noopener nofollow\" target=\"_blank\">www.hdbank.com.vn</a></p>\r\n\r\n<p>T: +84 8 62 915 916 &ndash; Ext: 1472</p>', 'HD Bank tuyển dụng thực tập', 'Lk5q_Logo.png', 6, '2019-07-06 15:42:02', '2019-07-11 02:37:27', 187, 187, NULL),
(6, NULL, '<p>Khoa CNTT khảo s&aacute;t th&ocirc;ng tin c&aacute;c bạn cựu sinh vi&ecirc;n v&agrave; doanh nghiệp c&aacute;c bạn đang l&agrave;m việc. Rất mong c&aacute;c bạn hỗ trợ l&agrave;m khảo s&aacute;t ngắn trong trong link. Cảm ơn c&aacute;c bạn.<br />\r\nBCN Khoa.<br />\r\nTS. L&ecirc; Văn Vinh.</p>\r\n\r\n<p><a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" data-lynx-uri=\"https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fforms%2Fd%2F1EsiikUYSggRoDZMTKF6FsBnTt6ap0ZSZPMtpwlZd3K4%2Fedit%3Ffbclid%3DIwAR0bg3swLzGMyXaoDfx6QaELSCXKbhKNQRL4aUqqhN63CJsFO6xO8une5-g&amp;h=AT2MpPBcs6oxfUy9QvQOAOUMMjuRW82LkkcJeYULVuLcaXZmyG69ACMIyn65rG3PF0LaoCxsayd-oo26TjEtE-llTuPSkTBDTl-wE2UbuiMI_fyMOqgIy7UgBUFcL95k4CR_487sujW_OKUFHsXhNP417GRHTlMXIa8ImPQhanrpQFDwkRps-ncvEq8X76a13IzP4YQxnaBDE7HejZTWsttWOLcXO7KnVvgwZ3i8ysjFjc4ji2qBKQRzzfFNsv1SqV3d3P9J8k6QO_mlg8sqvNCcl4MwmxpKwuwlZdrqqCKSGpZivCrX4VOV-ngrppbrzy69vxT4AP6jr2df9PL7qlKxPO8tY2FYlygroGvMTqJqJOkyot-NrC5gsX5_rqycLkfUEX5EpM9bK00o7qFpTCVThsE8j2Uy_2rtps8Nuxa_d4oKcJ_QvezXg4nTWAc819wM1gLRRlvyLqCgJX_iQ4e5ScXlIJ_mJiZnT3ae9G75ue2hVSlOGPb79XfFwGVuRZJBVQeCNifcR0kX3WhnpWbf83q2V0Oe2Kb4Tikqdoti4n9DH8pYEjgp1lM4feedtJtSzfM67mbZ_r950G4TbQJ8A1V_7oZtQ0ga1foZlyBvOCGcM3Ipg35zZQoOA2lISppcNQ\" href=\"https://docs.google.com/forms/d/1EsiikUYSggRoDZMTKF6FsBnTt6ap0ZSZPMtpwlZd3K4/edit?fbclid=IwAR0bg3swLzGMyXaoDfx6QaELSCXKbhKNQRL4aUqqhN63CJsFO6xO8une5-g\" rel=\"noopener nofollow\" target=\"_blank\">https://docs.google.com/&hellip;/1EsiikUYSggRoDZMTKF6FsBnTt6a&hellip;/edit</a></p>', 'Khảo sát', 'kgom_faculty_banner.png', 4, '2019-07-06 18:52:28', '2019-07-11 02:35:58', 187, 187, NULL),
(7, NULL, '<p>TH&Ocirc;NG B&Aacute;O V/v: Tuyển dụng Kỹ sư C&ocirc;ng Nghệ Th&ocirc;ng Tin 2019&nbsp;<br />\r\nC&ocirc;ng ty TNHH C&ocirc;ng Nghiệp Nặng Doosan Việt Nam th&ocirc;ng b&aacute;o tuyển dụng nh&acirc;n sự như sau: 1. Vị tr&iacute; tuyển: Kỹ sư IT 2. Số lượng tuyển: 5 Kỹ sư 3. Y&ecirc;u cầu&nbsp;<br />\r\n- Hạn nhận hồ sơ: 17.06.2019, ưu ti&ecirc;n ứng vi&ecirc;n nộp hồ sơ sớm - Sinh vi&ecirc;n thuộc khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin, chuy&ecirc;n ng&agrave;nh li&ecirc;n quan đến C&ocirc;ng Nghệ Th&ocirc;ng Tin&nbsp;<br />\r\nHệ đại học ch&iacute;nh quy - Xếp loại học lực: Kh&aacute; trở l&ecirc;n - Kinh nghiệm: Sinh vi&ecirc;n mới tốt nghiệp, sẽ được đ&agrave;o tạo khi l&agrave;m việc tại C&ocirc;ng ty&nbsp;<br />\r\n- Ưu ti&ecirc;n cho sinh vi&ecirc;n c&oacute; hộ khẩu thường tr&uacute; tại Quảng Ng&atilde;i v&agrave; c&aacute;c tỉnh miền Trung 4. Ph&uacute;c lợi l&agrave;m việc&nbsp;<br />\r\n- L&agrave;m việc từ thứ 2 &ndash; thứ 6, nghỉ thứ 7 v&agrave; chủ nhật - Mức lương hấp dẫn, m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp&nbsp;<br />\r\nThưởng lương th&aacute;ng 13, thưởng th&agrave;nh quả c&ocirc;ng việc v&agrave; c&aacute;c dịp lễ, Tết trong năm - Cơ hội tham gia c&aacute;c chương tr&igrave;nh đ&agrave;o tạo n&acirc;ng cao năng lực trong nước v&agrave; nước ngo&agrave;i (H&agrave;n Quốc)&nbsp;<br />\r\nC&oacute; kỳ nghỉ h&egrave; h&agrave;ng năm (Được hưởng đầy đủ lương) - Hỗ trợ nh&agrave; ở (Căn hộ cho người lập gia đ&igrave;nh/K&yacute; t&uacute;c x&aacute; cho người độc th&acirc;n) - Hỗ trợ xe đưa đ&oacute;n h&agrave;ng ng&agrave;y, ăn uống v&agrave; đồng phục c&ocirc;ng ty&nbsp;<br />\r\n- Kh&aacute;m sức khỏe định kỳ, tham gia bảo hiểm đầy đủ v&agrave; c&aacute;c chế độ kh&aacute;c theo quy định của ph&aacute;p luật. 5. Địa điểm l&agrave;m việc&nbsp;<br />\r\nC&ocirc;ng ty TNHH C&ocirc;ng Nghiệp Nặng Doosan Việt Nam&nbsp;<br />\r\nKhu Kinh tế Dung Quất, X&atilde; B&igrave;nh Thuận, Huyện B&igrave;nh Sơn, Tỉnh Quảng Ng&atilde;i 6. Hồ sơ ứng tuyển bao gồm&nbsp;<br />\r\n- CV theo mẫu Doosan VINA (Tải form CV tại đ&acirc;y:&nbsp;<a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.doosan%2F%3Ffbclid%3DIwAR2uMb0Il8ZPZ1hUFbxivzKYEr7FIOFf60YK21AcDcaRy6MuEYIVVzJW8zg&amp;h=AT2Lz23nEZeQA99V0qtBW4N1ACdnW3LvZRUW64smMHHFLI4xeYpKnEkKE7f-17FxsO6aKI7rtymWUiTs1P78wyNY2_caTKwfxem76U2no_vCEgjrxGwPNRKl9U-2gDMiAzNQkbF4re2GQQs32UDP_GaNU4FJ2pqurYVyQ8KdWpDhDIyMbxYxhRiUAE7HJpEy1QenDOSNJNauTchFmTLzi8TjIXrye_94e-lF414QkSRZtPNKCYX0b5N7C6hVvRMO8LXuiOZYqoLrbMjCcoxMttk9XtIqzzNwb-6fzHkvOCi7jErs1za6jPtEP3Aph81smUT9a2vM05ARcTaPtTGvVDtk6P5jBqoYwi8DrVkh64sG24a5F8F-7EuJKp3PsgTAEfbcBwy-DPbqj6tIagmmH2RMeUwcj2pyC9fLndMjw7mA8mV6nxzeuc_LkE9V-Te0pNUNY3lufG4Ni-VPKRfV1_b47AjgIM3bVfON5af2KHKyqreKonfC0nrPsA4TMobNyV6fBvDijp6MBs4LqevPPAGxns-94bwUXrRys1srYkomwn826Oftnp3FtHbtK4QDHVSxtRD7B3T-4g8qlG4czyjLKaNFjLdpOSAPk166KNdOqmLzoy-YvtTTSsU1yvBx6g-bkw\" rel=\"noopener nofollow\" target=\"_blank\">http://www.doosan</a>&nbsp;<br />\r\n<a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fvina.com%2Fdoosanvina%2Fen%2Fcareers%2Findex.html%3Ffbclid%3DIwAR3NvgvwqRrJcrgfluMyV3gSoiMYfKyjQ-xbpMgwKSSG8bfP6g-qoM2l_sY&amp;h=AT0Q9DdKDgfHuNIji2Ku5f2cWhZQ1h-lxTKGA0w5aMeKAhoKrwCuFi4cbk8p5jcmmIbPXoZVdLS8XSY-IFcce9wrdfazapZdGixt1mjxOPDl0SClHqfmJKk2f4wT7U55c_b_qMHLbsTkUTZUFcZPvUijD_I8GUHD_kmsNLyqq8reT5PlFkVxw7cplm4mNdaJ_P7SOHV8iR9GjXQIREqcAqo-57XnccxOUicmft_YEhzYknmnBBdLm_baVfKzv6L1efe3YLqqbUh5LXXsbB0nWCPKtiynA-DambBDsAE6CX9wLgzAZQca2faINb0CLBvHFzJQQ9-t2PPzONCnkvOv_juHlZFvvO62eHhNanA_UFIimmHRMtXk7wRDmlMZgugTjqcw85kAra8M6mrLKejIkDoMEdxy8e656f1CdZ1OalE96CjIxMDGNeJagaa6R0hTfqU4aJTh2DSbaJP5l3vpolB17UFSRW2umY9w7_fTZ9D2T2tLxXlbT7RH3A3iRIaBZfGWZJbZz9CfyhAWmHnb2yRSNzFNcW0FMg7t99Y26iRa4_3ZEI7lQNYP2rlivnrCxXXvdxi0_FQReDpenFVEYEvMtWkW0ZUwnXzRZKmM61Z7DQlL9-ZH3srLB2FDiUM9cG9hTw\" rel=\"noopener nofollow\" target=\"_blank\">vina.com/doosanvina/en/careers/index.html</a>) - Bảng điểm trong qu&aacute; tr&igrave;nh học tập, bản sao CMND v&agrave; c&aacute;c bằng cấp, chứng chỉ li&ecirc;n quan (Nếu c&oacute;) 7. Nơi nhận hồ sơ&nbsp;<br />\r\n- Nộp hồ sơ trực tiếp qua địa chỉ email: dvhr@doosan.com&nbsp;<br />\r\nMọi thắc mắc c&oacute; thể li&ecirc;n hệ: Ms. Trịnh Thị Kim Oanh Ph&ograve;ng Quản l&yacute; Nh&acirc;n sự Mail: oanh.trinhthikim@<a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" data-lynx-uri=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fdoosan.com%2F%3Ffbclid%3DIwAR2nOv-XJNmW4jjnTjw8wcLztF86C7IQRP7GQmNnlhWqfzxbzItvCw9V9mk&amp;h=AT123ZP0XosLoAtMB5iRRmFgaAUk6cyYaRi0cdvl6W6b2-cKDHC9l21HJm0WabBm2rVS5b2-zt4B-AGd8o8Gjqe50uv3ByOwEgmzT7aZZ4wLK8y49K01g8dVdECVM7tK7aNSQQ4WZhsAtnKMGoWfDmK9DS6OuCYhOOi8Mp4ysE6KdUAtzJx2z3akdMNmjwNeonMgeLLfJlSRtQrtx50ErKft3AEJbr_UEYv8nqLPZeqZ4DfL_ygp-4gSMHMaxqqS5TaSgK3V3SmiudmiPOP_0TbRm_Sg_Qe23Zv9-2vCGEbhpWlfCk5qWa0wdkluWbgwbLeI4KZ_YYL6ieajB5I3aRh2vMTWX345LiK-0rb0y8ywst5bmYfuG2wHoYSJoLTvRQgeHqxasij-OSvuGbjC0rUSAATq_zBVpsI4bZjOBBr5pgXLVRPIIbrGboJEb2dKI1jUIMGocGSC7kKeO8phquo-CVgrsvktE8jQZqxSEEQDn8QtmAQKnoa8xuDeRZl_4FKYPI6sfrNPPkyb2eLQwDbkiCA0YbxXqQkPsnK_kdRxjRCbW01l30Mlc2Z3pMvQ9z8fe16xsYK0_SzW6ECijceptHoa3gJPE-ndYAB2_TPqnYjW3aqNq33Pz5TsnrhpVRB-Bw\" href=\"http://doosan.com/?fbclid=IwAR2nOv-XJNmW4jjnTjw8wcLztF86C7IQRP7GQmNnlhWqfzxbzItvCw9V9mk\" rel=\"noopener nofollow\" target=\"_blank\">doosan.com/</a>&nbsp;Tel: 0967 957602</p>', 'THÔNG BÁO V/v: Tuyển dụng Kỹ sư Công Nghệ Thông Tin 2019 ', '7tLq_faculty_banner.png', 6, '2019-07-06 18:55:11', '2019-07-11 02:39:44', 187, 187, NULL),
(8, NULL, '<p><a href=\"http://fit.hcmute.edu.vn/?ArticleId=647943ca-4e2f-4ba7-95ea-2e827a71d43b\">Lịch nộp v&agrave; bảo vệ kh&oacute;a luận tốt nghiệp năm 2018 - 2019</a></p>\r\n\r\n<p><img alt=\"\" src=\"http://fit.hcmute.edu.vn/Resources/Images/SubDomain/fit/20182019/HKII/tb2.PNG\" /></p>', 'Lịch nộp và bảo vệ khóa luận tốt nghiệp năm 2018 - 2019', '', 5, '2019-07-09 02:41:11', '2019-07-09 02:41:11', 187, NULL, NULL),
(9, NULL, '<p><img alt=\"\" src=\"http://fit.hcmute.edu.vn/Resources/Images/SubDomain/fit/TuyenDung/FoundationTrainingTuyenDung.jpg\" /></p>', 'TMA Solutions tuyển dụng sinh viên CNTT', 'WGPE_FoundationTrainingTuyenDung.jpg', 6, '2019-07-11 02:29:30', '2019-07-11 02:29:30', 187, NULL, NULL),
(10, NULL, '<p>TH&Ocirc;NG B&Aacute;O CHI&Ecirc;U SINH C&Aacute;C KH&Oacute;A HỌC TH&Aacute;NG 5</p>\r\n\r\n<p>ƯU Đ&Atilde;I D&Agrave;NH RI&Ecirc;NG CHO SINH VI&Ecirc;N ĐẠI HỌC SPKT TP.HCM</p>\r\n\r\n<p>Trung t&acirc;m Đ&agrave;o tạo NewStar th&ocirc;ng b&aacute;o chi&ecirc;u sinh c&aacute;c kh&oacute;a học về mạng v&agrave; lập tr&igrave;nh. Th&ocirc;ng tin chi tiết như sau<br />\r\n:<br />\r\n1. Python cơ bản<br />\r\n- Học ph&iacute;: 2.200.000đ<br />\r\n- Thời gian học: 18h30-21h thứ 2, 6<br />\r\n2. MCSA<br />\r\n- Học ph&iacute;: 4.999.000đ<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n- Giảm 20% cho c&aacute; nh&acirc;n, 30% cho nh&oacute;m 2 người, 40% cho nh&oacute;m 3 người trở l&ecirc;n<br />\r\n- Giảm th&ecirc;m 10% khi đăng k&yacute; trước ng&agrave;y khai giảng 14 ng&agrave;y<br />\r\n3. CCNA<br />\r\n- Học ph&iacute;: 5.800.000đ<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n- Giảm 20% cho c&aacute; nh&acirc;n, 30% cho nh&oacute;m 2 người, 40% cho nh&oacute;m 3 người trở l&ecirc;n<br />\r\n- Giảm th&ecirc;m 10% khi đăng k&yacute; trước ng&agrave;y khai giảng 14 ng&agrave;y<br />\r\n4. CCNP<br />\r\n- Học ph&iacute;: 4.990.000đ (gi&aacute; gốc 7.200.000đ)<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n5. LINUX<br />\r\n- Học ph&iacute;: 2.990.000đ (gi&aacute; gốc 4.000.000đ)<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n6. PHP&amp;MySQL<br />\r\n- Học ph&iacute;: 2.990.000đ (gi&aacute; gốc 3.500.000đ)<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n7. JAVA<br />\r\n- Học ph&iacute;: 2.990.000đ (gi&aacute; gốc 3.500.000đ)<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n8. C++<br />\r\n- Học ph&iacute;: 2.990.000đ<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n9.&nbsp;<a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" href=\"https://l.facebook.com/l.php?u=https%3A%2F%2FASP.NET%2F%3Ffbclid%3DIwAR04MKTC3lsBUQTi5uxa7tWXSg2EqpO9DXF4V-b0rgyfEufnJvDe7vgsx8g&amp;h=AT2aphgNgHWisUSk98HbtS5_eET5KmGqQ8LmfN_x2Y2jsDAoVftLk2vnnsBnyh1uAwsuCdcBYvtDjKYwsHtlYXUqW-0BkGtkOrIVJkJ2E78I4cxv4w6ZlWdSKMBcWEAD1ybwcjfZNbBPW-YfXbmVYfZ8Srx3kAA-YTeX2NBmiIuZi5FzCURSs08WPcAGggmuFPgPpRcccX8EoUWF9JzumxB3oavvEGLcmH869jzM1wxQu-t0INavJ99i21QDqf6yZyOWb6_1LJ4L07AhfJz9TJ4CHXyJ9dW4U-ArHfsgX9mU5vR0B-gwH0VJvqLwNKZZ5k-nkOoRdZvPzgHXAsZG18b0ngnjnQO1oDaF35DlwHPtR2ktYcSQVJBlkU4E6ziQoAPD-foTzppSUG6-IgbXWebFBkejwEBrFe4GQRHy-R5YtfkLYINQIa8WExGkW21BJyr3jfpc-9NITg88Cce-F32ZXl0ZInfKxFOpff3kevEs3ImawZsgdJR2unHnx3CbR2osbqHpmoXwbHs_7qofbJrSqbfPU58w8KgVAm3-Rh-flpSkqryAwT7Era4Fay5WrWeh_yREP5rWB1immnmuMklzfKQv0IlWa0j3FQITUKUir1oGwEYB89ueWhiqtsr0lhBuhW2zxHVOeBm-\" rel=\"noopener nofollow\" target=\"_blank\">ASP.NET</a><br />\r\n- Học ph&iacute;: 2.990.000đ<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7<br />\r\n10. ANDROID<br />\r\n- Học ph&iacute;: 2.990.000đ (gi&aacute; gốc 4.200.000đ)<br />\r\n- Thời gian học: 18h30-21h thứ 2,4,6 hoặc 3,5,7</p>\r\n\r\n<p>Địa điểm học: Lầu 2 T&ograve;a nh&agrave; 240 V&otilde; Văn Ng&acirc;n, Thủ Đức<br />\r\nMọi chi tiết vui l&ograve;ng li&ecirc;n hệ hotline: 028 3722 5858 - 0962 090 270 hoặc truy cập website&nbsp;<a data-ft=\"{&quot;tn&quot;:&quot;-U&quot;}\" data-lynx-mode=\"async\" data-lynx-uri=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fnewstar.vn%2F%3Ffbclid%3DIwAR1oJ29vOVwgPiYf64lyJAt6DTwTWJju1r3Lfnv15qplDbmzScJrTwRLDJM&amp;h=AT2RAMW6RQ4Aym2g1yJyBV-Rs-C_lGL2Di3TFItpCSvHl1WfyXeBY4zzcs5xhc92ZYnhszkaVOXWud7hSFYsbkD2k1sTurY8n3xzeI0UFlGmNJbW3ZE-KCwBi4DRG5UamVSRKND9KCQLAgIvGYNaJKKuIl4-JYqAmBOmnS5GLyeiHxKh8xXQPQ0SpcKFG83wvlFBRLsem1xyOxRw2EQ270RKxq7HG2yckZ6qAyWWVOBDDg9ldLk0HTw8ES5K-DqVgoBbX14Creu2C3WN8GkF3jr89vcTvLOy8cw_9d7z_D_y2k4pGh3QUOPihV3bZagIyDDw0coD_N-L4GJXI1U3lR6v4AdRpJceE1KuplgVKoHnaTSkb8nP2IyWcH3si3nlMOyBEi_E1Qx4t62_OThBJG6ESufEJKzN0A4g4cgpF26DHUXZNdHvGHv4Ho5nz00UMo28ZrOTdHMRY7_xaDyRy6O_sRZP898VNSWbiNy2NIv1FPrCimMBsRtqAPA1Y6xlUz-SCek3Lu6uw9EQMx3_lu-H65GJ69AtnKjnGNDdbAQS98GzYA_wtdsU7xq_PLuVKy1SplSJ9Ff4Mr5nNAFu4oTu3-i68fSM_klIDXhk4cBMlRZ_AnIdP2cl080KXfNKDekoJJkXyQImNeDY\" href=\"http://newstar.vn/?fbclid=IwAR1oJ29vOVwgPiYf64lyJAt6DTwTWJju1r3Lfnv15qplDbmzScJrTwRLDJM\" rel=\"noopener nofollow\" target=\"_blank\">http://newstar.vn</a></p>', 'THÔNG BÁO CHIÊU SINH CÁC KHÓA HỌC THÁNG 5 NewStar', '4BAQ_logo (1).png', 5, '2019-07-11 02:41:46', '2019-07-11 02:42:58', 187, 187, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news_types`
--

CREATE TABLE `news_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news_types`
--

INSERT INTO `news_types` (`id`, `name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 'Thông tin đoàn hội', '2019-06-29 23:19:09', '2019-07-06 19:21:42', 187, NULL, NULL),
(2, 'Hoạt động nổi bật', '2019-06-30 23:48:53', '2019-06-30 23:48:53', 187, NULL, NULL),
(3, 'Gương sinh viên 5 tốt', '2019-06-30 23:49:10', '2019-06-30 23:49:10', 187, NULL, NULL),
(4, 'Hoạt động cơ sở', '2019-06-30 23:51:32', '2019-06-30 23:51:32', 187, NULL, NULL),
(5, 'Học tập', '2019-07-09 02:40:40', '2019-07-09 02:40:40', 187, NULL, NULL),
(6, 'Tuyển dụng', '2019-07-11 02:28:33', '2019-07-11 02:28:33', 187, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 'UVBCH', 'Ủy viên BCH', NULL, '2019-06-22 20:29:18', NULL, 1, NULL),
(2, 'BCS', 'Ban cán sự', NULL, '2019-06-22 20:30:21', NULL, 1, NULL),
(3, 'TT', 'Thường trực', NULL, '2019-06-22 20:31:29', NULL, 1, NULL),
(9, 'Student', 'Quyền sinh viên', '2019-06-22 20:38:45', '2019-06-22 20:38:45', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(820, 3, 187, NULL, NULL, NULL, NULL, NULL),
(821, 9, 1, NULL, NULL, NULL, NULL, NULL),
(822, 9, 2, NULL, NULL, NULL, NULL, NULL),
(823, 9, 3, NULL, NULL, NULL, NULL, NULL),
(824, 9, 4, NULL, NULL, NULL, NULL, NULL),
(825, 9, 5, NULL, NULL, NULL, NULL, NULL),
(826, 9, 6, NULL, NULL, NULL, NULL, NULL),
(827, 9, 7, NULL, NULL, NULL, NULL, NULL),
(828, 9, 8, NULL, NULL, NULL, NULL, NULL),
(829, 9, 9, NULL, NULL, NULL, NULL, NULL),
(830, 9, 10, NULL, NULL, NULL, NULL, NULL),
(831, 9, 11, NULL, NULL, NULL, NULL, NULL),
(832, 9, 12, NULL, NULL, NULL, NULL, NULL),
(833, 9, 13, NULL, NULL, NULL, NULL, NULL),
(834, 9, 14, NULL, NULL, NULL, NULL, NULL),
(835, 9, 15, NULL, NULL, NULL, NULL, NULL),
(836, 9, 16, NULL, NULL, NULL, NULL, NULL),
(837, 9, 17, NULL, NULL, NULL, NULL, NULL),
(838, 9, 18, NULL, NULL, NULL, NULL, NULL),
(839, 9, 19, NULL, NULL, NULL, NULL, NULL),
(840, 9, 20, NULL, NULL, NULL, NULL, NULL),
(841, 9, 21, NULL, NULL, NULL, NULL, NULL),
(842, 9, 22, NULL, NULL, NULL, NULL, NULL),
(843, 9, 23, NULL, NULL, NULL, NULL, NULL),
(844, 9, 24, NULL, NULL, NULL, NULL, NULL),
(845, 9, 25, NULL, NULL, NULL, NULL, NULL),
(846, 9, 26, NULL, NULL, NULL, NULL, NULL),
(847, 9, 27, NULL, NULL, NULL, NULL, NULL),
(848, 9, 28, NULL, NULL, NULL, NULL, NULL),
(849, 9, 29, NULL, NULL, NULL, NULL, NULL),
(850, 9, 30, NULL, NULL, NULL, NULL, NULL),
(851, 9, 31, NULL, NULL, NULL, NULL, NULL),
(852, 9, 32, NULL, NULL, NULL, NULL, NULL),
(853, 9, 33, NULL, NULL, NULL, NULL, NULL),
(854, 9, 34, NULL, NULL, NULL, NULL, NULL),
(855, 9, 35, NULL, NULL, NULL, NULL, NULL),
(856, 9, 36, NULL, NULL, NULL, NULL, NULL),
(857, 9, 37, NULL, NULL, NULL, NULL, NULL),
(858, 9, 38, NULL, NULL, NULL, NULL, NULL),
(859, 9, 39, NULL, NULL, NULL, NULL, NULL),
(860, 9, 40, NULL, NULL, NULL, NULL, NULL),
(861, 9, 41, NULL, NULL, NULL, NULL, NULL),
(862, 9, 42, NULL, NULL, NULL, NULL, NULL),
(863, 9, 43, NULL, NULL, NULL, NULL, NULL),
(864, 9, 44, NULL, NULL, NULL, NULL, NULL),
(865, 9, 45, NULL, NULL, NULL, NULL, NULL),
(866, 9, 46, NULL, NULL, NULL, NULL, NULL),
(867, 9, 47, NULL, NULL, NULL, NULL, NULL),
(868, 9, 48, NULL, NULL, NULL, NULL, NULL),
(869, 9, 49, NULL, NULL, NULL, NULL, NULL),
(870, 9, 50, NULL, NULL, NULL, NULL, NULL),
(871, 9, 51, NULL, NULL, NULL, NULL, NULL),
(872, 9, 52, NULL, NULL, NULL, NULL, NULL),
(873, 9, 53, NULL, NULL, NULL, NULL, NULL),
(874, 9, 54, NULL, NULL, NULL, NULL, NULL),
(875, 9, 55, NULL, NULL, NULL, NULL, NULL),
(876, 9, 56, NULL, NULL, NULL, NULL, NULL),
(877, 9, 57, NULL, NULL, NULL, NULL, NULL),
(878, 9, 58, NULL, NULL, NULL, NULL, NULL),
(879, 9, 59, NULL, NULL, NULL, NULL, NULL),
(880, 9, 60, NULL, NULL, NULL, NULL, NULL),
(881, 9, 61, NULL, NULL, NULL, NULL, NULL),
(882, 9, 62, NULL, NULL, NULL, NULL, NULL),
(883, 9, 63, NULL, NULL, NULL, NULL, NULL),
(884, 9, 64, NULL, NULL, NULL, NULL, NULL),
(885, 9, 65, NULL, NULL, NULL, NULL, NULL),
(886, 9, 66, NULL, NULL, NULL, NULL, NULL),
(887, 9, 67, NULL, NULL, NULL, NULL, NULL),
(888, 9, 68, NULL, NULL, NULL, NULL, NULL),
(889, 9, 69, NULL, NULL, NULL, NULL, NULL),
(890, 9, 70, NULL, NULL, NULL, NULL, NULL),
(891, 9, 71, NULL, NULL, NULL, NULL, NULL),
(892, 9, 72, NULL, NULL, NULL, NULL, NULL),
(893, 9, 73, NULL, NULL, NULL, NULL, NULL),
(894, 9, 74, NULL, NULL, NULL, NULL, NULL),
(895, 9, 75, NULL, NULL, NULL, NULL, NULL),
(896, 9, 76, NULL, NULL, NULL, NULL, NULL),
(897, 9, 77, NULL, NULL, NULL, NULL, NULL),
(898, 9, 78, NULL, NULL, NULL, NULL, NULL),
(899, 9, 79, NULL, NULL, NULL, NULL, NULL),
(900, 9, 80, NULL, NULL, NULL, NULL, NULL),
(901, 9, 81, NULL, NULL, NULL, NULL, NULL),
(902, 9, 82, NULL, NULL, NULL, NULL, NULL),
(903, 9, 83, NULL, NULL, NULL, NULL, NULL),
(904, 9, 84, NULL, NULL, NULL, NULL, NULL),
(905, 9, 85, NULL, NULL, NULL, NULL, NULL),
(906, 9, 86, NULL, NULL, NULL, NULL, NULL),
(907, 9, 87, NULL, NULL, NULL, NULL, NULL),
(908, 9, 88, NULL, NULL, NULL, NULL, NULL),
(909, 9, 89, NULL, NULL, NULL, NULL, NULL),
(910, 9, 90, NULL, NULL, NULL, NULL, NULL),
(911, 9, 91, NULL, NULL, NULL, NULL, NULL),
(912, 9, 92, NULL, NULL, NULL, NULL, NULL),
(913, 9, 93, NULL, NULL, NULL, NULL, NULL),
(914, 9, 94, NULL, NULL, NULL, NULL, NULL),
(915, 9, 95, NULL, NULL, NULL, NULL, NULL),
(916, 9, 96, NULL, NULL, NULL, NULL, NULL),
(917, 9, 97, NULL, NULL, NULL, NULL, NULL),
(918, 9, 98, NULL, NULL, NULL, NULL, NULL),
(919, 9, 99, NULL, NULL, NULL, NULL, NULL),
(920, 9, 100, NULL, NULL, NULL, NULL, NULL),
(921, 9, 101, NULL, NULL, NULL, NULL, NULL),
(922, 9, 102, NULL, NULL, NULL, NULL, NULL),
(923, 9, 103, NULL, NULL, NULL, NULL, NULL),
(924, 9, 104, NULL, NULL, NULL, NULL, NULL),
(925, 9, 105, NULL, NULL, NULL, NULL, NULL),
(926, 9, 106, NULL, NULL, NULL, NULL, NULL),
(927, 9, 107, NULL, NULL, NULL, NULL, NULL),
(928, 9, 108, NULL, NULL, NULL, NULL, NULL),
(929, 9, 109, NULL, NULL, NULL, NULL, NULL),
(930, 9, 110, NULL, NULL, NULL, NULL, NULL),
(931, 9, 111, NULL, NULL, NULL, NULL, NULL),
(932, 9, 112, NULL, NULL, NULL, NULL, NULL),
(933, 9, 113, NULL, NULL, NULL, NULL, NULL),
(934, 9, 114, NULL, NULL, NULL, NULL, NULL),
(935, 9, 115, NULL, NULL, NULL, NULL, NULL),
(936, 9, 116, NULL, NULL, NULL, NULL, NULL),
(937, 9, 117, NULL, NULL, NULL, NULL, NULL),
(938, 9, 118, NULL, NULL, NULL, NULL, NULL),
(939, 9, 119, NULL, NULL, NULL, NULL, NULL),
(940, 9, 120, NULL, NULL, NULL, NULL, NULL),
(941, 9, 121, NULL, NULL, NULL, NULL, NULL),
(942, 9, 122, NULL, NULL, NULL, NULL, NULL),
(943, 9, 123, NULL, NULL, NULL, NULL, NULL),
(944, 9, 124, NULL, NULL, NULL, NULL, NULL),
(945, 9, 125, NULL, NULL, NULL, NULL, NULL),
(946, 9, 126, NULL, NULL, NULL, NULL, NULL),
(947, 9, 127, NULL, NULL, NULL, NULL, NULL),
(948, 9, 128, NULL, NULL, NULL, NULL, NULL),
(949, 9, 129, NULL, NULL, NULL, NULL, NULL),
(950, 9, 130, NULL, NULL, NULL, NULL, NULL),
(951, 9, 131, NULL, NULL, NULL, NULL, NULL),
(952, 9, 132, NULL, NULL, NULL, NULL, NULL),
(953, 9, 133, NULL, NULL, NULL, NULL, NULL),
(954, 9, 134, NULL, NULL, NULL, NULL, NULL),
(955, 9, 135, NULL, NULL, NULL, NULL, NULL),
(956, 9, 136, NULL, NULL, NULL, NULL, NULL),
(957, 9, 137, NULL, NULL, NULL, NULL, NULL),
(958, 9, 138, NULL, NULL, NULL, NULL, NULL),
(959, 9, 139, NULL, NULL, NULL, NULL, NULL),
(960, 9, 140, NULL, NULL, NULL, NULL, NULL),
(961, 9, 141, NULL, NULL, NULL, NULL, NULL),
(962, 9, 142, NULL, NULL, NULL, NULL, NULL),
(963, 9, 143, NULL, NULL, NULL, NULL, NULL),
(964, 9, 144, NULL, NULL, NULL, NULL, NULL),
(965, 9, 171, NULL, NULL, NULL, NULL, NULL),
(966, 9, 172, NULL, NULL, NULL, NULL, NULL),
(967, 9, 173, NULL, NULL, NULL, NULL, NULL),
(968, 9, 174, NULL, NULL, NULL, NULL, NULL),
(969, 9, 175, NULL, NULL, NULL, NULL, NULL),
(970, 9, 176, NULL, NULL, NULL, NULL, NULL),
(971, 9, 177, NULL, NULL, NULL, NULL, NULL),
(972, 9, 178, NULL, NULL, NULL, NULL, NULL),
(973, 9, 179, NULL, NULL, NULL, NULL, NULL),
(974, 9, 180, NULL, NULL, NULL, NULL, NULL),
(975, 9, 181, NULL, NULL, NULL, NULL, NULL),
(976, 9, 182, NULL, NULL, NULL, NULL, NULL),
(977, 9, 183, NULL, NULL, NULL, NULL, NULL),
(978, 9, 184, NULL, NULL, NULL, NULL, NULL),
(979, 9, 185, NULL, NULL, NULL, NULL, NULL),
(980, 9, 186, NULL, NULL, NULL, NULL, NULL),
(981, 9, 187, NULL, NULL, NULL, NULL, NULL),
(982, 9, 188, NULL, NULL, NULL, NULL, NULL),
(983, 9, 189, NULL, NULL, NULL, NULL, NULL),
(984, 9, 190, NULL, NULL, NULL, NULL, NULL),
(985, 9, 191, NULL, NULL, NULL, NULL, NULL),
(986, 9, 192, NULL, NULL, NULL, NULL, NULL),
(987, 9, 193, NULL, NULL, NULL, NULL, NULL),
(988, 9, 194, NULL, NULL, NULL, NULL, NULL),
(989, 9, 195, NULL, NULL, NULL, NULL, NULL),
(990, 9, 196, NULL, NULL, NULL, NULL, NULL),
(991, 9, 197, NULL, NULL, NULL, NULL, NULL),
(992, 9, 198, NULL, NULL, NULL, NULL, NULL),
(993, 9, 199, NULL, NULL, NULL, NULL, NULL),
(994, 9, 200, NULL, NULL, NULL, NULL, NULL),
(995, 9, 201, NULL, NULL, NULL, NULL, NULL),
(996, 9, 202, NULL, NULL, NULL, NULL, NULL),
(997, 9, 203, NULL, NULL, NULL, NULL, NULL),
(998, 9, 204, NULL, NULL, NULL, NULL, NULL),
(999, 9, 205, NULL, NULL, NULL, NULL, NULL),
(1000, 9, 206, NULL, NULL, NULL, NULL, NULL),
(1001, 9, 207, NULL, NULL, NULL, NULL, NULL),
(1002, 9, 208, NULL, NULL, NULL, NULL, NULL),
(1003, 9, 209, NULL, NULL, NULL, NULL, NULL),
(1004, 9, 210, NULL, NULL, NULL, NULL, NULL),
(1005, 9, 211, NULL, NULL, NULL, NULL, NULL),
(1006, 9, 212, NULL, NULL, NULL, NULL, NULL),
(1007, 9, 213, NULL, NULL, NULL, NULL, NULL),
(1008, 9, 214, NULL, NULL, NULL, NULL, NULL),
(1009, 9, 215, NULL, NULL, NULL, NULL, NULL),
(1010, 9, 216, NULL, NULL, NULL, NULL, NULL),
(1011, 9, 217, NULL, NULL, NULL, NULL, NULL),
(1012, 9, 218, NULL, NULL, NULL, NULL, NULL),
(1013, 9, 219, NULL, NULL, NULL, NULL, NULL),
(1014, 9, 220, NULL, NULL, NULL, NULL, NULL),
(1015, 9, 221, NULL, NULL, NULL, NULL, NULL),
(1016, 9, 222, NULL, NULL, NULL, NULL, NULL),
(1017, 9, 223, NULL, NULL, NULL, NULL, NULL),
(1018, 9, 224, NULL, NULL, NULL, NULL, NULL),
(1019, 9, 225, NULL, NULL, NULL, NULL, NULL),
(1020, 9, 226, NULL, NULL, NULL, NULL, NULL),
(1021, 9, 227, NULL, NULL, NULL, NULL, NULL),
(1022, 9, 228, NULL, NULL, NULL, NULL, NULL),
(1023, 9, 229, NULL, NULL, NULL, NULL, NULL),
(1024, 9, 230, NULL, NULL, NULL, NULL, NULL),
(1025, 9, 231, NULL, NULL, NULL, NULL, NULL),
(1026, 9, 232, NULL, NULL, NULL, NULL, NULL),
(1027, 9, 233, NULL, NULL, NULL, NULL, NULL),
(1028, 9, 234, NULL, NULL, NULL, NULL, NULL),
(1029, 9, 235, NULL, NULL, NULL, NULL, NULL),
(1030, 9, 236, NULL, NULL, NULL, NULL, NULL),
(1031, 9, 237, NULL, NULL, NULL, NULL, NULL),
(1032, 9, 238, NULL, NULL, NULL, NULL, NULL),
(1033, 9, 239, NULL, NULL, NULL, NULL, NULL),
(1034, 9, 240, NULL, NULL, NULL, NULL, NULL),
(1035, 9, 241, NULL, NULL, NULL, NULL, NULL),
(1036, 9, 242, NULL, NULL, NULL, NULL, NULL),
(1037, 9, 243, NULL, NULL, NULL, NULL, NULL),
(1038, 9, 244, NULL, NULL, NULL, NULL, NULL),
(1039, 9, 245, NULL, NULL, NULL, NULL, NULL),
(1040, 9, 246, NULL, NULL, NULL, NULL, NULL),
(1041, 9, 247, NULL, NULL, NULL, NULL, NULL),
(1042, 9, 248, NULL, NULL, NULL, NULL, NULL),
(1043, 9, 249, NULL, NULL, NULL, NULL, NULL),
(1044, 9, 250, NULL, NULL, NULL, NULL, NULL),
(1045, 9, 251, NULL, NULL, NULL, NULL, NULL),
(1046, 9, 252, NULL, NULL, NULL, NULL, NULL),
(1047, 9, 253, NULL, NULL, NULL, NULL, NULL),
(1048, 9, 254, NULL, NULL, NULL, NULL, NULL),
(1049, 9, 255, NULL, NULL, NULL, NULL, NULL),
(1050, 9, 256, NULL, NULL, NULL, NULL, NULL),
(1051, 9, 257, NULL, NULL, NULL, NULL, NULL),
(1052, 9, 258, NULL, NULL, NULL, NULL, NULL),
(1053, 9, 259, NULL, NULL, NULL, NULL, NULL),
(1054, 9, 260, NULL, NULL, NULL, NULL, NULL),
(1055, 9, 261, NULL, NULL, NULL, NULL, NULL),
(1056, 9, 262, NULL, NULL, NULL, NULL, NULL),
(1057, 9, 263, NULL, NULL, NULL, NULL, NULL),
(1058, 9, 264, NULL, NULL, NULL, NULL, NULL),
(1059, 9, 265, NULL, NULL, NULL, NULL, NULL),
(1060, 9, 266, NULL, NULL, NULL, NULL, NULL),
(1061, 9, 267, NULL, NULL, NULL, NULL, NULL),
(1062, 9, 268, NULL, NULL, NULL, NULL, NULL),
(1063, 9, 269, NULL, NULL, NULL, NULL, NULL),
(1064, 9, 270, NULL, NULL, NULL, NULL, NULL),
(1065, 9, 271, NULL, NULL, NULL, NULL, NULL),
(1066, 9, 272, NULL, NULL, NULL, NULL, NULL),
(1067, 9, 273, NULL, NULL, NULL, NULL, NULL),
(1068, 9, 274, NULL, NULL, NULL, NULL, NULL),
(1069, 9, 275, NULL, NULL, NULL, NULL, NULL),
(1070, 9, 276, NULL, NULL, NULL, NULL, NULL),
(1071, 9, 277, NULL, NULL, NULL, NULL, NULL),
(1072, 9, 278, NULL, NULL, NULL, NULL, NULL),
(1073, 9, 279, NULL, NULL, NULL, NULL, NULL),
(1074, 9, 280, NULL, NULL, NULL, NULL, NULL),
(1075, 9, 281, NULL, NULL, NULL, NULL, NULL),
(1076, 9, 282, NULL, NULL, NULL, NULL, NULL),
(1077, 9, 283, NULL, NULL, NULL, NULL, NULL),
(1078, 9, 284, NULL, NULL, NULL, NULL, NULL),
(1079, 9, 285, NULL, NULL, NULL, NULL, NULL),
(1080, 9, 286, NULL, NULL, NULL, NULL, NULL),
(1081, 9, 287, NULL, NULL, NULL, NULL, NULL),
(1082, 9, 288, NULL, NULL, NULL, NULL, NULL),
(1083, 9, 289, NULL, NULL, NULL, NULL, NULL),
(1084, 9, 290, NULL, NULL, NULL, NULL, NULL),
(1085, 9, 291, NULL, NULL, NULL, NULL, NULL),
(1086, 9, 292, NULL, NULL, NULL, NULL, NULL),
(1087, 9, 293, NULL, NULL, NULL, NULL, NULL),
(1088, 9, 294, NULL, NULL, NULL, NULL, NULL),
(1089, 9, 295, NULL, NULL, NULL, NULL, NULL),
(1090, 9, 296, NULL, NULL, NULL, NULL, NULL),
(1091, 9, 297, NULL, NULL, NULL, NULL, NULL),
(1092, 9, 298, NULL, NULL, NULL, NULL, NULL),
(1093, 9, 299, NULL, NULL, NULL, NULL, NULL),
(1094, 9, 300, NULL, NULL, NULL, NULL, NULL),
(1095, 9, 301, NULL, NULL, NULL, NULL, NULL),
(1096, 9, 302, NULL, NULL, NULL, NULL, NULL),
(1097, 9, 303, NULL, NULL, NULL, NULL, NULL),
(1098, 9, 304, NULL, NULL, NULL, NULL, NULL),
(1099, 9, 305, NULL, NULL, NULL, NULL, NULL),
(1100, 9, 306, NULL, NULL, NULL, NULL, NULL),
(1101, 9, 307, NULL, NULL, NULL, NULL, NULL),
(1102, 9, 308, NULL, NULL, NULL, NULL, NULL),
(1103, 9, 309, NULL, NULL, NULL, NULL, NULL),
(1104, 9, 310, NULL, NULL, NULL, NULL, NULL),
(1105, 9, 311, NULL, NULL, NULL, NULL, NULL),
(1106, 9, 312, NULL, NULL, NULL, NULL, NULL),
(1107, 9, 313, NULL, NULL, NULL, NULL, NULL),
(1108, 9, 314, NULL, NULL, NULL, NULL, NULL),
(1109, 9, 315, NULL, NULL, NULL, NULL, NULL),
(1110, 9, 316, NULL, NULL, NULL, NULL, NULL),
(1111, 9, 317, NULL, NULL, NULL, NULL, NULL),
(1112, 9, 318, NULL, NULL, NULL, NULL, NULL),
(1113, 9, 319, NULL, NULL, NULL, NULL, NULL),
(1114, 9, 320, NULL, NULL, NULL, NULL, NULL),
(1115, 9, 321, NULL, NULL, NULL, NULL, NULL),
(1116, 9, 322, NULL, NULL, NULL, NULL, NULL),
(1117, 9, 323, NULL, NULL, NULL, NULL, NULL),
(1118, 9, 324, NULL, NULL, NULL, NULL, NULL),
(1119, 9, 325, NULL, NULL, NULL, NULL, NULL),
(1120, 9, 326, NULL, NULL, NULL, NULL, NULL),
(1121, 9, 327, NULL, NULL, NULL, NULL, NULL),
(1122, 9, 328, NULL, NULL, NULL, NULL, NULL),
(1123, 9, 329, NULL, NULL, NULL, NULL, NULL),
(1124, 9, 330, NULL, NULL, NULL, NULL, NULL),
(1125, 9, 331, NULL, NULL, NULL, NULL, NULL),
(1126, 9, 332, NULL, NULL, NULL, NULL, NULL),
(1127, 9, 333, NULL, NULL, NULL, NULL, NULL),
(1128, 9, 334, NULL, NULL, NULL, NULL, NULL),
(1129, 9, 335, NULL, NULL, NULL, NULL, NULL),
(1130, 9, 336, NULL, NULL, NULL, NULL, NULL),
(1131, 9, 337, NULL, NULL, NULL, NULL, NULL),
(1132, 9, 338, NULL, NULL, NULL, NULL, NULL),
(1133, 9, 339, NULL, NULL, NULL, NULL, NULL),
(1134, 9, 340, NULL, NULL, NULL, NULL, NULL),
(1135, 9, 341, NULL, NULL, NULL, NULL, NULL),
(1136, 9, 342, NULL, NULL, NULL, NULL, NULL),
(1137, 9, 343, NULL, NULL, NULL, NULL, NULL),
(1138, 9, 344, NULL, NULL, NULL, NULL, NULL),
(1139, 9, 345, NULL, NULL, NULL, NULL, NULL),
(1140, 9, 346, NULL, NULL, NULL, NULL, NULL),
(1141, 9, 347, NULL, NULL, NULL, NULL, NULL),
(1142, 9, 348, NULL, NULL, NULL, NULL, NULL),
(1143, 9, 349, NULL, NULL, NULL, NULL, NULL),
(1144, 9, 350, NULL, NULL, NULL, NULL, NULL),
(1145, 9, 351, NULL, NULL, NULL, NULL, NULL),
(1146, 9, 352, NULL, NULL, NULL, NULL, NULL),
(1147, 9, 353, NULL, NULL, NULL, NULL, NULL),
(1148, 9, 354, NULL, NULL, NULL, NULL, NULL),
(1149, 9, 355, NULL, NULL, NULL, NULL, NULL),
(1150, 9, 356, NULL, NULL, NULL, NULL, NULL),
(1151, 9, 357, NULL, NULL, NULL, NULL, NULL),
(1152, 9, 358, NULL, NULL, NULL, NULL, NULL),
(1153, 9, 359, NULL, NULL, NULL, NULL, NULL),
(1154, 9, 360, NULL, NULL, NULL, NULL, NULL),
(1155, 9, 361, NULL, NULL, NULL, NULL, NULL),
(1156, 9, 362, NULL, NULL, NULL, NULL, NULL),
(1157, 9, 363, NULL, NULL, NULL, NULL, NULL),
(1158, 9, 364, NULL, NULL, NULL, NULL, NULL),
(1159, 9, 365, NULL, NULL, NULL, NULL, NULL),
(1160, 9, 366, NULL, NULL, NULL, NULL, NULL),
(1161, 9, 367, NULL, NULL, NULL, NULL, NULL),
(1162, 9, 368, NULL, NULL, NULL, NULL, NULL),
(1163, 9, 369, NULL, NULL, NULL, NULL, NULL),
(1164, 9, 370, NULL, NULL, NULL, NULL, NULL),
(1165, 9, 371, NULL, NULL, NULL, NULL, NULL),
(1166, 9, 372, NULL, NULL, NULL, NULL, NULL),
(1167, 9, 373, NULL, NULL, NULL, NULL, NULL),
(1168, 9, 374, NULL, NULL, NULL, NULL, NULL),
(1169, 9, 375, NULL, NULL, NULL, NULL, NULL),
(1170, 9, 376, NULL, NULL, NULL, NULL, NULL),
(1171, 9, 377, NULL, NULL, NULL, NULL, NULL),
(1172, 9, 378, NULL, NULL, NULL, NULL, NULL),
(1173, 9, 379, NULL, NULL, NULL, NULL, NULL),
(1174, 9, 380, NULL, NULL, NULL, NULL, NULL),
(1175, 9, 381, NULL, NULL, NULL, NULL, NULL),
(1176, 9, 382, NULL, NULL, NULL, NULL, NULL),
(1177, 9, 383, NULL, NULL, NULL, NULL, NULL),
(1178, 9, 384, NULL, NULL, NULL, NULL, NULL),
(1179, 9, 385, NULL, NULL, NULL, NULL, NULL),
(1180, 9, 386, NULL, NULL, NULL, NULL, NULL),
(1181, 9, 387, NULL, NULL, NULL, NULL, NULL),
(1182, 9, 388, NULL, NULL, NULL, NULL, NULL),
(1183, 9, 389, NULL, NULL, NULL, NULL, NULL),
(1184, 9, 390, NULL, NULL, NULL, NULL, NULL),
(1185, 9, 391, NULL, NULL, NULL, NULL, NULL),
(1186, 9, 392, NULL, NULL, NULL, NULL, NULL),
(1187, 9, 393, NULL, NULL, NULL, NULL, NULL),
(1188, 9, 394, NULL, NULL, NULL, NULL, NULL),
(1189, 9, 395, NULL, NULL, NULL, NULL, NULL),
(1190, 9, 396, NULL, NULL, NULL, NULL, NULL),
(1191, 9, 397, NULL, NULL, NULL, NULL, NULL),
(1192, 9, 398, NULL, NULL, NULL, NULL, NULL),
(1193, 9, 399, NULL, NULL, NULL, NULL, NULL),
(1194, 9, 400, NULL, NULL, NULL, NULL, NULL),
(1195, 9, 401, NULL, NULL, NULL, NULL, NULL),
(1196, 9, 402, NULL, NULL, NULL, NULL, NULL),
(1197, 9, 403, NULL, NULL, NULL, NULL, NULL),
(1198, 9, 404, NULL, NULL, NULL, NULL, NULL),
(1199, 9, 405, NULL, NULL, NULL, NULL, NULL),
(1200, 9, 406, NULL, NULL, NULL, NULL, NULL),
(1201, 9, 407, NULL, NULL, NULL, NULL, NULL),
(1202, 9, 408, NULL, NULL, NULL, NULL, NULL),
(1203, 9, 409, NULL, NULL, NULL, NULL, NULL),
(1204, 9, 410, NULL, NULL, NULL, NULL, NULL),
(1205, 9, 411, NULL, NULL, NULL, NULL, NULL),
(1206, 9, 412, NULL, NULL, NULL, NULL, NULL),
(1207, 9, 413, NULL, NULL, NULL, NULL, NULL),
(1208, 9, 414, NULL, NULL, NULL, NULL, NULL),
(1209, 9, 415, NULL, NULL, NULL, NULL, NULL),
(1210, 9, 416, NULL, NULL, NULL, NULL, NULL),
(1211, 9, 417, NULL, NULL, NULL, NULL, NULL),
(1212, 9, 418, NULL, NULL, NULL, NULL, NULL),
(1213, 9, 419, NULL, NULL, NULL, NULL, NULL),
(1214, 9, 420, NULL, NULL, NULL, NULL, NULL),
(1215, 9, 421, NULL, NULL, NULL, NULL, NULL),
(1216, 9, 422, NULL, NULL, NULL, NULL, NULL),
(1217, 9, 423, NULL, NULL, NULL, NULL, NULL),
(1218, 9, 424, NULL, NULL, NULL, NULL, NULL),
(1219, 9, 425, NULL, NULL, NULL, NULL, NULL),
(1220, 9, 426, NULL, NULL, NULL, NULL, NULL),
(1221, 9, 427, NULL, NULL, NULL, NULL, NULL),
(1222, 9, 428, NULL, NULL, NULL, NULL, NULL),
(1223, 9, 429, NULL, NULL, NULL, NULL, NULL),
(1224, 9, 430, NULL, NULL, NULL, NULL, NULL),
(1225, 9, 431, NULL, NULL, NULL, NULL, NULL),
(1226, 9, 432, NULL, NULL, NULL, NULL, NULL),
(1227, 9, 433, NULL, NULL, NULL, NULL, NULL),
(1228, 9, 434, NULL, NULL, NULL, NULL, NULL),
(1229, 9, 435, NULL, NULL, NULL, NULL, NULL),
(1230, 9, 436, NULL, NULL, NULL, NULL, NULL),
(1231, 9, 437, NULL, NULL, NULL, NULL, NULL),
(1232, 9, 438, NULL, NULL, NULL, NULL, NULL),
(1233, 9, 439, NULL, NULL, NULL, NULL, NULL),
(1234, 9, 440, NULL, NULL, NULL, NULL, NULL),
(1235, 9, 441, NULL, NULL, NULL, NULL, NULL),
(1236, 9, 442, NULL, NULL, NULL, NULL, NULL),
(1237, 9, 443, NULL, NULL, NULL, NULL, NULL),
(1238, 9, 444, NULL, NULL, NULL, NULL, NULL),
(1239, 9, 445, NULL, NULL, NULL, NULL, NULL),
(1240, 9, 446, NULL, NULL, NULL, NULL, NULL),
(1241, 9, 447, NULL, NULL, NULL, NULL, NULL),
(1242, 9, 448, NULL, NULL, NULL, NULL, NULL),
(1243, 9, 449, NULL, NULL, NULL, NULL, NULL),
(1244, 9, 450, NULL, NULL, NULL, NULL, NULL),
(1245, 9, 451, NULL, NULL, NULL, NULL, NULL),
(1246, 9, 452, NULL, NULL, NULL, NULL, NULL),
(1247, 9, 453, NULL, NULL, NULL, NULL, NULL),
(1248, 9, 454, NULL, NULL, NULL, NULL, NULL),
(1249, 9, 455, NULL, NULL, NULL, NULL, NULL),
(1250, 9, 456, NULL, NULL, NULL, NULL, NULL),
(1251, 9, 457, NULL, NULL, NULL, NULL, NULL),
(1252, 9, 458, NULL, NULL, NULL, NULL, NULL),
(1253, 9, 459, NULL, NULL, NULL, NULL, NULL),
(1254, 9, 460, NULL, NULL, NULL, NULL, NULL),
(1255, 9, 461, NULL, NULL, NULL, NULL, NULL),
(1256, 9, 462, NULL, NULL, NULL, NULL, NULL),
(1257, 9, 463, NULL, NULL, NULL, NULL, NULL),
(1258, 9, 464, NULL, NULL, NULL, NULL, NULL),
(1259, 9, 465, NULL, NULL, NULL, NULL, NULL),
(1260, 9, 466, NULL, NULL, NULL, NULL, NULL),
(1261, 9, 467, NULL, NULL, NULL, NULL, NULL),
(1262, 9, 468, NULL, NULL, NULL, NULL, NULL),
(1263, 9, 469, NULL, NULL, NULL, NULL, NULL),
(1264, 9, 470, NULL, NULL, NULL, NULL, NULL),
(1265, 9, 471, NULL, NULL, NULL, NULL, NULL),
(1266, 9, 472, NULL, NULL, NULL, NULL, NULL),
(1267, 9, 473, NULL, NULL, NULL, NULL, NULL),
(1268, 9, 474, NULL, NULL, NULL, NULL, NULL),
(1269, 9, 475, NULL, NULL, NULL, NULL, NULL),
(1270, 9, 476, NULL, NULL, NULL, NULL, NULL),
(1271, 9, 477, NULL, NULL, NULL, NULL, NULL),
(1272, 9, 478, NULL, NULL, NULL, NULL, NULL),
(1273, 9, 479, NULL, NULL, NULL, NULL, NULL),
(1274, 9, 480, NULL, NULL, NULL, NULL, NULL),
(1275, 9, 481, NULL, NULL, NULL, NULL, NULL),
(1276, 9, 482, NULL, NULL, NULL, NULL, NULL),
(1277, 9, 483, NULL, NULL, NULL, NULL, NULL),
(1278, 9, 484, NULL, NULL, NULL, NULL, NULL),
(1279, 9, 485, NULL, NULL, NULL, NULL, NULL),
(1280, 9, 486, NULL, NULL, NULL, NULL, NULL),
(1281, 9, 487, NULL, NULL, NULL, NULL, NULL),
(1282, 9, 488, NULL, NULL, NULL, NULL, NULL),
(1283, 9, 489, NULL, NULL, NULL, NULL, NULL),
(1284, 9, 490, NULL, NULL, NULL, NULL, NULL),
(1285, 9, 491, NULL, NULL, NULL, NULL, NULL),
(1286, 9, 492, NULL, NULL, NULL, NULL, NULL),
(1287, 9, 493, NULL, NULL, NULL, NULL, NULL),
(1288, 9, 494, NULL, NULL, NULL, NULL, NULL),
(1289, 9, 495, NULL, NULL, NULL, NULL, NULL),
(1290, 9, 496, NULL, NULL, NULL, NULL, NULL),
(1291, 9, 497, NULL, NULL, NULL, NULL, NULL),
(1292, 9, 498, NULL, NULL, NULL, NULL, NULL),
(1293, 9, 499, NULL, NULL, NULL, NULL, NULL),
(1294, 9, 500, NULL, NULL, NULL, NULL, NULL),
(1295, 9, 501, NULL, NULL, NULL, NULL, NULL),
(1296, 9, 502, NULL, NULL, NULL, NULL, NULL),
(1297, 9, 503, NULL, NULL, NULL, NULL, NULL),
(1298, 9, 504, NULL, NULL, NULL, NULL, NULL),
(1299, 9, 505, NULL, NULL, NULL, NULL, NULL),
(1300, 9, 506, NULL, NULL, NULL, NULL, NULL),
(1301, 9, 507, NULL, NULL, NULL, NULL, NULL),
(1302, 9, 508, NULL, NULL, NULL, NULL, NULL),
(1303, 9, 509, NULL, NULL, NULL, NULL, NULL),
(1304, 9, 510, NULL, NULL, NULL, NULL, NULL),
(1305, 9, 511, NULL, NULL, NULL, NULL, NULL),
(1306, 9, 512, NULL, NULL, NULL, NULL, NULL),
(1307, 9, 513, NULL, NULL, NULL, NULL, NULL),
(1308, 9, 514, NULL, NULL, NULL, NULL, NULL),
(1309, 9, 515, NULL, NULL, NULL, NULL, NULL),
(1310, 9, 516, NULL, NULL, NULL, NULL, NULL),
(1311, 9, 517, NULL, NULL, NULL, NULL, NULL),
(1312, 9, 518, NULL, NULL, NULL, NULL, NULL),
(1313, 9, 519, NULL, NULL, NULL, NULL, NULL),
(1314, 9, 520, NULL, NULL, NULL, NULL, NULL),
(1315, 9, 521, NULL, NULL, NULL, NULL, NULL),
(1316, 9, 522, NULL, NULL, NULL, NULL, NULL),
(1317, 9, 523, NULL, NULL, NULL, NULL, NULL),
(1318, 9, 524, NULL, NULL, NULL, NULL, NULL),
(1319, 9, 525, NULL, NULL, NULL, NULL, NULL),
(1320, 9, 526, NULL, NULL, NULL, NULL, NULL),
(1321, 9, 527, NULL, NULL, NULL, NULL, NULL),
(1322, 9, 528, NULL, NULL, NULL, NULL, NULL),
(1323, 9, 529, NULL, NULL, NULL, NULL, NULL),
(1324, 9, 530, NULL, NULL, NULL, NULL, NULL),
(1325, 9, 531, NULL, NULL, NULL, NULL, NULL),
(1326, 9, 532, NULL, NULL, NULL, NULL, NULL),
(1327, 9, 533, NULL, NULL, NULL, NULL, NULL),
(1328, 9, 534, NULL, NULL, NULL, NULL, NULL),
(1329, 9, 535, NULL, NULL, NULL, NULL, NULL),
(1330, 9, 536, NULL, NULL, NULL, NULL, NULL),
(1331, 9, 537, NULL, NULL, NULL, NULL, NULL),
(1332, 9, 538, NULL, NULL, NULL, NULL, NULL),
(1333, 9, 539, NULL, NULL, NULL, NULL, NULL),
(1334, 9, 540, NULL, NULL, NULL, NULL, NULL),
(1335, 9, 541, NULL, NULL, NULL, NULL, NULL),
(1336, 9, 542, NULL, NULL, NULL, NULL, NULL),
(1337, 9, 543, NULL, NULL, NULL, NULL, NULL),
(1338, 9, 544, NULL, NULL, NULL, NULL, NULL),
(1339, 9, 545, NULL, NULL, NULL, NULL, NULL),
(1340, 9, 546, NULL, NULL, NULL, NULL, NULL),
(1341, 9, 547, NULL, NULL, NULL, NULL, NULL),
(1342, 9, 548, NULL, NULL, NULL, NULL, NULL),
(1343, 9, 549, NULL, NULL, NULL, NULL, NULL),
(1344, 9, 550, NULL, NULL, NULL, NULL, NULL),
(1345, 9, 551, NULL, NULL, NULL, NULL, NULL),
(1346, 9, 552, NULL, NULL, NULL, NULL, NULL),
(1347, 9, 553, NULL, NULL, NULL, NULL, NULL),
(1348, 9, 554, NULL, NULL, NULL, NULL, NULL),
(1349, 9, 555, NULL, NULL, NULL, NULL, NULL),
(1350, 9, 556, NULL, NULL, NULL, NULL, NULL),
(1351, 9, 557, NULL, NULL, NULL, NULL, NULL),
(1352, 9, 558, NULL, NULL, NULL, NULL, NULL),
(1353, 9, 559, NULL, NULL, NULL, NULL, NULL),
(1354, 9, 560, NULL, NULL, NULL, NULL, NULL),
(1355, 9, 561, NULL, NULL, NULL, NULL, NULL),
(1356, 9, 562, NULL, NULL, NULL, NULL, NULL),
(1357, 9, 563, NULL, NULL, NULL, NULL, NULL),
(1358, 9, 564, NULL, NULL, NULL, NULL, NULL),
(1359, 9, 565, NULL, NULL, NULL, NULL, NULL),
(1360, 9, 566, NULL, NULL, NULL, NULL, NULL),
(1361, 9, 567, NULL, NULL, NULL, NULL, NULL),
(1362, 9, 568, NULL, NULL, NULL, NULL, NULL),
(1363, 9, 569, NULL, NULL, NULL, NULL, NULL),
(1364, 9, 570, NULL, NULL, NULL, NULL, NULL),
(1365, 9, 571, NULL, NULL, NULL, NULL, NULL),
(1366, 9, 572, NULL, NULL, NULL, NULL, NULL),
(1367, 9, 573, NULL, NULL, NULL, NULL, NULL),
(1368, 9, 574, NULL, NULL, NULL, NULL, NULL),
(1369, 9, 575, NULL, NULL, NULL, NULL, NULL),
(1370, 9, 576, NULL, NULL, NULL, NULL, NULL),
(1371, 9, 577, NULL, NULL, NULL, NULL, NULL),
(1372, 9, 578, NULL, NULL, NULL, NULL, NULL),
(1373, 9, 579, NULL, NULL, NULL, NULL, NULL),
(1374, 9, 580, NULL, NULL, NULL, NULL, NULL),
(1375, 9, 581, NULL, NULL, NULL, NULL, NULL),
(1376, 9, 582, NULL, NULL, NULL, NULL, NULL),
(1377, 9, 583, NULL, NULL, NULL, NULL, NULL),
(1378, 9, 584, NULL, NULL, NULL, NULL, NULL),
(1379, 9, 585, NULL, NULL, NULL, NULL, NULL),
(1380, 9, 586, NULL, NULL, NULL, NULL, NULL),
(1381, 9, 587, NULL, NULL, NULL, NULL, NULL),
(1382, 9, 588, NULL, NULL, NULL, NULL, NULL),
(1383, 9, 589, NULL, NULL, NULL, NULL, NULL),
(1384, 9, 590, NULL, NULL, NULL, NULL, NULL),
(1385, 9, 591, NULL, NULL, NULL, NULL, NULL),
(1386, 9, 592, NULL, NULL, NULL, NULL, NULL),
(1387, 9, 593, NULL, NULL, NULL, NULL, NULL),
(1388, 9, 594, NULL, NULL, NULL, NULL, NULL),
(1389, 9, 595, NULL, NULL, NULL, NULL, NULL),
(1390, 9, 596, NULL, NULL, NULL, NULL, NULL),
(1391, 9, 597, NULL, NULL, NULL, NULL, NULL),
(1392, 9, 598, NULL, NULL, NULL, NULL, NULL),
(1393, 9, 599, NULL, NULL, NULL, NULL, NULL),
(1394, 9, 600, NULL, NULL, NULL, NULL, NULL),
(1395, 9, 601, NULL, NULL, NULL, NULL, NULL),
(1396, 9, 602, NULL, NULL, NULL, NULL, NULL),
(1397, 9, 603, NULL, NULL, NULL, NULL, NULL),
(1398, 9, 604, NULL, NULL, NULL, NULL, NULL),
(1399, 9, 605, NULL, NULL, NULL, NULL, NULL),
(1400, 9, 606, NULL, NULL, NULL, NULL, NULL),
(1401, 9, 607, NULL, NULL, NULL, NULL, NULL),
(1402, 9, 608, NULL, NULL, NULL, NULL, NULL),
(1403, 9, 609, NULL, NULL, NULL, NULL, NULL),
(1404, 9, 610, NULL, NULL, NULL, NULL, NULL),
(1405, 9, 611, NULL, NULL, NULL, NULL, NULL),
(1406, 9, 612, NULL, NULL, NULL, NULL, NULL),
(1407, 9, 613, NULL, NULL, NULL, NULL, NULL),
(1408, 9, 614, NULL, NULL, NULL, NULL, NULL),
(1409, 9, 615, NULL, NULL, NULL, NULL, NULL),
(1410, 9, 616, NULL, NULL, NULL, NULL, NULL),
(1411, 9, 617, NULL, NULL, NULL, NULL, NULL),
(1412, 9, 618, NULL, NULL, NULL, NULL, NULL),
(1413, 9, 619, NULL, NULL, NULL, NULL, NULL),
(1414, 9, 620, NULL, NULL, NULL, NULL, NULL),
(1415, 9, 621, NULL, NULL, NULL, NULL, NULL),
(1416, 9, 622, NULL, NULL, NULL, NULL, NULL),
(1417, 9, 623, NULL, NULL, NULL, NULL, NULL),
(1418, 9, 624, NULL, NULL, NULL, NULL, NULL),
(1419, 9, 625, NULL, NULL, NULL, NULL, NULL),
(1420, 9, 626, NULL, NULL, NULL, NULL, NULL),
(1421, 9, 627, NULL, NULL, NULL, NULL, NULL),
(1422, 9, 628, NULL, NULL, NULL, NULL, NULL),
(1423, 9, 629, NULL, NULL, NULL, NULL, NULL),
(1424, 9, 630, NULL, NULL, NULL, NULL, NULL),
(1425, 9, 631, NULL, NULL, NULL, NULL, NULL),
(1426, 9, 632, NULL, NULL, NULL, NULL, NULL),
(1427, 9, 633, NULL, NULL, NULL, NULL, NULL),
(1428, 9, 634, NULL, NULL, NULL, NULL, NULL),
(1429, 9, 635, NULL, NULL, NULL, NULL, NULL),
(1430, 9, 636, NULL, NULL, NULL, NULL, NULL),
(1431, 9, 637, NULL, NULL, NULL, NULL, NULL),
(1432, 9, 638, NULL, NULL, NULL, NULL, NULL),
(1433, 9, 639, NULL, NULL, NULL, NULL, NULL),
(1434, 9, 640, NULL, NULL, NULL, NULL, NULL),
(1435, 9, 641, NULL, NULL, NULL, NULL, NULL),
(1436, 9, 642, NULL, NULL, NULL, NULL, NULL),
(1437, 9, 643, NULL, NULL, NULL, NULL, NULL),
(1438, 9, 644, NULL, NULL, NULL, NULL, NULL),
(1439, 9, 645, NULL, NULL, NULL, NULL, NULL),
(1440, 9, 646, NULL, NULL, NULL, NULL, NULL),
(1441, 9, 647, NULL, NULL, NULL, NULL, NULL),
(1442, 9, 648, NULL, NULL, NULL, NULL, NULL),
(1443, 9, 649, NULL, NULL, NULL, NULL, NULL),
(1444, 9, 650, NULL, NULL, NULL, NULL, NULL),
(1445, 9, 651, NULL, NULL, NULL, NULL, NULL),
(1446, 9, 652, NULL, NULL, NULL, NULL, NULL),
(1447, 9, 653, NULL, NULL, NULL, NULL, NULL),
(1448, 9, 654, NULL, NULL, NULL, NULL, NULL),
(1449, 9, 655, NULL, NULL, NULL, NULL, NULL),
(1450, 9, 656, NULL, NULL, NULL, NULL, NULL),
(1451, 9, 657, NULL, NULL, NULL, NULL, NULL),
(1452, 9, 658, NULL, NULL, NULL, NULL, NULL),
(1453, 9, 659, NULL, NULL, NULL, NULL, NULL),
(1454, 9, 660, NULL, NULL, NULL, NULL, NULL),
(1455, 9, 661, NULL, NULL, NULL, NULL, NULL),
(1456, 9, 662, NULL, NULL, NULL, NULL, NULL),
(1457, 9, 663, NULL, NULL, NULL, NULL, NULL),
(1458, 9, 664, NULL, NULL, NULL, NULL, NULL),
(1459, 9, 665, NULL, NULL, NULL, NULL, NULL),
(1460, 9, 666, NULL, NULL, NULL, NULL, NULL),
(1461, 9, 667, NULL, NULL, NULL, NULL, NULL),
(1462, 9, 668, NULL, NULL, NULL, NULL, NULL),
(1463, 9, 669, NULL, NULL, NULL, NULL, NULL),
(1464, 9, 670, NULL, NULL, NULL, NULL, NULL),
(1465, 9, 671, NULL, NULL, NULL, NULL, NULL),
(1466, 9, 672, NULL, NULL, NULL, NULL, NULL),
(1467, 9, 673, NULL, NULL, NULL, NULL, NULL),
(1468, 9, 674, NULL, NULL, NULL, NULL, NULL),
(1469, 9, 675, NULL, NULL, NULL, NULL, NULL),
(1470, 9, 676, NULL, NULL, NULL, NULL, NULL),
(1471, 9, 677, NULL, NULL, NULL, NULL, NULL),
(1472, 9, 678, NULL, NULL, NULL, NULL, NULL),
(1473, 9, 679, NULL, NULL, NULL, NULL, NULL),
(1474, 9, 680, NULL, NULL, NULL, NULL, NULL),
(1475, 9, 681, NULL, NULL, NULL, NULL, NULL),
(1476, 9, 682, NULL, NULL, NULL, NULL, NULL),
(1477, 9, 683, NULL, NULL, NULL, NULL, NULL),
(1478, 9, 684, NULL, NULL, NULL, NULL, NULL),
(1479, 9, 685, NULL, NULL, NULL, NULL, NULL),
(1480, 9, 686, NULL, NULL, NULL, NULL, NULL),
(1481, 9, 687, NULL, NULL, NULL, NULL, NULL),
(1482, 9, 688, NULL, NULL, NULL, NULL, NULL),
(1483, 9, 689, NULL, NULL, NULL, NULL, NULL),
(1484, 9, 690, NULL, NULL, NULL, NULL, NULL),
(1485, 9, 691, NULL, NULL, NULL, NULL, NULL),
(1486, 9, 692, NULL, NULL, NULL, NULL, NULL),
(1487, 9, 693, NULL, NULL, NULL, NULL, NULL),
(1488, 9, 694, NULL, NULL, NULL, NULL, NULL),
(1489, 9, 695, NULL, NULL, NULL, NULL, NULL),
(1490, 9, 696, NULL, NULL, NULL, NULL, NULL),
(1491, 9, 697, NULL, NULL, NULL, NULL, NULL),
(1492, 9, 698, NULL, NULL, NULL, NULL, NULL),
(1493, 9, 699, NULL, NULL, NULL, NULL, NULL),
(1494, 9, 700, NULL, NULL, NULL, NULL, NULL),
(1495, 9, 701, NULL, NULL, NULL, NULL, NULL),
(1496, 9, 702, NULL, NULL, NULL, NULL, NULL),
(1497, 9, 703, NULL, NULL, NULL, NULL, NULL),
(1498, 9, 704, NULL, NULL, NULL, NULL, NULL),
(1499, 9, 705, NULL, NULL, NULL, NULL, NULL),
(1500, 9, 706, NULL, NULL, NULL, NULL, NULL),
(1501, 9, 707, NULL, NULL, NULL, NULL, NULL),
(1502, 9, 708, NULL, NULL, NULL, NULL, NULL),
(1503, 9, 709, NULL, NULL, NULL, NULL, NULL),
(1504, 9, 710, NULL, NULL, NULL, NULL, NULL),
(1505, 9, 711, NULL, NULL, NULL, NULL, NULL),
(1506, 9, 712, NULL, NULL, NULL, NULL, NULL),
(1507, 9, 713, NULL, NULL, NULL, NULL, NULL),
(1508, 9, 714, NULL, NULL, NULL, NULL, NULL),
(1509, 9, 715, NULL, NULL, NULL, NULL, NULL),
(1510, 9, 716, NULL, NULL, NULL, NULL, NULL),
(1511, 9, 717, NULL, NULL, NULL, NULL, NULL),
(1512, 9, 718, NULL, NULL, NULL, NULL, NULL),
(1513, 9, 719, NULL, NULL, NULL, NULL, NULL),
(1514, 9, 720, NULL, NULL, NULL, NULL, NULL),
(1515, 9, 721, NULL, NULL, NULL, NULL, NULL),
(1516, 9, 722, NULL, NULL, NULL, NULL, NULL),
(1517, 9, 723, NULL, NULL, NULL, NULL, NULL),
(1518, 9, 724, NULL, NULL, NULL, NULL, NULL),
(1519, 9, 725, NULL, NULL, NULL, NULL, NULL),
(1520, 9, 726, NULL, NULL, NULL, NULL, NULL),
(1521, 9, 727, NULL, NULL, NULL, NULL, NULL),
(1522, 9, 728, NULL, NULL, NULL, NULL, NULL),
(1523, 9, 729, NULL, NULL, NULL, NULL, NULL),
(1524, 9, 730, NULL, NULL, NULL, NULL, NULL),
(1525, 9, 731, NULL, NULL, NULL, NULL, NULL),
(1526, 9, 732, NULL, NULL, NULL, NULL, NULL),
(1527, 9, 733, NULL, NULL, NULL, NULL, NULL),
(1528, 9, 734, NULL, NULL, NULL, NULL, NULL),
(1529, 9, 735, NULL, NULL, NULL, NULL, NULL),
(1530, 9, 736, NULL, NULL, NULL, NULL, NULL),
(1531, 9, 737, NULL, NULL, NULL, NULL, NULL),
(1532, 9, 738, NULL, NULL, NULL, NULL, NULL),
(1533, 9, 739, NULL, NULL, NULL, NULL, NULL),
(1534, 9, 740, NULL, NULL, NULL, NULL, NULL),
(1535, 9, 741, NULL, NULL, NULL, NULL, NULL),
(1536, 9, 742, NULL, NULL, NULL, NULL, NULL),
(1537, 9, 743, NULL, NULL, NULL, NULL, NULL),
(1538, 9, 744, NULL, NULL, NULL, NULL, NULL),
(1539, 9, 745, NULL, NULL, NULL, NULL, NULL),
(1540, 9, 746, NULL, NULL, NULL, NULL, NULL),
(1541, 9, 747, NULL, NULL, NULL, NULL, NULL),
(1542, 9, 748, NULL, NULL, NULL, NULL, NULL),
(1543, 9, 749, NULL, NULL, NULL, NULL, NULL),
(1544, 9, 750, NULL, NULL, NULL, NULL, NULL),
(1545, 9, 751, NULL, NULL, NULL, NULL, NULL),
(1546, 9, 752, NULL, NULL, NULL, NULL, NULL),
(1547, 9, 753, NULL, NULL, NULL, NULL, NULL),
(1548, 9, 754, NULL, NULL, NULL, NULL, NULL),
(1549, 9, 755, NULL, NULL, NULL, NULL, NULL),
(1550, 9, 756, NULL, NULL, NULL, NULL, NULL),
(1551, 9, 757, NULL, NULL, NULL, NULL, NULL),
(1552, 9, 758, NULL, NULL, NULL, NULL, NULL),
(1553, 9, 759, NULL, NULL, NULL, NULL, NULL),
(1554, 9, 760, NULL, NULL, NULL, NULL, NULL),
(1555, 9, 761, NULL, NULL, NULL, NULL, NULL),
(1556, 9, 762, NULL, NULL, NULL, NULL, NULL),
(1557, 9, 763, NULL, NULL, NULL, NULL, NULL),
(1558, 9, 764, NULL, NULL, NULL, NULL, NULL),
(1559, 9, 765, NULL, NULL, NULL, NULL, NULL),
(1560, 9, 766, NULL, NULL, NULL, NULL, NULL),
(1561, 9, 767, NULL, NULL, NULL, NULL, NULL),
(1562, 9, 768, NULL, NULL, NULL, NULL, NULL),
(1563, 9, 769, NULL, NULL, NULL, NULL, NULL),
(1564, 9, 770, NULL, NULL, NULL, NULL, NULL),
(1565, 9, 771, NULL, NULL, NULL, NULL, NULL),
(1566, 9, 772, NULL, NULL, NULL, NULL, NULL),
(1567, 9, 773, NULL, NULL, NULL, NULL, NULL),
(1568, 9, 774, NULL, NULL, NULL, NULL, NULL),
(1569, 9, 775, NULL, NULL, NULL, NULL, NULL),
(1570, 9, 776, NULL, NULL, NULL, NULL, NULL),
(1571, 9, 777, NULL, NULL, NULL, NULL, NULL),
(1572, 9, 778, NULL, NULL, NULL, NULL, NULL),
(1573, 9, 779, NULL, NULL, NULL, NULL, NULL),
(1574, 9, 780, NULL, NULL, NULL, NULL, NULL),
(1575, 9, 781, NULL, NULL, NULL, NULL, NULL),
(1576, 9, 782, NULL, NULL, NULL, NULL, NULL),
(1577, 9, 783, NULL, NULL, NULL, NULL, NULL),
(1578, 9, 784, NULL, NULL, NULL, NULL, NULL),
(1579, 9, 785, NULL, NULL, NULL, NULL, NULL),
(1580, 9, 786, NULL, NULL, NULL, NULL, NULL),
(1581, 9, 787, NULL, NULL, NULL, NULL, NULL),
(1582, 9, 788, NULL, NULL, NULL, NULL, NULL),
(1583, 9, 789, NULL, NULL, NULL, NULL, NULL),
(1584, 9, 790, NULL, NULL, NULL, NULL, NULL),
(1585, 9, 791, NULL, NULL, NULL, NULL, NULL),
(1586, 9, 792, NULL, NULL, NULL, NULL, NULL),
(1587, 9, 793, NULL, NULL, NULL, NULL, NULL),
(1588, 9, 794, NULL, NULL, NULL, NULL, NULL),
(1589, 9, 795, NULL, NULL, NULL, NULL, NULL),
(1590, 9, 796, NULL, NULL, NULL, NULL, NULL),
(1591, 9, 797, NULL, NULL, NULL, NULL, NULL),
(1592, 9, 798, NULL, NULL, NULL, NULL, NULL),
(1593, 9, 799, NULL, NULL, NULL, NULL, NULL),
(1594, 9, 800, NULL, NULL, NULL, NULL, NULL),
(1595, 9, 801, NULL, NULL, NULL, NULL, NULL),
(1596, 9, 802, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `school_years`
--

CREATE TABLE `school_years` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1: 2 nam, 2: 4 nam',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `school_years`
--

INSERT INTO `school_years` (`id`, `name`, `course`, `type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, '2015 - 2019', 'K15', 2, NULL, NULL, NULL, NULL, NULL),
(2, '2016 - 2020', 'K16', 2, NULL, NULL, NULL, NULL, NULL),
(3, '2017 - 2021', 'K17', 2, NULL, NULL, NULL, NULL, NULL),
(4, '2018 - 2022', 'K18', 2, NULL, NULL, NULL, NULL, NULL),
(5, '2015 - 2016', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(6, '2016 - 2017', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(7, '2017 - 2018', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(8, '2018 - 2019', NULL, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `school_year_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: Male, 2: Female, 3: Other',
  `identity_card` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_youth_union_member` tinyint(1) DEFAULT '1' COMMENT '1: Yes, 2: No',
  `is_study` tinyint(1) DEFAULT '1' COMMENT '1: Còn học, 2: Đã tốt nghiệp, 3: Bảo lưu, 4: Nghỉ học',
  `date_on_union` date DEFAULT NULL,
  `is_payed_union_fee` tinyint(1) DEFAULT '1' COMMENT '1: Đã đóng, 2: Chưa đóng',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`student_id`, `name`, `class_id`, `school_year_id`, `address`, `birthday`, `sex`, `identity_card`, `phone_no`, `is_youth_union_member`, `is_study`, `date_on_union`, `is_payed_union_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `image`) VALUES
('000000', 'Test', 1, 1, NULL, '1997-08-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:37:30', '2019-04-11 07:37:30', NULL, NULL, NULL, 'null'),
('15110156', 'Phùng Văn An', 2, 1, '129, Trà Vong, H Tân Biên, Tây Ninh', '1995-01-02', 1, '291128561', '', 1, 1, NULL, 1, '2019-04-11 07:47:44', '2019-04-11 07:47:44', 1, NULL, NULL, 'null'),
('15110158', 'Trần Bảo Ân', 2, 1, '11, Phú Long, H Hàm Thuận Bắc, Bình Thuận', '1997-01-15', 1, '261480605', NULL, 1, 2, NULL, 1, '2019-04-11 07:47:44', '2019-04-11 07:47:44', 1, NULL, NULL, 'null'),
('15110159', 'Lê Ngọc Bảo', 2, 1, '5, Bảo Hòa, H Xuân Lộc, Đồng Nai', '1997-06-25', 1, '272620565', '01635691402', 1, 2, NULL, 1, '2019-04-11 07:47:44', '2019-04-11 07:47:44', 1, NULL, NULL, 'null'),
('15110160', 'Nguyễn Lê Đức Bảo', 2, 1, '122B/68/29,KP6, Tân Tiến, Đồng Nai', '1997-04-17', 1, '272563252', '', 1, 1, NULL, 1, '2019-04-11 07:47:44', '2019-04-11 07:47:44', 1, NULL, NULL, 'null'),
('15110161', 'Phạm Quốc Bảo', 2, 1, 'H Hóc Môn, TP. Hồ Chí Minh', '1997-11-03', 1, '025664768', '0903622217', 1, 1, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110162', 'Vũ Văn Bảo', 1, 1, 'H Krông Pắc, Đăk Lăk', '1997-07-24', 1, '241702998', NULL, 1, 3, '2019-06-16', 1, '2019-04-11 07:45:24', '2019-06-30 00:39:06', 1, NULL, NULL, 'null'),
('15110164', 'Nguyễn Đức Bốn', 2, 1, 'H Thống Nhất, Đồng Nai', '1997-01-05', 1, '272494904', '0981679203', 1, 1, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110165', 'Nguyễn Lê Bửu', 2, 1, 'TX Buôn Hồ, Đăk Lăk', '1997-10-03', 1, '241691540', '', 1, 1, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110166', 'Huỳnh Minh Chiến', 1, 1, 'H Chợ Gạo, Tiền Giang', '1997-10-29', 1, '312329132', '', 1, 2, NULL, 1, '2019-04-11 07:45:24', '2019-05-05 05:39:44', 1, NULL, NULL, 'null'),
('15110167', 'Trần Văn Chinh', 2, 1, 'H Tân Phú Đông, Tiền Giang', '1996-06-12', 1, '312283013', '01675309885', 1, 1, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110168', 'Nguyễn Tô Doanh Chuẩn', 1, 1, '363/6/40, Phường Bình Trị Đông A, Q Bình Tân, TP. Hồ Chí Minh', '1997-11-03', 1, '025794948', '', 1, 1, NULL, 1, '2019-04-11 07:45:24', '2019-04-11 07:45:24', 1, NULL, NULL, 'null'),
('15110170', 'Trịnh Văn Công', 4, 1, NULL, '1997-01-16', 1, NULL, NULL, 1, 2, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110171', 'Trịnh Văn Công', 1, 1, 'Xã EaBung, H Ea Súp, Đăk Lăk', '1997-03-03', 1, '241643373', '01637012455', 1, 2, NULL, 1, '2019-04-11 07:45:24', '2019-04-11 07:45:24', 1, NULL, NULL, 'null'),
('15110172', 'Huỳnh Thế Cương', 3, 1, '75/20, Xã Phú Hòa Đông, H Củ Chi, TP. Hồ Chí Minh', '1997-12-29', 1, '025564898', '', 1, 1, NULL, 1, '2019-04-11 07:56:07', '2019-04-11 07:56:07', 1, NULL, NULL, 'null'),
('15110173', 'Bùi Phan Viết Cường', 2, 1, 'Phường Thác Mơ, H Phước Long, Bình Phước', '1997-09-03', 1, '285646130', '', 1, 2, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110174', 'Nguyễn Mạnh Cường', 2, 1, '118, Tân Phú 1 - xã Đinh Lạc, H Di Linh, Lâm Đồng', '1997-10-15', 1, '251082121', '0961923445', 1, 2, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110175', 'Trần Quốc Cường', 3, 1, '3/17, Nguyễn Văn Cừ, TP Qui Nhơn, Bình Định', '1997-10-21', 1, '215408252', NULL, 1, 2, NULL, 1, '2019-04-11 07:56:07', '2019-04-11 07:56:07', 1, NULL, NULL, 'null'),
('15110176', 'Lê Thanh Danh', 2, 1, 'H Tư Nghĩa, Quảng Ngãi', '1997-02-20', 1, '212674237', '', 1, 2, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, '56395081_1099331386935764_6085244934967787520_n.jpg'),
('15110177', 'Lê Thái Duy', 1, 1, 'H Triệu Phong, Quảng Trị', '1996-02-02', 1, '197339835', '', 1, 1, NULL, 1, '2019-04-11 07:45:24', '2019-04-11 07:45:24', 1, NULL, NULL, 'null'),
('15110178', 'Nguyễn Hoàng Hiếu Duy', 1, 1, 'Số 9, Xã Lộc An, H Long Thành, Đồng Nai', '1990-04-10', 1, '272027259', '', 1, 2, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110179', 'Nguyễn Thành Duy', 3, 1, '100, xã Ea Yông, H Krông Pắc, Đăk Lăk', '1994-12-04', 1, '241540928', NULL, 1, 3, NULL, 1, '2019-04-11 07:56:07', '2019-04-11 07:56:07', 1, NULL, NULL, 'null'),
('15110180', 'Phạm Nhật Duy', 3, 1, '88/13/19/2, An Phước, H Long Thành, Đồng Nai', '1997-09-06', 1, '272604315', '', 1, 1, NULL, 1, '2019-04-11 07:56:07', '2019-04-11 07:56:07', 1, NULL, NULL, 'null'),
('15110181', 'Phạm Thanh Duy', 2, 1, '42/3, An Bình, H Long Hồ, Vĩnh Long', '1997-04-13', 1, '331843138', '0931800469', 1, 1, NULL, 1, '2019-04-11 07:47:45', '2019-04-11 07:47:45', 1, NULL, NULL, 'null'),
('15110182', 'Vũ Thị Duyên', 1, 1, 'Xuân Bắc, H Xuân Lộc, Đồng Nai', '1997-02-08', 2, '272538914', '', 1, 2, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110183', 'Dương Đại Dũng', 1, 1, 'H Long Thành, Đồng Nai', '1997-09-19', 1, '272592436', '', 1, 1, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110184', 'Trần Tiến Dương', 2, 1, 'Nam Chính, H Tiền Hải, Thái Bình', '1997-08-01', 1, '152128204', '', 1, 2, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110185', 'Võ Trần Quốc Đại', 2, 1, 'Phổ Quang, H Đức Phổ, Quảng Ngãi', '1997-01-27', 1, '212279384', '', 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110186', 'Diệp Thành Đạt', 4, 1, NULL, '1997-05-13', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110187', 'Lê Công Đạt', 2, 1, 'H Hoà Thành, Tây Ninh', '1997-05-16', 1, '291140728', '', 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110188', 'Nguyễn Quốc Đạt', 1, 1, '176, xã Diên Điền, H Diên Khánh, Khánh Hòa', '1997-05-24', 1, '225711932', '01693508795', 1, 3, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110190', 'Huỳnh Trung Đăng', 2, 1, 'TP Biên Hòa, Đồng Nai', '1997-01-28', 1, '272456435', '', 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110191', 'Trần Mạnh Đô', 1, 1, 'H Đức Thọ, Hà Tĩnh', '1997-08-03', 1, '184261155', '', 1, 3, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110192', 'Lê Thiện Đức', 1, 1, '0870, Lê Chánh, H Tân Châu, An Giang', '1997-09-10', 1, '352306488', NULL, 1, 1, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110193', 'Nguyễn Phi Long Hoàng Giang', 1, 1, 'Lâm Đồng', '1996-07-22', 1, '251006521', '', 1, 3, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110194', 'Đinh Văn Giao', 2, 1, 'H Giao Thủy, Nam Định', '1996-07-03', 1, '163291473', '', 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110195', 'Võ Hoàng Hà', 1, 1, 'Phường Long Phước, H Phước Long, Bình Phước', '1997-12-08', 1, '285647662', '', 1, 1, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110196', 'Lâm Chí Hào', 3, 1, 'H Cái Bè, Tiền Giang', '1997-02-13', 1, '312316978', '', 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110197', 'Lê Hồng Hải', 2, 1, 'TX Bắc Ninh, Bắc Ninh', '1997-01-01', 1, '125691025', '', 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110198', 'Đỗ Minh Hậu', 1, 1, 'Bảo Thạnh, H Ba Tri, Bến Tre', '1995-08-19', 1, '321533899', '', 1, 1, NULL, 1, '2019-04-11 07:45:25', '2019-04-11 07:45:25', 1, NULL, NULL, 'null'),
('15110200', 'Trần Công Hậu', 2, 1, 'H Di Linh, Lâm Đồng', '1997-05-15', 1, '251069643', '', 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110201', 'Nguyễn Thị Hiền', 1, 1, 'xã Cư ÊBur, TP Buôn Ma Thuột, Đăk Lăk', '1997-09-16', 2, '241791013', '', 1, 3, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110202', 'Đặng Ngọc Hiếu', 1, 1, '23, Phú Đông, TX Tuy Hòa, Phú Yên', '1997-08-14', 1, '221411732', '', 1, 1, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110203', 'Hoàng Minh Hiếu', 3, 1, 'Xuân Tâm, H Xuân Lộc, Đồng Nai', '1997-03-28', 1, '272556934', '', 1, 3, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110204', 'Lê Vy Nhật Hiếu', 3, 1, 'H Đăk Pơ, Gia Lai', '1997-09-09', 2, '231010242', NULL, 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-07-03 08:51:28', 1, NULL, NULL, 'kcq8_40108988_874935349361891_4670883634272534528_n.jpg'),
('15110205', 'Hoàng Đức Hiệp', 3, 1, 'Ea Bung, H Ea Súp, Đăk Lăk', '1997-08-20', 1, '241640461', '', 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110206', 'Lê Vũ Hoàng Hiệp', 3, 1, 'Hành Minh, H Nghĩa Hành, Quảng Ngãi', '1997-01-04', 1, '212797258', '', 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110207', 'Phạm Đăng Hùng Hiệp', 3, 1, '52, Hiệp Ninh, TX Tây Ninh, Tây Ninh', '1997-02-23', 1, '291167100', '', 1, 4, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110208', 'Đinh Văn Hinh', 1, 1, 'Giao Long, H Giao Thủy, Nam Định', '1997-06-08', 1, '163319654', NULL, 1, 1, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110209', 'Nguyễn Huy Hoàng', 2, 1, 'H Cư Kuin, Đăk Lăk', '1997-01-20', 1, '241565697', NULL, 1, 1, NULL, 1, '2019-04-11 07:47:46', '2019-04-11 07:47:46', 1, NULL, NULL, 'null'),
('15110210', 'Nguyễn Minh Hoàng', 4, 1, NULL, '1997-06-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110211', 'Trần Kim Hoàng', 4, 1, NULL, '1997-01-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110212', 'Hồ Huy Hòa', 1, 1, '59B, Đà Lạt, TP Đà Lạt, Lâm Đồng', '1997-01-22', 1, '250970910', NULL, 1, 4, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110213', 'Võ Long Hồ', 2, 1, '820/41, Bình Đức, TP Long Xuyên, An Giang', '1997-07-06', 1, '352388799', NULL, 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110214', 'Ngô Văn Huy', 3, 1, 'Đức Hòa, H Mộ Đức, Quảng Ngãi', '1997-04-20', 1, '212716100', '', 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110215', 'Nguyễn Quang Huy', 3, 1, 'Xã Nghĩa Kỳ, H Tư Nghĩa, Quảng Ngãi', '1997-06-20', 1, '212383726', '', 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110216', 'Nguyễn Khánh Huy', 3, 1, 'Xã Nghi Hợp, H Nghi Lộc, Nghệ An', '1997-11-11', 1, '187713456', '0985246727', 1, 1, NULL, 1, '2019-04-11 07:56:08', '2019-04-11 07:56:08', 1, NULL, NULL, 'null'),
('15110217', 'Phạm Bảo Hoàng Huy', 3, 1, '368, xã phước đông, H Cần Đước, Long An', '1997-12-22', 1, '301605456', NULL, 1, 4, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110218', 'Phạm Ngọc Huy', 2, 1, '307, xã Eahu, H Cư Kuin, Đăk Lăk', '1997-06-11', 1, '241568362', '01639657978', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110219', 'Đoàn Xuân Hùng', 1, 1, 'Xóm 2 Thôn Trúc Ly, Võ Ninh, H Quảng Ninh, Quảng Bình', '1997-09-02', 1, '194598072', '01635299937', 1, 1, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110220', 'Huỳnh Phi Hùng', 1, 1, '30/5, Liên Hiệp/Đức Trọng/Lâm Đồng, H Đức Trọng, Lâm Đồng', '1997-01-02', 1, '251020776', '0981720196', 1, 1, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110221', 'Nguyễn Đình Hùng', 2, 1, 'xóm, đại sơn, H Đô Lương, Nghệ An', '1996-03-17', 1, '187612076', '0976099453', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110222', 'Nguyễn Văn Hùng', 3, 1, '30, Đức Mạnh, H Đăk Mil, Đăk Nông', '1997-11-10', 1, '245306264', '0987337257', 1, 1, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110223', 'Trịnh Thế Hùng', 1, 1, '168 Thôn Hòa An, Ea Nuôt, H Buôn Đôn, Đăk Lăk', '1997-06-17', 1, '241509331', '0969292301', 1, 4, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110224', 'Phan Văn Hưng', 3, 1, 'Đức Thành, H Yên Thành, Nghệ An', '1997-04-01', 1, '187657144', '01648626936', 1, 1, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110225', 'Phạm Thế Hữu', 4, 1, NULL, '1997-07-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110226', 'Phạm Minh Kế', 1, 1, 'Nghĩa Ký, H Tư Nghĩa, Quảng Ngãi', '1997-05-10', 1, '212673885', '01644337163', 1, 1, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110227', 'Lê Hoàng Kha', 1, 1, '09, Thị trấn Cần Giuộc, H Cần Giuộc, Long An', '1997-09-28', 1, '301616888', '0932687444', 1, 1, NULL, 1, '2019-04-11 07:45:26', '2019-04-11 07:45:26', 1, NULL, NULL, 'null'),
('15110228', 'Nguyễn Tiên Kha', 1, 1, 'Tịnh Hoà, Tp. Quảng Ngãi, Quảng Ngãi', '1997-07-28', 1, '212482947', '01645449251', 1, 4, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110229', 'Lê Tấn Khang', 1, 1, '09 Phương Câu, Vạn Thạnh, TP Nha Trang, Khánh Hòa', '1997-06-24', 1, '225596662', '01869404456', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110230', 'Nguyễn Quang Khải', 1, 1, '272 Quỳnh Ngọc I, Eana, H Krông Ana, Đăk Lăk', '1997-09-20', 1, '241564799', '0962221944', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110231', 'Hoàng Văn Khánh', 1, 1, 'Hưng Trạch, H Bố Trạch, Quảng Bình', '1997-09-02', 1, '194596409', '', 1, 4, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110232', 'Nguyễn Phi Khánh', 2, 1, '018, Xã Tăng Hòa, H Gò Công Đông, Tiền Giang', '1997-09-27', 1, '312301283', '01628986159', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110233', 'Nguyễn Văn Khánh', 1, 1, '393, Phong Mỹ, TX Cao Lãnh, Đồng Tháp', '1997-08-25', 1, '341950036', '01204806531', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110234', 'Huỳnh Văn Khen', 1, 1, '35, Kiên Lương, H Kiên Lương, Kiên Giang', '1997-01-22', 1, '371810961', '', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110235', 'Nguyễn Dương Văn Khoa', 4, 1, NULL, '1997-04-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110236', 'Bạch Trung Kiên', 1, 1, 'Hưng Phú, H Hưng Nguyên, Nghệ An', '1997-02-07', 1, '187439972', '0974039537', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110237', 'Dương Tuấn Kiệt', 3, 1, '49, Thị trấn Thanh Bình, H Bù Đốp, Bình Phước', '1997-08-08', 1, '285568919', '01646356275', 0, 1, '2019-04-13', 0, '2019-04-11 07:56:09', '2019-07-06 21:02:51', 1, NULL, NULL, 'l1Zl_avatar.jpg'),
('15110238', 'Nguyễn Sơn Lâm', 3, 1, '14/109/66 Nguyễn Sơn, Gia Thụy, Q Long Biên, Hà Nội', '1996-01-03', 1, '013309246', '01634301455', 1, 1, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110240', 'Lâm Quang Lịch', 4, 1, NULL, '1997-12-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:10', '2019-04-11 07:58:10', 1, NULL, NULL, 'null'),
('15110241', 'Đinh Anh Long', 2, 1, 'H Bảo Lâm, Lâm Đồng', '1997-08-19', 1, '251124444', NULL, 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110242', 'Nguyễn Hoàng Long', 1, 1, '262, xã Bình Khánh, H Cần Giờ, TP. Hồ Chí Minh', '1997-06-03', 1, '025447664', '01866266362', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110243', 'Nguyễn Đình Lộc', 2, 1, 'Ấp Phương Vỹ, Suối Cao, H Xuân Lộc, Đồng Nai', '1997-05-04', 1, '272676165', '01698595893', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110244', 'Nguyễn Huỳnh Bá Lộc', 3, 1, 'Tiền Giang', '1997-09-18', 1, '312372900', NULL, 1, 1, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110245', 'Phạm Hữu Lộc', 1, 1, 'Ialy, Ialy, H Chư Păh, Gia Lai', '1997-10-25', 1, '231127863', '01685817658', 1, 1, NULL, 1, '2019-04-11 07:45:27', '2019-04-11 07:45:27', 1, NULL, NULL, 'null'),
('15110246', 'Bùi Thế Lượng', 1, 1, 'Bình Hòa, H Thuận An, Bình Dương', '1997-03-15', 1, '215412556', '01656465814', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110247', 'Dư Minh Lực', 1, 1, '3/21, phường 4, TP Cà Mau, Cà Mau', '1997-11-12', 1, '381795767', '0947908617', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110248', 'Nguyễn Văn Lực', 3, 1, 'Đliêya, H Krông Năng, Đăk Lăk', '1996-01-27', 1, '221370991', '01649938122', 1, 1, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110249', 'Trần Minh', 2, 1, '180/1, 2, TP Vũng Tàu, Bà Rịa - Vũng Tàu', '1997-08-09', 1, '273642054', '0933984921', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110250', 'Trần Quang Minh', 1, 1, 'Văn Tứ Đông, Cam Hòa, H Cam Lâm, Khánh Hòa', '1997-03-26', 1, '225760516', '01632458816', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110251', 'Nguyễn Thị Trúc My', 1, 1, 'Xã Tân Phước, H Gò Công Đông, Tiền Giang', '1997-02-18', 2, '312301847', '01672109425', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110252', 'Đào Thị Mỹ', 1, 1, 'Phổ Cường, H Đức Phổ, Quảng Ngãi', '1997-06-04', 2, '212281655', '0984372831', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110253', 'Phạm Lương Mỹ', 1, 1, '49, 11, Q Tân Bình, TP. Hồ Chí Minh', '1997-06-24', 1, '025549464', '0939097743', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110254', 'Lê Ngọc Nam', 3, 1, 'Xuân Tín, H Thọ Xuân, Thanh Hóa', '1997-11-13', 1, '174825210', '', 1, 1, NULL, 1, '2019-04-11 07:56:09', '2019-04-11 07:56:09', 1, NULL, NULL, 'null'),
('15110255', 'Lưu Phước Phương Nam', 2, 1, 'xã Quảng Thành, H Châu Đức, Bà Rịa - Vũng Tàu', '1997-11-17', 1, '273629896', '0988575470', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110256', 'Nguyễn Hải Nam', 4, 1, NULL, '1996-10-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110257', 'Vương Hoài Nam', 2, 1, '41/142, Long Hải, H Long Điền, Bà Rịa - Vũng Tàu', '1997-07-30', 1, '273599137', '01222667545', 1, 1, NULL, 1, '2019-04-11 07:47:47', '2019-04-11 07:47:47', 1, NULL, NULL, 'null'),
('15110258', 'Đoàn Đức Nghĩa', 3, 1, '10 Đường 11, Kp.6, Hiệp Bình Chánh, H Nghĩa Hưng, Nam Định', '1997-07-07', 1, '163412119', '', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110259', 'Nguyễn Hữu Nghĩa', 2, 1, '140 Ấp Bình Hòa, Bình Thạnh, TX Cao Lãnh, Đồng Tháp', '1997-06-24', 1, '341831896', '01696757628', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110260', 'Đoàn Quang Nghị', 2, 1, 'Tổ 4 Ấp 13, Minh Đức, H Hớn Quản, Bình Phước', '1997-09-15', 1, '285641745', '01669154090', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110261', 'Nguyễn Hữu Nghị', 3, 1, '09, An Bình Tây, H Ba Tri, Bến Tre', '1997-11-08', 1, '321702958', '01649946546', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110262', 'Ngô Huỳnh Nguyên', 3, 1, '58/13a, Phường Tân Chánh Hiệp, Quận 12, TP. Hồ Chí Minh', '1997-03-23', 1, '025632012', '01887127403', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110263', 'Nguyễn Thanh Nhã', 1, 1, '387, Ấp 1, xã Bàu Cạn, Long Thành - Đồng Nai, H Long Thành, Đồng Nai', '1997-03-09', 1, '272541833', '', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110264', 'Lê Anh Nhân', 1, 1, 'Nghĩa Hòa, H Tư Nghĩa, Quảng Ngãi', '1997-10-09', 1, '212677958', '0935890697', 1, 1, NULL, 1, '2019-04-11 07:45:28', '2019-04-11 07:45:28', 1, NULL, NULL, 'null'),
('15110265', 'Võ Hoàng Nhân', 2, 1, '108/PL, Phú Ngãi, H Ba Tri, Bến Tre', '1997-11-07', 1, '321701689', '0186182448', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110266', 'Cao Xuân Nhẫn', 2, 1, 'Cát Tiến, H Phù Cát, Bình Định', '1997-04-10', 1, '215416764', '01639879874', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110267', 'Nguyễn Đình Nhật', 2, 1, '141, Đắk Mâm, H KrôngNô, Đăk Nông', '1995-02-26', 1, '245266103', '01665026205', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110268', 'Lê Thị Thảo Nhi', 1, 1, '184, Long Điền B, H Chợ Mới, An Giang', '1997-06-05', 2, '352485103', '01652715956', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, '48421287_2000278446754334_5856016367102197760_n.jpg'),
('15110269', 'Nguyễn Thị Yến Nhi', 4, 1, NULL, '1997-02-02', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110270', 'Viên Minh Nhựt', 1, 1, 'Tân Phú, H Đồng Phú, Bình Phước', '1997-05-19', 1, '285606060', '01697952833', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110271', 'Cao Xuân Ninh', 1, 1, '01/ tổ 9, Phước Hưng, H Long Điền, Bà Rịa - Vũng Tàu', '1997-11-26', 1, '273677417', '01678693100', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110272', 'Nguyễn Ngọc Phan', 3, 1, 'Nghĩa Mỹ, H Tư Nghĩa, Quảng Ngãi', '1997-04-20', 1, '212678078', '', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110274', 'Nguyễn Trần Tấn Phát', 4, 1, NULL, '1997-06-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110275', 'Trần Phạm Tấn Phát', 1, 1, 'Tam Quan Nam, H Hoài Nhơn, Bình Định', '1997-07-10', 1, '215432483', '01647822789', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110276', 'Trần Huỳnh Phiêu', 2, 1, 'Ấp Tân Thới, Xã Sơn Định, H Chợ Lách, Bến Tre', '1997-11-09', 1, '321566624', '', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110277', 'Hồ Văn Phong', 1, 1, 'Xóm 3 Thôn An Dưỡng I, Hoài Tân, H Hoài Nhơn, Bình Định', '1997-02-08', 1, '215389085', '01642642780', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110278', 'Dương Hồng Phúc', 4, 1, NULL, '1997-06-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110279', 'Nguyễn Thành Phúc', 1, 1, '90, Xã Định Hiệp, huyện Dầu Tiếng, H Dầu Tiếng, Bình Dương', '1997-01-25', 1, '281190383', '01638180818', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110280', 'Ông Thị Diễm Phúc', 1, 1, '28/27, phường Linh chiểu, Q Thủ Đức, TP. Hồ Chí Minh', '1997-10-26', 2, '352449170', '0971777095', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110281', 'Trần Lê Gia Hồng Phúc', 3, 1, '03, tổ 1, ấp 7, xã Tân Ân, H Cần Đước, Long An', '1997-11-17', 1, '301604156', '01629579956', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110282', 'Trần Thiên Phúc', 1, 1, '436/59/11 Cách Mạng Tháng Tám, 11, Quận 3, TP. Hồ Chí Minh', '1997-02-01', 1, '025641931', '01289998434', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110283', 'Hoàng Thị Kim Phụng', 1, 1, 'Xã ÊaPhê, H Krông Pắc, Đăk Lăk', '1994-09-07', 2, '241386440', '01668174561', 1, 1, NULL, 1, '2019-04-11 07:45:29', '2019-04-11 07:45:29', 1, NULL, NULL, 'null'),
('15110284', 'Lê Thị Kiều Phụng', 4, 1, NULL, '1997-12-12', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110285', 'Lê Văn Phụng', 3, 1, '26, Nguyễn Thị Định, Phước Dân, H Ninh Phước, Ninh Thuận', '1995-09-07', 1, '264468073', '09699975478', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110286', 'Mai Quốc Như Nhật Phụng', 2, 1, 'Ấp Phú Cường, Phú Bình, H Tân Phú, Đồng Nai', '1997-12-12', 1, '272492087', '01658093430', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110287', 'Nguyễn Hoài Phương', 1, 1, 'An Thủy, H Ba Tri, Bến Tre', '1997-06-22', 1, '321567950', '0964824963', 1, 1, NULL, 0, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110288', 'Phạm Duy Phương', 3, 1, '120, Đoàn Thị Điểm, Lộc Thanh, TX Bảo Lộc, Lâm Đồng', '1997-01-22', 1, '251135139', '0925555570', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110289', 'Đào Thị Phượng', 1, 1, '71/85/9,tổ 62,kp8 (khu Âp Doi), F15, đường Thống Nhất, Liên Châu, H Yên Lạc, Vĩnh Phúc', '1997-03-09', 2, '135872362', '', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, '38245343_421904824996952_1455110649024610304_n.jpg'),
('15110290', 'Đặng Trương Duy Quang', 1, 1, '493B, Phường Phú Khương, TX Bến Tre, Bến Tre', '1997-11-25', 1, '321593660', '01659432579', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110291', 'Nguyễn Kỳ Quang', 3, 1, '206/40 Đồng Đen, xã Tịnh Châu, Tp. Quảng Ngãi, Quảng Ngãi', '1996-12-25', 1, '212479675', '01674908941', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110292', 'Phùng Đức Quang', 1, 1, '13/7, Trần Quang Khải, Bình Tân, TX Buôn Hồ, Đăk Lăk', '1997-06-15', 1, '241523117', '09955632432', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110293', 'Phạm Thị Quà', 4, 1, NULL, '1997-06-11', 2, NULL, NULL, 1, 1, NULL, 0, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110294', 'Đỗ Hoàng Quân', 1, 1, '26b/1d, Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh', '1997-03-05', 1, '025741978', '01285064732', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110295', 'Trần Lê Anh Quốc', 4, 1, NULL, '1997-03-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110297', 'Trần Phú Quý', 3, 1, 'Phường Long Thủy, H Phước Long, Bình Phước', '1997-12-30', 1, '258648351', '0969549644', 1, 1, NULL, 1, '2019-04-11 07:56:10', '2019-04-11 07:56:10', 1, NULL, NULL, 'null'),
('15110298', 'Trần Phú Quý', 3, 1, 'Phổ Khánh, H Tư Nghĩa, Quảng Ngãi', '1997-11-08', 1, '212279818', '01649467408', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110299', 'Nguyễn Văn Sang', 4, 1, NULL, '1997-03-11', 1, NULL, NULL, 1, 1, NULL, 0, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110300', 'Nguyễn Thanh Sơn', 3, 1, '193, Bàn Long, H Châu Thành, Tiền Giang', '1997-01-01', 1, '312336908', '01213994014', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110301', 'Phạm Thanh Sơn', 1, 1, 'Đông Hải, TX Phan Rang-Tháp Chàm, Ninh Thuận', '1997-02-17', 1, '264448947', '01639157154', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110302', 'Võ Nguyễn Hoàng Sơn', 3, 1, '7/4, Phú Thuận, Quận 7, TP. Hồ Chí Minh', '1997-08-20', 1, '025682204', '01673587001', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110303', 'Nguyễn Văn Sỹ', 3, 1, 'Số 232, ấp 3, Gia Canh, H Định Quán, Đồng Nai', '1997-05-23', 1, '272551954', '0972736782', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110304', 'Giang Minh Tài', 2, 1, '11, Sùng Nhơn, H Đức Linh, Bình Thuận', '1997-03-11', 1, '261508593', '01685767192', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110305', 'Nguyễn Tấn Tài', 2, 1, 'Phú Lộc, H Krông Năng, Đăk Lăk', '1997-11-15', 1, '241705261', '01238233336', 1, 1, NULL, 1, '2019-04-11 07:47:48', '2019-04-11 07:47:48', 1, NULL, NULL, 'null'),
('15110306', 'Nguyễn Văn Tài', 1, 1, '48, Đạ Teh, H Đạ Tẻh, Lâm Đồng', '1997-05-17', 1, '251111331', '01689618171', 1, 1, NULL, 0, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110307', 'Trương Tấn Tài', 2, 1, 'Sơn Hội, H Sơn Hòa, Phú Yên', '1997-09-15', 1, '221447017', '09676384149', 1, 1, NULL, 1, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110308', 'Võ Phước Tân', 1, 1, '897/12, phường Bình Thắng, H Dĩ An, Bình Dương', '1997-05-06', 1, '281136389', '', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110309', 'Lê Phước Thanh', 3, 1, '82/3, Hiệp Bình Phước, Q Thủ Đức, TP. Hồ Chí Minh', '1997-03-31', 1, '026010891', '0937217351', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110310', 'Nguyễn Viết Thanh', 1, 1, 'Hồ Tùng Mậu, Tân Thanh, TX Tam Kỳ, Quảng Nam', '1997-01-01', 1, '206314588', '01634049975', 1, 1, NULL, 1, '2019-04-11 07:45:30', '2019-04-11 07:45:30', 1, NULL, NULL, 'null'),
('15110311', 'Hồ Nhất Thành', 1, 1, 'Đội 6 Thôn Cộng Hòa I, Tịnh Ấn Tây, Tp. Quảng Ngãi, Quảng Ngãi', '1997-07-21', 1, '212474688', '01668718790', 0, 1, NULL, 0, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110312', 'Tạ Tích Thành', 1, 1, 'Cây Gáo, Trảng Bom, Đồng Nai', '1997-06-24', 1, '272667052', '0978169503', 1, 1, NULL, 0, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110313', 'Trần Minh Thành', 3, 1, 'Ngan Dừa, H Hồng Dân, Bạc Liêu', '1997-02-03', 1, '385756864', '', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110314', 'Nguyễn Thị Thanh Thảo', 2, 1, 'Thạnh Lợi, H Vĩnh Thanh, Cần Thơ', '1997-03-08', 2, '362484135', '01688360937', 1, 1, NULL, 1, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110315', 'Phạm Đại Thạch', 1, 1, 'Củng Sơn, H Sơn Hòa, Phú Yên', '1997-02-25', 1, '221444366', '01694676100', 1, 1, NULL, 1, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110316', 'Đoàn Thanh Thắng', 2, 1, 'Thiện Hưng, H Bù Đốp, Bình Phước', '1996-10-22', 1, '285570592', '', 1, 1, NULL, 0, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110317', 'Nguyễn Đức Thắng', 2, 1, 'H Phú Hòa, Phú Yên', '1997-06-20', 1, '221423755', '0944924822', 1, 1, NULL, 1, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110318', 'Trần Hải Anh Thi', 2, 1, 'Hòa Trị, TX Bảo Lộc, Lâm Đồng', '1997-05-26', 1, '251029489', '0944924822', 1, 1, NULL, 0, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110319', 'Lương Trọng Thiên', 1, 1, '17,24, Mê Pu, H Đức Linh, Bình Thuận', '1997-12-21', 1, '261501292', '01687772887', 1, 1, NULL, 1, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110320', 'Cao Ngọc Thiện', 1, 1, '22, Phan Châu Trinh, Minh An, TX Hội An, Quảng Nam', '1996-09-07', 1, '206055520', '01223421418', 1, 1, NULL, 1, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110321', 'Phan Minh Thiện', 1, 1, '195, xã Thạnh Quới, H Vĩnh Thanh, Cần Thơ', '1996-12-21', 1, '362467830', '01697421797', 1, 1, NULL, 0, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110322', 'Lương Văn Thông', 3, 1, 'Số nhà 7, Tân Tiến, H Đồng Phú, Bình Phước', '1997-06-10', 1, '285608054', '01643084880', 1, 1, NULL, 1, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110323', 'Nguyễn Minh Thông', 3, 1, '324/9/1, Phước Hải, TP Nha Trang, Khánh Hòa', '1997-01-08', 1, '225908620', '01656522379 (gap phu', 1, 1, NULL, 0, '2019-04-11 07:56:11', '2019-04-11 07:56:11', 1, NULL, NULL, 'null'),
('15110324', 'Hoàng Thị Thu', 4, 1, NULL, '1997-07-27', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:11', '2019-04-11 07:58:11', 1, NULL, NULL, 'null'),
('15110326', 'Huỳnh Văn Thuận', 1, 1, '293, xã Long Trạch, H Cần Đước, Long An', '1997-05-02', 1, '301607024', '01223353674', 1, 1, NULL, 1, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110327', 'Nguyễn Ngọc Minh Thuận', 1, 1, '107, Quốc Hương, Quận 2, TP. Hồ Chí Minh', '1997-10-24', 1, '025832129', '0971095395', 1, 1, NULL, 0, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110328', 'Cao Thị Thuyền', 1, 1, 'An Bình Tây, H Ba Tri, Bến Tre', '1997-03-18', 2, '321701131', '01645293097', 1, 1, NULL, 1, '2019-04-11 07:45:31', '2019-04-11 07:45:31', 1, NULL, NULL, 'null'),
('15110329', 'Nguyễn Thị Thức', 3, 1, 'CÁT THẮNG, H Phù Cát, Bình Định', '1997-11-18', 2, '215418020', '01674730687', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110330', 'Đinh Phúc Tiến', 3, 1, 'Thạch Tiến, H Thạch Hà, Hà Tĩnh', '1997-04-09', 1, '184265245', '', 1, 1, NULL, 0, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110331', 'Nguyễn Bá Tiến', 1, 1, 'Phú Trung, H Bù Gia Mập, Bình Phước', '1997-01-14', 1, '285558624', '0987249905', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110332', 'Nguyễn Đức Tiến', 1, 1, 'phường Sơn Giang, H Phước Long, Bình Phước', '1997-03-04', 1, '285649177', '01636526505', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110333', 'Hà Văn Tình', 1, 1, 'Thôn Lộc Tây 2, quế Lộc, Nông Sơn, Quảng Nam', '1995-06-16', 1, '205863662', '0979443744', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110334', 'Lê Đức Toàn', 1, 1, 'Lương Hòa, H Châu Thành, Trà Vinh', '1997-03-16', 1, '334904218', '0988686491', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110335', 'Nguyễn Cảnh Toàn', 4, 1, NULL, '1997-09-01', 1, NULL, NULL, 1, 1, NULL, 0, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110336', 'Phạm Văn Tổng', 4, 1, NULL, '1997-09-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110337', 'Phạm Văn Tới', 1, 1, '5C/A1, Tmt 01, Quận 12, TP. Hồ Chí Minh', '1997-06-09', 1, '025596240', '0167 77 99 322', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110338', 'Bùi Xuân Trí', 1, 1, 'Phước Thắng, H Tuy Phước, Bình Định', '1997-09-02', 1, '215392922', '0987527849', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110339', 'Trần Quang Triều', 1, 1, 'Xã Thăng Hưng, H Chư Prông, Gia Lai', '1997-09-16', 1, '231103256', '01696718448', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110340', 'Trần Minh Trí', 3, 1, 'Long Hòa, H Bình Đại, Bến Tre', '1997-01-19', 1, '321553602', '0965539730', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110341', 'Trần Văn Trí', 1, 1, 'Hoài Hải, H Hoài Nhơn, Bình Định', '1997-10-05', 1, '215430952', '01659548682', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110342', 'Từ Hòa Trí', 1, 1, 'Ninh Thân, H Ninh Hòa, Khánh Hòa', '1997-01-04', 1, '225677066', '01206002680', 1, 1, NULL, 1, '2019-04-11 07:45:32', '2019-04-11 07:45:32', 1, NULL, NULL, 'null'),
('15110343', 'Trần Nguyên Trọng', 1, 1, 'H Đức Phổ, Quảng Ngãi', '1997-02-19', 1, '212279427', '0979402544', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110344', 'Lê Vĩnh Trung', 3, 1, '14, Thị trấn Mỹ Thọ, H Cao Lãnh, Đồng Tháp', '1997-03-10', 1, '341932078', '', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110345', 'Lưu Quang Trung', 3, 1, 'Kim Dinh, TX Bà Rịa, Bà Rịa - Vũng Tàu', '1997-09-22', 1, '273646698', '01657690869', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110346', 'Nguyễn Chí Trung', 1, 1, 'Bình Trung, H Thăng Bình, Quảng Nam', '1997-04-22', 1, '205969565', '01665293553', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110347', 'Nguyễn Tạ Minh Trung', 1, 1, 'Tam Quang, H Núi Thành, Quảng Nam', '1997-03-25', 1, '206220235', '01684648350', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, '42872964_697133664019478_8375899294850351104_n.jpg'),
('15110348', 'Phạm Quang Trung', 2, 1, 'Xuân Tây, H Cẩm Mỹ, Đồng Nai', '1997-12-10', 1, '272565689', '', 1, 1, NULL, 1, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110349', 'Nguyễn Thị Trúc', 2, 1, 'Thạch Kênh, H Thạch Hà, Hà Tĩnh', '1997-12-09', 2, '184185750', '0948880903', 1, 1, NULL, 1, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110350', 'Nguyễn Xuân Trúc', 3, 1, '13/8b, khu phố 8, phường tân phong,Biên hòa,Đồng nai, Đồng Nai', '1997-11-30', 1, '272649955', '', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110351', 'Đoàn Ngọc Xuyên Trường', 3, 1, '61/50, số 1, Phường 10, Q Tân Bình, TP. Hồ Chí Minh', '1997-04-20', 1, '025599931', '', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110352', 'Nguyễn Nhật Trường', 2, 1, '408, Thành Long, H Châu Thành, Tây Ninh', '1997-11-07', 1, '291144008', '01627385952', 1, 1, NULL, 1, '2019-04-11 07:47:49', '2019-04-11 07:47:49', 1, NULL, NULL, 'null'),
('15110353', 'Trần Nhật Trường', 4, 1, NULL, '1997-06-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110354', 'Bùi Đỗ Trung Trực', 3, 1, 'Hành Tín Đông, H Nghĩa Hành, Quảng Ngãi', '1997-09-16', 1, '212798733', '01629529124', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110355', 'Hồ Ngọc Tuấn', 4, 1, NULL, '1997-02-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110356', 'Mai Thanh Tuấn', 3, 1, 'Eam\'doal, H M\'Đrăk, Đăk Lăk', '1995-10-20', 1, '241431763', '0965598393', 1, 1, NULL, 1, '2019-04-11 07:56:12', '2019-04-11 07:56:12', 1, NULL, NULL, 'null'),
('15110357', 'Vũ Minh Tuấn', 4, 1, NULL, '1997-12-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110358', 'Hà Vũ Kim Tuyền', 3, 1, 'Tiêu Mỹ, H Tiên Phước, Quảng Nam', '1997-08-29', 2, '206028223', '', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110359', 'Lữ Văn Tùng', 2, 1, 'Tân bình, H Đồng Xoài, Bình Phước', '1997-02-10', 1, '285699696', '0965629279', 1, 1, NULL, 1, '2019-04-11 07:47:50', '2019-04-11 07:47:50', 1, NULL, NULL, 'null'),
('15110360', 'Trần Ngọc Tùng', 1, 1, 'Bình Hòa, H Thuận An, Bình Dương', '1997-11-15', 1, '281120546', '01626223711', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110361', 'Trần Thị Tố Uyên', 2, 1, 'H Nghĩa Hành, Quảng Ngãi', '1996-07-30', 2, '212796438', '', 1, 1, NULL, 1, '2019-04-11 07:47:50', '2019-04-11 07:47:50', 1, NULL, NULL, 'null'),
('15110362', 'Bùi Quốc Việt', 2, 1, 'Cát Khánh, H Phù Cát, Bình Định', '1997-02-26', 1, '215416382', '01699720244', 1, 1, NULL, 1, '2019-04-11 07:47:50', '2019-04-11 07:47:50', 1, NULL, NULL, 'null'),
('15110363', 'Đỗ Quốc Việt', 2, 1, 'Lộc Thọ, TP Nha Trang, Khánh Hòa', '1997-06-18', 1, '225592750', '0167218804', 1, 1, NULL, 1, '2019-04-11 07:47:50', '2019-04-11 07:47:50', 1, NULL, NULL, 'null'),
('15110364', 'Huỳnh Công Viên', 1, 1, '161, Ngô Gia Tự, Phú Đông, TX Tuy Hòa, Phú Yên', '1997-09-05', 1, '221447065', '01696900717', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110365', 'Lê Trung Việt', 1, 1, '328, Phường Lê Hồng Phong, TP Qui Nhơn, Bình Định', '1997-03-03', 1, '215408660', '0964031585', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110366', 'Hồ Hoàng Vinh', 3, 1, '10/5, Lê Hồng Phong, Phước Tân, TP Nha Trang, Khánh Hòa', '1997-09-09', 1, '225599276', '01884905025', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110367', 'Huỳnh Tấn Vinh', 3, 1, 'Hòa Trị, H Phú Hòa, Phú Yên', '1997-06-30', 1, '221458515', '01672643294', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110368', 'Ngô Quang Vinh', 1, 1, 'Nhơn Phong, H An Nhơn, Bình Định', '1997-10-17', 1, '215424330', '01658236822', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110369', 'Nguyễn Thế Vinh', 2, 1, '35, Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh', '1997-06-14', 1, '025741728', '0964123143', 1, 1, NULL, 1, '2019-04-11 07:47:50', '2019-04-11 07:47:50', 1, NULL, NULL, 'null'),
('15110370', 'Phạm Hửu Vinh', 3, 1, '452, Tình lộ 954, Tt Chợ Vàm, H Phú Tân, An Giang', '1997-01-19', 1, '352323136', '01296824724', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110371', 'Võ Thế Vinh', 2, 1, 'Bình Hòa, H Vĩnh Cửu, Đồng Nai', '1997-09-30', 1, '272739121', '01657184324', 1, 1, NULL, 1, '2019-04-11 07:47:50', '2019-04-11 07:47:50', 1, NULL, NULL, 'null'),
('15110372', 'Thòng Thanh Vĩ', 3, 1, 'Sông Xoài, H Tân Thành, Bà Rịa - Vũng Tàu', '1997-11-13', 1, '273589026', '01632965962', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110373', 'Đào Hoàn Vũ', 3, 1, 'Xóm 7, Xã Bình Nghi, H Tây Sơn, Bình Định', '1997-04-30', 1, '215399363', '01673853307', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110375', 'Nguyễn Thanh Thiên Vương', 1, 1, 'Tây Sơn, TP Pleiku, Gia Lai', '1997-12-12', 1, '231121212', '0947600125', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110376', 'Huỳnh Ngọc Thanh Xuân', 4, 1, NULL, '1997-12-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110377', 'Trần Xuân', 3, 1, 'Hòa Hội, H Xuyên Mộc, Bà Rịa - Vũng Tàu', '1997-02-23', 1, '273655097', '01654348522', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110378', 'Trần Nguyễn Thanh Như Ý', 1, 1, 'Nhơn Thọ, H An Nhơn, Bình Định', '1997-08-16', 1, '215422510', '', 1, 1, NULL, 1, '2019-04-11 07:45:33', '2019-04-11 07:45:33', 1, NULL, NULL, 'null'),
('15110379', 'Võ Trường Duy', 4, 1, NULL, '1997-05-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110380', 'Nguyễn Đình Thái', 3, 1, '33A, xã Thái Mỹ, H Củ Chi, TP. Hồ Chí Minh', '1997-01-15', 1, '025759460', '01657426721', 1, 1, NULL, 1, '2019-04-11 07:56:13', '2019-04-11 07:56:13', 1, NULL, NULL, 'null'),
('15110385', 'Ka` Huừs Tam Bou', 4, 1, NULL, '1996-11-06', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:12', '2019-04-11 07:58:12', 1, NULL, NULL, 'null'),
('15110386', 'Trương Phó Công', 1, 1, 'Lộc phú, H Lộc Ninh, Bình Phước', '1996-11-04', 1, '285504634', '01686763315', 1, 1, NULL, 1, '2019-04-11 07:45:34', '2019-04-11 07:45:34', 1, NULL, NULL, 'null'),
('15110387', 'H Ba Kpor', 1, 1, 'Êa B Hôk, H Cư M Gar, Đăk Lăk', '1996-09-24', 2, '241710159', '0987984910', 1, 1, NULL, 1, '2019-04-11 07:45:34', '2019-04-11 07:45:34', 1, NULL, NULL, 'null'),
('15110389', 'Long Thị Phương', 1, 1, 'EaTam, H Krông Năng, Đăk Lăk', '1995-01-12', 2, '241606519', '016880367422', 1, 1, NULL, 1, '2019-04-11 07:45:34', '2019-04-11 07:45:34', 1, NULL, NULL, 'null'),
('15110390', 'Vi Văn Sang', 4, 1, NULL, '1996-11-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 07:58:13', '2019-04-11 07:58:13', 1, NULL, NULL, 'null'),
('15110391', 'Phạm Văn Dũng', 1, 1, 'Nam Dong, H Cư Jút, Đăk Nông', '1997-03-13', 1, '245301104', '', 1, 1, NULL, 1, '2019-04-11 07:45:34', '2019-04-11 07:45:34', 1, NULL, NULL, 'null'),
('15110701', 'Phạm Ngọc Minh Huy', 1, 1, '166/32, 03, Q Gò Vấp, TP. Hồ Chí Minh', '1997-02-09', 1, '025546672', '01867637010', 1, 1, NULL, 1, '2019-04-11 07:45:34', '2019-04-11 07:45:34', 1, NULL, NULL, 'null'),
('15110702', 'Nguyễn Hà My', 1, 1, '6N/1, Ngô Tất Tố, 22, Q Bình Thạnh, TP. Hồ Chí Minh', '1997-10-06', 1, '025550746', '0302722907', 1, 1, NULL, 1, '2019-04-11 07:45:34', '2019-04-11 07:45:34', 1, NULL, NULL, 'null'),
('16110281', 'Nguyễn Duy Bảo', 5, 2, NULL, '1998-12-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:21', '2019-04-11 08:00:21', 1, NULL, NULL, 'null'),
('16110282', 'Huỳnh Công Chiến', 5, 2, NULL, '1998-08-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:21', '2019-04-11 08:00:21', 1, NULL, NULL, 'null'),
('16110284', 'Huỳnh Ngọc Chính', 5, 2, NULL, '1998-05-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:21', '2019-04-11 08:00:21', 1, NULL, NULL, 'null'),
('16110286', 'Lê Hoàng Công', 5, 2, NULL, '1998-02-06', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:00:21', '2019-04-11 08:00:21', 1, NULL, NULL, 'null'),
('16110291', 'Phạm Ngọc Diêu', 6, 2, NULL, '1998-12-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:29', '2019-04-11 08:01:29', 1, NULL, NULL, 'null'),
('16110294', 'Nguyễn Thị Kim Dung', 7, 2, NULL, '1998-09-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 09:41:39', '2019-04-11 09:41:39', NULL, NULL, NULL, '53856560_618402595297916_1482701256941109248_n.jpg'),
('16110297', 'Trần Khương Duy', 5, 2, NULL, '1995-10-14', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:00:21', '2019-04-11 08:00:21', 1, NULL, NULL, 'null'),
('16110299', 'Đặng Thị Duyên', 7, 2, NULL, '1998-01-07', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:14', '2019-04-11 08:03:14', 1, NULL, NULL, '52883801_2257054381235085_4124496285925376000_n.jpg'),
('16110302', 'Nguyễn Triều Dương', 5, 2, NULL, '1998-01-24', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110303', 'Phan Thị Thùy Dương', 7, 2, NULL, '1998-03-26', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:14', '2019-04-11 08:03:14', 1, NULL, NULL, 'null'),
('16110304', 'Nguyễn Đình Đạt', 5, 2, NULL, '1997-04-26', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110305', 'Nguyễn Thành Đạt', 5, 2, NULL, '1998-03-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110306', 'Nguyễn Tuấn Đạt', 5, 2, NULL, '1995-02-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110308', 'Trần Thành Đạt', 5, 2, NULL, '1998-03-07', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110309', 'Nguyễn Lê Điền', 7, 2, NULL, '1998-11-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:14', '2019-04-11 08:03:14', 1, NULL, NULL, 'null'),
('16110311', 'Nguyễn Thành Đồng', 5, 2, NULL, '1998-11-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110313', 'Đỗ Văn Đức', 7, 2, NULL, '1998-02-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:14', '2019-04-11 08:03:14', 1, NULL, NULL, 'null'),
('16110316', 'Chu Thị Hương Giang', 5, 2, NULL, '1998-10-13', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110317', 'Nguyễn Thanh Giàu', 6, 2, NULL, '1998-04-26', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:01:29', '2019-04-11 08:01:29', 1, NULL, NULL, 'null'),
('16110318', 'Nguyễn Văn Hải', 5, 2, NULL, '1998-03-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:22', '2019-04-11 08:00:22', 1, NULL, NULL, 'null'),
('16110321', 'Mai Đình Hậu', 6, 2, NULL, '1998-01-31', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:29', '2019-04-11 08:01:29', 1, NULL, NULL, 'null'),
('16110322', 'Thổ Văn Hiền', 7, 2, NULL, '1998-06-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:14', '2019-04-11 08:03:14', 1, NULL, NULL, 'null'),
('16110323', 'Phan Vũ Minh Hiển', 6, 2, NULL, '1998-04-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110324', 'Bùi Công Hiếu', 6, 2, NULL, '1998-03-10', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, '50534642_296936624502734_6815052825945440256_n.jpg'),
('16110326', 'Lê Thanh Hiếu', 6, 2, NULL, '1998-01-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110327', 'Nguyễn Minh Hiếu', 6, 2, NULL, '1998-01-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110329', 'Phan Hữu Hiếu', 6, 2, NULL, '1998-10-02', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110330', 'Nguyễn Hoàng Hiệp', 5, 2, NULL, '1998-06-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110331', 'Phùng Đại Hiệp', 6, 2, NULL, '1998-07-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110335', 'Võ Huy Hoàng', 6, 2, NULL, '1998-01-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110337', 'Lê Minh Hổ', 6, 2, NULL, '1998-05-20', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110338', 'Võ Văn Hội', 7, 2, NULL, '1998-11-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null');
INSERT INTO `students` (`student_id`, `name`, `class_id`, `school_year_id`, `address`, `birthday`, `sex`, `identity_card`, `phone_no`, `is_youth_union_member`, `is_study`, `date_on_union`, `is_payed_union_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `image`) VALUES
('16110341', 'Nguyễn Đức Hoàng Huy', 6, 2, NULL, '1998-03-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:30', '2019-04-11 08:01:30', 1, NULL, NULL, 'null'),
('16110346', 'Phạm Kim Hùng', 5, 2, NULL, '1998-11-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110347', 'Huỳnh Lê Hữu Hưng', 6, 2, NULL, '1998-02-22', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110348', 'Lê Hoàng Hưng', 5, 2, NULL, '1998-08-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110350', 'Trần Phát Hưng', 6, 2, NULL, '1998-01-08', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110351', 'Phạm Thị Ngọc Hường', 7, 2, NULL, '1998-12-16', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110355', 'Lê Quang Kha', 5, 2, NULL, '1998-01-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110356', 'Huỳnh Nhật Khang', 5, 2, NULL, '1998-08-07', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110357', 'Nguyễn Bá Khải', 5, 2, NULL, '1998-12-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110363', 'Võ Đình Khởi', 5, 2, NULL, '1998-09-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110364', 'Huỳnh Kim Kiên', 5, 2, NULL, '1998-09-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:23', '2019-04-11 08:00:23', 1, NULL, NULL, 'null'),
('16110366', 'Kim Tuấn Kiệt', 5, 2, NULL, '1998-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110367', 'Nguyễn Tuấn Kiệt', 7, 2, NULL, '1998-08-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110369', 'Huỳnh Nhật Lâm', 7, 2, NULL, '1998-09-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110370', 'Nguyễn Hải Lâm', 5, 2, NULL, '1998-04-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110373', 'Ngô Tuấn LĩNh', 5, 2, NULL, '1998-01-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110374', 'Lê Cao Liêm', 5, 2, NULL, '1998-09-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110375', 'Thái Thanh Liêm', 6, 2, NULL, '1998-04-27', 1, NULL, NULL, 1, 2, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110376', 'Trần Thị Liên', 5, 2, NULL, '1998-08-01', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, '52550197_1041853299335782_3274780394171400192_n.jpg'),
('16110377', 'Phan Hoàng Nhật Linh', 5, 2, NULL, '1998-10-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110379', 'Nguyễn Cảnh Lịch', 5, 2, NULL, '1998-03-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110381', 'Trịnh Văn Long', 5, 2, NULL, '1997-05-10', 1, NULL, NULL, 1, 2, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110382', 'Nguyễn Thị Khánh Lộc', 6, 2, NULL, '1998-02-03', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110385', 'Trần Văn Luyện', 6, 2, NULL, '1998-09-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110386', 'Phan Văn Lực', 7, 2, NULL, '1997-07-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110389', 'Lê Văn Minh', 7, 2, NULL, '1997-05-24', 1, NULL, NULL, 1, 2, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110390', 'Lý Quang Minh', 5, 2, NULL, '1998-05-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:24', '2019-04-11 08:00:24', 1, NULL, NULL, 'null'),
('16110392', 'Đinh Quang Nam', 5, 2, NULL, '1998-04-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110393', 'Nguyễn Hoài Nam', 5, 2, NULL, '1997-04-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110394', 'Lê Thị Hồng Nga', 6, 2, NULL, '1998-04-24', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110396', 'Lê Thị Thanh Ngân', 7, 2, NULL, '1998-04-30', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110402', 'Lê Sĩ Nguyên', 6, 2, NULL, '1998-11-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110405', 'Nguyễn Trọng Nhân', 6, 2, NULL, '1998-10-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110407', 'Phạm Văn Nhất', 5, 2, NULL, '1998-01-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110409', 'Huỳnh Thị Tuyết Nhi', 5, 2, NULL, '1998-08-10', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110410', 'Trần Thị Nhựt', 5, 2, NULL, '1998-06-02', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110411', 'Lê Văn Tấn Phát', 7, 2, NULL, '1998-08-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110415', 'Đinh Ngọc Phú', 5, 2, NULL, '1998-07-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110416', 'Nguyễn Quang Phú', 5, 2, NULL, '1998-11-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110417', 'Hoàng Thị Diễm Phúc', 7, 2, NULL, '1998-01-03', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:15', '2019-04-11 08:03:15', 1, NULL, NULL, 'null'),
('16110419', 'Phạm Hoàng Phúc', 5, 2, NULL, '1998-11-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, 'null'),
('16110422', 'Trịnh Vĩnh Phúc', 7, 2, NULL, '1998-10-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110423', 'Võ Hồng Phúc', 5, 2, NULL, '1998-02-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:25', '2019-04-11 08:00:25', 1, NULL, NULL, '51659961_1759679654177967_3989973074081480704_n.jpg'),
('16110426', 'Võ Văn Phước', 5, 2, NULL, '1998-03-31', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110427', 'Liên Minh Quang', 6, 2, NULL, '1998-06-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:31', '2019-04-11 08:01:31', 1, NULL, NULL, 'null'),
('16110429', 'Hồ Nguyễn Hoàng Quân', 5, 2, NULL, '1998-07-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110433', 'Hoàng Thúy Quyên', 5, 2, NULL, '1998-08-22', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110438', 'Nguyễn Văn Rum', 6, 2, NULL, '1998-11-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110439', 'Hoàng Phong Sang', 6, 2, NULL, '1998-10-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110440', 'Nguyễn Anh Sang', 6, 2, NULL, '1998-01-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, '31171447_1245486088919860_7009438364248047616_n.jpg'),
('16110447', 'Võ Phước Sơn', 6, 2, NULL, '1998-01-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110451', 'Hồ Thiện Tâm', 5, 2, NULL, '1998-06-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110454', 'Hoàng Trọng Tấn', 7, 2, NULL, '1996-09-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110460', 'Mai Vĩnh Thành', 5, 2, NULL, '1998-10-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110464', 'Bùi Quang Thăng', 5, 2, NULL, '1998-07-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110467', 'Dương Thanh Thân', 5, 2, NULL, '1998-10-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110468', 'Nguyễn Duy Thiên', 6, 2, NULL, '1998-08-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110469', 'Võ Văn Thiên', 5, 2, NULL, '1998-12-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:26', '2019-04-11 08:00:26', 1, NULL, NULL, 'null'),
('16110472', 'Nguyễn Hữu Thiện', 5, 2, NULL, '1998-02-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110474', 'Phan Văn Phước Thịnh', 6, 2, NULL, '1998-01-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110475', 'Phạm Gia Thịnh', 6, 2, NULL, '1998-01-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110476', 'Nguyễn Quang Thọ', 5, 2, NULL, '1998-04-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110478', 'Nguyễn Thị Thanh Thuỷ', 5, 2, NULL, '1998-06-25', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110480', 'Phan Thị Quang Thư', 6, 2, NULL, '1998-11-19', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110482', 'Nguyễn Đình Thượng Thượng', 6, 2, NULL, '1998-03-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:32', '2019-04-11 08:01:32', 1, NULL, NULL, 'null'),
('16110487', 'Trần Phạm Minh Tín', 6, 2, NULL, '1998-09-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110488', 'Lê Thị Thùy Trang', 7, 2, NULL, '1998-05-15', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110489', 'Nguyễn Trường Tráng', 7, 2, NULL, '1998-03-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110490', 'Lê Thị Huyền Trân', 5, 2, NULL, '1998-03-09', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110492', 'Đặng Mậu Triết', 5, 2, NULL, '1998-04-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110493', 'Hồ Ngọc Triết', 5, 2, NULL, '1997-12-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110494', 'Lê Thị Trinh', 6, 2, NULL, '1998-02-25', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110495', 'Phan Minh Trí', 7, 2, NULL, '1998-04-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110496', 'Phan Văn Trí', 5, 2, NULL, '1998-05-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110499', 'Trần Hoàng Trọng', 6, 2, NULL, '1998-08-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110500', 'Trần Ngọc Trọng', 6, 2, NULL, '1998-03-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110509', 'Mai Đức Tuấn', 7, 2, NULL, '1998-10-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110514', 'Nguyễn Thị Thanh Tuyền', 5, 2, NULL, '1998-07-13', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:27', '2019-04-11 08:00:27', 1, NULL, NULL, 'null'),
('16110516', 'Trần Minh Tùng', 6, 2, NULL, '1998-09-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110517', 'Hồ Anh Tú', 6, 2, NULL, '1998-09-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110523', 'Lâm Thế Vinh', 6, 2, NULL, '1998-01-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110525', 'Phạm Thái Vĩnh', 6, 2, NULL, '1998-04-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:33', '2019-04-11 08:01:33', 1, NULL, NULL, 'null'),
('16110526', 'Cao Nguyễn Hoàng Vũ', 6, 2, NULL, '1998-07-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:34', '2019-04-11 08:01:34', 1, NULL, NULL, 'null'),
('16110527', 'Nguyễn Tuấn Vũ', 6, 2, NULL, '1998-11-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:34', '2019-04-11 08:01:34', 1, NULL, NULL, 'null'),
('16110528', 'Nguyễn Văn Vũ', 5, 2, NULL, '1998-09-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110530', 'Nguyễn Ngọc Hoàng Vy', 5, 2, NULL, '1998-02-04', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110531', 'Nguyễn Trường Yên', 7, 2, NULL, '1998-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:03:16', '2019-04-11 08:03:16', 1, NULL, NULL, 'null'),
('16110532', 'Trương Lưu Sỹ Đức', 5, 2, NULL, '1998-06-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110533', 'Hồ Ngọc Sơn Hà', 5, 2, NULL, '1998-08-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110534', 'Trương Phương Hằng', 5, 2, NULL, '1998-03-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110536', 'Nguyễn Ngọc Trúc Linh', 5, 2, NULL, '1998-07-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110538', 'Hồ Sỹ Luận', 6, 2, NULL, '1998-07-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:34', '2019-04-11 08:01:34', 1, NULL, NULL, 'null'),
('16110539', 'Nguyễn Xuân Nguyên', 5, 2, NULL, '1998-02-26', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, '49575813_1060580784125253_3048326512617979904_n.jpg'),
('16110540', 'Nguyễn Trọng Phú', 5, 2, NULL, '1998-10-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110541', 'Nguyễn Thanh Tân', 6, 2, NULL, '1998-07-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:34', '2019-04-11 08:01:34', 1, NULL, NULL, 'null'),
('16110543', 'Trần Thị Ngọc Trâm', 6, 2, NULL, '1998-01-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:34', '2019-04-11 08:01:34', 1, NULL, NULL, 'null'),
('16110584', 'Nguyễn Bá Thuận', 6, 2, NULL, '1998-05-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:01:34', '2019-04-11 08:01:34', 1, NULL, NULL, 'null'),
('16110588', 'Trần Văn Nam', 5, 2, NULL, '1996-03-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:28', '2019-04-11 08:00:28', 1, NULL, NULL, 'null'),
('16110590', 'Đào Đức Thiện', 5, 2, NULL, '1995-03-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:00:29', '2019-04-11 08:00:29', 1, NULL, NULL, 'null'),
('17110259', 'Nguyễn Tiến Anh', 9, 3, NULL, '1999-03-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:55', '2019-04-11 08:06:55', 1, NULL, NULL, 'null'),
('17110261', 'Phạm Tô Bảo', 8, 3, NULL, '1999-04-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:49', '2019-04-11 08:05:49', 1, NULL, NULL, 'null'),
('17110262', 'Nguyễn Hoàng Ca', 8, 3, NULL, '1999-10-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:49', '2019-04-11 08:05:49', 1, NULL, NULL, 'null'),
('17110263', 'Trần Ngọc Chiến', 9, 3, NULL, '1998-08-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110264', 'Huỳnh Mai Chung', 8, 3, NULL, '1999-08-08', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:05:49', '2019-04-11 08:05:49', 1, NULL, NULL, 'null'),
('17110266', 'Quách Văn Chương', 9, 3, NULL, '1999-02-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110267', 'Võ Thế Công', 9, 3, NULL, '1999-07-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110268', 'Nguyễn Đỗ Cường', 8, 3, NULL, '1999-10-30', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:05:49', '2019-04-11 08:05:49', 1, NULL, NULL, 'null'),
('17110269', 'Nguyễn Thị Phương Doanh', 9, 3, NULL, '1999-11-10', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110270', 'Nguyễn Thị Kim Dung', 9, 3, NULL, '1999-09-30', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110271', 'Dương Trí Dũng', 9, 3, NULL, '1999-10-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110272', 'Nguyễn Đình Dũng', 9, 3, NULL, '1998-01-14', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110273', 'Phạm Thái Dương', 8, 3, NULL, '1999-10-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:49', '2019-04-11 08:05:49', 1, NULL, NULL, 'null'),
('17110274', 'Đoàn Ngọc Đại', 8, 3, NULL, '1999-06-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110275', 'Nguyễn Ngọc Đại', 9, 3, NULL, '1999-07-17', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110276', 'Lê Hồng Đạo', 8, 3, NULL, '1999-10-16', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110277', 'Đinh Xuân Đạt', 9, 3, NULL, '1999-02-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:56', '2019-04-11 08:06:56', 1, NULL, NULL, 'null'),
('17110278', 'Lý Thành Đạt', 9, 3, NULL, '1999-04-06', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110279', 'Nguyễn Tiến Đạt', 8, 3, NULL, '1999-02-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110280', 'Võ Thành Đạt', 9, 3, NULL, '1999-11-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110281', 'Trần Hồng Điệp', 8, 3, NULL, '1999-08-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110282', 'Đào Văn Đức', 8, 3, NULL, '1999-06-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110283', 'Nguyễn Hoàng Hữu Đức', 8, 3, NULL, '1999-12-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110284', 'Phạm Xuân Đức', 10, 3, NULL, '1999-01-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:10', '2019-04-11 08:08:10', 1, NULL, NULL, 'null'),
('17110285', 'Võ Hữu Đức', 10, 3, NULL, '1999-05-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:10', '2019-04-11 08:08:10', 1, NULL, NULL, 'null'),
('17110287', 'Nguyễn Hoàng Giang', 8, 3, NULL, '1999-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110288', 'Nguyễn Thạch Trường Giảng', 8, 3, NULL, '1999-05-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:50', '2019-04-11 08:05:50', 1, NULL, NULL, 'null'),
('17110289', 'Đoàn Nhật Hào', 8, 3, NULL, '1999-06-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110290', 'Đinh Sơn Hải', 9, 3, NULL, '1999-05-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110291', 'Mai Chí Hải', 8, 3, NULL, '1999-10-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110292', 'Ngô Văn Hải', 8, 3, NULL, '1999-07-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110293', 'Nguyễn Minh Hải', 9, 3, NULL, '1999-02-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110294', 'Chế Hoàng Hảo', 9, 3, NULL, '1999-07-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110295', 'Nguyễn Trung Hảo', 9, 3, NULL, '1998-12-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110296', 'Nguyễn Đình Hậu', 8, 3, NULL, '1999-04-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110298', 'Nguyễn Trung Hiếu', 10, 3, NULL, '1999-05-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:10', '2019-04-11 08:08:10', 1, NULL, NULL, 'null'),
('17110299', 'Võ Trọng Hiếu', 10, 3, NULL, '1999-10-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110300', 'Hoàng Thái Hòa', 8, 3, NULL, '1999-03-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110301', 'Đoàn Quốc Huy', 9, 3, NULL, '1999-10-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110302', 'Đỗ Chí Huy', 9, 3, NULL, '1999-03-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:57', '2019-04-11 08:06:57', 1, NULL, NULL, 'null'),
('17110303', 'Nguyễn Tấn Huy', 8, 3, NULL, '1999-11-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110304', 'Phan Phú Huy', 8, 3, NULL, '1999-12-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110305', 'Phạm Đức Huy', 10, 3, NULL, '1999-09-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110306', 'Từ Đăng Huy', 8, 3, NULL, '1999-10-31', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:51', '2019-04-11 08:05:51', 1, NULL, NULL, 'null'),
('17110307', 'Trương Hà Huy Hùng', 8, 3, NULL, '1999-11-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110308', 'Trần Ngọc Hưng', 8, 3, NULL, '1998-03-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110309', 'Lê Đức Khang', 8, 3, NULL, '1999-06-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110311', 'Nguyễn Công Khanh', 9, 3, NULL, '1999-12-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110312', 'Nguyễn Hoàng Gia Khanh', 10, 3, NULL, '1999-02-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110313', 'Vương Tuấn Khanh', 10, 3, NULL, '1999-11-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110314', 'Đỗ Tường Khải', 8, 3, NULL, '1999-09-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110315', 'Dương Cơ Khánh', 8, 3, NULL, '1999-03-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110317', 'Nguyễn Toàn Khoa', 8, 3, NULL, '1999-03-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110318', 'Võ Bùi Đăng Khoa', 8, 3, NULL, '1999-10-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110319', 'Võ Đăng Khoa', 8, 3, NULL, '1999-06-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110320', 'Bảo Khôi', 10, 3, NULL, '1999-03-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110321', 'Trương Đình Khôi', 8, 3, NULL, '1999-07-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:52', '2019-04-11 08:05:52', 1, NULL, NULL, 'null'),
('17110322', 'Trần Phước Khương', 9, 3, NULL, '1999-02-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110323', 'Vũ Trung Kiên', 8, 3, NULL, '1999-05-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110324', 'Nguyễn Thanh Lâm', 8, 3, NULL, '1999-12-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110325', 'Nguyễn Đức Linh', 10, 3, NULL, '1999-01-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110326', 'Hà Hải Long', 8, 3, NULL, '1999-11-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110327', 'Lưu Luyến Tuyên Long', 8, 3, NULL, '1999-07-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110328', 'Trần Quang Long', 9, 3, NULL, '1999-09-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110329', 'Tô Vĩnh Lợi', 9, 3, NULL, '1999-09-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110330', 'Bùi Đình Mạnh', 9, 3, NULL, '1999-07-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110331', 'Lương Quang Minh', 8, 3, NULL, '1999-08-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110332', 'Nguyễn Thị Huyền My', 10, 3, NULL, '1999-04-21', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110333', 'Đặng Phương Nam', 8, 3, NULL, '1999-10-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110334', 'Nguyễn Xuân Nam', 9, 3, NULL, '1999-01-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110335', 'Phan Hoàng Nam', 10, 3, NULL, '1999-11-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110336', 'Võ Thị Ngọc Nga', 10, 3, NULL, '1999-08-13', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:11', '2019-04-11 08:08:11', 1, NULL, NULL, 'null'),
('17110337', 'Huỳnh Văn Ngoãn', 10, 3, NULL, '1999-09-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, '54728826_2256594451279846_7773109061582585856_n.jpg'),
('17110338', 'Lê Minh Ngọc', 9, 3, NULL, '1999-09-28', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110339', 'Lăng Trọng Ngôn', 8, 3, NULL, '1999-07-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110340', 'Huỳnh Châu Thanh Nhân', 9, 3, NULL, '1999-08-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, '56184183_118393759331492_8895119918488354816_n.jpg'),
('17110341', 'Bùi Minh Nhật', 9, 3, NULL, '1999-07-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:58', '2019-04-11 08:06:58', 1, NULL, NULL, 'null'),
('17110342', 'Ngô Quang Nhật', 9, 3, NULL, '1999-04-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110343', 'Lê Quang Nhựt', 10, 3, NULL, '1999-07-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110344', 'Huỳnh Thị Kiều Oanh', 8, 3, NULL, '1999-04-03', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110345', 'Hoàng Minh Hoài Phong', 9, 3, NULL, '1999-11-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110346', 'Huỳnh Trần Phú', 8, 3, NULL, '1999-12-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:53', '2019-04-11 08:05:53', 1, NULL, NULL, 'null'),
('17110347', 'Sơn Minh Phú', 8, 3, NULL, '1999-06-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110348', 'Lã Thiên Phúc', 9, 3, NULL, '1999-07-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110349', 'Mai Gia Phúc', 9, 3, NULL, '1999-05-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110350', 'Nguyễn Huỳnh Phúc', 10, 3, NULL, '1999-09-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110351', 'Nguyễn Minh Phụng', 10, 3, NULL, '1999-09-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110352', 'Nguyễn Đỗ Đăng Quang', 8, 3, NULL, '1999-11-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110353', 'Nguyễn Nhật Quang', 8, 3, NULL, '1999-04-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110354', 'Nguyễn Anh Quân', 9, 3, NULL, '1999-03-31', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110355', 'Lưu Văn Quận', 9, 3, NULL, '1999-09-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110356', 'Huỳnh Ngọc Quốc', 10, 3, NULL, '1999-01-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, '53517984_1607877159351086_664922823604568064_n.jpg'),
('17110357', 'Thọ Kim Quang Quyền', 8, 3, NULL, '1999-01-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110358', 'Nguyễn Quang Quý', 9, 3, NULL, '1999-10-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110359', 'Phan Đình Sơn', 8, 3, NULL, '1999-06-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110360', 'Võ Phúc Sơn', 8, 3, NULL, '1997-06-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110361', 'Tăng Phát Tài', 10, 3, NULL, '1999-06-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110362', 'Trần Hữu Thiện Tâm', 8, 3, NULL, '1999-04-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110363', 'Phan Nhật Tân', 9, 3, NULL, '1999-03-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110364', 'Phạm Văn Minh Tân', 10, 3, NULL, '1999-03-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110365', 'Lê Hồng Thái', 8, 3, NULL, '1998-06-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110367', 'Nguyễn Huy Thắng', 8, 3, NULL, '1999-06-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:54', '2019-04-11 08:05:54', 1, NULL, NULL, 'null'),
('17110368', 'Nguyễn Văn Thắng', 8, 3, NULL, '1999-06-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110370', 'Phạm Việt Hoàng Thi', 8, 3, NULL, '1999-05-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110371', 'Huỳnh Ngọc Hưng Thịnh', 8, 3, NULL, '1999-12-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110372', 'Nguyễn Hoàng Thịnh', 9, 3, NULL, '1997-10-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:06:59', '2019-04-11 08:06:59', 1, NULL, NULL, 'null'),
('17110373', 'Trần Minh Thịnh', 10, 3, NULL, '1999-11-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110374', 'Ngô Minh Thu', 8, 3, NULL, '1998-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110375', 'Đặng Thị Thư', 8, 3, NULL, '1999-05-26', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110376', 'Võ Trung Thường', 8, 3, NULL, '1999-06-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110377', 'Phan Nguyễn Thủy Tiên', 10, 3, NULL, '1999-10-06', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:12', '2019-04-11 08:08:12', 1, NULL, NULL, 'null'),
('17110378', 'Thái Lý Tiến', 9, 3, NULL, '1999-10-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, 'null'),
('17110380', 'Trần Hưng Tiến', 8, 3, NULL, '1999-07-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110381', 'Trương Quang Tịnh', 8, 3, NULL, '1999-03-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:55', '2019-04-11 08:05:55', 1, NULL, NULL, 'null'),
('17110382', 'Trịnh Việt Toàn', 9, 3, NULL, '1999-11-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, 'null'),
('17110383', 'Phạm Hoàng Toán', 10, 3, NULL, '1999-07-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:13', '2019-04-11 08:08:13', 1, NULL, NULL, 'null'),
('17110384', 'Huỳnh Thế Tông', 9, 3, NULL, '1999-06-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, 'null'),
('17110385', 'Vương Thị Thu Trang', 10, 3, NULL, '1999-04-17', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:13', '2019-04-11 08:08:13', 1, NULL, NULL, 'null'),
('17110386', 'Nguyễn Văn Triều', 8, 3, NULL, '1999-06-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, '52038601_2057867544510426_4927630800632938496_n.jpg'),
('17110387', 'Huỳnh Minh Triết', 8, 3, NULL, '1999-12-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110388', 'Nguyễn Văn Khánh Trình', 9, 3, NULL, '1999-08-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, 'null'),
('17110389', 'Huỳnh Hữu Trí', 9, 3, NULL, '1999-01-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, 'null'),
('17110390', 'Phạm Minh Trí', 8, 3, NULL, '1999-01-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110391', 'Lê Đức Trọng', 8, 3, NULL, '1999-11-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110392', 'Nguyễn Đình Trọng', 10, 3, NULL, '1999-03-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:13', '2019-04-11 08:08:13', 1, NULL, NULL, 'null'),
('17110393', 'Ngô Quốc Trung', 9, 3, NULL, '1999-09-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, '53160486_405026156917128_8985841808307126272_n.jpg'),
('17110394', 'Phạm Thành Trung', 9, 3, NULL, '1999-08-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, 'null'),
('17110395', 'Phạm Toàn Trung', 8, 3, NULL, '1999-06-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110396', 'Đàm Nguyễn Trung Trường', 8, 3, NULL, '1999-05-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110397', 'Nguyễn Anh Tuấn', 8, 3, NULL, '1999-02-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110398', 'Trần Minh Tuấn', 9, 3, NULL, '1999-10-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:00', '2019-04-11 08:07:00', 1, NULL, NULL, '22406260_342727006173933_6277443215278403262_n.jpg'),
('17110399', 'Trần Quang Tùng', 8, 3, NULL, '1999-06-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110400', 'Hồ Minh Tú', 8, 3, NULL, '1999-07-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:56', '2019-04-11 08:05:56', 1, NULL, NULL, 'null'),
('17110401', 'Nguyễn Hùng Vĩ', 9, 3, NULL, '1999-04-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:01', '2019-04-11 08:07:01', 1, NULL, NULL, 'null'),
('17110402', 'Nguyễn Minh Vũ', 8, 3, NULL, '1999-09-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:57', '2019-04-11 08:05:57', 1, NULL, NULL, 'null'),
('17110403', 'Trần Lê Anh Vũ', 10, 3, NULL, '1999-01-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:08:13', '2019-04-11 08:08:13', 1, NULL, NULL, 'null'),
('17110404', 'Hoàng Lê Vương', 8, 3, NULL, '1999-12-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:57', '2019-04-11 08:05:57', 1, NULL, NULL, 'null'),
('17110406', 'Hồ Thị Yến', 9, 3, NULL, '1999-10-10', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:01', '2019-04-11 08:07:01', 1, NULL, NULL, 'null'),
('17110407', 'Vy Chí Hòa', 8, 3, NULL, '1997-05-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:57', '2019-04-11 08:05:57', 1, NULL, NULL, 'null'),
('17110408', 'Hoàng Thị Thu Mai', 8, 3, NULL, '1998-01-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:05:57', '2019-04-11 08:05:57', 1, NULL, NULL, 'null'),
('17110409', 'Lê Trung Quốc', 9, 3, NULL, '1999-10-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:01', '2019-04-11 08:07:01', 1, NULL, NULL, 'null'),
('17110411', 'Hoàng Thị Hiền', 9, 3, NULL, '1998-01-21', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:01', '2019-04-11 08:07:01', 1, NULL, NULL, 'null'),
('17110412', 'Triệu Thị Huyền Trang', 9, 3, NULL, '1998-01-05', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:07:01', '2019-04-11 08:07:01', 1, NULL, NULL, 'null'),
('17133002', 'Trần Gia Bảo', 11, 3, NULL, '1999-10-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:15', '2019-04-11 08:09:15', 1, NULL, NULL, 'null'),
('17133003', 'Phạm Hoàng Quang Cảnh', 11, 3, NULL, '1999-09-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:15', '2019-04-11 08:09:15', 1, NULL, NULL, 'null'),
('17133004', 'Vỏ Phú Cường', 11, 3, NULL, '1999-10-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:15', '2019-04-11 08:09:15', 1, NULL, NULL, 'null'),
('17133005', 'Ngô Thành Danh', 11, 3, NULL, '1999-09-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:15', '2019-04-11 08:09:15', 1, NULL, NULL, 'null'),
('17133006', 'Võ Trọng Diện', 11, 3, NULL, '1999-03-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133007', 'Nguyễn Khánh Duy', 11, 3, NULL, '1999-07-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133008', 'Nguyễn Tiến Duy', 11, 3, NULL, '1997-08-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133009', 'Nguyễn Ngọc Dương', 11, 3, NULL, '1999-06-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133010', 'Vũ Anh Thái Dương', 11, 3, NULL, '1995-04-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133011', 'Bùi Đình Tiến Đạt', 11, 3, NULL, '1999-02-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133012', 'Đỗ Lê Tiến Đạt', 11, 3, NULL, '1999-06-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133013', 'Phạm Quốc Đệ', 11, 3, NULL, '1999-10-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133014', 'Lê Ngọc Đoan', 11, 3, NULL, '1999-06-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:16', '2019-04-11 08:09:16', 1, NULL, NULL, 'null'),
('17133015', 'Vũ Đặng Quỳnh Giang', 11, 3, NULL, '1999-03-14', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133016', 'Phạm Xuân Hà', 11, 3, NULL, '1999-07-10', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133017', 'Đỗ Viết Hải', 11, 3, NULL, '1996-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133018', 'Lê Phúc Hạo', 11, 3, NULL, '1999-02-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133019', 'Nguyễn Quý Trọng Hiếu', 11, 3, NULL, '1999-03-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133021', 'Ngô Ngọc Hoài', 11, 3, NULL, '1999-06-20', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133022', 'Bồ Xuân Hoàng', 11, 3, NULL, '1999-08-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133023', 'Nguyễn Văn Hoàng', 11, 3, NULL, '1999-04-13', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133024', 'Phùng Huy Hoàng', 11, 3, NULL, '1999-03-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:17', '2019-04-11 08:09:17', 1, NULL, NULL, 'null'),
('17133025', 'Đường Lê Minh Học', 11, 3, NULL, '1999-07-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133026', 'Đinh Quang Huy', 11, 3, NULL, '1999-08-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133027', 'Trần Hoàng Huy', 11, 3, NULL, '1999-10-31', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133029', 'Lê Minh Hùng', 11, 3, NULL, '1999-10-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133030', 'Lê Kha', 11, 3, NULL, '1999-12-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133031', 'Lâm Duy Khang', 11, 3, NULL, '1999-06-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133032', 'Lê Khắc Trí Khang', 11, 3, NULL, '1999-12-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133033', 'Vũ Ngọc Khang', 11, 3, NULL, '1997-10-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:18', '2019-04-11 08:09:18', 1, NULL, NULL, 'null'),
('17133034', 'Lê Hữu Khuê', 11, 3, NULL, '1999-02-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133037', 'Nguyễn Hữu Minh', 11, 3, NULL, '1999-09-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133038', 'Uông Quang Minh', 11, 3, NULL, '1999-03-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133039', 'Mai Bình Nam', 11, 3, NULL, '1999-01-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133040', 'Trần Trọng Nghĩa', 11, 3, NULL, '1999-10-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133041', 'Nguyễn Thị Ngọc', 11, 3, NULL, '1999-05-03', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133042', 'Võ Hoàng Ngôi', 11, 3, NULL, '1999-09-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133043', 'Nguyễn Quang Nhật', 11, 3, NULL, '1999-09-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:19', '2019-04-11 08:09:19', 1, NULL, NULL, 'null'),
('17133044', 'Nguyễn Hiền Nhung', 11, 3, NULL, '1999-03-08', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133045', 'Nhâm Nhật Oanh', 11, 3, NULL, '1999-07-11', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133046', 'Nguyễn Triệu Phát', 11, 3, NULL, '1999-04-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133047', 'Phạm Trường Phát', 11, 3, NULL, '1999-06-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133048', 'Nguyễn Thái Phong', 11, 3, NULL, '1999-04-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133049', 'Nguyễn Thế Phong', 11, 3, NULL, '1999-05-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133051', 'Trần Hùng Quân', 11, 3, NULL, '1999-02-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133052', 'Đỗ Lê Quí', 11, 3, NULL, '1999-10-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133053', 'Phạm Văn Quỹ', 11, 3, NULL, '1999-10-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:20', '2019-04-11 08:09:20', 1, NULL, NULL, 'null'),
('17133055', 'Nguyễn Phước Sang', 11, 3, NULL, '1998-02-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133056', 'Lê Công Sanh', 11, 3, NULL, '1999-11-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133057', 'Nguyễn Đức Tây', 11, 3, NULL, '1999-02-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133058', 'Huỳnh Thảo Tất', 11, 3, NULL, '1999-08-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133060', 'Phan Tấn Thịnh', 11, 3, NULL, '1999-11-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133063', 'Nguyễn Thị Thu Thủy', 11, 3, NULL, '1999-10-23', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133064', 'Uông Thị Thanh Thủy', 11, 3, NULL, '1999-05-25', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133065', 'Huỳnh Thị Thiên Thư', 11, 3, NULL, '1999-06-30', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133066', 'Nguyễn Văn Tiến', 11, 3, NULL, '1999-11-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:21', '2019-04-11 08:09:21', 1, NULL, NULL, 'null'),
('17133067', 'Phạm Bảo Trân', 11, 3, NULL, '1999-04-23', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133068', 'Đỗ Thị Nhã Trúc', 11, 3, NULL, '1999-07-29', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133069', 'Nguyễn Chí Trường', 11, 3, NULL, '1999-08-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133071', 'Hoàng Thị Cẩm Tú', 11, 3, NULL, '1999-08-16', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133072', 'Phan Hoàng Việt', 11, 3, NULL, '1999-10-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133073', 'Phan Đăng Vui', 11, 3, NULL, '1999-06-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133074', 'Võ Hùng Vỹ', 11, 3, NULL, '1999-10-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('17133075', 'Phạm Hồng Ý', 11, 3, NULL, '1999-02-16', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:09:22', '2019-04-11 08:09:22', 1, NULL, NULL, 'null'),
('18110245', 'Lê Nhật Thu An', 12, 4, NULL, '2000-08-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:51', '2019-04-11 08:10:51', 1, NULL, NULL, 'null'),
('18110246', 'Nguyễn Trường An', 12, 4, NULL, '2000-05-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:51', '2019-04-11 08:10:51', 1, NULL, NULL, 'null'),
('18110248', 'Nguyễn Việt Anh', 12, 4, NULL, '2000-06-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:51', '2019-04-11 08:10:51', 1, NULL, NULL, 'null'),
('18110249', 'Trần Văn Ân', 13, 4, NULL, '2000-09-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:54', '2019-04-11 08:11:54', 1, NULL, NULL, 'null'),
('18110250', 'Dương Trung Bảo', 12, 4, NULL, '2000-04-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:51', '2019-04-11 08:10:51', 1, NULL, NULL, 'null'),
('18110251', 'Lê Nguyễn Gia Bảo', 13, 4, NULL, '2000-05-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:54', '2019-04-11 08:11:54', 1, NULL, NULL, 'null'),
('18110253', 'Lê Duy Bách', 13, 4, NULL, '2000-12-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110254', 'Nguyễn Thanh Bằng', 13, 4, NULL, '2000-12-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110255', 'Khổng Gia Bình', 12, 4, NULL, '2000-12-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:52', '2019-04-11 08:10:52', 1, NULL, NULL, 'null');
INSERT INTO `students` (`student_id`, `name`, `class_id`, `school_year_id`, `address`, `birthday`, `sex`, `identity_card`, `phone_no`, `is_youth_union_member`, `is_study`, `date_on_union`, `is_payed_union_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `image`) VALUES
('18110256', 'Trương Thị Cam', 12, 4, NULL, '2000-08-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:52', '2019-04-11 08:10:52', 1, NULL, NULL, 'null'),
('18110257', 'Nguyễn Võ Chinh', 13, 4, NULL, '2000-09-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110258', 'Lưu Văn Cụi', 12, 4, NULL, '2000-05-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:52', '2019-04-11 08:10:52', 1, NULL, NULL, '56408543_2275040649416514_5750598499355852800_n.jpg'),
('18110259', 'Nguyễn Tấn Cường', 12, 4, NULL, '2000-04-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:52', '2019-04-11 08:10:52', 1, NULL, NULL, 'null'),
('18110260', 'Nguyễn Khánh Duy', 12, 4, NULL, '2000-09-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:52', '2019-04-11 08:10:52', 1, NULL, NULL, 'null'),
('18110261', 'Nguyễn Quang Duy', 13, 4, NULL, '2000-11-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110262', 'Trần Nhất Duy', 12, 4, NULL, '2000-09-20', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110263', 'Đặng Vũ Dũng', 13, 4, NULL, '2000-12-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110264', 'Tạ Tiến Dũng', 12, 4, NULL, '2000-10-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110265', 'Vũ Trung Dũng', 12, 4, NULL, '2000-05-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110266', 'Trần Quang Đại', 12, 4, NULL, '2000-01-05', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110267', 'Lê Tấn Đạt', 13, 4, NULL, '2000-03-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110268', 'Nguyễn Hải Đăng', 12, 4, NULL, '2000-01-25', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110269', 'Trần Văn Hân Minh Đính', 13, 4, NULL, '2000-02-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110270', 'Võ Thành Đô', 13, 4, NULL, '2000-08-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110271', 'Thân Trọng Đông', 13, 4, NULL, '2000-11-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:55', '2019-04-11 08:11:55', 1, NULL, NULL, 'null'),
('18110272', 'Luân Văn Đức', 13, 4, NULL, '2000-01-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110273', 'Từ Hữu Hà Đức', 12, 4, NULL, '2000-09-03', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110274', 'Lê Quỳnh Giang', 12, 4, NULL, '2000-10-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110275', 'Nguyễn Trường Giang', 13, 4, NULL, '2000-02-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110276', 'Võ Hồng Tiên Giang', 13, 4, NULL, '2000-07-17', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110277', 'Lê Thanh Hải', 13, 4, NULL, '2000-10-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110278', 'Nguyễn Ngọc Hải', 12, 4, NULL, '2000-11-26', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:53', '2019-04-11 08:10:53', 1, NULL, NULL, 'null'),
('18110279', 'Thạch Ngọc Hải', 13, 4, NULL, '2000-01-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110280', 'Đỗ Ngọc Hiền', 13, 4, NULL, '2000-09-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110281', 'Đoàn Mạnh Hiếu', 12, 4, NULL, '2000-11-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110282', 'Hồ Văn Hiếu', 12, 4, NULL, '2000-02-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110283', 'Nguyễn Ngọc Trung Hiếu', 12, 4, NULL, '2000-11-16', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110284', 'Hồ Huy Hoàng', 12, 4, NULL, '2000-04-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110285', 'Nguyễn Thị Minh Hoàng', 12, 4, NULL, '2000-11-22', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110286', 'Phan Minh Hoàng', 13, 4, NULL, '2000-01-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110287', 'Phạm Minh Hoàng', 12, 4, NULL, '2000-11-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110288', 'Trần Ngọc Hoàng', 12, 4, NULL, '2000-09-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110289', 'Trần Văn Hoàng', 12, 4, NULL, '2000-03-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:54', '2019-04-11 08:10:54', 1, NULL, NULL, 'null'),
('18110290', 'Nguyễn Đức Hòa', 12, 4, NULL, '2000-11-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110291', 'Đỗ Tân Hợp', 12, 4, NULL, '2000-08-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110292', 'Lê Trần Đức Huy', 12, 4, NULL, '2000-10-06', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110293', 'Nguyễn Hoàng Huy', 12, 4, NULL, '2000-12-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110294', 'Nguyễn Hoàng Huy', 12, 4, NULL, '2000-06-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110295', 'Đỗ Quang Hùng', 12, 4, NULL, '2000-10-01', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110296', 'Hoàng Dương Hùng', 12, 4, NULL, '2000-08-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110298', 'Tạ Thị Mai Hương', 12, 4, NULL, '2000-05-25', 2, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110299', 'Nguyễn Đông Hướng', 12, 4, NULL, '2000-01-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:55', '2019-04-11 08:10:55', 1, NULL, NULL, 'null'),
('18110300', 'Nguyễn Đào Khang Hy', 12, 4, NULL, '2000-02-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110301', 'Nguyễn Tài Kha', 12, 4, NULL, '1999-01-04', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110302', 'Phạm Thúc Kha', 13, 4, NULL, '2000-06-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:56', '2019-04-11 08:11:56', 1, NULL, NULL, 'null'),
('18110303', 'Hồ Quốc Khánh', 12, 4, NULL, '2000-05-01', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110304', 'Lâm Quốc Khánh', 12, 4, NULL, '2000-09-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110305', 'Nguyễn Ngọc Khánh', 13, 4, NULL, '2000-02-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110306', 'Mai Đăng Khoa', 13, 4, NULL, '2000-02-06', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110307', 'Phan Duy Khoa', 13, 4, NULL, '2000-04-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110308', 'Nguyễn Hải An Khương', 13, 4, NULL, '2000-04-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110309', 'Trần Trung Kiên', 13, 4, NULL, '2000-03-02', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110310', 'Nguyễn Tuấn Kiệt', 13, 4, NULL, '1999-12-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110311', 'Nguyễn Văn Linh', 13, 4, NULL, '2000-05-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110312', 'Hồ Phi Long', 12, 4, NULL, '2000-01-17', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110313', 'Nguyễn Thành Long', 13, 4, NULL, '2000-11-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110314', 'Phạm Hoàng Long', 13, 4, NULL, '2000-03-11', 1, NULL, NULL, 1, 3, NULL, 1, '2019-04-11 08:11:57', '2019-04-11 08:11:57', 1, NULL, NULL, 'null'),
('18110315', 'Trần Hoàng Long', 13, 4, NULL, '2000-02-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110316', 'Trần Thành Long', 13, 4, NULL, '2000-07-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110317', 'Mai Văn Lượng', 13, 4, NULL, '2000-10-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110318', 'Phạm Nhật Minh', 13, 4, NULL, '2000-08-28', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110319', 'Vũ Nhật Minh', 13, 4, NULL, '2000-02-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110320', 'Vũ Trần Quốc Minh', 13, 4, NULL, '2000-05-31', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110321', 'Nguyễn Hoài Nam', 12, 4, NULL, '2000-08-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110322', 'Trần Hà Nam', 13, 4, NULL, '1999-10-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110323', 'Trần Quốc Nam', 12, 4, NULL, '2000-06-01', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110324', 'Bùi Văn Nghĩa', 12, 4, NULL, '2000-01-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110325', 'Đặng Văn Nghĩa', 12, 4, NULL, '2000-06-06', 1, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:10:56', '2019-04-11 08:10:56', 1, NULL, NULL, 'null'),
('18110326', 'Huỳnh Trọng Nghĩa', 12, 4, NULL, '2000-06-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110327', 'Trương Thị Thảo Nguyên', 12, 4, NULL, '2000-03-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110328', 'Nguyễn Thanh Nhân', 12, 4, NULL, '2000-05-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110329', 'Nguyễn Võ Tuấn Nhân', 12, 4, NULL, '2000-05-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110330', 'Chung Thiên Nhi', 12, 4, NULL, '2000-02-26', 2, NULL, NULL, 1, 4, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110331', 'Phạm Xuân Nhuận', 12, 4, NULL, '2000-01-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110332', 'Nguyễn Quốc Ninh', 12, 4, NULL, '2000-11-19', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110333', 'Nguyễn Văn Pháp', 12, 4, NULL, '2000-09-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110335', 'Phan Thanh Phát', 12, 4, NULL, '2000-01-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:57', '2019-04-11 08:10:57', 1, NULL, NULL, 'null'),
('18110336', 'Bùi Lê Tấn Phi', 12, 4, NULL, '2000-02-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110337', 'Cao Phạm Hoàng Phúc', 13, 4, NULL, '2000-03-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110338', 'Huỳnh Ngọc Phúc', 12, 4, NULL, '2000-01-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110339', 'Nguyễn Trần Phúc', 12, 4, NULL, '2000-10-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110340', 'Phan Văn Phúc', 13, 4, NULL, '2000-10-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:58', '2019-04-11 08:11:58', 1, NULL, NULL, 'null'),
('18110341', 'Nguyễn Thị Bích Phương', 12, 4, NULL, '2000-02-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110342', 'Tô Minh Phước', 13, 4, NULL, '2000-08-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110343', 'Gian Thiệu Quân', 12, 4, NULL, '2000-05-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110344', 'Võ Trần Minh Quân', 12, 4, NULL, '2000-09-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110345', 'Nguyễn Anh Quốc', 13, 4, NULL, '2000-04-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110346', 'Nguyễn Đức Minh Quốc', 12, 4, NULL, '2000-01-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110347', 'Đào Thị Mỹ Quyên', 12, 4, NULL, '2000-06-28', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:58', '2019-04-11 08:10:58', 1, NULL, NULL, 'null'),
('18110348', 'Hoàng Thái Như Quỳnh', 13, 4, NULL, '2000-08-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110349', 'Lê Trình Diễm Quỳnh', 12, 4, NULL, '2000-07-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110350', 'Lê Tấn Qúi', 12, 4, NULL, '2000-05-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110351', 'Châu Hoàng Sa', 12, 4, NULL, '2000-11-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110352', 'Đặng Văn Sang', 12, 4, NULL, '2000-03-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110353', 'Nguyễn Khắc Thành Sang', 12, 4, NULL, '2000-08-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110354', 'Nguyễn Quyết Sinh', 12, 4, NULL, '2000-02-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110355', 'Nguyễn Phan Sự', 13, 4, NULL, '2000-02-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110356', 'Lê Hửu Tâm', 12, 4, NULL, '2000-07-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110357', 'Lương Hữu Tâm', 12, 4, NULL, '2000-10-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110359', 'Trần Đăng Tâm', 12, 4, NULL, '2000-04-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:10:59', '2019-04-11 08:10:59', 1, NULL, NULL, 'null'),
('18110360', 'Lê Đức Tân', 13, 4, NULL, '2000-01-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110361', 'Nguyễn Văn Tân', 13, 4, NULL, '2000-09-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110362', 'Cao Thị Hoài Thanh', 13, 4, NULL, '2000-03-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, '56262420_819696941696568_3756931923876773888_n.jpg'),
('18110363', 'Đỗ Minh Thanh', 12, 4, NULL, '2000-01-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110364', 'Nguyễn Đoàn Quốc Thanh', 12, 4, NULL, '2000-08-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110365', 'Thòng Chủ Thành', 12, 4, NULL, '2000-11-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110366', 'Lê Thị Phương Thảo', 12, 4, NULL, '2000-10-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110367', 'Nguyễn Thị Thảo', 13, 4, NULL, '2000-01-20', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:59', '2019-04-11 08:11:59', 1, NULL, NULL, 'null'),
('18110368', 'Ngô Xuân Thắng', 12, 4, NULL, '2000-02-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110369', 'Nguyễn Đăng Thắng', 13, 4, NULL, '2000-09-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110370', 'Ngô Đồng Thiện', 13, 4, NULL, '2000-02-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110371', 'Trần Ngọc Minh Thiện', 13, 4, NULL, '2000-01-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, '52898452_1178690272306209_5647291462006603776_n.jpg'),
('18110372', 'Nguyễn Trường Thịnh', 13, 4, NULL, '2000-08-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110373', 'Trần Hoài Lệ Thương', 12, 4, NULL, '1993-10-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110374', 'Trần Thủy Tiên', 12, 4, NULL, '1997-12-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110375', 'Nguyễn Minh Tiền', 13, 4, NULL, '2000-10-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110376', 'Lưu Quang Tiến', 13, 4, NULL, '2000-09-18', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110377', 'Nguyễn Huỳnh Minh Tiến', 12, 4, NULL, '2000-09-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:00', '2019-04-11 08:11:00', 1, NULL, NULL, 'null'),
('18110378', 'Nguyễn Minh Tiến', 12, 4, NULL, '2000-03-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110379', 'Nguyễn Bùi Tiệp', 13, 4, NULL, '2000-04-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110380', 'Trần Quang Tỉnh', 12, 4, NULL, '2000-02-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110381', 'Nguyễn Trung Tín', 13, 4, NULL, '2000-09-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110382', 'Trần Thanh Toàn', 12, 4, NULL, '2000-05-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110384', 'Hồ Văn Trường', 13, 4, NULL, '2000-05-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:00', '2019-04-11 08:12:00', 1, NULL, NULL, 'null'),
('18110385', 'Phạm Nhựt Trường', 12, 4, NULL, '2000-09-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110386', 'Nguyễn Đức Tuấn', 13, 4, NULL, '2000-10-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:01', '2019-04-11 08:12:01', 1, NULL, NULL, 'null'),
('18110387', 'Nguyễn Thanh Tú', 12, 4, NULL, '2000-01-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110388', 'Trương Ngọc Vĩnh Tú', 13, 4, NULL, '2000-04-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:01', '2019-04-11 08:12:01', 1, NULL, NULL, 'null'),
('18110389', 'Nguyễn Văn Từ', 12, 4, NULL, '2000-09-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110390', 'Nguyễn Vũ Ngọc Uyên', 12, 4, NULL, '2000-09-29', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110393', 'Lã Quốc Việt', 12, 4, NULL, '2000-11-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110394', 'Kiều Xuân Vinh', 13, 4, NULL, '2000-09-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:01', '2019-04-11 08:12:01', 1, NULL, NULL, 'null'),
('18110395', 'Lê Khánh Vinh', 12, 4, NULL, '2000-07-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:01', '2019-04-11 08:11:01', 1, NULL, NULL, 'null'),
('18110396', 'Vương Quốc Vinh', 13, 4, NULL, '2000-12-21', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:01', '2019-04-11 08:12:01', 1, NULL, NULL, 'null'),
('18110397', 'Huỳnh Văn Vĩ', 13, 4, NULL, '2000-08-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:01', '2019-04-11 08:12:01', 1, NULL, NULL, 'null'),
('18110399', 'Thi Lý Vũ', 12, 4, NULL, '2000-01-09', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18110400', 'Huỳnh Thị Thúy Vy', 13, 4, NULL, '2000-05-20', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:12:01', '2019-04-11 08:12:01', 1, NULL, NULL, 'null'),
('18110401', 'Nguyễn Tô Thuyết Y', 12, 4, NULL, '2000-07-06', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18110402', 'Lê Thị Ngọc Yến', 12, 4, NULL, '2000-08-30', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18110403', 'Lương Thế Anh', 12, 4, NULL, '1999-03-08', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18110404', 'Thông Đoan', 12, 4, NULL, '1999-12-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18110406', 'Thạch Thị Si Nên', 12, 4, NULL, '1998-11-12', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18110407', 'Nại Quảng Hồng Nhi', 12, 4, NULL, '1999-08-28', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:11:02', '2019-04-11 08:11:02', 1, NULL, NULL, 'null'),
('18133002', 'Trần Quang Bách', 14, 4, NULL, '2000-02-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:18', '2019-04-11 08:13:18', 1, NULL, NULL, 'null'),
('18133003', 'Trần Hoàng An Bình', 14, 4, NULL, '2000-01-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:18', '2019-04-11 08:13:18', 1, NULL, NULL, 'null'),
('18133004', 'Nguyễn Thành Công', 14, 4, NULL, '2000-10-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:18', '2019-04-11 08:13:18', 1, NULL, NULL, 'null'),
('18133006', 'Phan Thành Đạt', 14, 4, NULL, '2000-09-26', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:18', '2019-04-11 08:13:18', 1, NULL, NULL, 'null'),
('18133007', 'Trần Tiến Đức', 14, 4, NULL, '2000-07-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:18', '2019-04-11 08:13:18', 1, NULL, NULL, 'null'),
('18133009', 'Lê Nam Hải', 14, 4, NULL, '2000-08-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133010', 'Nguyễn Hoàng Đại Hải', 14, 4, NULL, '2000-09-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133011', 'Nguyễn Huỳnh Phúc Hậu', 14, 4, NULL, '2000-10-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133012', 'Lê Chí Hiếu', 14, 4, NULL, '2000-02-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133013', 'Nguyễn Xuân Hiệu', 14, 4, NULL, '2000-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133014', 'Nguyễn Ngọc Hòa', 14, 4, NULL, '2000-03-10', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133015', 'Ngô Trí Huy', 14, 4, NULL, '2000-04-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133016', 'Nguyễn Quang Hùng', 14, 4, NULL, '2000-07-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133017', 'Phạm Ngọc Hùng', 14, 4, NULL, '2000-10-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:19', '2019-04-11 08:13:19', 1, NULL, NULL, 'null'),
('18133018', 'Phạm Văn Hùng', 14, 4, NULL, '2000-10-29', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133019', 'Đỗ Hải Hưng', 14, 4, NULL, '2000-01-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133020', 'Nguyễn Khánh Hưng', 14, 4, NULL, '2000-04-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133021', 'Lê Đình Khang', 14, 4, NULL, '2000-03-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133022', 'Nguyễn Đăng Khoa', 14, 4, NULL, '2000-06-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133023', 'Lê Thị Thùy Linh', 14, 4, NULL, '2000-04-29', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133024', 'Ngô Phi Lít', 14, 4, NULL, '2000-07-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133025', 'Huỳnh Thiên Long', 14, 4, NULL, '2000-04-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:20', '2019-04-11 08:13:20', 1, NULL, NULL, 'null'),
('18133026', 'Lương Uy Long', 14, 4, NULL, '2000-06-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133029', 'Huỳnh Thị Hương Ly', 14, 4, NULL, '2000-03-07', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133030', 'Lê Đỗ Trà My', 14, 4, NULL, '2000-02-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133031', 'Nguyễn Duy Nam', 14, 4, NULL, '2000-01-28', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133032', 'Trương Vạn Nam', 14, 4, NULL, '2000-09-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133033', 'Võ Thị Thanh Ngân', 14, 4, NULL, '2000-12-24', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133034', 'Đinh Quang Ngọc', 14, 4, NULL, '2000-08-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133035', 'Lương Bá Nguyên', 14, 4, NULL, '2000-09-04', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133036', 'Trần Gia Nguyên', 14, 4, NULL, '2000-09-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:21', '2019-04-11 08:13:21', 1, NULL, NULL, 'null'),
('18133037', 'Nguyễn Hữu Nhật', 14, 4, NULL, '2000-02-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133038', 'Phạm Đình Nhiên', 14, 4, NULL, '2000-11-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133039', 'Nguyễn Tuấn Phi', 14, 4, NULL, '2000-09-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133040', 'Đỗ Đình Phùng', 14, 4, NULL, '2000-02-23', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133041', 'Nguyễn Hoàng Phúc', 14, 4, NULL, '1999-10-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133042', 'Nguyễn Tấn Phúc', 14, 4, NULL, '2000-09-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133043', 'Nguyễn Minh Phụng', 14, 4, NULL, '2000-08-14', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133044', 'Nguyễn Thị Như Quỳnh', 14, 4, NULL, '2000-02-05', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133045', 'Nguyễn Minh Sang', 14, 4, NULL, '2000-04-20', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:22', '2019-04-11 08:13:22', 1, NULL, NULL, 'null'),
('18133046', 'Đặng Ngọc Sơn', 14, 4, NULL, '2000-07-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133047', 'Võ Hà Nhật Tân', 14, 4, NULL, '2000-01-30', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133048', 'Nguyễn Hoàn Thai', 14, 4, NULL, '1999-03-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133050', 'Đào Văn Thắng', 14, 4, NULL, '2000-01-27', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133051', 'Phạm Văn Thắng', 14, 4, NULL, '2000-01-02', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133052', 'Phạm Việt Thắng', 14, 4, NULL, '2000-01-12', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133053', 'Nguyễn Minh Thiện', 14, 4, NULL, '2000-02-24', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133054', 'Trần Như Thuận', 14, 4, NULL, '2000-11-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:23', '2019-04-11 08:13:23', 1, NULL, NULL, 'null'),
('18133055', 'Đào Minh Thy', 14, 4, NULL, '2000-09-27', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133056', 'Nguyễn Đăng Phước Tín', 14, 4, NULL, '2000-02-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133057', 'Bùi Sỹ Toàn', 14, 4, NULL, '2000-12-17', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133058', 'Nguyễn Anh Triều', 14, 4, NULL, '2000-08-25', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133059', 'Phan Thành Trung', 14, 4, NULL, '2000-07-16', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133060', 'Trần Minh Tú Trung', 14, 4, NULL, '2000-08-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133061', 'Trịnh Công Viễn', 14, 4, NULL, '2000-10-03', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133062', 'Lâm Hoàng Việt', 14, 4, NULL, '2000-05-15', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133063', 'Nguyễn Văn Quốc Vĩ', 14, 4, NULL, '2000-06-01', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:24', '2019-04-11 08:13:24', 1, NULL, NULL, 'null'),
('18133064', 'Nguyễn Tuấn Vũ', 14, 4, NULL, '2000-01-22', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:25', '2019-04-11 08:13:25', 1, NULL, NULL, '52486625_1022051824655633_6155410355393658880_n.jpg'),
('18133065', 'Võ Việt Vỹ', 14, 4, NULL, '2000-10-11', 1, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:25', '2019-04-11 08:13:25', 1, NULL, NULL, 'null'),
('18133066', 'Trần Thị Lệ Xuân', 14, 4, NULL, '2000-04-30', 2, NULL, NULL, 1, 1, NULL, 1, '2019-04-11 08:13:25', '2019-04-11 08:13:25', 1, NULL, NULL, 'null'),
('19110000', 'Nguyễn Văn Test', 1, 1, 'Bình Điền, Long An', '2001-01-31', 1, NULL, NULL, 1, 1, '2019-06-16', 1, '2019-06-30 00:48:06', '2019-06-30 00:49:43', NULL, NULL, NULL, 'null');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0: Sinh vien,  1: Thuong truc, 2: UV BCH, 3: BCS',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `student_id`, `level`, `created_by`, `updated_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '000000@hcmute.edu.vn', NULL, '$2y$10$T03iBiOcF3njFZYXFpjSOeeRu38lx2VpM4DTwVcW66.TIQhWJqRY2', '000000', 0, NULL, NULL, 'I27Z9k9CSYMSQ0SeKeEMZTOZhtkJXbkL35xhGWY6zLIE3M46GTMtIm3AMS3X', '2019-04-11 07:37:30', '2019-04-11 07:37:30', NULL),
(2, '15110162@student.hcmute.edu.vn', NULL, '$2y$10$hAzk1m68DnxYdqSOVloPhOb1BMJ3XfSwPdjQWMxdQHY1OiU8iMxW6', '15110162', 0, 1, NULL, NULL, '2019-04-11 07:45:24', '2019-04-11 07:45:24', NULL),
(3, '15110166@student.hcmute.edu.vn', NULL, '$2y$10$3XnX8oIVJ1BeEtB/C/5FJeVXVZhFzNqNEwkTJVTY1Kdx.s2pmxdAC', '15110166', 0, 1, NULL, NULL, '2019-04-11 07:45:24', '2019-04-11 07:45:24', NULL),
(4, '15110168@student.hcmute.edu.vn', NULL, '$2y$10$Ar4BT.y5BSMXdQPVaE5iauW9/1eRaKkuu82bB8Pz4RPd5llUYuqRG', '15110168', 0, 1, NULL, NULL, '2019-04-11 07:45:24', '2019-04-11 07:45:24', NULL),
(5, '15110171@student.hcmute.edu.vn', NULL, '$2y$10$UNGq1mRj6f237A91B8.ThuZwMQ9UVdkjfv2BjFF.bpgqVAQfA53GG', '15110171', 0, 1, NULL, NULL, '2019-04-11 07:45:24', '2019-04-11 07:45:24', NULL),
(6, '15110177@student.hcmute.edu.vn', NULL, '$2y$10$qvooX8Cq463pausbAyEhluonosir.RqZDXtBCRptC3pu8FrFs1PRK', '15110177', 0, 1, NULL, NULL, '2019-04-11 07:45:24', '2019-04-11 07:45:24', NULL),
(7, '15110178@student.hcmute.edu.vn', NULL, '$2y$10$XUQy/aOGrpGNTMZnGpOfaenNcWWpy2pGRp08c64FWjI..mUXtWYkW', '15110178', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(8, '15110182@student.hcmute.edu.vn', NULL, '$2y$10$tvdtXXLlZTOvvj7PFWGc8eDDLyIUU547RoTG7VHdSNMdbMXBNoKgO', '15110182', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(9, '15110183@student.hcmute.edu.vn', NULL, '$2y$10$xM0YynaB9I4BTPW0uJjNQud0qVpx8AZv7mT/Yz3NjrYUbaBevqwha', '15110183', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(10, '15110188@student.hcmute.edu.vn', NULL, '$2y$10$J/UnW4Ei0wbxGWNGOtNVFORlZSd7xKcVJ5XMvDDRPlbGC4K8ZXdoO', '15110188', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(11, '15110191@student.hcmute.edu.vn', NULL, '$2y$10$M9R5Scq5vlRytgAPICV8H.b9cnhi4wJb2xZsoX6Hcf8l2qG2TrAem', '15110191', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(12, '15110192@student.hcmute.edu.vn', NULL, '$2y$10$sjt/cJhVYzVVfcsO47Y43.jgkPhsYCH/y6foJxlHrQAFUppVW9Vie', '15110192', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(13, '15110193@student.hcmute.edu.vn', NULL, '$2y$10$r7c7wX09.Jqtb7e7g6O6mOGYRDGFqAwZ1j8nD28q4iM3ZTqg7V5UC', '15110193', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(14, '15110195@student.hcmute.edu.vn', NULL, '$2y$10$vuZZJR0A8rTEKT..G5OaQekmHVx1a.lwZiN4wS0mDYFyfOauklFaS', '15110195', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(15, '15110198@student.hcmute.edu.vn', NULL, '$2y$10$mruBvXPtwqHrxLp/xrkmXeqYavuA4iycuIdUdsapt/2MyOBkGkx1G', '15110198', 0, 1, NULL, NULL, '2019-04-11 07:45:25', '2019-04-11 07:45:25', NULL),
(16, '15110201@student.hcmute.edu.vn', NULL, '$2y$10$944Q.fZv8iuZnVgD6GGpT.xIhOyIE0EjMuRh2dhnXKsbKTatllfxe', '15110201', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(17, '15110202@student.hcmute.edu.vn', NULL, '$2y$10$H4f6YpvzpVo8egENMZhT0ORM3kFw05DGq8/Hs2IDkVnhGtzlrEafi', '15110202', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(18, '15110208@student.hcmute.edu.vn', NULL, '$2y$10$Zn3TvRv7oCQ5AQVRfbKe/.hUm3r5vtlHmGvn8L93xzIc5juhdGJTG', '15110208', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(19, '15110212@student.hcmute.edu.vn', NULL, '$2y$10$t57RKjanyPs1pm5BrrCuruN1d1tjqtIL2yjY27CIuNM67xKCrSJoW', '15110212', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(20, '15110219@student.hcmute.edu.vn', NULL, '$2y$10$SBAbLjE5vojStLnfVMF9iehbHW8epp7yQUj6zpa2F.0jR8nRfGXHe', '15110219', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(21, '15110220@student.hcmute.edu.vn', NULL, '$2y$10$5Y1WnlRfQt359G6mbAew9ONaoJs5rSULPaJPdKpQ2F4kSk2.GYHxO', '15110220', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(22, '15110223@student.hcmute.edu.vn', NULL, '$2y$10$J2gbg50DOiWLpN3FZpHK7eOjZKfsgWHCXW5p7XqaK7k9JfpK1rmSq', '15110223', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(23, '15110226@student.hcmute.edu.vn', NULL, '$2y$10$WerH2API76/c4d/Y/9sJxOksEtlyWRvGP3JIJkodi427o4DXgCEy6', '15110226', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(24, '15110227@student.hcmute.edu.vn', NULL, '$2y$10$oJvb7uhFFsKykwrF3ZCoq.z7ahSRXtbmoW7JbExBBBUyllcJCGmpu', '15110227', 0, 1, NULL, NULL, '2019-04-11 07:45:26', '2019-04-11 07:45:26', NULL),
(25, '15110228@student.hcmute.edu.vn', NULL, '$2y$10$pSOZjXYwAavv5EJZwn8cde0gLkVlG8BRDgHqzfx5XJp/cTnme2yWC', '15110228', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(26, '15110229@student.hcmute.edu.vn', NULL, '$2y$10$3pT.N3raInx6fOQM/UeEMuVZu2sdb33uGjvR2th/EzZmJp7HqpwRK', '15110229', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(27, '15110230@student.hcmute.edu.vn', NULL, '$2y$10$ewQxLSTMzzj7Rao6Qcu9Yu7AE/oG1E.mKO/Meq40MpbuiOjVZu1Ee', '15110230', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(28, '15110231@student.hcmute.edu.vn', NULL, '$2y$10$Qw9Ztkd.GYQP5xfJYBz/AuFaHNKebxKC3vIclGjJ18kVu5jSTW/di', '15110231', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(29, '15110233@student.hcmute.edu.vn', NULL, '$2y$10$rdxd0eryQE3INA6hD3GaXuICV.r0SksMHSozVl.x3EKeNQ/YDFXeK', '15110233', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(30, '15110234@student.hcmute.edu.vn', NULL, '$2y$10$0d3ZINc9/dAbbTyGFh2Ux.Oxf875EyUli1tOmXJjeLQDSGMTA8DWm', '15110234', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(31, '15110236@student.hcmute.edu.vn', NULL, '$2y$10$ofsCO89tmxVlfqTJml91ueAP3zVhrY8nVQu3m0LIBcBddR2QL4dqa', '15110236', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(32, '15110242@student.hcmute.edu.vn', NULL, '$2y$10$Em/f8lpqjoeN74Kg2gqVbeacwlZGrGQBJzahNddlsgyJKcoyuW5ke', '15110242', 0, 1, NULL, NULL, '2019-04-11 07:45:27', '2019-04-11 07:45:27', NULL),
(33, '15110245@student.hcmute.edu.vn', NULL, '$2y$10$dW5RGBY5YyfiG4UbYeQy6.i4gzIpHLvxc4DHyWfmRLvqXOo4gZTN.', '15110245', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(34, '15110246@student.hcmute.edu.vn', NULL, '$2y$10$YAOc5snM.bgib3pQlvboeuwBmTetacz26OpwwYqj3mm5qmhyS4ypW', '15110246', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(35, '15110247@student.hcmute.edu.vn', NULL, '$2y$10$uDvCwF7KziJ9F/oW6mpYg.RSrf7U088MFbwSLiuk.M2ebRb7d86MC', '15110247', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(36, '15110250@student.hcmute.edu.vn', NULL, '$2y$10$MU3DAU97eP/EXBX1ShwNqekX2TICi5IrruLIixXGy2fuZUpXBd3si', '15110250', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(37, '15110251@student.hcmute.edu.vn', NULL, '$2y$10$9xzB6oR8oSUeMxbYd34IzOFhXKyqSd2RxsHqxpzP32AfpJSdEWbO6', '15110251', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(38, '15110252@student.hcmute.edu.vn', NULL, '$2y$10$cabmhnimPC73bbmCuTLFx.q/Zqgw52WKnUcinP4rFvG0YBRbdmVdS', '15110252', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(39, '15110253@student.hcmute.edu.vn', NULL, '$2y$10$W/21y1Bhewpm12bBnIg4LeYhvMLyKxV4Wxyr25qJtkX/cICOsOWme', '15110253', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(40, '15110263@student.hcmute.edu.vn', NULL, '$2y$10$tfJyiFA/SWmyXuO6yFnugOFLvu5smbzTKx6AgvdPletk2MSj80R5i', '15110263', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(41, '15110264@student.hcmute.edu.vn', NULL, '$2y$10$5kZorSpjbMwVjbzJjQDJfO0zpUXq./v8.76yEijimn4.hW.D5oJzS', '15110264', 0, 1, NULL, NULL, '2019-04-11 07:45:28', '2019-04-11 07:45:28', NULL),
(42, '15110268@student.hcmute.edu.vn', NULL, '$2y$10$dG.losvZxj1Apx6F9M0RyOGkG8hQjclJoPQNHMhW5/.T75UVGDNAu', '15110268', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(43, '15110270@student.hcmute.edu.vn', NULL, '$2y$10$y1mJj21KdQ/RnpU8HF4bPeLpWdfeCwzuauG27oh3Iy7pvs2s6pG.S', '15110270', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(44, '15110271@student.hcmute.edu.vn', NULL, '$2y$10$s9dF6y/u/z.h9O7l4yAZ4eUuCGoivPH/0H8d8rYXv3lrcYhN0X5qe', '15110271', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(45, '15110275@student.hcmute.edu.vn', NULL, '$2y$10$Po5.Y8xHpqGWdpXAkK175uuygsmbnBJCZE564iDVmsQPOsUTGlfx2', '15110275', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(46, '15110277@student.hcmute.edu.vn', NULL, '$2y$10$35.KcKFSFI.84zzJm.ICuOQkMOVxPcs8gRskh/ostNt3u2sldOm.C', '15110277', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(47, '15110279@student.hcmute.edu.vn', NULL, '$2y$10$x2Aq9nGQSELu/OuOcM8lQem.imDVMcTsFP32OOattjO3xRngcAPay', '15110279', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(48, '15110280@student.hcmute.edu.vn', NULL, '$2y$10$q15PFiYtNy8s1vOY9QE8jejihZnKYl3tIs3uKGp2.GiqOddscirNK', '15110280', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(49, '15110282@student.hcmute.edu.vn', NULL, '$2y$10$W/F00ZZwyUH0HNaMhOV1/eU1Gf9cuiSbraQkPpwWMJ2OKmTM4GFZK', '15110282', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(50, '15110283@student.hcmute.edu.vn', NULL, '$2y$10$rNZLvaRESSj2sTS5P0j9AeA7WjoE58KGGrFexDh6/VzjykCRyZfx2', '15110283', 0, 1, NULL, NULL, '2019-04-11 07:45:29', '2019-04-11 07:45:29', NULL),
(51, '15110287@student.hcmute.edu.vn', NULL, '$2y$10$XcCm9fTXkzG.A5iS15TQq.MiPe9p6/H7GbyPL7zLGhdu7xIr6bbrq', '15110287', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(52, '15110289@student.hcmute.edu.vn', NULL, '$2y$10$dbADaPcx0UfY4M3c27I7B.s5wXFvXTjuCCL/5Xo7W1VAVETJhwzNG', '15110289', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(53, '15110290@student.hcmute.edu.vn', NULL, '$2y$10$NkGwStLv3P541T.HrQ8l.Ov091don4MaEGHItHnUckLDp3JLowpp.', '15110290', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(54, '15110292@student.hcmute.edu.vn', NULL, '$2y$10$IEGIV/dawZKR8M4dke9iLO.07Cc7ZJlcvA25AT0ZnYSHA9w/8v3v2', '15110292', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(55, '15110294@student.hcmute.edu.vn', NULL, '$2y$10$fqNUeLBllynVlS7uJ7fedON7hbk5VgMHoj0c2Rt9Q3BzGVtSmZm6K', '15110294', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(56, '15110301@student.hcmute.edu.vn', NULL, '$2y$10$fPiAa2GE8iYAhmCrmxFfze9JPM8rtV5wJOBK5EQD737.ij70FOsS2', '15110301', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(57, '15110306@student.hcmute.edu.vn', NULL, '$2y$10$U6XE1vT3bowuGP6TeDCl5eTvD84dDkkajugZMHzijXhLbdfX0YbmW', '15110306', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(58, '15110308@student.hcmute.edu.vn', NULL, '$2y$10$AQEdyBDnAe/AjsxLAaAsb.WpLi7r2AZBy3DRgxWsjBC8n3b50Yiwu', '15110308', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(59, '15110310@student.hcmute.edu.vn', NULL, '$2y$10$tZDPzkveV1buUJt29pWp4uPyYCnAL7GB2d8X2oC.Zkf/a42ocvz.O', '15110310', 0, 1, NULL, NULL, '2019-04-11 07:45:30', '2019-04-11 07:45:30', NULL),
(60, '15110311@student.hcmute.edu.vn', NULL, '$2y$10$BXcyZWghqNis4BWQFV7K6eNwX7miz0s/0a4/yPJYwRJEspSTgCZpm', '15110311', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(61, '15110312@student.hcmute.edu.vn', NULL, '$2y$10$XgO09XJotAv0X9h6au7kCeTI6IJFUa6v1qSikpI/gYzbQdsbk7QP2', '15110312', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(62, '15110315@student.hcmute.edu.vn', NULL, '$2y$10$JYMtH0b6xr/h7HQ1sG3Pw.2tVVcxwifZ76LlXnCs3xTfVEZAICkiS', '15110315', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(63, '15110319@student.hcmute.edu.vn', NULL, '$2y$10$zRRWFAc1cr9cr22Lspdc7O5tDbGIY8TdDeQOhUCoJpoVX457u00gS', '15110319', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(64, '15110320@student.hcmute.edu.vn', NULL, '$2y$10$7ee66pXr2d5YuZwoAxeR8uLdW2YJk.Hxr/s91F7ISicP94Joo2cVu', '15110320', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(65, '15110321@student.hcmute.edu.vn', NULL, '$2y$10$rl8henTmg2sZtqabW2HJTez6jjx/50KmfIj0mAmuHJxUzCtDh75na', '15110321', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(66, '15110326@student.hcmute.edu.vn', NULL, '$2y$10$nL53aDyDCJD960wMgseqfuRPbSIBOh3NTEQq1y3cCsNJZJQm6shgi', '15110326', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(67, '15110327@student.hcmute.edu.vn', NULL, '$2y$10$8C0ForenLYKH.SO8s0seJuR/OsIzBfV10/kIPzsXmk0tTxDEzeMlq', '15110327', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(68, '15110328@student.hcmute.edu.vn', NULL, '$2y$10$IObssn6EZzzxxR.V/0GFpeuRvkpSX2n.YilLhSa9EL09KaDJegQXe', '15110328', 0, 1, NULL, NULL, '2019-04-11 07:45:31', '2019-04-11 07:45:31', NULL),
(69, '15110331@student.hcmute.edu.vn', NULL, '$2y$10$TduPo3r9pLfYEPbGXFgImelE4WakyqbbmcgODwWHsZby706iuKyK.', '15110331', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(70, '15110332@student.hcmute.edu.vn', NULL, '$2y$10$GGqQhOWzR0hy.U9xuB0W5ua3a89ETsCLt./BpiGae1l8UibX64Nby', '15110332', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(71, '15110333@student.hcmute.edu.vn', NULL, '$2y$10$p/AUPodHbIedsPixWj5YVO568b4PLENYtaailM4qElWXweF274UjS', '15110333', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(72, '15110334@student.hcmute.edu.vn', NULL, '$2y$10$gnCGSCzCVs1EuVbGy3.UB.k2N0XxJ6tdpzpr/HW1NnEFoSMU7h9fy', '15110334', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(73, '15110337@student.hcmute.edu.vn', NULL, '$2y$10$y1ku7k4dkxIrtGDqnaE6MOFpuuG5JvpzgtWq1y4sXe8UbBcRUp9nm', '15110337', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(74, '15110338@student.hcmute.edu.vn', NULL, '$2y$10$UMUIStFtfNk/yvK1gnvs3.VTqOo49ca52PZeK4DgABz8v6XD4ffOa', '15110338', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(75, '15110339@student.hcmute.edu.vn', NULL, '$2y$10$a1/eUFD3HMWkHCMpHfidU.VJ2cpb19Cesj6J/Fnm5W6lWUQs45Yka', '15110339', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(76, '15110341@student.hcmute.edu.vn', NULL, '$2y$10$YcDzkywhmOmpoSzSIR0ia.w8KkKIiCaLAuf3Eg3IRgQ7XtHKP8FNi', '15110341', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(77, '15110342@student.hcmute.edu.vn', NULL, '$2y$10$FquWf/eNjjj12/OtI3gbH.ZHZ2H9fV.2wfWf5CQ3c2ojeGuBEazri', '15110342', 0, 1, NULL, NULL, '2019-04-11 07:45:32', '2019-04-11 07:45:32', NULL),
(78, '15110343@student.hcmute.edu.vn', NULL, '$2y$10$O3zEYpO6tKb2SJKhGIYyKe4I2ow2DNI.4gPuA7HGOMO3xOILOHshO', '15110343', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(79, '15110346@student.hcmute.edu.vn', NULL, '$2y$10$Hl2QQQRhsgYI8z.2FrpUNOo4KmEJJFdIzsxvkyZSV0G7QF4iT4lKG', '15110346', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(80, '15110347@student.hcmute.edu.vn', NULL, '$2y$10$SqWdjJQdioz5dk3XTbgcyO7hnFcJnjVOImoyLtrlTiT67pdri/S3C', '15110347', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(81, '15110360@student.hcmute.edu.vn', NULL, '$2y$10$duAeNbT9fX8nkXg92Rs2E.Upc4Tqh96EXinYOpm2QGUuw8mJ72rdm', '15110360', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(82, '15110364@student.hcmute.edu.vn', NULL, '$2y$10$2c/Xuyq2GXwCvU4s8QnDZO/3KPvwq3UsF1KeKwhz3t5sryNO14gk2', '15110364', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(83, '15110365@student.hcmute.edu.vn', NULL, '$2y$10$SXF5rCRQt/1myARsxBzo3.9UUvp3TnYAH3eMocTr7gFAncLryyKge', '15110365', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(84, '15110368@student.hcmute.edu.vn', NULL, '$2y$10$zY4cf/mbfALT3Q/RH9vee.NaY0n4WFIQbjW7IRGTwW0FG7wI1/386', '15110368', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(85, '15110375@student.hcmute.edu.vn', NULL, '$2y$10$r0P7YmXRdogNUyAXK.9SJetAsY292v/H4DjSu74DJoOI39fuyFe/e', '15110375', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(86, '15110378@student.hcmute.edu.vn', NULL, '$2y$10$FEHI/X2piyHFpCAf2jLBgO.pJxTzpSlz5GGeBnYy1yWSvRwtAL9aa', '15110378', 0, 1, NULL, NULL, '2019-04-11 07:45:33', '2019-04-11 07:45:33', NULL),
(87, '15110386@student.hcmute.edu.vn', NULL, '$2y$10$XIUSKkZ0Err3yq9B./se6O4Yy2ZkoLutUv1h4fmqb4nBfHrXMnY1y', '15110386', 0, 1, NULL, NULL, '2019-04-11 07:45:34', '2019-04-11 07:45:34', NULL),
(88, '15110387@student.hcmute.edu.vn', NULL, '$2y$10$Ai2GmAgVHDTeOwMwwGaese6uZ/EwBN392wZ2KV2HY3iQBfLRg21oG', '15110387', 0, 1, NULL, NULL, '2019-04-11 07:45:34', '2019-04-11 07:45:34', NULL),
(89, '15110389@student.hcmute.edu.vn', NULL, '$2y$10$taO5mefXSPmeXx61g6UsZ.xo0Yt9/3SiraBG12Fovj3XnipJFBDGS', '15110389', 0, 1, NULL, NULL, '2019-04-11 07:45:34', '2019-04-11 07:45:34', NULL),
(90, '15110391@student.hcmute.edu.vn', NULL, '$2y$10$rJOOTti1Li.pzdUpmtcnm.Cuh9RdBoMxZJNd19LoqMjBpbU/rYATe', '15110391', 0, 1, NULL, NULL, '2019-04-11 07:45:34', '2019-04-11 07:45:34', NULL),
(91, '15110701@student.hcmute.edu.vn', NULL, '$2y$10$84ExbIgFzcwK9IYSOgtVpO4tVL2tffFTphs3Jr.XVwuSe3Ob7mVsu', '15110701', 0, 1, NULL, NULL, '2019-04-11 07:45:34', '2019-04-11 07:45:34', NULL),
(92, '15110702@student.hcmute.edu.vn', NULL, '$2y$10$HDo3SYanfluJAZmmXoZTJ.aA3fimbZLtqgVjLuFZl1X.ZygUeXe9W', '15110702', 0, 1, NULL, NULL, '2019-04-11 07:45:34', '2019-04-11 07:45:34', NULL),
(93, '15110156@student.hcmute.edu.vn', NULL, '$2y$10$OTb31cae8TgE.1b2G71JEuUy0RUwg3SNXOjH0D8IRRlg9wzXq15R2', '15110156', 0, 1, NULL, NULL, '2019-04-11 07:47:44', '2019-04-11 07:47:44', NULL),
(94, '15110158@student.hcmute.edu.vn', NULL, '$2y$10$pWJEN6YEv4tBgSvGHF71w.wmmlnssjLNzQ2w9OLZNsmLKemMTS0MC', '15110158', 0, 1, NULL, NULL, '2019-04-11 07:47:44', '2019-04-11 07:47:44', NULL),
(95, '15110159@student.hcmute.edu.vn', NULL, '$2y$10$6xq8ULQvB6PusecgElAoye6TohFOLPVZSPWzJwRgjFpFRynC4bLnm', '15110159', 0, 1, NULL, NULL, '2019-04-11 07:47:44', '2019-04-11 07:47:44', NULL),
(96, '15110160@student.hcmute.edu.vn', NULL, '$2y$10$YlmtgqaXgNkXdzrEsQhBdOzMLelHps2dJh/8pcUrQCrxMMzJmios2', '15110160', 0, 1, NULL, NULL, '2019-04-11 07:47:44', '2019-04-11 07:47:44', NULL),
(97, '15110161@student.hcmute.edu.vn', NULL, '$2y$10$x62TT5eZt4358cSKmI7bDedLG16W2w5XfLd4Fkdb3NwvnQZdeAN9q', '15110161', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(98, '15110164@student.hcmute.edu.vn', NULL, '$2y$10$pbqQrl3SDDEUDw/7TcmseuvQpu0xVWo6XBHNXBgRM1PuTRYaRxsUe', '15110164', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(99, '15110165@student.hcmute.edu.vn', NULL, '$2y$10$A5iZC5i3wf5tunLkqXayl.7vMZVQBPqFVA4lBQ9fpz.4dkdWeds5m', '15110165', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(100, '15110167@student.hcmute.edu.vn', NULL, '$2y$10$I0oHTOhpLd1GTnWZH/piBu4DpX6.B644NX4LXJHRUFWELwalymTRa', '15110167', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(101, '15110173@student.hcmute.edu.vn', NULL, '$2y$10$aSkoe4asMLW2ehQJ.t4ZnuDslR5A9yl1bXfQhVYu4mXm2piMQH642', '15110173', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(102, '15110174@student.hcmute.edu.vn', NULL, '$2y$10$R.pwcUwxpcH9ITlFRaNl0uyrySnSfSBkO3hh00mU8ACo6OuXLOZjS', '15110174', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(103, '15110176@student.hcmute.edu.vn', NULL, '$2y$10$rU.gYdd2IX3DfINL5WZyDeR4..eFDR1/EaALcP50UpFMTQ4W9Dx2.', '15110176', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(104, '15110181@student.hcmute.edu.vn', NULL, '$2y$10$AGGrzP1Qlzjyib3A0HspvOGPIK9LgTsXo7PpKpYDG2KvasMSIAJdu', '15110181', 0, 1, NULL, NULL, '2019-04-11 07:47:45', '2019-04-11 07:47:45', NULL),
(105, '15110184@student.hcmute.edu.vn', NULL, '$2y$10$vqlhVRyBU4W3shC5OKxMKeuJMxSYc2AVJp7w/oKvAjDaYzsDdUcTe', '15110184', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(106, '15110185@student.hcmute.edu.vn', NULL, '$2y$10$FTEvUSBhndBAHZYYRUux5u7lWM2BRDX5DNG5Ro7jyzxUg6jZhmS5S', '15110185', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(107, '15110187@student.hcmute.edu.vn', NULL, '$2y$10$evjsm4QKkdQ9cJMJTeh2vuArjw0tD0ipBNHRr0cxp.txMzaZNKWTe', '15110187', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(108, '15110190@student.hcmute.edu.vn', NULL, '$2y$10$6SMTI3BW6Ew8R10jg4AKleum5xaPnvpAhXXcJCxSdcPEJJSkJJgWO', '15110190', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(109, '15110194@student.hcmute.edu.vn', NULL, '$2y$10$TxnhNdZ9vTBTfUMPPLsTc.k9FaO8OazNFDeBMpyeri9SwfR9QF7lK', '15110194', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(110, '15110197@student.hcmute.edu.vn', NULL, '$2y$10$U7Hgspi4BAWLBRk6VqpkDOe5xUQf9IlEiG8d4cJqcJ7Y7Tn5iLYBi', '15110197', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(111, '15110200@student.hcmute.edu.vn', NULL, '$2y$10$EB3dTfX5QVFEkAKegncHQe1gx.vSV9Dfw9NGc/I0/PJP4LbE1fVyi', '15110200', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(112, '15110209@student.hcmute.edu.vn', NULL, '$2y$10$dn/Vwjw1yaFqfmrLdKKkvukyZQ5RAk5TVofKf3I762XhHnbPAqaFC', '15110209', 0, 1, NULL, NULL, '2019-04-11 07:47:46', '2019-04-11 07:47:46', NULL),
(113, '15110213@student.hcmute.edu.vn', NULL, '$2y$10$3A/MQYVmKta6SPI1WkH7Pe0qYvIRxSprczrP780Ik0SHum.HHEWMC', '15110213', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(114, '15110218@student.hcmute.edu.vn', NULL, '$2y$10$U09DUJuSklZlqXjcyXOV9OY0s5dbk9p9CpFR2HWEgWAHxwZYwnL62', '15110218', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(115, '15110221@student.hcmute.edu.vn', NULL, '$2y$10$8MG0GjJJ.7SavMrTPydaNePO8ygBSakFJLh0FxeJ/r04uKCX23eGC', '15110221', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(116, '15110232@student.hcmute.edu.vn', NULL, '$2y$10$KUJDwFNvvKkhkP5DTFthy.xstOSlZtvsbtAe/sNiHWzE2oHzl1Cf.', '15110232', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(117, '15110241@student.hcmute.edu.vn', NULL, '$2y$10$NcQt4wvHDSFUL9SCeq4ld.taekFCz7ZYDTkRd3zKnkC2UicZzaCgm', '15110241', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(118, '15110243@student.hcmute.edu.vn', NULL, '$2y$10$KeDl4i9GBYVIHX6Cgoq4IuGmLvtxDt8SwnuVgGyrRhf3ZkqZsr9Uu', '15110243', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(119, '15110249@student.hcmute.edu.vn', NULL, '$2y$10$vM8uvQKbPCruNXqqz7.uduM6LiNcEBO5qk2PdKYVwboxBBbz4EkJq', '15110249', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(120, '15110255@student.hcmute.edu.vn', NULL, '$2y$10$9W/TwdHwjdNcN2TqRfjDEOs/S1lt.GgvSQ4pbag/RS7EcyHeRq6OK', '15110255', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(121, '15110257@student.hcmute.edu.vn', NULL, '$2y$10$u.e.bKN9Y2bKWyDfRv7x1uLno7eBiGP4u6UUEHVc.7rov861K3tfm', '15110257', 0, 1, NULL, NULL, '2019-04-11 07:47:47', '2019-04-11 07:47:47', NULL),
(122, '15110259@student.hcmute.edu.vn', NULL, '$2y$10$L8vlwLqijJ8BBzhNKBMlwePCgn7BNdbhMkBf2KTPUWu1kOjCb19wW', '15110259', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(123, '15110260@student.hcmute.edu.vn', NULL, '$2y$10$zHTGNaJjit.yzysjralrhOx32ivVcJNKd6Q9VghOzgmNZAHoLM3aK', '15110260', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(124, '15110265@student.hcmute.edu.vn', NULL, '$2y$10$NgSY2EwykSGFLCRhQ9CIpupKVFuwir/G1y89dD1fl/Jy276H1jcG2', '15110265', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(125, '15110266@student.hcmute.edu.vn', NULL, '$2y$10$XOcZds4GPewtXUgxgrfcOuuYuxR4MtGnzTip8E5.2uJWUyh22a6vO', '15110266', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(126, '15110267@student.hcmute.edu.vn', NULL, '$2y$10$CrN9BKB32bG8oueFxdWJE.CzIe0lGifa4XML7mF9LYf.wr6IMuWra', '15110267', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(127, '15110276@student.hcmute.edu.vn', NULL, '$2y$10$pazjMW1qCB2BqSEDSL4lMOILW052tzI6kOv.OkiSPDmeDeSeiy/S6', '15110276', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(128, '15110286@student.hcmute.edu.vn', NULL, '$2y$10$eqSd.eiqI89jHKorQCNtuuWYukhVgitMAGUtdWmrZ3PO.KoAV4bm.', '15110286', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(129, '15110304@student.hcmute.edu.vn', NULL, '$2y$10$QE5Yq7NS92Kn5idLlK.dZezYHAzjinwc8mK6m3Ey8HWlAuDycginO', '15110304', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(130, '15110305@student.hcmute.edu.vn', NULL, '$2y$10$.TfMFFiqldBY2sG8hoxGqOvhwZ4BFNJUGClgYO.60JJVpCR0FhOP2', '15110305', 0, 1, NULL, NULL, '2019-04-11 07:47:48', '2019-04-11 07:47:48', NULL),
(131, '15110307@student.hcmute.edu.vn', NULL, '$2y$10$g1AgRz8JJR3Ut1vohk3TmOhH8a3NDMMf6lvKVxLunwoPPnmYc1ffi', '15110307', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(132, '15110314@student.hcmute.edu.vn', NULL, '$2y$10$yyV4uw/GndCqP1XvY7UX7.0ufLhYtTLZgbAtJGo6w7rY9E33LrXIK', '15110314', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(133, '15110316@student.hcmute.edu.vn', NULL, '$2y$10$bzaEVbboMCDSIlIkZEWEIOEFuQv2SR/wDSReNUfnvC5UyVScOyVRe', '15110316', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(134, '15110317@student.hcmute.edu.vn', NULL, '$2y$10$uZm9OnFOuMcNVvfERt0YbOiTBLeURq1vk1KlMsO6YWluAhiaYTjpC', '15110317', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(135, '15110318@student.hcmute.edu.vn', NULL, '$2y$10$i0OUQet.PIc9bjrGI7kD3OZsDuSVJ7LBqFnjg9oEjlGc5PNHy0wjK', '15110318', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(136, '15110348@student.hcmute.edu.vn', NULL, '$2y$10$GQ1P.J4knHmbu0TES4ChBeaxYoTuSyspW/vMbnSZiLhn25Tnrg9Dy', '15110348', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(137, '15110349@student.hcmute.edu.vn', NULL, '$2y$10$3XCdLDqVB1GZlyYTe.9d5OENUN2NGpiyziaipHPD9NEUqus71GHTa', '15110349', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(138, '15110352@student.hcmute.edu.vn', NULL, '$2y$10$YS0ViOzNphCUp600V5WNn.8ExcfwtariWrcBQLJ073Nfh553aVYOa', '15110352', 0, 1, NULL, NULL, '2019-04-11 07:47:49', '2019-04-11 07:47:49', NULL),
(139, '15110359@student.hcmute.edu.vn', NULL, '$2y$10$5yip5X5V3fbUXKUFSwmIQuy.nPrQ3H4Clooi2ZR1s8d43b5IN0ph.', '15110359', 0, 1, NULL, NULL, '2019-04-11 07:47:50', '2019-04-11 07:47:50', NULL),
(140, '15110361@student.hcmute.edu.vn', NULL, '$2y$10$BN6hUr.IMaE6dCgfE7FJsuTkkBLn8JKIyW9/HRyK0o7q4KFc6pjmy', '15110361', 0, 1, NULL, NULL, '2019-04-11 07:47:50', '2019-04-11 07:47:50', NULL),
(141, '15110362@student.hcmute.edu.vn', NULL, '$2y$10$ud3qJvBMqghn49CF1pfTluhUW9sFFBrje6q8l8NPD.JZQyTQIaBGu', '15110362', 0, 1, NULL, NULL, '2019-04-11 07:47:50', '2019-04-11 07:47:50', NULL),
(142, '15110363@student.hcmute.edu.vn', NULL, '$2y$10$Ar2s13Rqegw08SeqSi430uvaxmk80VkRheOS25kKx30PfjxMPithy', '15110363', 0, 1, NULL, NULL, '2019-04-11 07:47:50', '2019-04-11 07:47:50', NULL),
(143, '15110369@student.hcmute.edu.vn', NULL, '$2y$10$cugruQJWC/FBkk5LB8KENOB5Cfz5C.2E7fGpSRQqnsFZZW5uBhYDe', '15110369', 0, 1, NULL, NULL, '2019-04-11 07:47:50', '2019-04-11 07:47:50', NULL),
(144, '15110371@student.hcmute.edu.vn', NULL, '$2y$10$tq3931vF9HUBhzy7P6oL0u150KLff1fKYM5TbfjLFEFggaH9s54m.', '15110371', 0, 1, NULL, NULL, '2019-04-11 07:47:50', '2019-04-11 07:47:50', NULL),
(171, '15110172@student.hcmute.edu.vn', NULL, '$2y$10$oqIc0/b5g5gds8CxeQtEVuRcmqFLj6Kw5YLzbi2D4wLyBrnscOzU6', '15110172', 0, 1, NULL, NULL, '2019-04-11 07:56:07', '2019-04-11 07:56:07', NULL),
(172, '15110175@student.hcmute.edu.vn', NULL, '$2y$10$Xy/BuqCdcescl6pUSCfvI.gxkgdyx5/ziX.A6QAHrJSAc4vHA/Yim', '15110175', 0, 1, NULL, NULL, '2019-04-11 07:56:07', '2019-04-11 07:56:07', NULL),
(173, '15110179@student.hcmute.edu.vn', NULL, '$2y$10$5QW0pzC/x6PiintVSXgK/ebEZLEzrl0dJclnutU662xoewwyAqkey', '15110179', 0, 1, NULL, NULL, '2019-04-11 07:56:07', '2019-04-11 07:56:07', NULL),
(174, '15110180@student.hcmute.edu.vn', NULL, '$2y$10$gfViMJq9D5nK74uT0uhogO/gyH2Ph2yaswX1eq6.ia5xO3yJO3Gvy', '15110180', 0, 1, NULL, NULL, '2019-04-11 07:56:07', '2019-04-11 07:56:07', NULL),
(175, '15110196@student.hcmute.edu.vn', NULL, '$2y$10$c7TVbxUg505YkFW3358cg.Wjlq/eykiTQlE.hUrF1QwCA3n5gQmri', '15110196', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(176, '15110203@student.hcmute.edu.vn', NULL, '$2y$10$eGVQgLJ2fV3VaufxcPOdYegZZsiR4Dpf5SOCGsaq5cuhD9Qmf5xly', '15110203', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(177, '15110204@student.hcmute.edu.vn', NULL, '$2y$10$OUVXwfvdO7i/tmG6AWxlwenZNgSXcPhrGUpLRi/cXfIXo5300.bSq', '15110204', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-07-03 09:11:50', NULL),
(178, '15110205@student.hcmute.edu.vn', NULL, '$2y$10$JYVeyTvMZlaMUNJ5WjHZ4eg0snXsd/kLlMmBdx9YRB9Viui6M2qim', '15110205', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(179, '15110206@student.hcmute.edu.vn', NULL, '$2y$10$B03vRRfmVTydijek2Oeq6OgG7CxatmwGFHOEpRA/6VRZVHozbuq7C', '15110206', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(180, '15110207@student.hcmute.edu.vn', NULL, '$2y$10$gVTiK/9yrZd7NhsttdSNEuHkBWV05DNriQrF.7JZ2dEPuI.8tTbxm', '15110207', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(181, '15110214@student.hcmute.edu.vn', NULL, '$2y$10$JpGnBiNwA0IHkgeJoGfBoOO2zXaJ.cnUDSwLbL7uwvSCe0JQPtU2W', '15110214', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(182, '15110215@student.hcmute.edu.vn', NULL, '$2y$10$BZ0GRm/S.Ctlq7W3nkqNpOGrvcx9fwvIq93WbXirEgx/XkmXlIdmm', '15110215', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(183, '15110216@student.hcmute.edu.vn', NULL, '$2y$10$1whXIksxb2KQv2uTDQZi2.FaZrD.iABsOQas4DJalWRlkE02d7jbq', '15110216', 0, 1, NULL, NULL, '2019-04-11 07:56:08', '2019-04-11 07:56:08', NULL),
(184, '15110217@student.hcmute.edu.vn', NULL, '$2y$10$K02FLgonRa3wyDY4Nkt.ruVxJIRw2twwNVb5ZSXf7uQnnLju5eULi', '15110217', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(185, '15110222@student.hcmute.edu.vn', NULL, '$2y$10$Iebh2n/NHijOvJMqWsL9MevqB9FtPYfk92DtkqDUYu7rqpwLcSmZO', '15110222', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(186, '15110224@student.hcmute.edu.vn', NULL, '$2y$10$zPG9VNlc0YQUmE9QB3ZJk.o0ZRp8DJ1L0V62WZuRsrxDVK1EU21fa', '15110224', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(187, '15110237@student.hcmute.edu.vn', NULL, '$2y$10$faIkODO9T.YHyj179wlAGOFu2H.qtumn2MtQsOgTPRwbYXsT.Hani', '15110237', 1, 1, NULL, 'TvZwr7NnZrGtCFfdYIbRoXiTGjXtl6LzaYKXX2NlN0KoPxexifpwSxZN63rp', '2019-04-11 07:56:09', '2019-07-04 07:16:20', NULL),
(188, '15110238@student.hcmute.edu.vn', NULL, '$2y$10$ZqS/f4nJ8ytSzphCkjovhOnzGVFw22GOOJMjZ4wG.kpVZA.juAos6', '15110238', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(189, '15110244@student.hcmute.edu.vn', NULL, '$2y$10$1y8dtPgO5R2UJzrRxvDK8.vq6Ct.yPSxWZ6wCMw5AMmLT8M3W2wje', '15110244', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(190, '15110248@student.hcmute.edu.vn', NULL, '$2y$10$EUEoRWKD/i90opYZwfb2re5wtlxjEmdU5ezjvL6i3y65DFUD9jay2', '15110248', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(191, '15110254@student.hcmute.edu.vn', NULL, '$2y$10$wecZ19ODHAWmBiuEYPG0iOBaa4ynbTNDnS.4WLtMbPtoNbIk/toI2', '15110254', 0, 1, NULL, NULL, '2019-04-11 07:56:09', '2019-04-11 07:56:09', NULL),
(192, '15110258@student.hcmute.edu.vn', NULL, '$2y$10$BAH3TOoeYH96ve5idFCTQ.pxuWbY1Cju14bQUu3PvElQiN4IK2CG.', '15110258', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(193, '15110261@student.hcmute.edu.vn', NULL, '$2y$10$kwEabzY8o0CudRltoLp/weKyxpM6KFowrHb5mkGC3M3OPIYR/KWQq', '15110261', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(194, '15110262@student.hcmute.edu.vn', NULL, '$2y$10$6lPaJA63kID0U3BSuKzPQ.W8YqYZw.SXF8p5FpC9gMBIwm6k.WNOW', '15110262', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(195, '15110272@student.hcmute.edu.vn', NULL, '$2y$10$ihI/vCxqD4RZ17t9yPMPdeOqM6S/iADI/lvwRzwQcCdwc6.tkUtuW', '15110272', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(196, '15110281@student.hcmute.edu.vn', NULL, '$2y$10$mttaHAMGaM0lhcT32QInt.y3kmf1H7bXp5CWJzwNiDQKZqE4MsnaC', '15110281', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(197, '15110285@student.hcmute.edu.vn', NULL, '$2y$10$9n5qpflgZMiy.0Ymaq5OtOxqXa78tgddiZ9YlxaBTITuOa/.RHwu6', '15110285', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(198, '15110288@student.hcmute.edu.vn', NULL, '$2y$10$6DYDmm.QKM.Anb/.PBUvhu4.UaL66EuHIrzDcYPJpL7dbjD4ZyvKC', '15110288', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(199, '15110291@student.hcmute.edu.vn', NULL, '$2y$10$S9ctGtBA3IwLNEq6K0oqO.3KqSop95UiNL.pJ8a3spyiHPzYwnGyC', '15110291', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(200, '15110297@student.hcmute.edu.vn', NULL, '$2y$10$21pQ8slr5nQ1qG9qDlN4W.mZmOhtxMCmc80B5HwaI5iHW1.Ox1zKu', '15110297', 0, 1, NULL, NULL, '2019-04-11 07:56:10', '2019-04-11 07:56:10', NULL),
(201, '15110298@student.hcmute.edu.vn', NULL, '$2y$10$xr4ACCnj9sBB06sGhJJW0e2LzWAlHhmBOGGG/6vqf9OavE0DtrDp2', '15110298', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(202, '15110300@student.hcmute.edu.vn', NULL, '$2y$10$tHJO4oSTrcB8PW6BcGMAa.K4.j7ELBExS18ikRHqFHdxqthBNhXo6', '15110300', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(203, '15110302@student.hcmute.edu.vn', NULL, '$2y$10$XFDERl5Q2LDsvT4/o8KlFu7h3EfR5QlrQkAPYof4jL4A17pTnbgO.', '15110302', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(204, '15110303@student.hcmute.edu.vn', NULL, '$2y$10$zkuD9KnUm0b.g5VwXdrhyuDAUcFu2hh3RJkn0EBbVI80LZq81/fKS', '15110303', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(205, '15110309@student.hcmute.edu.vn', NULL, '$2y$10$6NAMPPDgcB28FrzMZGMSV.ywGVobPXxvzEfxA2AUECqHNPgHh2wXa', '15110309', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(206, '15110313@student.hcmute.edu.vn', NULL, '$2y$10$FIG6LNPtjEtGJJjlj61WYuduwE/Gk2PIwwU8GUKn4wmlTSgewyQ9C', '15110313', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(207, '15110322@student.hcmute.edu.vn', NULL, '$2y$10$CVOtg8LKF9yi9YW9ZepA..KcvhgJXcO.L3r1BoUCzkcSeVJ.k7pGW', '15110322', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(208, '15110323@student.hcmute.edu.vn', NULL, '$2y$10$DqFW1iE6Ttow34jPuNYwL.Ttg34b4teQOizbQPl7r74scKvMsv8Eu', '15110323', 0, 1, NULL, NULL, '2019-04-11 07:56:11', '2019-04-11 07:56:11', NULL),
(209, '15110329@student.hcmute.edu.vn', NULL, '$2y$10$gGXdteDc9h62yNYIFlcFQORYIvNRxfP9mhs6Xo5AHZmDXjZkrMgra', '15110329', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(210, '15110330@student.hcmute.edu.vn', NULL, '$2y$10$JcILo1tmAlCqWDhOI3kbW.G0AbUzLQdgHjVxJgu82zncOQfiGaea2', '15110330', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(211, '15110340@student.hcmute.edu.vn', NULL, '$2y$10$Z4j3bzTpGfK0CDfq3Z5TVOTU6xhU.lBhcaKJ6OazgAKNDGvc9xs66', '15110340', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(212, '15110344@student.hcmute.edu.vn', NULL, '$2y$10$PCs88rAkCQgysmROg6m1E..UhfytGTrj1d1fdgJvEf0ZGbcPmgqnW', '15110344', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(213, '15110345@student.hcmute.edu.vn', NULL, '$2y$10$eFBpebTPmVqWZFg3.5sQmeu9Tj9qZJKQj7lPj/qEwEesfgF3QdQsK', '15110345', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(214, '15110350@student.hcmute.edu.vn', NULL, '$2y$10$5Kculk2smtuDnhG1t8lfnu.5sclM0k82uscHpeuWDN.Z9Tm8Kwu0q', '15110350', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(215, '15110351@student.hcmute.edu.vn', NULL, '$2y$10$SJEYaHsXM.g7QoUWi6l6b.poTjQllFreF6vjbsHPuAmetkxMyJXEO', '15110351', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(216, '15110354@student.hcmute.edu.vn', NULL, '$2y$10$E5MkCeie1kfMPGeeRlauPOS9MS0.KUNAMe3pLSlYu1JhMODfedJRO', '15110354', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(217, '15110356@student.hcmute.edu.vn', NULL, '$2y$10$jhYuRSbhQZCNz2qM3oMBOeK30kG3.uYx5aZCNT./kh5fEZy9vqaO.', '15110356', 0, 1, NULL, NULL, '2019-04-11 07:56:12', '2019-04-11 07:56:12', NULL),
(218, '15110358@student.hcmute.edu.vn', NULL, '$2y$10$3VrCx0DjY15UgjYZL3GOEO/67DzRgvQky6mlMoZKbmYgVgQa2Faya', '15110358', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(219, '15110366@student.hcmute.edu.vn', NULL, '$2y$10$I7PSPHxViQEPB2Ghljd3tuxD7nzU07lNsCDXH0sbdMuuy2QkP83l2', '15110366', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(220, '15110367@student.hcmute.edu.vn', NULL, '$2y$10$uNf/.AHtEASoMODtmc3bP.wAVnUEQ4hVcfiT7IctTGnfgW9msx/Ji', '15110367', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(221, '15110370@student.hcmute.edu.vn', NULL, '$2y$10$eTVlycFE5P533A9vuDBieuoKXUjt1WGYeJgYsD65Tgn8KnPUFq5OG', '15110370', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(222, '15110372@student.hcmute.edu.vn', NULL, '$2y$10$kc13mhfhd00vkZC8gXjaa.nC8crdPRfb7Q4TgaflNO9pfCR1z.g2i', '15110372', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(223, '15110373@student.hcmute.edu.vn', NULL, '$2y$10$TmGHBmTW1GL7W9ICDP/gsO.qGdjjSjwioQrSLBDc2EtigKcP/wEoa', '15110373', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(224, '15110377@student.hcmute.edu.vn', NULL, '$2y$10$O9X2ckSFHIK0Qh2E.K7SWe/eQ954VYrBD8.LSd6QpJieGG1Sgyin.', '15110377', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(225, '15110380@student.hcmute.edu.vn', NULL, '$2y$10$GCCgowJFal7va7Vcbf6BG.OhG9o7ZJGKwzR/1WgD9MHnplErSOAee', '15110380', 0, 1, NULL, NULL, '2019-04-11 07:56:13', '2019-04-11 07:56:13', NULL),
(226, '15110170@student.hcmute.edu.vn', NULL, '$2y$10$v..ESs75SPo9mtX49OSkwuNbChg9okp0sdJUpyUaj5n..6DmPeULS', '15110170', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(227, '15110186@student.hcmute.edu.vn', NULL, '$2y$10$rjTLsrhyGpYwmNFTaVoQbe7MnLkJn5OlRJyaMxqbFXBBG8xd95rmW', '15110186', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(228, '15110210@student.hcmute.edu.vn', NULL, '$2y$10$naLDCRbGlLxW4vysp1DCM.ZvL.pP.zOBkiIgLxt2TRn3hMgxuZRc2', '15110210', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(229, '15110211@student.hcmute.edu.vn', NULL, '$2y$10$x3Fyitj7tyaB7OXN2vmGyewgO6EjfphrFEBJRkqLTpbsIXqt8Kpj2', '15110211', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(230, '15110225@student.hcmute.edu.vn', NULL, '$2y$10$j4VhmCpypZbcpXZUMvHVVuLNZ40Uj1I3XGIdrm4z3IiI.NKPw0K3C', '15110225', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(231, '15110235@student.hcmute.edu.vn', NULL, '$2y$10$op42BL7wBg.ZkPg9Q2gOwuezbDge/c8gASPS0XoEOBUk8gkUtHtIe', '15110235', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(232, '15110240@student.hcmute.edu.vn', NULL, '$2y$10$N.4NWPpJY8RX6ewREuDqTegQhsVfBEuT784K2qxdpV0OSWkqisvAG', '15110240', 0, 1, NULL, NULL, '2019-04-11 07:58:10', '2019-04-11 07:58:10', NULL),
(233, '15110256@student.hcmute.edu.vn', NULL, '$2y$10$CXu/dlutjeVuiqjZ.hKDf.kaMK88co9s6VGzJmcJTSoORJ1.lv2vq', '15110256', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(234, '15110269@student.hcmute.edu.vn', NULL, '$2y$10$fAXLAoHLFsXmQfVsC6K2QOdEfDb/.zL8KW2shWV7PFJUgKAe2kmMm', '15110269', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(235, '15110274@student.hcmute.edu.vn', NULL, '$2y$10$KgcrnGu0adj.q55tcLbe/.X8Tj3rpPrDiWYzrZDXrAEJI9Xq6yxRe', '15110274', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(236, '15110278@student.hcmute.edu.vn', NULL, '$2y$10$BHXp466KtMwNNWORFNpWQ.t2AAJgDQpkrMGmNHEgN.bzWk3Uc5Oxi', '15110278', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(237, '15110284@student.hcmute.edu.vn', NULL, '$2y$10$boPNFC.xUIfjOxp7LkOKNez2.RA5Jj90VohKiC54W2FVsDl9Mb6MG', '15110284', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(238, '15110293@student.hcmute.edu.vn', NULL, '$2y$10$mpQBE3PcCPyLbfkbOO4oIeYCk8xQoqwAVJEG2/W4EmmqClA8CajDS', '15110293', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(239, '15110295@student.hcmute.edu.vn', NULL, '$2y$10$T0R5PbdpUUc0v0t/hAyAoeIKruNIxPz77plD7aZS19KrI.JA3pz9W', '15110295', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(240, '15110299@student.hcmute.edu.vn', NULL, '$2y$10$8m1VUNLVAE4go6WaMZ.CH.bQ4IElTMwMQCQZl7TfK6/rw/BFS8c.6', '15110299', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(241, '15110324@student.hcmute.edu.vn', NULL, '$2y$10$uSTjBbtVQmjnRG9RvHovDujI750GPZgYjl4x0SOCRouEdGb8peIbS', '15110324', 0, 1, NULL, NULL, '2019-04-11 07:58:11', '2019-04-11 07:58:11', NULL),
(242, '15110335@student.hcmute.edu.vn', NULL, '$2y$10$Rtojz5TzpfZ0HkzwvsSqTuI.GCiQHPW2LuXPi1t9UvgJFCrV7RZEe', '15110335', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(243, '15110336@student.hcmute.edu.vn', NULL, '$2y$10$MVU/FxFZtdV4bm8DiPitYeQLv7bX/lHN7PnxtoAt2ds4AZnpceAte', '15110336', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(244, '15110353@student.hcmute.edu.vn', NULL, '$2y$10$vFUpM3PgUDOPdJg72fll2./94dBXPNdGa8Emak.luBgITu3iRuCQO', '15110353', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(245, '15110355@student.hcmute.edu.vn', NULL, '$2y$10$8y05r7NKfHFGbl77OPSGpuA8gEzy6SUSK6e3IGURBC1/.JtKvdKBi', '15110355', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(246, '15110357@student.hcmute.edu.vn', NULL, '$2y$10$UCJEG7Rs3y50/SsHMDZ8ge0Gqa0wPQpfqt/f4Wm3NM7nBP5HooaTu', '15110357', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(247, '15110376@student.hcmute.edu.vn', NULL, '$2y$10$4tHtn4ecW4TuJjC4zAacNu.Agck0Yp/L6xkCIPADRnEohre1hwVnO', '15110376', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(248, '15110379@student.hcmute.edu.vn', NULL, '$2y$10$DshaLm6jIPZg9pm3fxoZp.fz.2CaeGIwNWh4cRPIRbUYCHM8MFPl6', '15110379', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(249, '15110385@student.hcmute.edu.vn', NULL, '$2y$10$ohUmZW2iHQczDd1ae/9snevEB49al92FHbgAR.k/S2bbzJUUOnhz6', '15110385', 0, 1, NULL, NULL, '2019-04-11 07:58:12', '2019-04-11 07:58:12', NULL),
(250, '15110390@student.hcmute.edu.vn', NULL, '$2y$10$LQzt6dguW/E92N0L0vWaLO1l5E0t7WPmj5NGseCN77qR6RvJpQhU2', '15110390', 0, 1, NULL, NULL, '2019-04-11 07:58:13', '2019-04-11 07:58:13', NULL),
(251, '16110281@student.hcmute.edu.vn', NULL, '$2y$10$xu/mDfAPdSuYICnSewL3j.tFABROXIxa4YrALqa533FJjYyPcfOyG', '16110281', 0, 1, NULL, NULL, '2019-04-11 08:00:21', '2019-04-11 08:00:21', NULL),
(252, '16110282@student.hcmute.edu.vn', NULL, '$2y$10$I/TXFn3nPAlKVgyVJktnMuI5dVhNS132EJq4rfjDPjxngFHK91EQm', '16110282', 0, 1, NULL, NULL, '2019-04-11 08:00:21', '2019-04-11 08:00:21', NULL),
(253, '16110284@student.hcmute.edu.vn', NULL, '$2y$10$Qjl5psjzDG4g7DM6ZpgYOOPh4wCd.z/9j6WTLNNEauUr4oDFXBm0K', '16110284', 0, 1, NULL, NULL, '2019-04-11 08:00:21', '2019-04-11 08:00:21', NULL),
(254, '16110286@student.hcmute.edu.vn', NULL, '$2y$10$5QEx5kJaRmDoQVh/AYx9xeIg3DD5OVAOz4z7D1ccF0h6khMraXsN.', '16110286', 0, 1, NULL, NULL, '2019-04-11 08:00:21', '2019-04-11 08:00:21', NULL),
(255, '16110297@student.hcmute.edu.vn', NULL, '$2y$10$pCibbxmllGuKVgRvg29N6eudUpSxsAOGdnSwB4xOK.9Y6LQWM0.ou', '16110297', 0, 1, NULL, NULL, '2019-04-11 08:00:21', '2019-04-11 08:00:21', NULL),
(256, '16110302@student.hcmute.edu.vn', NULL, '$2y$10$btMDkF8gOSkZDV85m.6N0.4nVSzueSS9kIbbHV/1.zUYcXw8KYeqq', '16110302', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(257, '16110304@student.hcmute.edu.vn', NULL, '$2y$10$aQkHvFKWKBD5XNBoaro6B.UXSfUySfQ/N0mlMd2d3IIbD5LqXraxS', '16110304', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(258, '16110305@student.hcmute.edu.vn', NULL, '$2y$10$G0EQWP4CGK2gyb55chdcUeQUZF6K0Cpv9b7rKFuUJqKRgRUBVKFXy', '16110305', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(259, '16110306@student.hcmute.edu.vn', NULL, '$2y$10$tAlMuQW.EpU65ZHA98g4SOv6aR22n6k0PJkzOHfMolTm.9sgrHBIq', '16110306', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(260, '16110308@student.hcmute.edu.vn', NULL, '$2y$10$tTpHKga2jHBh8m4viCtpVeQewhNLcCULLzBsMXJ8abu3CRb/1ZjVu', '16110308', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(261, '16110311@student.hcmute.edu.vn', NULL, '$2y$10$HCUemVOJDpYYARrbRvB5OOHfcSWTp9o9wka.EFPiGAnHvNuEYuNpi', '16110311', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(262, '16110316@student.hcmute.edu.vn', NULL, '$2y$10$0e8/ni5MKZ3wxIZgmZPYO.B/Ixvome0.H.kLcQQQZh4Y0emdUp7o2', '16110316', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(263, '16110318@student.hcmute.edu.vn', NULL, '$2y$10$DQbJtCkGiNgny6PJnnH/aujefNf/4wVkj7Jdft0xZQsLSmKFb6heG', '16110318', 0, 1, NULL, NULL, '2019-04-11 08:00:22', '2019-04-11 08:00:22', NULL),
(264, '16110330@student.hcmute.edu.vn', NULL, '$2y$10$EW/PBDyEz8YsK1WwlbNgaeqmbb1xcikzezsIWygIPcS0lF28NMf3W', '16110330', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(265, '16110346@student.hcmute.edu.vn', NULL, '$2y$10$RWawlKh6rX..a1f.3VuhLem22MrgTL.xDoKXg6q413UFvgd0DBT.S', '16110346', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(266, '16110348@student.hcmute.edu.vn', NULL, '$2y$10$HwuETGnOpLZrhCVrCIKCC.C26RQdO9YpaUlO6SRP8vecdJx6Pqh6a', '16110348', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(267, '16110355@student.hcmute.edu.vn', NULL, '$2y$10$REOljBdTqutqqqMmbGaJDetTzo1BApbLOeS3LQyC3qSv5jF9evaKa', '16110355', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(268, '16110356@student.hcmute.edu.vn', NULL, '$2y$10$LfAxtQUmQDC0BlKQd.O7Ze.JTdL0oaTkWEdCYzZnu/2XWEQSsF7Ki', '16110356', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(269, '16110357@student.hcmute.edu.vn', NULL, '$2y$10$Wl8knZi6xM6DCttcjZNXVOAFzRIEjfzs4YEEw0DNYA8NFN8P3Eyd6', '16110357', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(270, '16110363@student.hcmute.edu.vn', NULL, '$2y$10$dCH/bhCL49u9P/EzMa6KhOkC7RE2j9n/8PbbVrvBaPtyaYP0TMXsq', '16110363', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(271, '16110364@student.hcmute.edu.vn', NULL, '$2y$10$1RIOeCk1KkCB6fY5Aaf9F.qbcESRWNHSWHXpI7eTzG3QAlfgz/8IK', '16110364', 0, 1, NULL, NULL, '2019-04-11 08:00:23', '2019-04-11 08:00:23', NULL),
(272, '16110366@student.hcmute.edu.vn', NULL, '$2y$10$wDDbh0d7qrLSfA6lEA1oI.t6u/a0bP5R9kS98EtJe8cG8HsjBYXY.', '16110366', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(273, '16110370@student.hcmute.edu.vn', NULL, '$2y$10$r5We8GI8jmeqm/YSO6pGvuKPM4cthfyDt2AKXz6/B3cP0joURBnqu', '16110370', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(274, '16110373@student.hcmute.edu.vn', NULL, '$2y$10$aJpSu7mWhNj85hUlwu7UDu1x5jhMUB2qWhDTH.XEzSCP6Md3o6Z1C', '16110373', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(275, '16110374@student.hcmute.edu.vn', NULL, '$2y$10$tmNTb1e.mwHL35.PX2nlhutIIrLO5b3Jg4hwNvTFurmi35Bka7O0e', '16110374', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(276, '16110376@student.hcmute.edu.vn', NULL, '$2y$10$4UcVzXGlYOzQ3Yzx8PNaJOw/iE2J4iX6c.TQvWuGlkiIjjNKZAo5O', '16110376', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(277, '16110377@student.hcmute.edu.vn', NULL, '$2y$10$mgph4TLeVLRETeEtiqK91.E3RUKfLNdTCKc1H4IYTcdPaHOdFBX9q', '16110377', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(278, '16110379@student.hcmute.edu.vn', NULL, '$2y$10$KQ6mEn6tQJ2EJZldnLASsuTvN30ST8STHuqrz0pjKstfKKhTN71hy', '16110379', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(279, '16110381@student.hcmute.edu.vn', NULL, '$2y$10$FGgUEseenb/QVDN4PsDGyOdAy3L.9cN.18GcvbmvYqij0LuHsfcu2', '16110381', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(280, '16110390@student.hcmute.edu.vn', NULL, '$2y$10$JlLWYq39SbGD8LtTM8Ff2OG9kEoJ842h7IDohToFrg8odlrsowz5m', '16110390', 0, 1, NULL, NULL, '2019-04-11 08:00:24', '2019-04-11 08:00:24', NULL),
(281, '16110392@student.hcmute.edu.vn', NULL, '$2y$10$HwcSD5f6BRxpchqvRim0LedulYKvwKVJEoV/mZmBKxtWOzynojexi', '16110392', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(282, '16110393@student.hcmute.edu.vn', NULL, '$2y$10$Ux7L7/FV4vQTl4MGe5mUf.nqnQIExe8ILqEspUJHqxsF0UmGaZcg6', '16110393', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(283, '16110407@student.hcmute.edu.vn', NULL, '$2y$10$qC5XRGwd6ffaW96FIVGIcOHa6HoevC/8MoR4EU2bNH5TiIkFzdKv.', '16110407', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(284, '16110409@student.hcmute.edu.vn', NULL, '$2y$10$eQ5bOXMhiPWu/Uj4WrVJWurJC0gCJk9nOq96SGovw1oAUsuckYNyi', '16110409', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(285, '16110410@student.hcmute.edu.vn', NULL, '$2y$10$KzFemiNaSV16sL89opzXIOaorb2LEMhsDJ6drM2IJKNyUgfCtjyGa', '16110410', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(286, '16110415@student.hcmute.edu.vn', NULL, '$2y$10$gLgsjsWCMRz5L3z3EHXx/.tMmRKxMYXE13pdEGRy6yjpAfMzpFFaG', '16110415', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL);
INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `student_id`, `level`, `created_by`, `updated_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(287, '16110416@student.hcmute.edu.vn', NULL, '$2y$10$tkqkOM5pI/Kj5gGNm6rb1.Pp8IhLZVMnF1aDn3iYmxM36ahPWlwvK', '16110416', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(288, '16110419@student.hcmute.edu.vn', NULL, '$2y$10$G4In2tGItxA3ugGTCATl5OtPn.keejC9PkoeCA4yGSRnjHjObLHeK', '16110419', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(289, '16110423@student.hcmute.edu.vn', NULL, '$2y$10$90hwJ1SfaGPtV.2XBl1TX.xW3o2x2AyOEHNc.XkEG03JSreCb.Uzm', '16110423', 0, 1, NULL, NULL, '2019-04-11 08:00:25', '2019-04-11 08:00:25', NULL),
(290, '16110426@student.hcmute.edu.vn', NULL, '$2y$10$Qcm5s8XmZdIDQCIFYv51d.jvwRslfTOyrZUteRQZV/rPbwm2X6.Sq', '16110426', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(291, '16110429@student.hcmute.edu.vn', NULL, '$2y$10$rAjrrOAOClieygZlGXgu7eUT2shoH7Vpg31.IdrQKZdN8nd70EmDy', '16110429', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(292, '16110433@student.hcmute.edu.vn', NULL, '$2y$10$yrSC1.VmvOC7nDk87Jflw.QJhSOmZQ9kOazP5UshKXtKFZ037cCcS', '16110433', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(293, '16110451@student.hcmute.edu.vn', NULL, '$2y$10$7aAg5n8ZRQ0yDFMhELIcH.sAxRpf0ADB.boz03hV8IS1r0nmD4hS2', '16110451', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(294, '16110460@student.hcmute.edu.vn', NULL, '$2y$10$FYY9i5ftY15ukFq/3wkGveHlMz/ywqMwWwrwNl7iVA159TQEX9MFy', '16110460', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(295, '16110464@student.hcmute.edu.vn', NULL, '$2y$10$2X5Pr5dnwJ./WKqhQuqZDu4ObbW0XiVVjwz2tpjM11E3rmd8XqI1m', '16110464', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(296, '16110467@student.hcmute.edu.vn', NULL, '$2y$10$b4sSKTo4koFZ1K8SjdUtUuWpxQcsYh8I./MVNDJLyjQ3UG925jFGu', '16110467', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(297, '16110469@student.hcmute.edu.vn', NULL, '$2y$10$SWfeafYFjuCJL6aFarKo1OdpgyAH3QW8zJZrH.7pFpOiv9/YCSAHW', '16110469', 0, 1, NULL, NULL, '2019-04-11 08:00:26', '2019-04-11 08:00:26', NULL),
(298, '16110472@student.hcmute.edu.vn', NULL, '$2y$10$Sc9Kjc8xzshRnWR8WpZPQeXBD1zvYh0P0ei07o6WqQKKntZrmEAkS', '16110472', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(299, '16110476@student.hcmute.edu.vn', NULL, '$2y$10$sx6m/QJA9op8sDuu9ugxGukNaJgnGvZbxeCjPic.eNQuja.2SDQAW', '16110476', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(300, '16110478@student.hcmute.edu.vn', NULL, '$2y$10$Y5ryt3p4JaKHwsiGGjTZd.p.I1vuEwTa4byH04NIj4fa8xdIiXYlS', '16110478', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(301, '16110490@student.hcmute.edu.vn', NULL, '$2y$10$3QeKcGHEl/JQ2.5JGf8WRO3l0R0Mykn9SYVhh2Ij9DeY/wvtCIwO2', '16110490', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(302, '16110492@student.hcmute.edu.vn', NULL, '$2y$10$5.hat7sPFoS.n5hBEgqKa.P8PgyFlI1xtUk8fntEv8tqYqJG5SxpS', '16110492', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(303, '16110493@student.hcmute.edu.vn', NULL, '$2y$10$6iXN5bfatR.xHUDu53DzEOn95UeMs.UZGrsXfSukdHAt5r9S/4Yde', '16110493', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(304, '16110496@student.hcmute.edu.vn', NULL, '$2y$10$h6utg76RjP8L7jImN4jEn.VUVxF5g5APKAH1C7B6sd1q7LaUcqc0a', '16110496', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(305, '16110514@student.hcmute.edu.vn', NULL, '$2y$10$uYTrtY1r.UuKArtdWCBWj.zcb.naQ7Egv3bhJtG5WIKG/C5jvVt.K', '16110514', 0, 1, NULL, NULL, '2019-04-11 08:00:27', '2019-04-11 08:00:27', NULL),
(306, '16110528@student.hcmute.edu.vn', NULL, '$2y$10$HuykaZYDXuMzs7mRnoV6Uu5JHjy7MTTjjsp82OFDMHVt.PGY660Dy', '16110528', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(307, '16110530@student.hcmute.edu.vn', NULL, '$2y$10$yKHLc/RMevoM8N4Ehuqriu/4cC9rs58Xx7bhK9zM/N57qB9djuzZ6', '16110530', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(308, '16110532@student.hcmute.edu.vn', NULL, '$2y$10$Uhu8xFhXACs6FScOTMprPeXPSUH8VPGdmaOEwHObRdoLilgoDFQs.', '16110532', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(309, '16110533@student.hcmute.edu.vn', NULL, '$2y$10$WhKNYeTT1daYv2NHXPtpJuoqqXuuH9cZdhUNXXgN8cHuUyrlUqzd6', '16110533', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(310, '16110534@student.hcmute.edu.vn', NULL, '$2y$10$mQz//PReJPMt79YwEk1cL.zRv091mZ9J756YscH5zsLT3HPcbquMe', '16110534', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(311, '16110536@student.hcmute.edu.vn', NULL, '$2y$10$mVv/8EDPg19.EpiS9/pej.tjmJaKivdQ7hdLpA7406Z6pzL0tXDOe', '16110536', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(312, '16110539@student.hcmute.edu.vn', NULL, '$2y$10$dMRAL53a6aYkejSGa5.m8ekkFFXfwh.qyoFN1x.4WKkBbj/iclSnu', '16110539', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(313, '16110540@student.hcmute.edu.vn', NULL, '$2y$10$spAUEPMeOOL.4x9o61SQDOfPi2E1pvtCpBRmH/3y25UJqlaS4ev.S', '16110540', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(314, '16110588@student.hcmute.edu.vn', NULL, '$2y$10$e61C8KtTodQhMXxvnu1JV.O5Z6cp.HvGPdbBU3vTS7FS10EB6unga', '16110588', 0, 1, NULL, NULL, '2019-04-11 08:00:28', '2019-04-11 08:00:28', NULL),
(315, '16110590@student.hcmute.edu.vn', NULL, '$2y$10$5hKwDqKVpHt0Iefs89hcrOn6c8S0xMGWmKaGL1frX088eUUlPpY1a', '16110590', 0, 1, NULL, NULL, '2019-04-11 08:00:29', '2019-04-11 08:00:29', NULL),
(316, '16110291@student.hcmute.edu.vn', NULL, '$2y$10$nKFFzb2nYXOckkBOf4Wxv.MhHPrKAFPz1suUQuMGl5PZ.95GF0imK', '16110291', 0, 1, NULL, NULL, '2019-04-11 08:01:29', '2019-04-11 08:01:29', NULL),
(317, '16110317@student.hcmute.edu.vn', NULL, '$2y$10$WlFM6ABOHVYnpqfN1l2UCOQ8sw5zzKtRNy7ExwKVh0oUMgEUVJR4y', '16110317', 0, 1, NULL, NULL, '2019-04-11 08:01:29', '2019-04-11 08:01:29', NULL),
(318, '16110321@student.hcmute.edu.vn', NULL, '$2y$10$w5qXsz2b9z9OoM4Z524y2O0HJ73iDBpIrlHmbvShgR.rvg6Bld8wK', '16110321', 0, 1, NULL, NULL, '2019-04-11 08:01:29', '2019-04-11 08:01:29', NULL),
(319, '16110323@student.hcmute.edu.vn', NULL, '$2y$10$0vAYivPkOZo1lxSQOJQu2.iRKXGkKMH4kT0vDgB8xIMElopyK1EtW', '16110323', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(320, '16110324@student.hcmute.edu.vn', NULL, '$2y$10$F/HKmh7R1r65VUwJE/h5pOn0YDhmWDxfkXvJJhOH8TNTupS78b7Bm', '16110324', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(321, '16110326@student.hcmute.edu.vn', NULL, '$2y$10$Q8LH6t7aIrT2QKQ9LZgZcur5Qlm9/zF3AvH6MLnOn.DqHfTqk.Ad.', '16110326', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(322, '16110327@student.hcmute.edu.vn', NULL, '$2y$10$hBfwaPPdcavHiT/KWNBFBeH240KjPywGjlUDR9PchGQFJTjSxwlwq', '16110327', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(323, '16110329@student.hcmute.edu.vn', NULL, '$2y$10$anK6rF40GTCvbHtXYiwOmOHtgS6JkNEew8M8tg1E/5UVF/vuc.8Kq', '16110329', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(324, '16110331@student.hcmute.edu.vn', NULL, '$2y$10$5hnoA21OsXmbnkfkiGdHgeo7rAWFaIqFy1D3m2g.PxbLawnK5Xn/i', '16110331', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(325, '16110335@student.hcmute.edu.vn', NULL, '$2y$10$Mvtb/LH5DMGCoMqw5JFox.g17C7sjxuwQW0Mh3YhFDkiPsMdkIrei', '16110335', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(326, '16110337@student.hcmute.edu.vn', NULL, '$2y$10$nj4sqSdQEQmiHxTz.qiXneElwJug90LfpnacOmikU62h7xp6Nid46', '16110337', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(327, '16110341@student.hcmute.edu.vn', NULL, '$2y$10$jfcDVnygevR1Vc7gijxxguAPNiibLSalbQvVUFv2fc38RT5ktDPk2', '16110341', 0, 1, NULL, NULL, '2019-04-11 08:01:30', '2019-04-11 08:01:30', NULL),
(328, '16110347@student.hcmute.edu.vn', NULL, '$2y$10$6AqHuZREbd3muUrcJ96K1uR7EPgnoe0E4pA6yUPD1oaeVajw2.kZi', '16110347', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(329, '16110350@student.hcmute.edu.vn', NULL, '$2y$10$5dSU/ZGy6Y8pzkpDgBbLduddnv20spTrFk3lKMVJBL7TAtFH9Mad.', '16110350', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(330, '16110375@student.hcmute.edu.vn', NULL, '$2y$10$sFUn5viHdepOhIb1Q9DqZOwJQaqkQVTvQWUdQHCrxv/yfge8.SviK', '16110375', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(331, '16110382@student.hcmute.edu.vn', NULL, '$2y$10$Nyl2cfzfn/gSlmB1BXVyu.E18XGokk1cSHvFPhtp..R5mwDSAsdCu', '16110382', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(332, '16110385@student.hcmute.edu.vn', NULL, '$2y$10$ingMsa8YCJ7L1q2FpwWOtOG6eU0lcQX/40JFyVfEmah.XBFHaQHRS', '16110385', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(333, '16110394@student.hcmute.edu.vn', NULL, '$2y$10$n0uAhjs5ITgnzyhHEF7RCe4dM1/6822eZ/We.AQe63E2CpaDKZDOC', '16110394', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(334, '16110402@student.hcmute.edu.vn', NULL, '$2y$10$8rHhAwU399O/xL73Pdihcur9/1qzChV.W4lI0fwaMpawn4Bpc1cUG', '16110402', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(335, '16110405@student.hcmute.edu.vn', NULL, '$2y$10$s7r4TyYFvDQvdKnvtSoLfOkLB.U4k3g1GId2L1xe8R11GkP82.1Se', '16110405', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(336, '16110427@student.hcmute.edu.vn', NULL, '$2y$10$HMkSv5zn/NdWvRHveCEiHO/RhwuUAMTA20CwfubGyX1YIO4ytjPXa', '16110427', 0, 1, NULL, NULL, '2019-04-11 08:01:31', '2019-04-11 08:01:31', NULL),
(337, '16110438@student.hcmute.edu.vn', NULL, '$2y$10$DU5M9COqg5uCAgUoqHRuYeylWY7.RiTzIGSaTpIqXp9omvAvO4evu', '16110438', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(338, '16110439@student.hcmute.edu.vn', NULL, '$2y$10$iryCEUdOjDZI2ojRDKqoPe8cyv9wA8NR7K5TCbnoVH5ipOQ49ovIG', '16110439', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(339, '16110440@student.hcmute.edu.vn', NULL, '$2y$10$DSWOfOMkQz741ughlHgNt.4iWGS6FrVPHqQqO5W.JQN32aL2//X/6', '16110440', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(340, '16110447@student.hcmute.edu.vn', NULL, '$2y$10$Z5PYnf0lNMraxKmYHMbUY.ulDa29yWKDhqcDaUYLZ2rx3rb33chW6', '16110447', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(341, '16110468@student.hcmute.edu.vn', NULL, '$2y$10$dcmkkZWUwotgc4uf8J05HOgLe9LfO51HR/TkbokyStWEgTZ/DHIFS', '16110468', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(342, '16110474@student.hcmute.edu.vn', NULL, '$2y$10$xvMb.9MeYUdVdLpQJJWBMebadNicHjiPdWIhoLj4hvdAwDZFl67x2', '16110474', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(343, '16110475@student.hcmute.edu.vn', NULL, '$2y$10$j27FKYfVpuDc1jraYiNpNeDAIi0iBla0Gyr2mrGVjhvT44LmTeJFK', '16110475', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(344, '16110480@student.hcmute.edu.vn', NULL, '$2y$10$9EiZQjo.QSoSLo0aAuMVZe1p9cyErM2bLtEjw7caAw/PQhutMYpAy', '16110480', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(345, '16110482@student.hcmute.edu.vn', NULL, '$2y$10$GCodpZHaYZIkEsYPGrPBK.ZdNUoH1JI4PJ0aTJXYpycU4ZGWv.c..', '16110482', 0, 1, NULL, NULL, '2019-04-11 08:01:32', '2019-04-11 08:01:32', NULL),
(346, '16110487@student.hcmute.edu.vn', NULL, '$2y$10$sIB5EOxoCaH4TFlhSNAtk.uBTi07Kjim.Xy18iSZa5pfPCXnKHsIa', '16110487', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(347, '16110494@student.hcmute.edu.vn', NULL, '$2y$10$CrmdLkRoLU3.GzIB4u7cO.SXZa6KSa.OTBsDyXr/DIKexhEevlFVG', '16110494', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(348, '16110499@student.hcmute.edu.vn', NULL, '$2y$10$iaqmc1I9apginCdcH6At2uL5FMRSthLYPFD8NBucIxZ46/BLiju6O', '16110499', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(349, '16110500@student.hcmute.edu.vn', NULL, '$2y$10$36H5XjMnYidhVUwoPMrQTunmBT6LnwDOohoYA5.8/h2i.ENGqD4Fu', '16110500', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(350, '16110516@student.hcmute.edu.vn', NULL, '$2y$10$qw5T.pSnJ8twxcd1ZBiLtuMUQ/mlP6OZKdbOMth8kjbibkIjUdHhK', '16110516', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(351, '16110517@student.hcmute.edu.vn', NULL, '$2y$10$N7boiMwsoCoomt4i8kWbxuuN2qpJ5yn0Su0RDr.TaogBgaaRc9ccm', '16110517', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(352, '16110523@student.hcmute.edu.vn', NULL, '$2y$10$jc4yyojTs2kHMHbKLVHiLOVFPJ.0sUWaNz7edbKuC5Pr/mN5GWOBi', '16110523', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(353, '16110525@student.hcmute.edu.vn', NULL, '$2y$10$z6QGk34aZrkMYdO/ptNUb.I6hHVfreK7iSSaSMsYOiLOgWoRd6MqO', '16110525', 0, 1, NULL, NULL, '2019-04-11 08:01:33', '2019-04-11 08:01:33', NULL),
(354, '16110526@student.hcmute.edu.vn', NULL, '$2y$10$CPHPVThrjkFTQsSvihIwLePyBRJuMqa1QB3ouQUIO2N2tKsUROIMC', '16110526', 0, 1, NULL, NULL, '2019-04-11 08:01:34', '2019-04-11 08:01:34', NULL),
(355, '16110527@student.hcmute.edu.vn', NULL, '$2y$10$Rk8rG2MMnloOAYkCNoOGeu1BAzP5StF70dLgyRUEyTdyBEPOLai6O', '16110527', 0, 1, NULL, NULL, '2019-04-11 08:01:34', '2019-04-11 08:01:34', NULL),
(356, '16110538@student.hcmute.edu.vn', NULL, '$2y$10$l56xQfK3xRwzzQ426ARo2u0ES9IlUpBjAqdceuAtP0YUTsoCtM0KO', '16110538', 0, 1, NULL, NULL, '2019-04-11 08:01:34', '2019-04-11 08:01:34', NULL),
(357, '16110541@student.hcmute.edu.vn', NULL, '$2y$10$h/aqQUDHFQNmk12QfkjDY.YXcHB7yl/RNztSOcBrgBQKZeyKSRuFa', '16110541', 0, 1, NULL, NULL, '2019-04-11 08:01:34', '2019-04-11 08:01:34', NULL),
(358, '16110543@student.hcmute.edu.vn', NULL, '$2y$10$eMeXSTvVXLd417RFW2gcPerVTp6tJu7g9mnzdMgTQ6A39AFRROqOG', '16110543', 0, 1, NULL, NULL, '2019-04-11 08:01:34', '2019-04-11 08:01:34', NULL),
(359, '16110584@student.hcmute.edu.vn', NULL, '$2y$10$V0eu7kW0JjTsY4BI8RTj9.55x6BqVLIsZAzTxzK97B1NxY9.p15Ma', '16110584', 0, 1, NULL, NULL, '2019-04-11 08:01:34', '2019-04-11 08:01:34', NULL),
(360, '16110299@student.hcmute.edu.vn', NULL, '$2y$10$M33ADIkmaeHGTTdN7TIoHOIoQAUpniqPgfH1NJ9C8BKPSP5PjdIkW', '16110299', 0, 1, NULL, NULL, '2019-04-11 08:03:14', '2019-04-11 08:03:14', NULL),
(361, '16110303@student.hcmute.edu.vn', NULL, '$2y$10$/Qqv5iBD8CzmIy5w9aqmBOspSR4bsUZkpvnuf5S2C4FYZpVThGYNu', '16110303', 0, 1, NULL, NULL, '2019-04-11 08:03:14', '2019-04-11 08:03:14', NULL),
(362, '16110309@student.hcmute.edu.vn', NULL, '$2y$10$kdPmDMDyLJWiwF1KM8VtxO8cXJWu2fZlPViqKW.kFgRNDIrtE5AG6', '16110309', 0, 1, NULL, NULL, '2019-04-11 08:03:14', '2019-04-11 08:03:14', NULL),
(363, '16110313@student.hcmute.edu.vn', NULL, '$2y$10$/9MNCeQco8mZLyfBYgOvr.14XqmRPXoQoyiWVgn5hipNjaXmPc2QS', '16110313', 0, 1, NULL, NULL, '2019-04-11 08:03:14', '2019-04-11 08:03:14', NULL),
(364, '16110322@student.hcmute.edu.vn', NULL, '$2y$10$byv8T9E.HGOQuevWRJ8TdO85TVF4cLNUFseMdtG6JQPgdpC8m0cz6', '16110322', 0, 1, NULL, NULL, '2019-04-11 08:03:14', '2019-04-11 08:03:14', NULL),
(365, '16110338@student.hcmute.edu.vn', NULL, '$2y$10$.r7f8hhZ2fXc0.gybvnXV.AkoAMhajd6XpxvGX7UuLv6Mr4VlOUIC', '16110338', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(366, '16110351@student.hcmute.edu.vn', NULL, '$2y$10$CBjlVvaHBvcIgGtKsvxmme3iJTvc7h558bpVd5wd2jvMgf7PlKNri', '16110351', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(367, '16110367@student.hcmute.edu.vn', NULL, '$2y$10$am6Oir.1YAwY9127RShRk.TUoX5r9EpoxWQA5q49ysJJDIQsUOwIS', '16110367', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(368, '16110369@student.hcmute.edu.vn', NULL, '$2y$10$hqi0f0S8Y6/vupEcw/cvGeuMERAH4OonFexAvZ0WLd1ysFqP/dhvi', '16110369', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(369, '16110386@student.hcmute.edu.vn', NULL, '$2y$10$f8VYZrHoLP8pulImHsQaceemXTQJec6C/ekGMeDYWgE6yA2jgHtSG', '16110386', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(370, '16110389@student.hcmute.edu.vn', NULL, '$2y$10$7YHkoFpJKXlsBbdv5.0HNOOPR.tQqt561RpHNEviZ587juAh3ExSW', '16110389', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(371, '16110396@student.hcmute.edu.vn', NULL, '$2y$10$ZdjG62u1luWSXBrOBtQNBeG6ryFTpu44hgKgtBhYAmI8wzZ/Im8q.', '16110396', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(372, '16110411@student.hcmute.edu.vn', NULL, '$2y$10$gC4kbP5Ac6IKJ5TZmluTfuYKelruKoaUM4fHpiqlLegxLtMnIS0Ly', '16110411', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(373, '16110417@student.hcmute.edu.vn', NULL, '$2y$10$2.n/bEkkesGg997y84hkOe4ruJVscmbXwos66lpsv4uyZlVzSj/aG', '16110417', 0, 1, NULL, NULL, '2019-04-11 08:03:15', '2019-04-11 08:03:15', NULL),
(374, '16110422@student.hcmute.edu.vn', NULL, '$2y$10$i4pdfKMaGtmZtvsPE/kKCejacZj5W.U88LPTzw47o2uuF8tx0aM3K', '16110422', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(375, '16110454@student.hcmute.edu.vn', NULL, '$2y$10$UdlznS49UKfdKbEt/oijqeEMbsDAMKyx1.8Lp98c9ZDPwPTBWy0Cq', '16110454', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(376, '16110488@student.hcmute.edu.vn', NULL, '$2y$10$Ph1jNPjlsWvrENN3CwX3RO9tV2aBuC6ARN/WhNb.Vgh2BzYV54y/e', '16110488', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(377, '16110489@student.hcmute.edu.vn', NULL, '$2y$10$tQ6XCHFzgCKLEOuYEdmuD.h9G9rW6LWy.mCbqomQm3/iDPmY33K..', '16110489', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(378, '16110495@student.hcmute.edu.vn', NULL, '$2y$10$oBoYeyIaKznGcEwUrL8aluQMVTqhcS7tLiOw8ax8oZPTgaRc.Ho.u', '16110495', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(379, '16110509@student.hcmute.edu.vn', NULL, '$2y$10$NzvIDXiCM/kdtEYzEsnLrOJcs5fp6jMfGIePUV/xvjdW2NIsouSW2', '16110509', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(380, '16110531@student.hcmute.edu.vn', NULL, '$2y$10$jfROXldcXnVbAPh1ESXTX.jw5KUcXcbLUj.oPrh9PajISxCmmpjKa', '16110531', 0, 1, NULL, NULL, '2019-04-11 08:03:16', '2019-04-11 08:03:16', NULL),
(381, '17110261@student.hcmute.edu.vn', NULL, '$2y$10$n7O6U6yWUKOcIEm25GjzYO2qL8D5UQRGH8yASYAw65RFqv6EnIoBG', '17110261', 0, 1, NULL, NULL, '2019-04-11 08:05:49', '2019-04-11 08:05:49', NULL),
(382, '17110262@student.hcmute.edu.vn', NULL, '$2y$10$SZ42cChzIo8Rak3PrK3pDOgfBMKZuOaKJdGGfCP2xV.y3ewZb57Ui', '17110262', 0, 1, NULL, NULL, '2019-04-11 08:05:49', '2019-04-11 08:05:49', NULL),
(383, '17110264@student.hcmute.edu.vn', NULL, '$2y$10$vI4pNj5mCFr1Pj5fBC.DRu8JF4sAT6gV8548Y0pgD0HMt0H/hxfKa', '17110264', 0, 1, NULL, NULL, '2019-04-11 08:05:49', '2019-04-11 08:05:49', NULL),
(384, '17110268@student.hcmute.edu.vn', NULL, '$2y$10$jU2L0BfhI4TOXiZzuGhLKOAopubnFEo1A1fQaOvTJXRMK3YWc7Bui', '17110268', 0, 1, NULL, NULL, '2019-04-11 08:05:49', '2019-04-11 08:05:49', NULL),
(385, '17110273@student.hcmute.edu.vn', NULL, '$2y$10$FvCfPbwCdnuG1H6Bddo72enbkZJVGxSFxeFl4/uahwvaNOsf1S0kK', '17110273', 0, 1, NULL, NULL, '2019-04-11 08:05:49', '2019-04-11 08:05:49', NULL),
(386, '17110274@student.hcmute.edu.vn', NULL, '$2y$10$NHhkgSSfuHU.0340dGw0IOZ6h6XXCT3.gOqeFdiFvkqAxUsgAlVbO', '17110274', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(387, '17110276@student.hcmute.edu.vn', NULL, '$2y$10$7Az7tXZHf9CVhGWQiKGkLOabY/muk0BpoTOxAtAR24FuEOkuOugAS', '17110276', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(388, '17110279@student.hcmute.edu.vn', NULL, '$2y$10$tKqtTHl3w4PicpD11w82/upGpZFNJmPrl3FAjSkcMd/m5GnYMCZ3m', '17110279', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(389, '17110281@student.hcmute.edu.vn', NULL, '$2y$10$hF6wZLr8twjVdcAnvP3KAu5Bz9rKiZuStWjCa.rISpzmJpAE.wGlu', '17110281', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(390, '17110282@student.hcmute.edu.vn', NULL, '$2y$10$3v8sYO8aztK.TsO0VLDlX.cVDYrZYSRilZJj41bVMb44cPMO86hca', '17110282', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(391, '17110283@student.hcmute.edu.vn', NULL, '$2y$10$voUxIlg965twpjNg6KIvb.OcquPjcv0ALIXJHkT9RTO1mHjpIJQzy', '17110283', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(392, '17110287@student.hcmute.edu.vn', NULL, '$2y$10$cjG2uiuj.2pnucGdpB/u6es.woFp0H8v1WUWyef/icI3RGp9xLlvG', '17110287', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(393, '17110288@student.hcmute.edu.vn', NULL, '$2y$10$pB9cvJbNBSjddxAO15ertOBu2AL1lUxOI7ef2EsPoqK/csqCCgQOG', '17110288', 0, 1, NULL, NULL, '2019-04-11 08:05:50', '2019-04-11 08:05:50', NULL),
(394, '17110289@student.hcmute.edu.vn', NULL, '$2y$10$VRjZOEwOZMLLXXJPXUAhTeS8HXqXJ.oRBYmhFm53AEiN5gfZHaZc6', '17110289', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(395, '17110291@student.hcmute.edu.vn', NULL, '$2y$10$VmUMPELoyGXvwFuNGgrEneaP29BtoDJjgjcdu4P3Z3aByMOXQZqW2', '17110291', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(396, '17110292@student.hcmute.edu.vn', NULL, '$2y$10$DoVHoy8Mqkdy/PK6FpBY..o7weBLS5eDyVqwRy9HSV8wWjs0esLl2', '17110292', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(397, '17110296@student.hcmute.edu.vn', NULL, '$2y$10$7u5VJIu78iHEkmHli8xnbOII1DsNfkkB2N05AgiyBIeCjAC3OfvC.', '17110296', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(398, '17110300@student.hcmute.edu.vn', NULL, '$2y$10$467dvFMVaEXutJDHP.//1.C.phoHimerwuGCW2iMnHLwkjPfLqWB2', '17110300', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(399, '17110303@student.hcmute.edu.vn', NULL, '$2y$10$72vdJ0x.f2omAFPZuo1CXemiS4ZZbD65M8M3wKNwVu71adcBDb.kG', '17110303', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(400, '17110304@student.hcmute.edu.vn', NULL, '$2y$10$hnC1Hc/jC/1qG55QMItNX..NKLdGXCICvNguhXyD6Ro2ZpUs9f.hO', '17110304', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(401, '17110306@student.hcmute.edu.vn', NULL, '$2y$10$rHo3J6PC9pAi/sippgfwPewOkV1H3YUDcN3Qzse/h2/bRqSd5sRya', '17110306', 0, 1, NULL, NULL, '2019-04-11 08:05:51', '2019-04-11 08:05:51', NULL),
(402, '17110307@student.hcmute.edu.vn', NULL, '$2y$10$/kx9L28pxKeUsPfsttgyCugTyoIva8wyi1MHpCGn14I3iwVoxkwVS', '17110307', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(403, '17110308@student.hcmute.edu.vn', NULL, '$2y$10$AQsqnhQkN7FBrVnlpY.zS.GLeqUTTZ0GCSRknv2imABhp/D2NlNkC', '17110308', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(404, '17110309@student.hcmute.edu.vn', NULL, '$2y$10$z2NBzsupqucnvNxPTe5MX.o2pTrX0UBasOExEJoQCtQm4C6xTuUKW', '17110309', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(405, '17110314@student.hcmute.edu.vn', NULL, '$2y$10$V7bRj38vUdQsI1qGHDFXcOtxJ/VJYvsXBdMWa.G013pI5RQ/QFAjO', '17110314', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(406, '17110315@student.hcmute.edu.vn', NULL, '$2y$10$Oj7eT3CAj8W3KlTtcaoh2uimVQw3fbbI2NYSFtNMzAfz4p5KkiYOS', '17110315', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(407, '17110317@student.hcmute.edu.vn', NULL, '$2y$10$x4fYPn9Yhuncn0M9SUF72erFGadvTqHJziYMO7cKFimc.ydNeMv9.', '17110317', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(408, '17110318@student.hcmute.edu.vn', NULL, '$2y$10$CzsATDRDD9.RWI3/xu8zs.0UR.K78SnY2VIWVrNket5sMoU2VxKNa', '17110318', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(409, '17110319@student.hcmute.edu.vn', NULL, '$2y$10$LwGudd4i4bazbDZ1caiPmOb36zNSVK9YDBz9kupSOQ5dpeunFjsIW', '17110319', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(410, '17110321@student.hcmute.edu.vn', NULL, '$2y$10$bbtl7vFWpCYo5a5INk1kauvQPWIx8QCeKqLBEHBoAluIWakhrPPbi', '17110321', 0, 1, NULL, NULL, '2019-04-11 08:05:52', '2019-04-11 08:05:52', NULL),
(411, '17110323@student.hcmute.edu.vn', NULL, '$2y$10$SKPT.PhF9j7HHygBIkO53ulPeFlbhfd4AF3eUgypR9w8.5ufqLQ5K', '17110323', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(412, '17110324@student.hcmute.edu.vn', NULL, '$2y$10$KS.F.rRAHxXW/IFyrccKg.JxkuxsoE46hd24tjV93b1mAAEZ7XEL.', '17110324', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(413, '17110326@student.hcmute.edu.vn', NULL, '$2y$10$iVQI5eHsJrhuRu8a3/OLMeJ7upnHhErdkzmjLnZbFV.BboJO.zY4C', '17110326', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(414, '17110327@student.hcmute.edu.vn', NULL, '$2y$10$K5VRrqp3tB8znv/hcSYv3OeR3gdEzV2F7IK1WF1Sdg3v7XujLhhL6', '17110327', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(415, '17110331@student.hcmute.edu.vn', NULL, '$2y$10$RwN07nkgXv5mUeugoeacS.q07v2PyUt.itI83yA6tLR8LlqMGB7dO', '17110331', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(416, '17110333@student.hcmute.edu.vn', NULL, '$2y$10$G/Es.GMFyOXl4/IDw33jX.6tYJcuPwsj3G.UHv81wlNwsPB0IJl7q', '17110333', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(417, '17110339@student.hcmute.edu.vn', NULL, '$2y$10$rmUhpZoyFqNWhzk4k/mrN.HSRKTMOueV4BaTDRQ24UCsNfVUQShXq', '17110339', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(418, '17110344@student.hcmute.edu.vn', NULL, '$2y$10$bbb3Unj5Nh4xljdMTiwL1O5F9HpjbyfOuGQr31dtHG.6udt5/CMVm', '17110344', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(419, '17110346@student.hcmute.edu.vn', NULL, '$2y$10$vDPRTedNpA0wskeohohpjO1tgeEilOukClYbiOF0JITI0I35cavIK', '17110346', 0, 1, NULL, NULL, '2019-04-11 08:05:53', '2019-04-11 08:05:53', NULL),
(420, '17110347@student.hcmute.edu.vn', NULL, '$2y$10$GzPvWOj.tfbF.pL7M3qhF.8uqEudb0v..AjOz73Wu.xvjg53aq7wK', '17110347', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(421, '17110352@student.hcmute.edu.vn', NULL, '$2y$10$eh3nP8ybBqPvyz3B9GtBq.eZqsl2OtfGQIj.bUliQFAbRK2QCUOiK', '17110352', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(422, '17110353@student.hcmute.edu.vn', NULL, '$2y$10$dUk.aGQg.CsAMgFBNlamZ.rr6KYkO1OSsZJauqIM4.WVXtkCe9UNC', '17110353', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(423, '17110357@student.hcmute.edu.vn', NULL, '$2y$10$D7.xFT2nDMdRBaqNx3a3QeAMvxiIldXy5T94lJFAu9mjDcaqshE4S', '17110357', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(424, '17110359@student.hcmute.edu.vn', NULL, '$2y$10$pjw3WgoMNm1rdIWF3AR5z.tVma9l02DiWYYFzr1FCFuwFEUd74DKO', '17110359', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(425, '17110360@student.hcmute.edu.vn', NULL, '$2y$10$011hMkrGKaCZ.tpvkYPnae4pq.MtJmNX0pg4.FF3aE8gfPk9ZqyXS', '17110360', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(426, '17110362@student.hcmute.edu.vn', NULL, '$2y$10$Y.I6orQvzSsJjBV32jEsI.KHJQBAtcu1q55DxF/g2Kfjx5fi.EaYG', '17110362', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(427, '17110365@student.hcmute.edu.vn', NULL, '$2y$10$QC8im76NKWLlr5apWxj7SOyGvLRH/3.rMvqrWAMLZrmFnzu26UHNC', '17110365', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(428, '17110367@student.hcmute.edu.vn', NULL, '$2y$10$yBc75sU6F50Za57AC7KqV.8BYIFnoLzs3w8/vkjWAQOViIvYeKz2u', '17110367', 0, 1, NULL, NULL, '2019-04-11 08:05:54', '2019-04-11 08:05:54', NULL),
(429, '17110368@student.hcmute.edu.vn', NULL, '$2y$10$AP.Ufg1Ql1tR2JdeuiaGxuuKaQ9Lv884x/JHQpzjMHt7akG8.PvOS', '17110368', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(430, '17110370@student.hcmute.edu.vn', NULL, '$2y$10$aZkUd0qItfZnuxdBNdHj0.BT/2PIWR8/W5iLZmQTrUen860pxU4/S', '17110370', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(431, '17110371@student.hcmute.edu.vn', NULL, '$2y$10$8NYAGOp1jVlKk7XmQaMdFevbhudd6eB9zWzv5DhHdr32wgNAgxaSy', '17110371', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(432, '17110374@student.hcmute.edu.vn', NULL, '$2y$10$r6jdHzNALfXaZVldrVXFCuth06mP3WMPkNfvx7lj.nXlIDfk6SQAO', '17110374', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(433, '17110375@student.hcmute.edu.vn', NULL, '$2y$10$uF6wAVwgs7LjlRp8mGk0oe0oOxr6r564y6/CZ//j0oMU1TNxOPrhS', '17110375', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(434, '17110376@student.hcmute.edu.vn', NULL, '$2y$10$8YUvmwk7d8PydscVJWSMhucp4PUu1I3TKfSxxDzZPQwY463iFdUR.', '17110376', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(435, '17110380@student.hcmute.edu.vn', NULL, '$2y$10$1sQ5EyETMLK4TnOqqowbFOszy1Vecc1ib8eUEbi20hxeuGu33YcdG', '17110380', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(436, '17110381@student.hcmute.edu.vn', NULL, '$2y$10$lHG7DH4iCIDiowLuW/D4sOe2aZobhjLFHhKFRwIiFLTFdaFOLC09u', '17110381', 0, 1, NULL, NULL, '2019-04-11 08:05:55', '2019-04-11 08:05:55', NULL),
(437, '17110386@student.hcmute.edu.vn', NULL, '$2y$10$1lBznmx1iHMc2wUMrkFDR.BjWVSGrXcbc3T0hjgTI8rX.5.ouqVZm', '17110386', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(438, '17110387@student.hcmute.edu.vn', NULL, '$2y$10$f524sVwTMoPtpOTPdvVYIuYg4xzIjyc8xo3T8GZoY6.1sLghZI0Iy', '17110387', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(439, '17110390@student.hcmute.edu.vn', NULL, '$2y$10$5RS5GAeE7rrDaiwO05CIDuKcpcBzPExHh8DgitJQIJi3/xcprefOW', '17110390', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(440, '17110391@student.hcmute.edu.vn', NULL, '$2y$10$hm4W/eoYWY8pgKMyo4HM6e5YtCJglHd986Z85T0hj7./I8i.cXziS', '17110391', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(441, '17110395@student.hcmute.edu.vn', NULL, '$2y$10$NiMXwisECSWUYXTH3n.6TeMgMfXzeN8tYClihTTdoBIF.C0ByznOS', '17110395', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(442, '17110396@student.hcmute.edu.vn', NULL, '$2y$10$QgG3rrz5Dg4xxU6lPT9wn.d0k/azcxUVF6zuH8Stgqhjz0jDbxThu', '17110396', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(443, '17110397@student.hcmute.edu.vn', NULL, '$2y$10$NB2xnyG6Omu9sCTzFvzat.5mAGP1rKisPsD33H44D4MNCPkORIXq2', '17110397', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(444, '17110399@student.hcmute.edu.vn', NULL, '$2y$10$tNFVC9//sWx8B6UNMYI2n.N/nnJnVPdclXJVb.N1ZAFG1xAXoMC1q', '17110399', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(445, '17110400@student.hcmute.edu.vn', NULL, '$2y$10$L5gOIfgdpjp2Q71o7CHZE.FswfPlB1MuYYtqNZEDZ4IQCPOjvlp0i', '17110400', 0, 1, NULL, NULL, '2019-04-11 08:05:56', '2019-04-11 08:05:56', NULL),
(446, '17110402@student.hcmute.edu.vn', NULL, '$2y$10$hXEcfbi1xTsc1OXns9lvveKhIWS79OqEh2.fV6AHUlaYhbST1Zz8C', '17110402', 0, 1, NULL, NULL, '2019-04-11 08:05:57', '2019-04-11 08:05:57', NULL),
(447, '17110404@student.hcmute.edu.vn', NULL, '$2y$10$Gpv7kMm2oE96S10fQ/dJtO0ZdYWDFNMuyVlgnURoeqiImtteUNBQO', '17110404', 0, 1, NULL, NULL, '2019-04-11 08:05:57', '2019-04-11 08:05:57', NULL),
(448, '17110407@student.hcmute.edu.vn', NULL, '$2y$10$ri3uNuXRyrONtzGvN73wcegn03kA5FE9CBeYXSc1V7DQPAt6A4Gs6', '17110407', 0, 1, NULL, NULL, '2019-04-11 08:05:57', '2019-04-11 08:05:57', NULL),
(449, '17110408@student.hcmute.edu.vn', NULL, '$2y$10$rca.rTj9b.8f8ixHvQ7oLevT0GQdvvIv9x8p/lHjRBX/N/lAkqQ/a', '17110408', 0, 1, NULL, NULL, '2019-04-11 08:05:57', '2019-04-11 08:05:57', NULL),
(450, '17110259@student.hcmute.edu.vn', NULL, '$2y$10$3EpOZXTIKp9z0Z7oLieeduD1WF.Q9uNJVQaQ0DzaHCoeIZGGrakOS', '17110259', 0, 1, NULL, NULL, '2019-04-11 08:06:55', '2019-04-11 08:06:55', NULL),
(451, '17110263@student.hcmute.edu.vn', NULL, '$2y$10$90b.oyL56oI7dXE4IpNy5e.E42fVney1AI0eJMbx7bx6CSf0FAQli', '17110263', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(452, '17110266@student.hcmute.edu.vn', NULL, '$2y$10$gsdJrBmWHuEFSjOS6bv3I.O9FMGJwpsmtx1FhdU1CPmnojVNoTSPe', '17110266', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(453, '17110267@student.hcmute.edu.vn', NULL, '$2y$10$I/WqRw.1KWnE56ZOdksDpe1mRALh8VQJNKIu.9sFU6kJOel8iiUqu', '17110267', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(454, '17110269@student.hcmute.edu.vn', NULL, '$2y$10$cUDSxyR8fHsUTHBS.9plzejRL1kEhNAx//Dl63T0AIkVw2kBGVGfi', '17110269', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(455, '17110270@student.hcmute.edu.vn', NULL, '$2y$10$Oe5N85GW.EoD0uremEKurO9q3QQ8QcYZS9VugEA1D0ZCSoRFF91kC', '17110270', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(456, '17110271@student.hcmute.edu.vn', NULL, '$2y$10$Z4qCrVyoA8CORsS2zFAV9u5MXZJCLthDpfVVeC.cWcOK4fT03wbIK', '17110271', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(457, '17110272@student.hcmute.edu.vn', NULL, '$2y$10$A957SpGZ3IJl7YK.eNZB5u7K4pyYXa4TUaBWwolSsjj1hb4.brhCy', '17110272', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(458, '17110275@student.hcmute.edu.vn', NULL, '$2y$10$uPU/lnSlXN3npBn9Vs3cUO7kBKmxv.EsHeLTC/0YlG7T.ONUK2dji', '17110275', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(459, '17110277@student.hcmute.edu.vn', NULL, '$2y$10$Q3HaD5L0K9UhYtWVlDz1gefwUbH9fe/fc4NkPdoyWGQAp8Fkl7Q0i', '17110277', 0, 1, NULL, NULL, '2019-04-11 08:06:56', '2019-04-11 08:06:56', NULL),
(460, '17110278@student.hcmute.edu.vn', NULL, '$2y$10$0bhHDtZobdzLv8cMEASqPeTiUMHMQFHzzpuBqt4QaLmEO37TmcSea', '17110278', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(461, '17110280@student.hcmute.edu.vn', NULL, '$2y$10$goeddecNs0ZotTZ5Ifh18ONBRiyJCUg4l52FR0I35USM/EWSpGGo6', '17110280', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(462, '17110290@student.hcmute.edu.vn', NULL, '$2y$10$kBu58A4zxkcULsicFVDJH.inrCdSuN44EX40vvveN5Xyf4MNIRb7u', '17110290', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(463, '17110293@student.hcmute.edu.vn', NULL, '$2y$10$KubcNsELATs7nX9yjq6Gqu8760mcMVAsKG8UqGtPAkupc1QxiBoMy', '17110293', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(464, '17110294@student.hcmute.edu.vn', NULL, '$2y$10$tHbjx.VuZJO518I7y1n7Xe9dZgUlpd5FY0yuLIT6Mdd3Qa24M8LfG', '17110294', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(465, '17110295@student.hcmute.edu.vn', NULL, '$2y$10$drwiPjvydeNwkmEodUga8O0G.9etjxD/WTwEZCaBnVQAK5b7ZHwRi', '17110295', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(466, '17110301@student.hcmute.edu.vn', NULL, '$2y$10$kMeC83hsHX.oGvdZ8O6kG.CdcYHIgsFHhx1AGd1ahUzlSz0WoMOIm', '17110301', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(467, '17110302@student.hcmute.edu.vn', NULL, '$2y$10$Pjzmba9pPmnQiL9vxa6obee8hrsL7WkVHbLnkc5DHvoXFMyLXFvwe', '17110302', 0, 1, NULL, NULL, '2019-04-11 08:06:57', '2019-04-11 08:06:57', NULL),
(468, '17110311@student.hcmute.edu.vn', NULL, '$2y$10$AHEf3c3IlpBVQxN1IMz28.aKawF2o.FFJaLcsni43ynFeGIYLhao6', '17110311', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(469, '17110322@student.hcmute.edu.vn', NULL, '$2y$10$UyN1sklWaBxsnr3bNAKE.OwqjwWqyZJAZfChI/7oMcVd9hnsinx8C', '17110322', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(470, '17110328@student.hcmute.edu.vn', NULL, '$2y$10$dyFQyJetMNcH8iJRqV43uuBGwlJR6S6uIANJKg/XguM6wWruEPQUu', '17110328', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(471, '17110329@student.hcmute.edu.vn', NULL, '$2y$10$3RhnqWr8N5MfqQkJnDXQOe8kNVqcPy2pdeQAo5O/vSggGIon08vvy', '17110329', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(472, '17110330@student.hcmute.edu.vn', NULL, '$2y$10$rw4KTg.fQIbqYDoU4SP3/eisHCztvM35eyf1gVUpys1AQnAiROJpi', '17110330', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(473, '17110334@student.hcmute.edu.vn', NULL, '$2y$10$GikLCMkET0E/4VVpNM7IX.sANJEN.SLQChjzKSeiBIEz.oN9LYONy', '17110334', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(474, '17110338@student.hcmute.edu.vn', NULL, '$2y$10$1Bo/rn82poC2nY3sDAFxjOQtMNPIZ8QpHY2nvbzliDgJZrXStRL1C', '17110338', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(475, '17110340@student.hcmute.edu.vn', NULL, '$2y$10$va9fYdz2YVZiWwVx1FfNPOeCNSYF6nSEhUYbb88DkqLAxJGIoolW2', '17110340', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(476, '17110341@student.hcmute.edu.vn', NULL, '$2y$10$03kFl/SP1DMhbHApoVFrf.dE8U05Fxbnco6MMch0h8Gi3CpqrSpb.', '17110341', 0, 1, NULL, NULL, '2019-04-11 08:06:58', '2019-04-11 08:06:58', NULL),
(477, '17110342@student.hcmute.edu.vn', NULL, '$2y$10$6FAHvKPWvoHcnXnK44KzeOVFTW7XqA1AgaOcMiMu0nD6gzfyf9pV6', '17110342', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(478, '17110345@student.hcmute.edu.vn', NULL, '$2y$10$eVYKzhEeumnM/YTQ1r7yEeG3xY.PpDZ87oBYJ743P16HieMDWXrJO', '17110345', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(479, '17110348@student.hcmute.edu.vn', NULL, '$2y$10$L0V0hogunthaiWjCAwpnJez8hwfHRPZroH3cbX6YVMDscTsTqu8BW', '17110348', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(480, '17110349@student.hcmute.edu.vn', NULL, '$2y$10$6rpH8gLIzCosRMoxEZRAdOZzzvELrEy5gw3lG0xTQJYszRa8t/qJi', '17110349', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(481, '17110354@student.hcmute.edu.vn', NULL, '$2y$10$rIuRvhnKRUZZvF3kt9lbaemjgq8cGnR4TWDNid134jRps/NKGaEfC', '17110354', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(482, '17110355@student.hcmute.edu.vn', NULL, '$2y$10$1nkcX.gCQM31/XYALTFRfuroCjIvIqNsYwwvLkARdixsmQuZn3AnS', '17110355', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(483, '17110358@student.hcmute.edu.vn', NULL, '$2y$10$0molie0uS/IhQhLDFWrUgeKSjAaHqCl5/TCoeEMtsheIlfzOD0hdi', '17110358', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(484, '17110363@student.hcmute.edu.vn', NULL, '$2y$10$F5GVOY0SUT7fmIJyp2qLS./4coQ.wn2N2Y0a5HM1ot/6kj2ShHdB6', '17110363', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(485, '17110372@student.hcmute.edu.vn', NULL, '$2y$10$l6xn5r23EDzT/n17nrCJKuJyworgygZLtA.4BEXaNs5mTv6o716Ea', '17110372', 0, 1, NULL, NULL, '2019-04-11 08:06:59', '2019-04-11 08:06:59', NULL),
(486, '17110378@student.hcmute.edu.vn', NULL, '$2y$10$H243ahCGGUUds1hCaFHovOikZinvzbKsvSbpj/dkTxPFNgDhD/Jce', '17110378', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(487, '17110382@student.hcmute.edu.vn', NULL, '$2y$10$bTTBhSV0X2vupbVMcacFiukogBCYIOBTMHyxHpAVZJZcwUqjy5182', '17110382', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(488, '17110384@student.hcmute.edu.vn', NULL, '$2y$10$ISf6c9d7FrsW0VgeJFkT0uGPfmHeRRuMSpwiK1tpUYUsYzzv0JiZO', '17110384', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(489, '17110388@student.hcmute.edu.vn', NULL, '$2y$10$mn1gGoY2WAmB355Yf6T50eKq/TOGrfSXFG4hXj61wC36m7EV4COxK', '17110388', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(490, '17110389@student.hcmute.edu.vn', NULL, '$2y$10$Fcb5qDdPY2T.TWLhRZ/jeOQj/TdaqGlPzcLwMM/p2tpXokZgSJjPS', '17110389', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(491, '17110393@student.hcmute.edu.vn', NULL, '$2y$10$SammQ5mseLdBCp/.FqhP.OE1QM5z5Pd5YFeVBp6DClGNHWJNyV8Pi', '17110393', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(492, '17110394@student.hcmute.edu.vn', NULL, '$2y$10$xF38bFNPGOR/QGt5/yRTwukEVW6C4B3M2FBKF/7M/JinaYdqYQlRK', '17110394', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(493, '17110398@student.hcmute.edu.vn', NULL, '$2y$10$TcOAl3brASv4eAOGuFEE1.FzdU5khAyxsSwayc3imImaj0SHa0nQO', '17110398', 0, 1, NULL, NULL, '2019-04-11 08:07:00', '2019-04-11 08:07:00', NULL),
(494, '17110401@student.hcmute.edu.vn', NULL, '$2y$10$nZqx8xsgwltR5auX5ycZE.DAA8K7LLiLdgn/JFl7tTDqaH6REIjXy', '17110401', 0, 1, NULL, NULL, '2019-04-11 08:07:01', '2019-04-11 08:07:01', NULL),
(495, '17110406@student.hcmute.edu.vn', NULL, '$2y$10$JAGzSshjElDaa.80oiMqquuuTKLhh/fWx8y9NNlJGwW8/Juegfdgu', '17110406', 0, 1, NULL, NULL, '2019-04-11 08:07:01', '2019-04-11 08:07:01', NULL),
(496, '17110409@student.hcmute.edu.vn', NULL, '$2y$10$trlityNcvzNSDyjjoFxwY.52fmyq1zU6pcvY3TrbMkBFtm3S2hX7a', '17110409', 0, 1, NULL, NULL, '2019-04-11 08:07:01', '2019-04-11 08:07:01', NULL),
(497, '17110411@student.hcmute.edu.vn', NULL, '$2y$10$nVUOlOrQi8g4vc3iiW3zk.5hW7wOueu.gImAKBAu44z2s96FnkxlK', '17110411', 0, 1, NULL, NULL, '2019-04-11 08:07:01', '2019-04-11 08:07:01', NULL),
(498, '17110412@student.hcmute.edu.vn', NULL, '$2y$10$qdPdEA.btmy6BfjDHbnviOav2pTLYcpmOLYBzkC3nke3dE/kdmdp6', '17110412', 0, 1, NULL, NULL, '2019-04-11 08:07:01', '2019-04-11 08:07:01', NULL),
(499, '17110284@student.hcmute.edu.vn', NULL, '$2y$10$FexN8qb4dA5OZM.7.rU8e.WxQv8sS9rbK12Vk0j.RbQWPpM3Mwj1m', '17110284', 0, 1, NULL, NULL, '2019-04-11 08:08:10', '2019-04-11 08:08:10', NULL),
(500, '17110285@student.hcmute.edu.vn', NULL, '$2y$10$.7Na/rf0yfRDh9u.dpw4FuMvChe9N09d.OY74bmp3OAhqVW6gonXy', '17110285', 0, 1, NULL, NULL, '2019-04-11 08:08:10', '2019-04-11 08:08:10', NULL),
(501, '17110298@student.hcmute.edu.vn', NULL, '$2y$10$65HBoLqeSbsvTerD/1xLJelekZq2KgxqJwg8QIGd2YGMfkho/2b3e', '17110298', 0, 1, NULL, NULL, '2019-04-11 08:08:10', '2019-04-11 08:08:10', NULL),
(502, '17110299@student.hcmute.edu.vn', NULL, '$2y$10$wGbzuM1hDeJmtGbIH2G0ieokDm8UWh1mo8kkDo1QsrAli5fot2iE2', '17110299', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(503, '17110305@student.hcmute.edu.vn', NULL, '$2y$10$3xBsZ95MaswHCKlq2y2cp.bBBGCbBW9qEBo8zVlAshwrv69ijfSO.', '17110305', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(504, '17110312@student.hcmute.edu.vn', NULL, '$2y$10$gzy/YM2VhInYrHqNqKXZuOcqYKuZGYdd2gVS/Aw/rEhsup1ZgbPBC', '17110312', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(505, '17110313@student.hcmute.edu.vn', NULL, '$2y$10$Pz6psd5XIKHHsw4ofQ1iq.z6hMQQBycqO1lsWPy6sLsd9munK9BkW', '17110313', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(506, '17110320@student.hcmute.edu.vn', NULL, '$2y$10$xO2.x3niRhPPSWj8b4CRk.QZUSx2fkhoeq8/f4NCKmvh.Dkrulh1i', '17110320', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(507, '17110325@student.hcmute.edu.vn', NULL, '$2y$10$f1qyPLm827lfXoa8nEFuTuDe85d5K0W3KCLBEdtnxbFfMpaxMjyeS', '17110325', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(508, '17110332@student.hcmute.edu.vn', NULL, '$2y$10$5RxH/MLDGZstwfj2fshAv.Sh4ST9tblFWAX.dQk69ovrrSU5CwmWy', '17110332', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(509, '17110335@student.hcmute.edu.vn', NULL, '$2y$10$Gr0igHsLFilGkncxfVTR6eSzwI.HikrBR2BgvTE8dPVtoAxRPindm', '17110335', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(510, '17110336@student.hcmute.edu.vn', NULL, '$2y$10$zP.IunDw5eImNwr.vqNnsepJLfIE8Rt2fdsIE/Fwq1Fd8wA/QpvhG', '17110336', 0, 1, NULL, NULL, '2019-04-11 08:08:11', '2019-04-11 08:08:11', NULL),
(511, '17110337@student.hcmute.edu.vn', NULL, '$2y$10$hT0tQI5cGp4DM84WCgmnKeks1/P4t9sjkK.QMyNVqsHwyU1ADLcM6', '17110337', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(512, '17110343@student.hcmute.edu.vn', NULL, '$2y$10$6eNgTH7aBlHhbXaKpZoh4eH2Zu.MJ5SYAVJKPG3PnyFLSDGA2TA0y', '17110343', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(513, '17110350@student.hcmute.edu.vn', NULL, '$2y$10$dQxPmkPagmzJ.PxEnYmIK.FTXGUABM6Vu8is7ZoDL0iuZd3/ay81G', '17110350', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(514, '17110351@student.hcmute.edu.vn', NULL, '$2y$10$Z2KgyHA5ar.j4Oum7it3MONzR34aCqrB2YWA3CEnLNDuVRLyTml/y', '17110351', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(515, '17110356@student.hcmute.edu.vn', NULL, '$2y$10$/ULgzo2zZP2bABp0Ljdqqua6.Ji65.2yD6R4JZHPEyFOfLGgNDVCC', '17110356', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(516, '17110361@student.hcmute.edu.vn', NULL, '$2y$10$xvnMBZcO8Oqdmww4n3YlLuJ7caBefGdB124bgV3sCO4.479lIakgO', '17110361', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(517, '17110364@student.hcmute.edu.vn', NULL, '$2y$10$hprG4u4jEAIXxQelEek4kOL1tgwt0ujeAOnBnO2v9o9TFFV6v/ypq', '17110364', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(518, '17110373@student.hcmute.edu.vn', NULL, '$2y$10$FtMfSMEJxNs1BBQMEskCaOI4k6AyOBZmQjxvCwZDk4jllXaUMuKg.', '17110373', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(519, '17110377@student.hcmute.edu.vn', NULL, '$2y$10$/leR5Jtrh8iHbRnRm5BHM.sQqm79kol6./CV0bHMU7IufTSQ4QdjS', '17110377', 0, 1, NULL, NULL, '2019-04-11 08:08:12', '2019-04-11 08:08:12', NULL),
(520, '17110383@student.hcmute.edu.vn', NULL, '$2y$10$fYQ4hjIuN/KcWs/9lU7bl.aTlGNmVapHuEnYolYf7qkSIKo15brge', '17110383', 0, 1, NULL, NULL, '2019-04-11 08:08:13', '2019-04-11 08:08:13', NULL),
(521, '17110385@student.hcmute.edu.vn', NULL, '$2y$10$HJJcHotOt.GHfUaUE4xYPOI.1oPpgeFTA61F8x7yw4FfPFrbthjHi', '17110385', 0, 1, NULL, NULL, '2019-04-11 08:08:13', '2019-04-11 08:08:13', NULL),
(522, '17110392@student.hcmute.edu.vn', NULL, '$2y$10$tRnB66Lecot943H2tiOs/O20.adnOzjsoMh0eyYrwgtBg4w.loB8q', '17110392', 0, 1, NULL, NULL, '2019-04-11 08:08:13', '2019-04-11 08:08:13', NULL),
(523, '17110403@student.hcmute.edu.vn', NULL, '$2y$10$e1bPsSBXdHEfEaREnyHoLuovm0tjRKU2.FqToJvSJ.lYGpOy1XG.y', '17110403', 0, 1, NULL, NULL, '2019-04-11 08:08:13', '2019-04-11 08:08:13', NULL),
(524, '17133002@student.hcmute.edu.vn', NULL, '$2y$10$sQLLqq7CnOfg17szwgV19OiglKEVZqyPol9GoAEf.oPqhvwaPo8cu', '17133002', 0, 1, NULL, NULL, '2019-04-11 08:09:15', '2019-04-11 08:09:15', NULL),
(525, '17133003@student.hcmute.edu.vn', NULL, '$2y$10$g7SyJgSCxSDPY/5.rWZ7/u2fK/geXGOcgc8Xc1oUjARPs/loq7MIi', '17133003', 0, 1, NULL, NULL, '2019-04-11 08:09:15', '2019-04-11 08:09:15', NULL),
(526, '17133004@student.hcmute.edu.vn', NULL, '$2y$10$0YSmPTU0gAd.BSAD7eR25euppZiYfMrH8fFhMk8dJdsbeUcLvP7XO', '17133004', 0, 1, NULL, NULL, '2019-04-11 08:09:15', '2019-04-11 08:09:15', NULL),
(527, '17133005@student.hcmute.edu.vn', NULL, '$2y$10$zdWFC23gdtXjMYU6iuMHFeasp0s2fS6PX805tuDh0yLFXYRHijU8W', '17133005', 0, 1, NULL, NULL, '2019-04-11 08:09:15', '2019-04-11 08:09:15', NULL),
(528, '17133006@student.hcmute.edu.vn', NULL, '$2y$10$aW2sSORhMfqqKf8QV0LcmuI/NYIl51uI5LoQAFtA8mjPqYkZn3I9K', '17133006', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(529, '17133007@student.hcmute.edu.vn', NULL, '$2y$10$U/AZiZWRIhrrYdPGz1vM2O26r.qmE26QevDOB0lVBO8S.2k59hkdq', '17133007', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(530, '17133008@student.hcmute.edu.vn', NULL, '$2y$10$taDvnqdFY2EygoJmmsJIcuZBmyK47IuvJrzIndJMF/8soKJYZveZa', '17133008', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(531, '17133009@student.hcmute.edu.vn', NULL, '$2y$10$YuaJf9xBs7OXE6ujmxghuejkks.fZkQ76oxQV22ZxCxpJq2SO2zFC', '17133009', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(532, '17133010@student.hcmute.edu.vn', NULL, '$2y$10$Lv4Lyv.XDZ.RgtJ62sZpluZEJu4yRp15xnEMafZMZK00MKNJCHQ5S', '17133010', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(533, '17133011@student.hcmute.edu.vn', NULL, '$2y$10$69wXoEiMnPaIjcUpUtBqDOiqy8DH7c1ctRQ8iIdTmxbNpDXk63v9G', '17133011', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(534, '17133012@student.hcmute.edu.vn', NULL, '$2y$10$CkQJM1VFu815mH5VpbPp1.2TDpcaxtrCRPtVAQ2uPztTxeh8z3ODS', '17133012', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(535, '17133013@student.hcmute.edu.vn', NULL, '$2y$10$41Lus2RhExYrW4f6XtbBL.b0JABebYsd4Q.rgDlLhDtWFf0OPWZ2e', '17133013', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(536, '17133014@student.hcmute.edu.vn', NULL, '$2y$10$frDFqKphjReEqBYFu88aouItgUBsKKTr2xJ0hSTv3GCh85LUQziVu', '17133014', 0, 1, NULL, NULL, '2019-04-11 08:09:16', '2019-04-11 08:09:16', NULL),
(537, '17133015@student.hcmute.edu.vn', NULL, '$2y$10$cBsRHVtKRaWWzsn7MGsZEutEsfj5c69bpA3iLDlJREOSvzqhHohv2', '17133015', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(538, '17133016@student.hcmute.edu.vn', NULL, '$2y$10$ZCZqWlWJ45wd/jI13K9hW.ptmrYOTRqkHMZNuvf0OlNiyHNPnGw9m', '17133016', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(539, '17133017@student.hcmute.edu.vn', NULL, '$2y$10$gQYENDtpkVkTu2kn095hvem88ey7GRTaBwa396o/9xTQ0FBgSx3Am', '17133017', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(540, '17133018@student.hcmute.edu.vn', NULL, '$2y$10$tQjjI5aH5odW/WgvLOqgx.6H5RolQ7dzLqee0EFTHm7muyYpo38GW', '17133018', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(541, '17133019@student.hcmute.edu.vn', NULL, '$2y$10$YRFF9Glph1aClmFKOZh2fO5gjp0KiBNZAU0VOyNMediFmL5FTd2IK', '17133019', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(542, '17133021@student.hcmute.edu.vn', NULL, '$2y$10$t58D3LURg/5T5056xLxxTetJ1npzBDrmBArrDG66uC4pLMs2yn4Hu', '17133021', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(543, '17133022@student.hcmute.edu.vn', NULL, '$2y$10$hi5GFftBzi/YHtp9cFvKxu7PrAzZ6hbZ4IDHs/iIJrrtZVMBa6ctG', '17133022', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(544, '17133023@student.hcmute.edu.vn', NULL, '$2y$10$RhNNCbfXKI1.ma2znN6YROZe/Nap/g76r2RX0aw0RrF40qfK0qoB6', '17133023', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(545, '17133024@student.hcmute.edu.vn', NULL, '$2y$10$PAWSKWpl3HWoRgKNg6fHTefOkKkaftPvzEOvv5.NLAUEsKoevTlW.', '17133024', 0, 1, NULL, NULL, '2019-04-11 08:09:17', '2019-04-11 08:09:17', NULL),
(546, '17133025@student.hcmute.edu.vn', NULL, '$2y$10$SQhZG1LTi5ZG8LYxISdJm.6TSAInL59xlKu69ZLGKZ500TtNz/49K', '17133025', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL);
INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `student_id`, `level`, `created_by`, `updated_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(547, '17133026@student.hcmute.edu.vn', NULL, '$2y$10$m1RxNpbp97cFUsTos0870encoaa.lPofl/Aje87lCaIlnhVTPfU1u', '17133026', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(548, '17133027@student.hcmute.edu.vn', NULL, '$2y$10$74q7ej07Q3SuwpDD7cPyuuylCTu4nQ.vrWb2lf.a1zNjRtON9H93a', '17133027', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(549, '17133029@student.hcmute.edu.vn', NULL, '$2y$10$mZqbV0pUy35QkTrsZz/2cOx3SEeKX1EUeb09T36HJ5Vq8CZdxWEqO', '17133029', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(550, '17133030@student.hcmute.edu.vn', NULL, '$2y$10$IPJNzL8dzQWTbyFjcmBlWeTczexBUX3Jf8hZ87FA3h2PFNmjK9DZO', '17133030', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(551, '17133031@student.hcmute.edu.vn', NULL, '$2y$10$FEdRpQKaEog.BnTxSh9UG.JSnbrCmXiwPnLjT9oGOKmzhb87NjOE6', '17133031', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(552, '17133032@student.hcmute.edu.vn', NULL, '$2y$10$Meouk31VOqqUY8QTLfn7Wui9qMvOijeOjjEate.kVM263ZZE86cIC', '17133032', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(553, '17133033@student.hcmute.edu.vn', NULL, '$2y$10$/fuI82FcT6DIl10dY0oZ3.PxMYb8bS242ZWXMPyqYNLWyRhrfP6Ym', '17133033', 0, 1, NULL, NULL, '2019-04-11 08:09:18', '2019-04-11 08:09:18', NULL),
(554, '17133034@student.hcmute.edu.vn', NULL, '$2y$10$sWhBdbrlB0ceKWkm0Dkw4egF62Znog8zBvpu5fEF1DyKQY25EVQeK', '17133034', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(555, '17133037@student.hcmute.edu.vn', NULL, '$2y$10$IRXoxkx/gzxJlYP4LWvb7uOw0QG3RKkKxpM5owB9sX3lD3TW9XrAm', '17133037', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(556, '17133038@student.hcmute.edu.vn', NULL, '$2y$10$vKQecMZfuPZ03Jwm0o9FT.2xPe2XAXCL9xADD8qsuuUmA5N1OiR42', '17133038', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(557, '17133039@student.hcmute.edu.vn', NULL, '$2y$10$JZ5N1dv06jeFhScGLPYmAeV7IOvXnFod3te2GHMhgKg4/VgmFgUwO', '17133039', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(558, '17133040@student.hcmute.edu.vn', NULL, '$2y$10$lFcH0uHdhoM5.uqJFSzZaeZpWWeV26HzCAgJ/HGsCBL4iHwxT7GLy', '17133040', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(559, '17133041@student.hcmute.edu.vn', NULL, '$2y$10$OTfmOofZ.fOhv3r985znveAjhEgR0Qhv9sb0MZ6d/OasJcr/SYlLe', '17133041', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(560, '17133042@student.hcmute.edu.vn', NULL, '$2y$10$E3od.aNTSTBHU3wyxtqZcO5KtGWrBbrlS.Ck3BOig.8mqDD2IV572', '17133042', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(561, '17133043@student.hcmute.edu.vn', NULL, '$2y$10$Av4YoNI7ukTvr/bG1hBCUOOJ3ktnD2RYCz0sBWIimItPjmitPiEfC', '17133043', 0, 1, NULL, NULL, '2019-04-11 08:09:19', '2019-04-11 08:09:19', NULL),
(562, '17133044@student.hcmute.edu.vn', NULL, '$2y$10$k6Sg3EmbPAxdKGJn/VQlx.u4EFipkZ3CeDOn14Eyj4OfmAXKSNYES', '17133044', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(563, '17133045@student.hcmute.edu.vn', NULL, '$2y$10$yj6hRNppUhvBtuMggIuej.k.M1DgWDOdLNDMR522cQzI4SkxretdS', '17133045', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(564, '17133046@student.hcmute.edu.vn', NULL, '$2y$10$6FlFUekWZLO1baX0UOTdUej0z4IzrV/UiMOVFvoYuOSEoKbTuVFnC', '17133046', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(565, '17133047@student.hcmute.edu.vn', NULL, '$2y$10$Ne/5PiZwAUjQnuvc35ns9uzAA5I.yoZ3hjhBHLMZRI3vqy.f1W3jO', '17133047', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(566, '17133048@student.hcmute.edu.vn', NULL, '$2y$10$3M/iJTRv92.mB3Z/apaPgeR2XiHYJ6RF8eCXs9Qgt9eRqHil5PvK2', '17133048', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(567, '17133049@student.hcmute.edu.vn', NULL, '$2y$10$WbjzibEqES3DKrnBgRqPe.DvY6qt0giwYTjOcuYkTk0NJJNQSR6WO', '17133049', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(568, '17133051@student.hcmute.edu.vn', NULL, '$2y$10$OumBh4lZgo0R6XMW416oce3asLwYjyhI21pFrqlifBXlfPKr4upNm', '17133051', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(569, '17133052@student.hcmute.edu.vn', NULL, '$2y$10$HIJlvYPBdGq.ns6tNntWBeejo/rflSxzNSKxlYSsYLk9GLJURjoiW', '17133052', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(570, '17133053@student.hcmute.edu.vn', NULL, '$2y$10$3VSndo5UzI2cNJXho/nCLebc.Egx/5fuFZzm1ZsX3SD8EDRZrqbXa', '17133053', 0, 1, NULL, NULL, '2019-04-11 08:09:20', '2019-04-11 08:09:20', NULL),
(571, '17133055@student.hcmute.edu.vn', NULL, '$2y$10$wZrDsPaz45.VJlhN9owr3uHD2XgEKNHHiemgI.hrjxFSf2gdmYnca', '17133055', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(572, '17133056@student.hcmute.edu.vn', NULL, '$2y$10$JxetjhsiNuiqNYJFY3QvL.iSaEy8q7kwYPKdm4u9yCj1Jm4JKWJ8K', '17133056', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(573, '17133057@student.hcmute.edu.vn', NULL, '$2y$10$LXWYLSXtSbnPriRqJchZROP4FelTXaW4pZTf.vzz3cIbEtlmrU7be', '17133057', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(574, '17133058@student.hcmute.edu.vn', NULL, '$2y$10$3mJaclC8GHfFhpx3s3IDRO0wuDO03ncp57X9bJem4IybmPpbnqanG', '17133058', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(575, '17133060@student.hcmute.edu.vn', NULL, '$2y$10$FjhnffMfn5nxeL8W4CvCa.SgAK3p5B41yky9qLPsPaRiZwmJobMza', '17133060', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(576, '17133063@student.hcmute.edu.vn', NULL, '$2y$10$Sx8oqhshcAREo.G1lqZA8.QooZJCYqffnyorckrysTLAefhh10YX.', '17133063', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(577, '17133064@student.hcmute.edu.vn', NULL, '$2y$10$SQ2aUbQs2WWCfhjPsM57ze7RE3wNn18WPSGyW9wJVRikmOO6j1Qhi', '17133064', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(578, '17133065@student.hcmute.edu.vn', NULL, '$2y$10$Cc3KSuHbHku73OLxXEIcOuuvWPOzFtwQz.9.c64HXzfnH6dej8CqG', '17133065', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(579, '17133066@student.hcmute.edu.vn', NULL, '$2y$10$AJ2g.Cnylx8KU1L9qUoh.uvzGcPZ6f7n8ferTTWfzhBt5vN52RsZW', '17133066', 0, 1, NULL, NULL, '2019-04-11 08:09:21', '2019-04-11 08:09:21', NULL),
(580, '17133067@student.hcmute.edu.vn', NULL, '$2y$10$sOP75cbsT73XhpiyLUcp6ejoh84lJm6pfe/QQm0yRN2L3UKddFtoS', '17133067', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(581, '17133068@student.hcmute.edu.vn', NULL, '$2y$10$mm1DwBUDq4DhwOb6dKCIkuKaxlhKNdYAWMdJfZPKJCZb315tshdV6', '17133068', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(582, '17133069@student.hcmute.edu.vn', NULL, '$2y$10$U9rat7ofoYojxoMxKsCXK.arnCQYdddKEdlI7p/eAfqJUniMH.9Ti', '17133069', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(583, '17133071@student.hcmute.edu.vn', NULL, '$2y$10$BHvc5vlc.nQB3z3e2XhCmu5rU8ybPrHuxIxrgvAVxXHY4HoVJQWre', '17133071', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(584, '17133072@student.hcmute.edu.vn', NULL, '$2y$10$tEh5dKUY89Uvgf0nuj1vXO3.bR8TF2AxlZF9lCXEr8nKoTC4KrxZ6', '17133072', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(585, '17133073@student.hcmute.edu.vn', NULL, '$2y$10$U1lfWPwlcN7kFiJcxB9LjuzBA0bAAge03xJJ5MPwrz82UtPi91imC', '17133073', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(586, '17133074@student.hcmute.edu.vn', NULL, '$2y$10$H13bvO5irWkjy/n96GgoE.XO7xfIavdvwxl7dCEkzkS6Frp3yhLti', '17133074', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(587, '17133075@student.hcmute.edu.vn', NULL, '$2y$10$TziwlWUJagIcgTKNK7GB3Oe8Bj6OHTI/0gxLghPLRPxgLQj8fKkt.', '17133075', 0, 1, NULL, NULL, '2019-04-11 08:09:22', '2019-04-11 08:09:22', NULL),
(588, '18110245@student.hcmute.edu.vn', NULL, '$2y$10$V1PN2YSiuvlorQ2OSeL3Ae/BlFXe4rvwAqwUcwtHmPNPbkLEy9fMu', '18110245', 0, 1, NULL, NULL, '2019-04-11 08:10:51', '2019-04-11 08:10:51', NULL),
(589, '18110246@student.hcmute.edu.vn', NULL, '$2y$10$2fNtiRqw.yrcVZZh4iP3euHx6sEKrP3voXXVWBMYv9CoLVvBrjP4K', '18110246', 0, 1, NULL, NULL, '2019-04-11 08:10:51', '2019-04-11 08:10:51', NULL),
(590, '18110248@student.hcmute.edu.vn', NULL, '$2y$10$KZ9bQh/BuRXmWrFDNmcToOwR5k69E0DaPDKjE0y4HdBOrXIuZIIk6', '18110248', 0, 1, NULL, NULL, '2019-04-11 08:10:51', '2019-04-11 08:10:51', NULL),
(591, '18110250@student.hcmute.edu.vn', NULL, '$2y$10$/lHXLHe3q90E/h9WultOwe1zEVnbjkA/Dl0AWFx/FrgVrBZGg/njm', '18110250', 0, 1, NULL, NULL, '2019-04-11 08:10:51', '2019-04-11 08:10:51', NULL),
(592, '18110255@student.hcmute.edu.vn', NULL, '$2y$10$wMwPJDSPDSxrbAq0L/V9jONzbQi2Xnf3TtOnL/tj/DK1jhNyMKIu2', '18110255', 0, 1, NULL, NULL, '2019-04-11 08:10:52', '2019-04-11 08:10:52', NULL),
(593, '18110256@student.hcmute.edu.vn', NULL, '$2y$10$OjLuEV6EGqx.SZHoynImTuPsM4VuD44yAaHKTy7VtFXwfGdzB6lAa', '18110256', 0, 1, NULL, NULL, '2019-04-11 08:10:52', '2019-04-11 08:10:52', NULL),
(594, '18110258@student.hcmute.edu.vn', NULL, '$2y$10$DVt/zY38qgH6zS/RdgokVePuv1bkD.PVpyjDO/uZYodPtgPLuzXTi', '18110258', 0, 1, NULL, NULL, '2019-04-11 08:10:52', '2019-04-11 08:10:52', NULL),
(595, '18110259@student.hcmute.edu.vn', NULL, '$2y$10$k55didybMICGSPEtqp6OWu/7ODtya29LS1Ujb64jH..GT9OByX3Sa', '18110259', 0, 1, NULL, NULL, '2019-04-11 08:10:52', '2019-04-11 08:10:52', NULL),
(596, '18110260@student.hcmute.edu.vn', NULL, '$2y$10$bmDmTU3AFFH8jB28vvJRVev8YMpJoig7mZRoYPa1KTQYyAOeZvbke', '18110260', 0, 1, NULL, NULL, '2019-04-11 08:10:52', '2019-04-11 08:10:52', NULL),
(597, '18110262@student.hcmute.edu.vn', NULL, '$2y$10$CkVbzqx/mBIRgp3ShaTRyu7Nv5LKAdn4vccTcLprjA.KZhtZ3CCq.', '18110262', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(598, '18110264@student.hcmute.edu.vn', NULL, '$2y$10$ldP0CMhBCps6ktvHAqwcCONgsd3VVRvrfCg/.EKrgkouSEmm.KYfi', '18110264', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(599, '18110265@student.hcmute.edu.vn', NULL, '$2y$10$f1BccheN3n1GcdajRPQrOO.Jo1tjo7RMPGqHnnYAoRsc2udYzutRq', '18110265', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(600, '18110266@student.hcmute.edu.vn', NULL, '$2y$10$lFDIbcAM48HNdrTpLaDnSucsqr/VVC02YdxIK6Sj2X9Dv6hWs6zyq', '18110266', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(601, '18110268@student.hcmute.edu.vn', NULL, '$2y$10$z9voIXY/x5L5zvk2QfvlueL8Le8zYq55zWvyiMcvm08zvgeKwTGJi', '18110268', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(602, '18110273@student.hcmute.edu.vn', NULL, '$2y$10$QAgvYngJg7g99SPpoynfuukKwNA4AGIuupQimMghM4RSwDDYq69dC', '18110273', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(603, '18110274@student.hcmute.edu.vn', NULL, '$2y$10$G6FHQJ8U9cyuIjZ5QhsS0.QMcapg85P6oE9YiJihY0rX587o4bzh.', '18110274', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(604, '18110278@student.hcmute.edu.vn', NULL, '$2y$10$5lfMZqGNMDwxqMIhq2Ts4..2Dq.mshF9eG8Jp.ypV8HD97tKZ2.OG', '18110278', 0, 1, NULL, NULL, '2019-04-11 08:10:53', '2019-04-11 08:10:53', NULL),
(605, '18110281@student.hcmute.edu.vn', NULL, '$2y$10$TfQrXWvoJuLM.klYUAy11uv0qF1GT2D0qGzL4xG4I2oXWHT5OH8CW', '18110281', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(606, '18110282@student.hcmute.edu.vn', NULL, '$2y$10$OEVVFWyQmm0bXvPs4tlQdO2gq1TeacoX1guCD2MTG/xIBupkZiGxW', '18110282', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(607, '18110283@student.hcmute.edu.vn', NULL, '$2y$10$Xt6lx7N15sNvpEkFlyDL8OO81G2ReKGMGL1Paa3Cs2myoJS1Ubvhe', '18110283', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(608, '18110284@student.hcmute.edu.vn', NULL, '$2y$10$S91CHDQTole8qFRKz6BH7.mhV80Anr2uWKVoCRJVKRSDgMcK6Nk/u', '18110284', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(609, '18110285@student.hcmute.edu.vn', NULL, '$2y$10$U5c7V5FIJLvKL6Lp6rBRWONnj7ofWVPMuwaQ/6ZHU51Aipa1PvhMu', '18110285', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(610, '18110287@student.hcmute.edu.vn', NULL, '$2y$10$XlRDn6whf6wcqSYvvSsDjuOL/XIlVW765q5qcTqFXgKLwYdiy9vt.', '18110287', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(611, '18110288@student.hcmute.edu.vn', NULL, '$2y$10$6XDgaPU4AnDXnT4kqnwZyurX2sikHujUI4YvFMJOlSdiSKiFpufR.', '18110288', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(612, '18110289@student.hcmute.edu.vn', NULL, '$2y$10$n27Yxrt/KY/8V/XgqqQRf./NBDPWX3622F1PGq6Z1.X/skGfX1uVW', '18110289', 0, 1, NULL, NULL, '2019-04-11 08:10:54', '2019-04-11 08:10:54', NULL),
(613, '18110290@student.hcmute.edu.vn', NULL, '$2y$10$EV4xCyWi5g7RLj41uTqdvelwnFWfybHUgisO.3SmyOcCK9Njl81lu', '18110290', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(614, '18110291@student.hcmute.edu.vn', NULL, '$2y$10$kWsPPLBpbWKOORKs8Di7Se7jIP0/x/PAklR1D6.xNgGOogdH0Alum', '18110291', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(615, '18110292@student.hcmute.edu.vn', NULL, '$2y$10$jn453v50FAGQmfCTrOKbLeOEKKsnberSmmBS3KYEnxpJDzyq6njVW', '18110292', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(616, '18110293@student.hcmute.edu.vn', NULL, '$2y$10$YZ7FAmoADw6IRz11/.sFhOwYw8/XtRLChT1881NlE0yuVUQMeIEUa', '18110293', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(617, '18110294@student.hcmute.edu.vn', NULL, '$2y$10$UAY/4fIQDfm7/2vdp2lpceACxGQ3bPPYe5gfSTh5ggRV0sC1BtRaG', '18110294', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(618, '18110295@student.hcmute.edu.vn', NULL, '$2y$10$gMJb0dVo9fOo7piEmbMareOREZtVd2HHAIG4ezKpIPMDd7LpKAko2', '18110295', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(619, '18110296@student.hcmute.edu.vn', NULL, '$2y$10$bRuC5FClD36bBNsHH0vPTul3qVXLYtQYuWfA9LkMzs5Bgk63KrknG', '18110296', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(620, '18110298@student.hcmute.edu.vn', NULL, '$2y$10$tLIJXQK82EmPb4I8PzHRNesbpTrm58ocjLRYnqNGliXIKHKUnks76', '18110298', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(621, '18110299@student.hcmute.edu.vn', NULL, '$2y$10$IC86i2X5tfcutZQ7uAWYc.02FCeIGMuNrvbB.B4Px9qvlMp.hzFWK', '18110299', 0, 1, NULL, NULL, '2019-04-11 08:10:55', '2019-04-11 08:10:55', NULL),
(622, '18110300@student.hcmute.edu.vn', NULL, '$2y$10$BuLzDBhOzpOqZaKKTwuoNOagFs3Rg/Crd83NA/HccoFey9Gzm0D6C', '18110300', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(623, '18110301@student.hcmute.edu.vn', NULL, '$2y$10$m1XywagyfRThIJqEnLmpSOM1NCKY50PTwA4E4E7W9jpdmVPyz4M4G', '18110301', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(624, '18110303@student.hcmute.edu.vn', NULL, '$2y$10$6JhHI/qpcek2aejr9WSbf.PMYQVfYHriaL1.hmFnaqDjCyboFAdFC', '18110303', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(625, '18110304@student.hcmute.edu.vn', NULL, '$2y$10$Xv2cpyHz1KuVmGWV0.PHV.nhWocD3OxsiGMdTbkwin93t3daPYGr2', '18110304', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(626, '18110312@student.hcmute.edu.vn', NULL, '$2y$10$geOaJIFeM3sMzV5C4g4WT.6Qglyg60YHKxSk9ZXCC3BBDl5dpiA3.', '18110312', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(627, '18110321@student.hcmute.edu.vn', NULL, '$2y$10$z/zJkDqIIrlU1jcMXnAEf.xvQwP/C9cul5cNyaXa5p0AxcN9CV5D2', '18110321', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(628, '18110323@student.hcmute.edu.vn', NULL, '$2y$10$gBlwMAhjYz3v.I84BAFjHuL4Nlj4Cpc2tG77WdT0k/Cg7f/eXXviO', '18110323', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(629, '18110324@student.hcmute.edu.vn', NULL, '$2y$10$Tx1ewTIsRr4dgyDeUehbXusLkD5aiyp/n6baNVLTwJlkWoHiBxmxu', '18110324', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(630, '18110325@student.hcmute.edu.vn', NULL, '$2y$10$wjOI8U7pAszfPosUqx206uBwJ2Rin6MJXFFguS3zvww39waIKN7MW', '18110325', 0, 1, NULL, NULL, '2019-04-11 08:10:56', '2019-04-11 08:10:56', NULL),
(631, '18110326@student.hcmute.edu.vn', NULL, '$2y$10$wWExDR/aAw1g499wv0NcAe/G2bELk2WI1JCjXRBPazJkrthTgft9m', '18110326', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(632, '18110327@student.hcmute.edu.vn', NULL, '$2y$10$mMAqiopGfo2.QeyWqt/C2umh8JJJ.FpX3K6LraSLKW0AdBKcfkbXK', '18110327', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(633, '18110328@student.hcmute.edu.vn', NULL, '$2y$10$piqmqr5Oa7j3l/mwzIA4wu9wdUWKp0w6N/pZksXnu5whUNjj62pBy', '18110328', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(634, '18110329@student.hcmute.edu.vn', NULL, '$2y$10$CzyL0FkCFHj/tdQqoR5VSuyYqmtT55.O7NqwmiHVV9VGunCOzsNni', '18110329', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(635, '18110330@student.hcmute.edu.vn', NULL, '$2y$10$hePdc.fBL8B.qOOr3DyjheIHkWT36jeLc1AVjIwp59Ywm7fded4xK', '18110330', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(636, '18110331@student.hcmute.edu.vn', NULL, '$2y$10$XDXYjkhB2pl3Bb4hR6vv4.Vvwd26v3A8q9KSJNzH7L7d6qDOijKGG', '18110331', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(637, '18110332@student.hcmute.edu.vn', NULL, '$2y$10$PCAxWuVmiwL0QLc1Y7Lf1es7sQyPHa5mf0zROUvTJb5woEgU3MVRG', '18110332', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(638, '18110333@student.hcmute.edu.vn', NULL, '$2y$10$j9FrkjIsLaP7WXpbSyFxju4YTNQryX39EqKCUaO361VIlPtk0WVHG', '18110333', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(639, '18110335@student.hcmute.edu.vn', NULL, '$2y$10$hk8lVnUcpcTZxVANkMhCvO1LSDL9olQpU1NiDVM2tN1/7JdnHGXgy', '18110335', 0, 1, NULL, NULL, '2019-04-11 08:10:57', '2019-04-11 08:10:57', NULL),
(640, '18110336@student.hcmute.edu.vn', NULL, '$2y$10$/q2RQwUcBv83upDpj9pQr.WvxDx1rkKRF9vtmJFy7kPzBAyPR7Pda', '18110336', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(641, '18110338@student.hcmute.edu.vn', NULL, '$2y$10$OqaW9196R/pMBZ9zJaZCTubH34tQjkFhX0VI1oJSfM1JBHuEkge5q', '18110338', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(642, '18110339@student.hcmute.edu.vn', NULL, '$2y$10$VeQR.moEzwBa1vqQc6BxJe8vApFc5.60hUIH53Y9DtTe9nkBjf4Bu', '18110339', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(643, '18110341@student.hcmute.edu.vn', NULL, '$2y$10$Ex/ieU9l2fnZZSIQsnNvw.gzUqF3tW8R3Jmar.veszGx0inkQbuwK', '18110341', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(644, '18110343@student.hcmute.edu.vn', NULL, '$2y$10$APsXy7yZAMIXM0FjDN6s4uNUJtzVNLAE/Ap4OUhugP4bM965J4Ju2', '18110343', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(645, '18110344@student.hcmute.edu.vn', NULL, '$2y$10$vLi/FTVz.rR.VB00dyEKmOWv0wf8J1k3zOcCXYOlv9YovU/jCY6nu', '18110344', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(646, '18110346@student.hcmute.edu.vn', NULL, '$2y$10$573f11zkHQk8loEjcvokGexcYjrMijn1koi4RM5y7HTgTotElmBTq', '18110346', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(647, '18110347@student.hcmute.edu.vn', NULL, '$2y$10$KWT4afdOwUPksEBKcn8uAO0yGELFAEjyPfBbgUDpTaUy8g4ZkLIm6', '18110347', 0, 1, NULL, NULL, '2019-04-11 08:10:58', '2019-04-11 08:10:58', NULL),
(648, '18110349@student.hcmute.edu.vn', NULL, '$2y$10$Gd7Pe57D5KAcFkBzXSyo0OKdVSAkp8MCM6tKaKJkPu5oWxalpFHIK', '18110349', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(649, '18110350@student.hcmute.edu.vn', NULL, '$2y$10$xa4welLX4EEJl4Eq8CQGsuBBoylSFPgZTZPJ7ABEBbkmzeTWeyal2', '18110350', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(650, '18110351@student.hcmute.edu.vn', NULL, '$2y$10$GMcMJcbOTQVvMa7zm2HbG.qaT671KlFRWXbNkMGFAryXnEuGH.3AG', '18110351', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(651, '18110352@student.hcmute.edu.vn', NULL, '$2y$10$VlvQDEuWBKf0YtrJQeYeQuFeyXGVYwt8xdShGfIBRDrKlVqCAP3D.', '18110352', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(652, '18110353@student.hcmute.edu.vn', NULL, '$2y$10$sKSc74Oocv3R3EMrBK.af.VPRsUJXe2gtzE64i4qAxdUQZCf4nwzm', '18110353', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(653, '18110354@student.hcmute.edu.vn', NULL, '$2y$10$KKm9.pNqXGyWw304qz3BJemfRec1UXYAKrmbN9IIEdxH2I4Wh4HZG', '18110354', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(654, '18110356@student.hcmute.edu.vn', NULL, '$2y$10$LhGy25WEaujr7PX1.btYO.f7SBxZQK1mpOuGURqwt1wY2s1kZJh2q', '18110356', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(655, '18110357@student.hcmute.edu.vn', NULL, '$2y$10$SCdOXBH77jgKmmVwkGntXe9LKFKUdPiG.k5MXXq2hMVoZq7CINfHa', '18110357', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(656, '18110359@student.hcmute.edu.vn', NULL, '$2y$10$s0WCT8ZluZ8WcGKtCzaThedGLl4cVc5.weGSIpbkCH3gLIvlVF1h6', '18110359', 0, 1, NULL, NULL, '2019-04-11 08:10:59', '2019-04-11 08:10:59', NULL),
(657, '18110363@student.hcmute.edu.vn', NULL, '$2y$10$jvsi56XUSATquVj3Vk6zzuPjr/voWsPE8kvdeRahLQvSN4wW1T7vS', '18110363', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(658, '18110364@student.hcmute.edu.vn', NULL, '$2y$10$gwPi6J4V6hEyBqLQm/72dOJyGR4cbalGxp9.TBazK.ycFF9lckcpC', '18110364', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(659, '18110365@student.hcmute.edu.vn', NULL, '$2y$10$rTap2a4A6BJyncFTAfvhquD4BCRB2qE/VkmbKWp2ciQTm3CeTbzVe', '18110365', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(660, '18110366@student.hcmute.edu.vn', NULL, '$2y$10$ZpGixtaJGLt1C4RDpSTn0.d9j90yfTrTZ1HME.bn1hjQqYLqSyQim', '18110366', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(661, '18110368@student.hcmute.edu.vn', NULL, '$2y$10$EgLvTQ5X4wVQCHlZd9VhM.jQfWm6xv2u0vUI2xfPJJuuShtr6n1uu', '18110368', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(662, '18110373@student.hcmute.edu.vn', NULL, '$2y$10$e/tZ0PfryrRoTLkiQEhf8ueJEsPDZGLjkkNvCXDMd0JML.ZObeBMi', '18110373', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(663, '18110374@student.hcmute.edu.vn', NULL, '$2y$10$Xm1dWmSCxXMYL49qJtjh7e.TSb4kTvv4F0zm7DU9pYyqFxfH2D8ZO', '18110374', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(664, '18110377@student.hcmute.edu.vn', NULL, '$2y$10$/Nj4bq.d0gtqYrhMbREm/OWF1Knv2esZo9byvTxKiuQGER2tXqChu', '18110377', 0, 1, NULL, NULL, '2019-04-11 08:11:00', '2019-04-11 08:11:00', NULL),
(665, '18110378@student.hcmute.edu.vn', NULL, '$2y$10$3KetZzdXaHABcyFs/mn1GuRkEv.xKKD9M01S1y3zRzHlFNsTOF5Ru', '18110378', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(666, '18110380@student.hcmute.edu.vn', NULL, '$2y$10$f0i7.EpOZQp851QAIUFwteI.aiDPvnbRnAV0xS/slMo6JWbkbkdTy', '18110380', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(667, '18110382@student.hcmute.edu.vn', NULL, '$2y$10$I1Si1.Nsp/YWpYmKJTC1R.BKnDFR.iN0PszBTTSASTBRp8h6cD4o6', '18110382', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(668, '18110385@student.hcmute.edu.vn', NULL, '$2y$10$2YfWo4hVIvtnuUH5ajF2k.DNvmlN3XkCG84vELiCF3.S/LzfE9woO', '18110385', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(669, '18110387@student.hcmute.edu.vn', NULL, '$2y$10$AqvsBb1UKJIEFmZVMOwfc.lAoC2HTxACExt6u//Vj2DnEwk9IfSNi', '18110387', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(670, '18110389@student.hcmute.edu.vn', NULL, '$2y$10$zLeWR7BioAOPO1x3pjap8OW6xCVGfAndFLHjvnmYY594vBj5mJtK2', '18110389', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(671, '18110390@student.hcmute.edu.vn', NULL, '$2y$10$nIjhvSLUOfNFehdSKBFo2OyAtwm8P/hUtM4jYZM/FOg0sc/bC18wO', '18110390', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(672, '18110393@student.hcmute.edu.vn', NULL, '$2y$10$JprUCbswdA.IjgNZtl0VOe0fUTu.27Zckh891wwY92vg3/ps5qhtu', '18110393', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(673, '18110395@student.hcmute.edu.vn', NULL, '$2y$10$Dnw14y54V5DA9r2Fb8qNTudsRTJDoesB/.c2jjU6RK9KCVXpQC/r2', '18110395', 0, 1, NULL, NULL, '2019-04-11 08:11:01', '2019-04-11 08:11:01', NULL),
(674, '18110399@student.hcmute.edu.vn', NULL, '$2y$10$8.vyXSA3RJgBO9khvWXLleuzeXJved.rZ6/Lp2GfyML0qbD2g8zWq', '18110399', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(675, '18110401@student.hcmute.edu.vn', NULL, '$2y$10$pxRgN1XPTs2HloJKLQsSJOqTikHM3ZiXEuele9YJ9r4tbgwJSw9Tu', '18110401', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(676, '18110402@student.hcmute.edu.vn', NULL, '$2y$10$cB/eDKhvx/h7O2.945uNVe/tvMq4QzrjW/l8ebZLRvKAlHUWF/9Gu', '18110402', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(677, '18110403@student.hcmute.edu.vn', NULL, '$2y$10$Ssv362M.gjyUGKDV.cni0.B2c1uY99tHWwrY15NKkmuR46/SLsbwe', '18110403', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(678, '18110404@student.hcmute.edu.vn', NULL, '$2y$10$XKmh7.xJDl9Ip0tVZxbPf.cTOmsbN2S3a0pTHpjMJumPb71EK1ik2', '18110404', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(679, '18110406@student.hcmute.edu.vn', NULL, '$2y$10$MK/KGT8GeFo6ojAwuJeSSemYqkTMyxBgSJ/0xKACCzo8a.JQSm4j.', '18110406', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(680, '18110407@student.hcmute.edu.vn', NULL, '$2y$10$fzO0ShrD4sNR1iZqtov0NehCgMQAqza7RK37xAyJTJQjTlGyZkghG', '18110407', 0, 1, NULL, NULL, '2019-04-11 08:11:02', '2019-04-11 08:11:02', NULL),
(681, '18110249@student.hcmute.edu.vn', NULL, '$2y$10$RKdAGAJLActnGdGdUZbx4.lkpj5xE5EObW4d8cDN3XIVrftjmqfbe', '18110249', 0, 1, NULL, NULL, '2019-04-11 08:11:54', '2019-04-11 08:11:54', NULL),
(682, '18110251@student.hcmute.edu.vn', NULL, '$2y$10$T.okVac/UhkrNEcRAK0SxeRwIhChka.7lVUSwHcf.qIRFDleTjps2', '18110251', 0, 1, NULL, NULL, '2019-04-11 08:11:54', '2019-04-11 08:11:54', NULL),
(683, '18110253@student.hcmute.edu.vn', NULL, '$2y$10$Tj.R0W/b53YQLXjyxsI8Cud5eXvmS4XS0sRNbOBfuKaVMnTpJXSQW', '18110253', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(684, '18110254@student.hcmute.edu.vn', NULL, '$2y$10$pigLL2e/SKOiiirZdDLNEudUwCGmW4AT0sZtQRa5d3NFv6Z5k7zSq', '18110254', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(685, '18110257@student.hcmute.edu.vn', NULL, '$2y$10$R26ZcU6AX2IrUxG8wGhez.Zv9Ggrqhp20nKxXUtxN5S85NFUulh1q', '18110257', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(686, '18110261@student.hcmute.edu.vn', NULL, '$2y$10$2hJI1YoEUBT88PYVn3oGOu8d0LPRi868ycsMN86uOAD0lTEpUyrHu', '18110261', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(687, '18110263@student.hcmute.edu.vn', NULL, '$2y$10$gp8okj.T7ImEg2TgssqE7e5YqTZzAYvxYDOkTr/dE/sOvgwBGQBFW', '18110263', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(688, '18110267@student.hcmute.edu.vn', NULL, '$2y$10$SYiSimcunPVImCCpdiZtq.QJJ3oMcMIeFHp0g0DG6yB456lagDGDy', '18110267', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(689, '18110269@student.hcmute.edu.vn', NULL, '$2y$10$ZDzgkzPtEPFRXcSW95Vcfu.HJQI4sWvAYl1C3QL5QTJtgCH699Yqm', '18110269', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(690, '18110270@student.hcmute.edu.vn', NULL, '$2y$10$V1Ehkua19VEEi78doqq7O.R0mYNy1KMZ0N64TS9QVTGYZ0TY.MJGe', '18110270', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(691, '18110271@student.hcmute.edu.vn', NULL, '$2y$10$Ptar8AvzncfzS2RSLGEvBuhJ/k9ALBEBgX061CGMe8ZykFOmdNAMm', '18110271', 0, 1, NULL, NULL, '2019-04-11 08:11:55', '2019-04-11 08:11:55', NULL),
(692, '18110272@student.hcmute.edu.vn', NULL, '$2y$10$Zih3QOfUAwaZs88v3GxEI.C9vd6DpA8OUYB8lHS4UPgdAjTTagm2a', '18110272', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(693, '18110275@student.hcmute.edu.vn', NULL, '$2y$10$0haTH5VmcwxjQPG4AS7M9utTywlq7.qHH1LBkIlt3Q4TcxdToMf8W', '18110275', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(694, '18110276@student.hcmute.edu.vn', NULL, '$2y$10$RxrlCbpUzFNSD4ysxZtkue1S4D9lYUl.yNkyuTl/Lk6k.OGv4vp9C', '18110276', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(695, '18110277@student.hcmute.edu.vn', NULL, '$2y$10$YXtHz9HsgmtKqup2uVnKwuv/aqytM6jQK49RbBt2w6RHkidyfDUkS', '18110277', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(696, '18110279@student.hcmute.edu.vn', NULL, '$2y$10$yGkLumJ97RMYDWKb6DPyu.DjWS7tvQ8vkaE4ekftu4pCqHUViqUIO', '18110279', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(697, '18110280@student.hcmute.edu.vn', NULL, '$2y$10$4MT7jm7oOw34v01fvHWll.z8zcZDruG.zRmgKzg0JoJxqGIt7ax4W', '18110280', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(698, '18110286@student.hcmute.edu.vn', NULL, '$2y$10$X1XO/0fqwafJDPVbTUnGLu/69POs03I6cHhpXRAbS.k/YZYrp2Tv6', '18110286', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(699, '18110302@student.hcmute.edu.vn', NULL, '$2y$10$zKINi4E1s8xyq8hEGlLMf.b9Kdo2mzVzF/x0N/ajLPyepOEZzCEre', '18110302', 0, 1, NULL, NULL, '2019-04-11 08:11:56', '2019-04-11 08:11:56', NULL),
(700, '18110305@student.hcmute.edu.vn', NULL, '$2y$10$7t43L4ATimjrOaSlE.Qpd.4n9myrUQ92Ni7DzjLajsiMOECxyRmt.', '18110305', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(701, '18110306@student.hcmute.edu.vn', NULL, '$2y$10$IS7QgyGGo2ExQMap0sbYKeLDQA3SIOMT1.bdRa4fXCEuuhtUSIEnq', '18110306', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(702, '18110307@student.hcmute.edu.vn', NULL, '$2y$10$kcc2fe5J1MVgbHrAyv4mjeXnY4JTjl3w5js2PEzv7RH.hGBr115gS', '18110307', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(703, '18110308@student.hcmute.edu.vn', NULL, '$2y$10$Qe1Mlsu63/gWxXAg.AGXyO5CbqEXVoRoPgZVxqefG4mXzBHEoyQ2m', '18110308', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(704, '18110309@student.hcmute.edu.vn', NULL, '$2y$10$DmNs33qUpItsdNOgyUNTuugAauc5Q8CsN87WullOVyv/KSGnLB59S', '18110309', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(705, '18110310@student.hcmute.edu.vn', NULL, '$2y$10$e8DzEPhH4pyeW4FQ/iYDPOpr2OSoVRMj7BCi.Wk/CS9nztbz0XyMm', '18110310', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(706, '18110311@student.hcmute.edu.vn', NULL, '$2y$10$EU/GziXPjGyW8e8t/RDVTe1s6LwF9oe67gKUfyrWvnG0TyQoGpYe6', '18110311', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(707, '18110313@student.hcmute.edu.vn', NULL, '$2y$10$QmnSo33Pn7EE6TilsBI9zO0HuwIAeZqTF2RlzDi0/pjqSHsLjEsNu', '18110313', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(708, '18110314@student.hcmute.edu.vn', NULL, '$2y$10$iraQ.MvMAI5fWUrkK40Ui.sQKTAgP8.JlliySeDgetehYxijCh9b.', '18110314', 0, 1, NULL, NULL, '2019-04-11 08:11:57', '2019-04-11 08:11:57', NULL),
(709, '18110315@student.hcmute.edu.vn', NULL, '$2y$10$QlWXaOgcAfjpLU9U94ROouBRU6bJRLUoBHk7cI874Bc28OlCfIssO', '18110315', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(710, '18110316@student.hcmute.edu.vn', NULL, '$2y$10$oHopwyTsRfNiFqCPlto1aeZ85OeJBXgY7gwoVVZyIFohBCJ0FJmBm', '18110316', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(711, '18110317@student.hcmute.edu.vn', NULL, '$2y$10$Jh2f.INfMZGXZX6.MDaRH.VkEYFPpxPE7iUYzHVm3Cz/Xjhlom.Yu', '18110317', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(712, '18110318@student.hcmute.edu.vn', NULL, '$2y$10$Qka6aEj2Jw004yrsAsqSHuk.hHLL2YUgQYFAu7Iqb0s1f9vGHXNc2', '18110318', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(713, '18110319@student.hcmute.edu.vn', NULL, '$2y$10$Cre5XfaiM2eUasossWkFBe8s.WS3mqLe3M5gnuauQidRUwhmLdUnW', '18110319', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(714, '18110320@student.hcmute.edu.vn', NULL, '$2y$10$9fvx16O9VM/dB1nS5AbeA.OquXrRKq.cRsWVZCANmJrrQncFnfGFu', '18110320', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(715, '18110322@student.hcmute.edu.vn', NULL, '$2y$10$UFZF2F2ifGWLvokEHp/7FuGYocg8L2N/Ll3KSmJwdp/yYrNaDX1Am', '18110322', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(716, '18110337@student.hcmute.edu.vn', NULL, '$2y$10$.zaasrUEkLoACFO4iJgCee602yQJdT75ePFG06f.snSSbR52O.lui', '18110337', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(717, '18110340@student.hcmute.edu.vn', NULL, '$2y$10$gZ7lShsK.h/fkaVsskexA.1rFUdzWaexGOk1biAWQNxaX2fF8iqy6', '18110340', 0, 1, NULL, NULL, '2019-04-11 08:11:58', '2019-04-11 08:11:58', NULL),
(718, '18110342@student.hcmute.edu.vn', NULL, '$2y$10$Av78Nbd7WABnZqii3AyC9.iyGmjALVZGIPTZHT/uWpk.bc0HAHV7q', '18110342', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(719, '18110345@student.hcmute.edu.vn', NULL, '$2y$10$ZdDk3CQ949P48TwGPQx2du6Mo/C/s24LHq7rHpfmWIhkxyk5.jG2y', '18110345', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(720, '18110348@student.hcmute.edu.vn', NULL, '$2y$10$Gaf8HnEcY05fOTPco0yIzOEcqsncpIEuTj4RB4AYwPXBAjmt1Ujni', '18110348', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(721, '18110355@student.hcmute.edu.vn', NULL, '$2y$10$IQVMjYuiYbunb9uYJC/4o.ojA4FYYU25TFFxvtFcDH4dekEHCcRVS', '18110355', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(722, '18110360@student.hcmute.edu.vn', NULL, '$2y$10$fiqZ0pv6/.XPxvFbZz/QmehmARoeDt240Gyu9YTvqYOZKJ8mtpylu', '18110360', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(723, '18110361@student.hcmute.edu.vn', NULL, '$2y$10$6sHc1MLEKJTdVmjmRu5SqunQ4tlsq3vltha9LDTADTcaHZRqUKuGu', '18110361', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(724, '18110362@student.hcmute.edu.vn', NULL, '$2y$10$AnBSfXv6.GioJzoiBSpDTut6oYVMbbu3Ya/smZ1WD6fs24AHi/yP6', '18110362', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(725, '18110367@student.hcmute.edu.vn', NULL, '$2y$10$M8/VsIg.Nz7Mo6McOvf2cOCJRoEn3KW/YeNjdtFSx/fE8t54aNneq', '18110367', 0, 1, NULL, NULL, '2019-04-11 08:11:59', '2019-04-11 08:11:59', NULL),
(726, '18110369@student.hcmute.edu.vn', NULL, '$2y$10$Gp54h42z.W7Bk235.fs6SO9HlTvkcESlvzSV4Aiaz4sPiZovSqVqC', '18110369', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(727, '18110370@student.hcmute.edu.vn', NULL, '$2y$10$uc912zoHSPAy/ZMnbCIWdOHCB7LzQaoE8cUgHbz/Y5yJdkZMfDAIm', '18110370', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(728, '18110371@student.hcmute.edu.vn', NULL, '$2y$10$8waQf5oYGdzph32m8SQTluBDHEaExsa.3zznyGJjB7nG79Mi/2say', '18110371', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(729, '18110372@student.hcmute.edu.vn', NULL, '$2y$10$azUqF8HOSdfQHwtsPiEpGec/AdI92rlBm90TnOOlnOHtU1Pk5AIma', '18110372', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(730, '18110375@student.hcmute.edu.vn', NULL, '$2y$10$BkBQSXZtTwpX6Vo.jy1PJOMHszQ3WfyoodIVsR.Of7qabyBqau3Fa', '18110375', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(731, '18110376@student.hcmute.edu.vn', NULL, '$2y$10$Ebxfbz8L8OZ/F59/r/bPduHTpZRp3RDK8aCb.jTWfJw8Hd7qtlAJa', '18110376', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(732, '18110379@student.hcmute.edu.vn', NULL, '$2y$10$lav37/L0GHkoRLRDsMR71urkaMhCRbQF8DKLrk/ZE8QyThYjiuOQS', '18110379', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(733, '18110381@student.hcmute.edu.vn', NULL, '$2y$10$gw7XBHhbSNkdIZXN3OLM3.bDgFpFuafqOkx1znUS6956ZTT7vr9O2', '18110381', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(734, '18110384@student.hcmute.edu.vn', NULL, '$2y$10$F45ahSLRO4sUKXgfrUaGYeOT9NZbpBWNeQCJm8HV35I1AyazRr8nm', '18110384', 0, 1, NULL, NULL, '2019-04-11 08:12:00', '2019-04-11 08:12:00', NULL),
(735, '18110386@student.hcmute.edu.vn', NULL, '$2y$10$vlcQBDEr68x48.ehLrD.JeQ1P3/jWgtYgdwSOjBqfjbOtNyyUE0qa', '18110386', 0, 1, NULL, NULL, '2019-04-11 08:12:01', '2019-04-11 08:12:01', NULL),
(736, '18110388@student.hcmute.edu.vn', NULL, '$2y$10$.1JNm9dx9F5ElgRClukYweSoUuBgcUZONM0KVLA/X5W9nVetvLjSW', '18110388', 0, 1, NULL, NULL, '2019-04-11 08:12:01', '2019-04-11 08:12:01', NULL),
(737, '18110394@student.hcmute.edu.vn', NULL, '$2y$10$Gqi3uXSdJEJlkGFYLmd4febiHxhycVOp2zRsK7cjMl/ELhpruznAe', '18110394', 0, 1, NULL, NULL, '2019-04-11 08:12:01', '2019-04-11 08:12:01', NULL),
(738, '18110396@student.hcmute.edu.vn', NULL, '$2y$10$purrcS9kYToE3wSe6jtiXuFwTiXR8h8vdgMLL1zcGoUHzAKc3KSOy', '18110396', 0, 1, NULL, NULL, '2019-04-11 08:12:01', '2019-04-11 08:12:01', NULL),
(739, '18110397@student.hcmute.edu.vn', NULL, '$2y$10$BFxqek6f83zMWrYoRZ4FxeDzm4HVmJjtvg/X2O3F5k5.u5IfbROBG', '18110397', 0, 1, NULL, NULL, '2019-04-11 08:12:01', '2019-04-11 08:12:01', NULL),
(740, '18110400@student.hcmute.edu.vn', NULL, '$2y$10$0wK30GhqkdSTrqDZ/ldrqumb2FgVfhyK..oN0.Yt8eMtHHaDLcB4i', '18110400', 0, 1, NULL, NULL, '2019-04-11 08:12:01', '2019-04-11 08:12:01', NULL),
(741, '18133002@student.hcmute.edu.vn', NULL, '$2y$10$uaXa9BfR5iTmUXgFSLdSD.imNxIz2a67C5qOM8fh8fGvJCSbW7FOy', '18133002', 0, 1, NULL, NULL, '2019-04-11 08:13:18', '2019-04-11 08:13:18', NULL),
(742, '18133003@student.hcmute.edu.vn', NULL, '$2y$10$XpKN/AjpPRtSNvf57G52bu.iqZOgv6CAHEsl6Cz84nE41iSw5vcDe', '18133003', 0, 1, NULL, NULL, '2019-04-11 08:13:18', '2019-04-11 08:13:18', NULL),
(743, '18133004@student.hcmute.edu.vn', NULL, '$2y$10$DHoCq0SFIhfL0c.71NOhOuJj61IyNXiumL9kDUE1MCtOuSsHcBgYS', '18133004', 0, 1, NULL, NULL, '2019-04-11 08:13:18', '2019-04-11 08:13:18', NULL),
(744, '18133006@student.hcmute.edu.vn', NULL, '$2y$10$erh248RaAKTJnaRGHVkb7eGlpuN6INwOArifKdyYEVnC5FlPFToJq', '18133006', 0, 1, NULL, NULL, '2019-04-11 08:13:18', '2019-04-11 08:13:18', NULL),
(745, '18133007@student.hcmute.edu.vn', NULL, '$2y$10$vnXEJGoy3tqAEueZUXw0k.DINmqbKfFqDhXZr1dwwJ4fWUnXGuY82', '18133007', 0, 1, NULL, NULL, '2019-04-11 08:13:18', '2019-04-11 08:13:18', NULL),
(746, '18133009@student.hcmute.edu.vn', NULL, '$2y$10$mTdb61lj/DeLGE7fPlAKc.i.x4HJuOScw.bFdcGHVooOJvgq5KyjC', '18133009', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(747, '18133010@student.hcmute.edu.vn', NULL, '$2y$10$bYi9lNAjx2ZvGGsdLFAQsuP9.7txO9HcD7t8l6.pUBknbmwoZO/Oy', '18133010', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(748, '18133011@student.hcmute.edu.vn', NULL, '$2y$10$.azFnCuABHN2IkU1Qxms6O/frnaaVo9zrCNQSixKR2HeIV6DFShS2', '18133011', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(749, '18133012@student.hcmute.edu.vn', NULL, '$2y$10$tuL/sezTBnWmMuU297PheeSTHmjP8NjhK4JpCxO.mmVhHbNDX6nT2', '18133012', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(750, '18133013@student.hcmute.edu.vn', NULL, '$2y$10$K2Oe6Z7PaHgJs/nY8CxygO7NUZ0mpShs7w8L/lO7C8OW.wPn6n3Ii', '18133013', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(751, '18133014@student.hcmute.edu.vn', NULL, '$2y$10$2/Gojpqw2iLxI/k47cYGhOO7PYvC6YkPea5gMOlEH5ss./dyV9OmW', '18133014', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(752, '18133015@student.hcmute.edu.vn', NULL, '$2y$10$4pZxFYvXyh375uOSdGlMnugdXCg82qfBooAsnfjVP0QNxvfSjkd/G', '18133015', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(753, '18133016@student.hcmute.edu.vn', NULL, '$2y$10$dI.K9hj8Y/p6sEj35IsM2.uQVWPs9Yyk4M5QV7xeL2lNknhFaRD16', '18133016', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(754, '18133017@student.hcmute.edu.vn', NULL, '$2y$10$WPSaPMaLOwQvVCZCOncSGezkoiVS4gMvZWjBRsORFRauGS8bCK4yu', '18133017', 0, 1, NULL, NULL, '2019-04-11 08:13:19', '2019-04-11 08:13:19', NULL),
(755, '18133018@student.hcmute.edu.vn', NULL, '$2y$10$nt.ukeRZ5rS5DOJndHqUOupfotlbvZEyfhJW7s2tSU2VIiIqFH0YS', '18133018', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(756, '18133019@student.hcmute.edu.vn', NULL, '$2y$10$qJTYRSDqncttJtVR6JzNmu78rMKRIv/IA0jExelSRXcgKfOi2AyOm', '18133019', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(757, '18133020@student.hcmute.edu.vn', NULL, '$2y$10$XzcF4kdS07W3oyzaFVJIJewLUeNssPiIoAPlcf/Vz6IznilAH/t9W', '18133020', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(758, '18133021@student.hcmute.edu.vn', NULL, '$2y$10$OdqrYPNIrmLUh0O4mgz3LOOSL.P5N1GD/RhObKrWS7UguaV8J2Kre', '18133021', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(759, '18133022@student.hcmute.edu.vn', NULL, '$2y$10$JZEX3ijDy9dMpKIWse0PpOQhxFo/Hn0T3jjoNBOugEPQDtUwLUK5q', '18133022', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(760, '18133023@student.hcmute.edu.vn', NULL, '$2y$10$k0tDmudFSce.UkZC8FxzbexLpqVpCg6BsXp6h8OcPd1YNkgHscYYW', '18133023', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(761, '18133024@student.hcmute.edu.vn', NULL, '$2y$10$1o1T9TfsUKKpHkWvoL35c.6B3HvktuJFboa7DG.170tPtlGiiOyKm', '18133024', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(762, '18133025@student.hcmute.edu.vn', NULL, '$2y$10$hPBG3LZ2DxFOKvbRwTW69.wDk3gSOmxZrkuFEw49bETqAusvxWfne', '18133025', 0, 1, NULL, NULL, '2019-04-11 08:13:20', '2019-04-11 08:13:20', NULL),
(763, '18133026@student.hcmute.edu.vn', NULL, '$2y$10$A1e2LuA96iZf7lsEsRUBTOlHYoFP4gj2uwMsOTsNalIYakK80iGYa', '18133026', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(764, '18133029@student.hcmute.edu.vn', NULL, '$2y$10$DRuDyAewJ0ye43IkFvOdj.iMzlmjovIKJEWpSOL37n4ARuYUzoavW', '18133029', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(765, '18133030@student.hcmute.edu.vn', NULL, '$2y$10$EwJe.jatdev5ylCYiar3HeG7MmQvXSortx2vCS8L2kGw9orSZ7as2', '18133030', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(766, '18133031@student.hcmute.edu.vn', NULL, '$2y$10$.5iInP0beYDn9DKUBxnq9uk/FfMRYOuQMpIOxuBAk4HZS0Kn5e1Wm', '18133031', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(767, '18133032@student.hcmute.edu.vn', NULL, '$2y$10$dfBq6gMEqbK2X7f7yFdtT.F6HculmVVrza3KgFHWgk6bhcLuWlTm2', '18133032', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(768, '18133033@student.hcmute.edu.vn', NULL, '$2y$10$kfnT0bUwelbjjOh9JsEjrOymNuT3xCSppRyB9V.FhkOFMRZH3Qeh6', '18133033', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(769, '18133034@student.hcmute.edu.vn', NULL, '$2y$10$/GDFquCdE4gq5B0VwLdlfuBrVsZTpAB/n/LIhlhiFds5fn.kVsR/a', '18133034', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(770, '18133035@student.hcmute.edu.vn', NULL, '$2y$10$yK8At77SrHVu2SF6m1SKH.VorFxD1.vsO/NRDUlyaYqrNswojvidG', '18133035', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(771, '18133036@student.hcmute.edu.vn', NULL, '$2y$10$K1IDFtosd.Amu0SrTaLFb.br2pV3ThEN1risI6JYeIxBZ8LodTVvC', '18133036', 0, 1, NULL, NULL, '2019-04-11 08:13:21', '2019-04-11 08:13:21', NULL),
(772, '18133037@student.hcmute.edu.vn', NULL, '$2y$10$/.C8LU6xqwHO3dpp/FjBfu5Hneg6gLEVsQYNLbMXnq5chEg5ogztq', '18133037', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(773, '18133038@student.hcmute.edu.vn', NULL, '$2y$10$c5.sSZNTB5RL/G35/ayHb.orMRQKKNCfDwMkjwAVygmVP1T4s3yNm', '18133038', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(774, '18133039@student.hcmute.edu.vn', NULL, '$2y$10$osJuw/99/ZTUdavsq3nLfus5MSRIJsDWOlH/pt23DGgmCxiPrg8CK', '18133039', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(775, '18133040@student.hcmute.edu.vn', NULL, '$2y$10$ykHpQghspmFZeM4emZ6OVOyXjv85wiJsnobXTH7J8n594sxGi4Ktq', '18133040', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(776, '18133041@student.hcmute.edu.vn', NULL, '$2y$10$d1GgkB.sbK2ED3Biceg.6uK3ejW/6wUh7FdYJ8iok./mE6wyaPL0m', '18133041', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(777, '18133042@student.hcmute.edu.vn', NULL, '$2y$10$YSYHa.6D4SV0z1bYNnLx2O5dWWExCGaI5vNZNeZpcVvhZxsQuOrcy', '18133042', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(778, '18133043@student.hcmute.edu.vn', NULL, '$2y$10$JsYfHu.N9uljdr0G.G7mieo9dVHPeix3BWx7Ei8STJ4Lc5aUUOnVq', '18133043', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(779, '18133044@student.hcmute.edu.vn', NULL, '$2y$10$ahk2wSb9QszX9deeoaOeOOYE1shIEjo1ibY1RQLRCrSupG/kj74nC', '18133044', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(780, '18133045@student.hcmute.edu.vn', NULL, '$2y$10$yXn0fyE2Wl/yd5D2jlAt3Ox8w6k6.IJ6BN96UNqOqymNy/0KhZQOW', '18133045', 0, 1, NULL, NULL, '2019-04-11 08:13:22', '2019-04-11 08:13:22', NULL),
(781, '18133046@student.hcmute.edu.vn', NULL, '$2y$10$PFGCT80QB.DmBQ2hN/rJmeyaRf421VjhXUfU2ZX0/p.RJuhk0dukC', '18133046', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(782, '18133047@student.hcmute.edu.vn', NULL, '$2y$10$GwewkcvK/de8KVNbPFiDouMBk4r46an8c1mkDLuKKB6eSIg9qUcHK', '18133047', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(783, '18133048@student.hcmute.edu.vn', NULL, '$2y$10$Htzz5hdYs0aH9yoZbujFDu/uSZjiy1rD/2Ivns8GC/DeMuliUcjVa', '18133048', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(784, '18133050@student.hcmute.edu.vn', NULL, '$2y$10$cmtfnJ4tKWhxaYNzyLGPk.ekOae0WEPexN6sNwoq2E8cXpBEEaXia', '18133050', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(785, '18133051@student.hcmute.edu.vn', NULL, '$2y$10$rna3DYLiovK9O399pQc1VeiPfXjox3L7DNCt1ralcDfvfVYGVq68K', '18133051', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(786, '18133052@student.hcmute.edu.vn', NULL, '$2y$10$sV8hDTJh0LgnleBBjp0hI.y46kfFjglsGngN59LgzsynZtaOjWIJi', '18133052', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(787, '18133053@student.hcmute.edu.vn', NULL, '$2y$10$oi26Y/379kHbtilJRIPB3Opztwle67H.yLs7DFxX1Te/YzIPS5Gf.', '18133053', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(788, '18133054@student.hcmute.edu.vn', NULL, '$2y$10$O4TIIH7lJUnCp89k15nSB.1S8NV3/MLNtHvhbOK4nplxOYhr/WtQy', '18133054', 0, 1, NULL, NULL, '2019-04-11 08:13:23', '2019-04-11 08:13:23', NULL),
(789, '18133055@student.hcmute.edu.vn', NULL, '$2y$10$na/hXZysDu1mvzSU3oevwOIpI0CjspWY.AwejL2G/KwZ52rTiOY0S', '18133055', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(790, '18133056@student.hcmute.edu.vn', NULL, '$2y$10$fX7SBDf/yolQ6r.diIeGzuRKYtrph8vqlP/Aj6ZtAqys0f.NtZqi6', '18133056', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(791, '18133057@student.hcmute.edu.vn', NULL, '$2y$10$7CFcnFvN2MO67x8f1OAbZuxVqhzD6TF3R7A/QY9FX/hPEyKCGNuHq', '18133057', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(792, '18133058@student.hcmute.edu.vn', NULL, '$2y$10$8vnnwq1lYj4gHYFouYRUtOAZRSWYW2cwWB/HxJy8Velr9eLCx7nZG', '18133058', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(793, '18133059@student.hcmute.edu.vn', NULL, '$2y$10$PWG1HYNYaINLr0y0i9pvc.TGzDZiHP.tSSxuQy3mqchF8nOVB9tdy', '18133059', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(794, '18133060@student.hcmute.edu.vn', NULL, '$2y$10$UntKbBVMtPSSIc7nWQYN.eA7/Ucvr4IRSDc42VLJE92eMVH3Hs11G', '18133060', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(795, '18133061@student.hcmute.edu.vn', NULL, '$2y$10$pnbPwBJQBal1XhFou6QRVO8pkQA7ipXozaGN2bDSTXq5T3AdTfoYy', '18133061', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(796, '18133062@student.hcmute.edu.vn', NULL, '$2y$10$d71au2en6TcDOQUXSKMOIeVrCJTPVknY/ZhGKFoCkFCwmGg/YRCQm', '18133062', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(797, '18133063@student.hcmute.edu.vn', NULL, '$2y$10$l3sufIoMjbnJXmBFs4h3sOkuxf42ify2E.V0LJwB3eUGURfJXGLoO', '18133063', 0, 1, NULL, NULL, '2019-04-11 08:13:24', '2019-04-11 08:13:24', NULL),
(798, '18133064@student.hcmute.edu.vn', NULL, '$2y$10$K/1mqWO/otv4agGfDmzKje3HgVp/ZhZE5twROgMhubWRNkayn8uzW', '18133064', 0, 1, NULL, NULL, '2019-04-11 08:13:25', '2019-04-11 08:13:25', NULL),
(799, '18133065@student.hcmute.edu.vn', NULL, '$2y$10$t7wv8vAAVKk6BrBn4DX0auxcoyg2CHBaWgTv2diS2wmb9tdihNvfi', '18133065', 0, 1, NULL, NULL, '2019-04-11 08:13:25', '2019-04-11 08:13:25', NULL),
(800, '18133066@student.hcmute.edu.vn', NULL, '$2y$10$X.maMDigp9Ue.3x2TQzNWe0wbtWoqfRkzZ1dfa9AQKFjinnTaGy0O', '18133066', 0, 1, NULL, NULL, '2019-04-11 08:13:25', '2019-04-11 08:13:25', NULL),
(801, '16110294@student.hcmute.edu.vn', NULL, '$2y$10$MKnWYXoPYK.QzlVF4IHvDuxWHYtnWBzehChsOn5gDzy.0T8UwZeBm', '16110294', 0, NULL, NULL, NULL, '2019-04-11 09:41:39', '2019-04-11 09:41:39', NULL),
(802, '19110000@student.hcmute.edu.vn', NULL, '$2y$10$RC3QQQgC3X3ZqIEliHGqUuHxTb2jf38ErKvpOXIsUVBSfW27cKebG', '19110000', 0, 187, NULL, NULL, '2019-06-30 00:48:06', '2019-06-30 00:48:06', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `workflows`
--

CREATE TABLE `workflows` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `workflows`
--

INSERT INTO `workflows` (`id`, `activity_id`, `student_id`, `deadline`, `content`, `progress`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 7, '15110176', '2019-05-31', 'Các bạn đứng thành vòng tròn để múa, mỗi bạn múa một kiểu, không ai giống ai, múa xong sẽ hát. Sau đó tất cả sẽ đi ăn cơm, ăn cơm xong sẽ đi ngủ, ngủ xong sẽ thức dậy đi đái.', 0, '2019-06-10 08:10:23', '2019-06-14 10:04:51', 1, 1, '2019-06-14 10:04:51'),
(2, 7, '15110237', '2019-06-27', 'Nhảy đầm', 0, '2019-06-10 08:10:23', '2019-06-14 10:02:35', 1, 1, '2019-06-14 10:02:35'),
(3, 8, '18110371', '2019-06-22', 'Chuẩn bị bánh kẹo cho chương trình', 37, '2019-06-14 10:09:28', '2019-06-16 01:40:53', 1, 1, '2019-06-16 01:40:53'),
(4, 3, '15110268', '2019-06-15', 'aaa', 15, '2019-06-14 21:03:35', '2019-07-08 06:54:26', 1, 187, NULL),
(5, 7, '15110237', '2019-06-15', 'Hậu cần', 22, '2019-06-14 21:07:13', '2019-07-06 00:59:24', 1, 187, NULL),
(6, 7, '18110258', '2019-06-08', 'Văn nghệ', 45, '2019-06-14 21:07:13', '2019-06-14 22:59:36', 1, 1, NULL),
(7, 3, '15110237', '2019-07-13', 'Chuẩn bị hậu cần', 56, '2019-07-08 06:56:01', '2019-07-08 08:07:10', 187, 187, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `workflow_details`
--

CREATE TABLE `workflow_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `workflow_id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `progress` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `workflow_details`
--

INSERT INTO `workflow_details` (`id`, `workflow_id`, `content`, `progress`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(6, 2, 'Nhảy đầm xòe', 50, NULL, '2019-06-14 10:01:55', 1, 0, '0000-00-00 00:00:00'),
(12, 1, 'Múa lửa', 10, '2019-06-14 09:31:42', '2019-06-14 10:04:51', 1, NULL, '2019-06-14 10:04:51'),
(13, 1, 'Lắc vòng', 25, '2019-06-14 09:31:42', '2019-06-14 10:04:51', 1, NULL, '2019-06-14 10:04:51'),
(14, 2, 'Nhảy zuiii', 40, '2019-06-14 09:32:22', '2019-06-14 10:02:35', 1, NULL, '2019-06-14 10:02:35'),
(15, 3, 'Mua bánh 1', 20, '2019-06-14 20:10:57', '2019-06-16 01:40:53', 1, NULL, '2019-06-16 01:40:53'),
(16, 3, 'Mua nước 1', 50, '2019-06-14 20:10:57', '2019-06-16 01:40:53', 1, NULL, '2019-06-16 01:40:53'),
(17, 3, 'Mua bánh 2', 70, '2019-06-14 20:10:57', '2019-06-16 01:40:53', 1, NULL, '2019-06-16 01:40:53'),
(18, 5, 'Mua dụng cụ', 10, '2019-06-14 21:08:20', '2019-07-06 00:59:24', 187, NULL, NULL),
(19, 5, 'Dây điện', 20, '2019-06-14 21:08:20', '2019-07-06 00:59:24', 187, NULL, NULL),
(20, 5, 'Hub mạng', 50, NULL, '2019-07-06 00:59:24', 187, NULL, NULL),
(21, 3, 'Bánh 2', 10, '2019-06-14 22:09:28', '2019-06-16 01:40:53', 1, NULL, '2019-06-16 01:40:53'),
(22, 6, 'hát', 80, '2019-06-14 22:10:38', '2019-06-14 22:10:38', 1, NULL, NULL),
(23, 5, 'Bột màu', 10, '2019-06-14 22:44:33', '2019-07-06 00:59:24', 187, NULL, NULL),
(24, 5, 'Nước', 20, '2019-06-14 22:44:33', '2019-07-06 00:59:24', 187, NULL, NULL),
(25, 6, 'Múa', 10, '2019-06-14 22:59:36', '2019-06-14 22:59:36', 1, NULL, NULL),
(26, 4, 'Nước uống', 10, '2019-07-08 06:54:26', '2019-07-08 06:54:26', 187, NULL, NULL),
(27, 4, 'bánh kẹo', 20, '2019-07-08 06:54:26', '2019-07-08 06:54:26', 187, NULL, NULL),
(28, 7, 'Dây điện', 20, '2019-07-08 06:56:44', '2019-07-08 06:56:44', 187, NULL, NULL),
(29, 7, 'Cáp mạng', 50, '2019-07-08 06:56:44', '2019-07-08 06:56:44', 187, NULL, NULL),
(30, 7, 'Lalâ', 100, '2019-07-08 08:07:10', '2019-07-08 08:07:10', 187, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_student_foregin` (`leader`);

--
-- Chỉ mục cho bảng `activity_funds`
--
ALTER TABLE `activity_funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_funds_activities_foregin` (`activity_id`);

--
-- Chỉ mục cho bảng `activity_fund_details`
--
ALTER TABLE `activity_fund_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_fund_details_activity_funds_foregin` (`fund_id`);

--
-- Chỉ mục cho bảng `association_ec`
--
ALTER TABLE `association_ec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `association_student_foregin` (`student_id`);

--
-- Chỉ mục cho bảng `attenders`
--
ALTER TABLE `attenders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attenders_activities_foregin` (`activity_id`),
  ADD KEY `attenders_students_foregin` (`student_id`);

--
-- Chỉ mục cho bảng `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkin_activity_foregin` (`activity_id`);

--
-- Chỉ mục cho bảng `checkin_details`
--
ALTER TABLE `checkin_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `checkin_student` (`checkin_id`,`student_id`),
  ADD KEY `checkin_checkin_id_foregin` (`checkin_id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_school_years_foregin` (`school_year_id`);

--
-- Chỉ mục cho bảng `collaborators`
--
ALTER TABLE `collaborators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collaborators_student_foregin` (`student_id`);

--
-- Chỉ mục cho bảng `exec_comm`
--
ALTER TABLE `exec_comm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exec_comm_student_foregin` (`student_id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_news_types_foregin` (`type_id`),
  ADD KEY `news_users_foregin` (`created_by`);

--
-- Chỉ mục cho bảng `news_types`
--
ALTER TABLE `news_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_users_foregin` (`user_id`),
  ADD KEY `user_roles_roles_foregin` (`role_id`);

--
-- Chỉ mục cho bảng `school_years`
--
ALTER TABLE `school_years`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_id_UNIQUE` (`student_id`),
  ADD KEY `students_classes_foregin` (`class_id`),
  ADD KEY `students_school_years_foregin` (`school_year_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_student_id_foregin` (`student_id`);

--
-- Chỉ mục cho bảng `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflows_activities_foregin` (`activity_id`),
  ADD KEY `workflows_student_foregin` (`student_id`);

--
-- Chỉ mục cho bảng `workflow_details`
--
ALTER TABLE `workflow_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_workflow_foregin` (`workflow_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `activity_funds`
--
ALTER TABLE `activity_funds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `activity_fund_details`
--
ALTER TABLE `activity_fund_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `association_ec`
--
ALTER TABLE `association_ec`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `attenders`
--
ALTER TABLE `attenders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT cho bảng `checkin`
--
ALTER TABLE `checkin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `checkin_details`
--
ALTER TABLE `checkin_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `collaborators`
--
ALTER TABLE `collaborators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `exec_comm`
--
ALTER TABLE `exec_comm`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `news_types`
--
ALTER TABLE `news_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1597;

--
-- AUTO_INCREMENT cho bảng `school_years`
--
ALTER TABLE `school_years`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT cho bảng `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `workflow_details`
--
ALTER TABLE `workflow_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_student_foregin` FOREIGN KEY (`leader`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `activity_funds`
--
ALTER TABLE `activity_funds`
  ADD CONSTRAINT `activity_funds_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

--
-- Các ràng buộc cho bảng `activity_fund_details`
--
ALTER TABLE `activity_fund_details`
  ADD CONSTRAINT `activity_fund_details_activity_funds_foregin` FOREIGN KEY (`fund_id`) REFERENCES `activity_funds` (`id`);

--
-- Các ràng buộc cho bảng `association_ec`
--
ALTER TABLE `association_ec`
  ADD CONSTRAINT `association_ec_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `attenders`
--
ALTER TABLE `attenders`
  ADD CONSTRAINT `attenders_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `attenders_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

--
-- Các ràng buộc cho bảng `checkin_details`
--
ALTER TABLE `checkin_details`
  ADD CONSTRAINT `checkin_checkin_id_foregin` FOREIGN KEY (`checkin_id`) REFERENCES `checkin` (`id`);

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`);

--
-- Các ràng buộc cho bảng `collaborators`
--
ALTER TABLE `collaborators`
  ADD CONSTRAINT `collaborators_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `exec_comm`
--
ALTER TABLE `exec_comm`
  ADD CONSTRAINT `exec_comm_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_news_types_foregin` FOREIGN KEY (`type_id`) REFERENCES `news_types` (`id`),
  ADD CONSTRAINT `news_users_foregin` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `user_roles_roles_foregin` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_roles_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_classes_foregin` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `students_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_student_id_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `workflows`
--
ALTER TABLE `workflows`
  ADD CONSTRAINT `workflows_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `workflows_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `workflow_details`
--
ALTER TABLE `workflow_details`
  ADD CONSTRAINT `workflow_details_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
