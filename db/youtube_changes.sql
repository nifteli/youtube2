ALTER TABLE  `videos` ADD  `addedDate` DATETIME NOT NULL AFTER  `info` ;
ALTER TABLE  `videoviews` CHANGE  `actionDate`  `actionDate` DATETIME NOT NULL ;

-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 23, 2015 at 10:53 AM
-- Server version: 5.5.16-log
-- PHP Version: 5.2.9-2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `youtube`
--
CREATE DATABASE IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `youtube`;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'taq1'),
(2, 'taq2');

-- --------------------------------------------------------

--
-- Table structure for table `videocats`
--

CREATE TABLE IF NOT EXISTS `videocats` (
  `videoId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`videoId`,`categoryId`),
  KEY `categoryId` (`categoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videocats`
--

INSERT INTO `videocats` (`videoId`, `categoryId`) VALUES
(1, 8),
(1, 254),
(2, 113),
(4, 113),
(5, 113),
(6, 113),
(7, 113),
(8, 113),
(9, 113),
(10, 113),
(11, 113),
(12, 113),
(13, 113),
(14, 113),
(15, 113),
(16, 113),
(17, 113),
(18, 113),
(19, 113),
(20, 113),
(21, 113),
(22, 113),
(23, 113),
(24, 113),
(25, 113),
(26, 113),
(27, 113),
(28, 113),
(29, 113),
(30, 113),
(31, 113),
(32, 113),
(33, 113),
(34, 113),
(35, 113),
(36, 113),
(37, 113),
(38, 113),
(39, 113),
(40, 113),
(41, 113),
(42, 113),
(43, 113),
(44, 113),
(45, 113),
(46, 113),
(47, 113),
(48, 113),
(49, 113),
(50, 113),
(51, 113),
(52, 113),
(53, 113),
(54, 113),
(55, 113),
(56, 113),
(57, 113),
(58, 113),
(59, 113),
(60, 113),
(61, 113),
(62, 113),
(63, 113),
(64, 113),
(65, 113),
(66, 113),
(67, 113),
(68, 113),
(69, 113),
(70, 113),
(71, 113),
(72, 113),
(73, 113),
(74, 113),
(75, 113),
(76, 113),
(77, 113),
(78, 113),
(79, 113),
(80, 113),
(81, 113),
(82, 113),
(83, 113),
(84, 113),
(85, 113),
(86, 113),
(87, 113),
(88, 113),
(89, 113),
(90, 113),
(91, 113),
(92, 113),
(93, 113),
(94, 113),
(95, 113),
(96, 113),
(97, 113),
(98, 113),
(99, 113),
(100, 113),
(101, 113),
(102, 113),
(103, 113),
(104, 113),
(105, 113),
(106, 113),
(107, 113),
(108, 113),
(109, 113),
(110, 113),
(111, 113),
(112, 113),
(113, 113),
(114, 113),
(115, 113),
(116, 113),
(117, 113),
(118, 113),
(119, 113),
(120, 113),
(121, 113),
(122, 113),
(123, 113),
(124, 113),
(125, 113),
(126, 113),
(127, 113),
(128, 113),
(129, 113),
(130, 113),
(131, 113),
(132, 113),
(133, 113),
(134, 113),
(135, 113),
(136, 113),
(137, 113),
(138, 113),
(139, 113),
(140, 113),
(141, 113),
(142, 113),
(143, 113),
(144, 113),
(145, 113),
(146, 113),
(147, 113),
(148, 113),
(149, 113),
(150, 113),
(151, 113),
(152, 113),
(153, 113),
(154, 113),
(155, 113),
(156, 113),
(157, 113),
(158, 113),
(159, 113),
(160, 113),
(161, 113),
(162, 113),
(163, 113),
(164, 113),
(165, 113),
(166, 113),
(167, 113),
(168, 113),
(169, 113),
(170, 113),
(171, 113),
(172, 113),
(173, 113),
(174, 113),
(175, 113),
(176, 113),
(177, 113),
(178, 113),
(179, 113),
(180, 113),
(181, 113),
(182, 113),
(183, 113),
(184, 113),
(185, 113),
(186, 113),
(187, 113),
(188, 113),
(189, 113),
(190, 113),
(191, 113),
(192, 113),
(193, 113),
(194, 113),
(195, 113),
(196, 113),
(197, 113),
(198, 113),
(199, 113),
(200, 113),
(201, 113),
(202, 254),
(203, 254);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `languageId` int(11) DEFAULT NULL,
  `questions` smallint(6) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `addedDate` datetime NOT NULL,
  `addedById` int(11) DEFAULT NULL,
  `addedByIP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updatedById` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `deleted` datetime NOT NULL,
  `deletedById` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL COMMENT 'by seconds',
  PRIMARY KEY (`id`),
  KEY `addedById` (`addedById`),
  KEY `updatedById` (`updatedById`),
  KEY `deletedById` (`deletedById`),
  KEY `languageId` (`languageId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=204 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `link`, `languageId`, `questions`, `name`, `info`, `addedDate`, `addedById`, `addedByIP`, `updatedById`, `isDeleted`, `deleted`, `deletedById`, `duration`) VALUES
(1, 'https://www.youtube.com/watch?v=PQF9lPE-Ii4', 5, 12, 'test1', 'twst', '2015-04-22 21:45:14', 2, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(2, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(4, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(5, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(6, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(7, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(8, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(9, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(10, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(11, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(12, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(13, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(14, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(15, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(16, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(17, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(18, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(19, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(20, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(21, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(22, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(23, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(24, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(25, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(26, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(27, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(28, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(29, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(30, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(31, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(32, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(33, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(34, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(35, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(36, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(37, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(38, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(39, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(40, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(41, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(42, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(43, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(44, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(45, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(46, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(47, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(48, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(49, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(50, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(51, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(52, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(53, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(54, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(55, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(56, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(57, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(58, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(59, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(60, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(61, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(62, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(63, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(64, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(65, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(66, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(67, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(68, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(69, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(70, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(71, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(72, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(73, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(74, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(75, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(76, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(77, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(78, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(79, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(80, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(81, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(82, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(83, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(84, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(85, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(86, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(87, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(88, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(89, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(90, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(91, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(92, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(93, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(94, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(95, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(96, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(97, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(98, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(99, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(100, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(101, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(102, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(103, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(104, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(105, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(106, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(107, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(108, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(109, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(110, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(111, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(112, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(113, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(114, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(115, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(116, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(117, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(118, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(119, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(120, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(121, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(122, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(123, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(124, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(125, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(126, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(127, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(128, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(129, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(130, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(131, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(132, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(133, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(134, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(135, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(136, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(137, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(138, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(139, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(140, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(141, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(142, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(143, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(144, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(145, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(146, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(147, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(148, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(149, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(150, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(151, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(152, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(153, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(154, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(155, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(156, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(157, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(158, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(159, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(160, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(161, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(162, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(163, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(164, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(165, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(166, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(167, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(168, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(169, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(170, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(171, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(172, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(173, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(174, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(175, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(176, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(177, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(178, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(179, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(180, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(181, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(182, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(183, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(184, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(185, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(186, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(187, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(188, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(189, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(190, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(191, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(192, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(193, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(194, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(195, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(196, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(197, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(198, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(199, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(200, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(201, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-22 21:45:14', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(202, 'https://www.youtube.com/watch?v=BNTaJu2CVBg', 5, 4, 'videoad', 'melumat', '0000-00-00 00:00:00', NULL, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(203, 'https://www.youtube.com/watch?v=BNTaJu2CVBg', 5, 4, 'Video Ad?: ', 'Video Ad?: \r\nVideo Ad?: \r\n', '0000-00-00 00:00:00', 1, '127.0.0.1', NULL, 0, '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `videotags`
--

CREATE TABLE IF NOT EXISTS `videotags` (
  `tagId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  PRIMARY KEY (`tagId`,`videoId`),
  KEY `videoId` (`videoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videotags`
--

INSERT INTO `videotags` (`tagId`, `videoId`) VALUES
(1, 0),
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `videoviews`
--

CREATE TABLE IF NOT EXISTS `videoviews` (
  `userId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  `action` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'watched = 0, liked = 1, disliked = -1',
  `actionDate` datetime NOT NULL,
  PRIMARY KEY (`userId`,`videoId`),
  KEY `videoId` (`videoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videoviews`
--

INSERT INTO `videoviews` (`userId`, `videoId`, `action`, `actionDate`) VALUES
(2, 1, 1, '2015-04-22 00:00:00'),
(1, 2, 0, '2015-04-22 00:00:00'),
(1, 1, -1, '2015-04-22 00:00:00'),
(3, 2, -1, '2015-04-22 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
