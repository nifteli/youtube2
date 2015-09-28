-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2015 at 11:44 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `foldervideos`
--

CREATE TABLE IF NOT EXISTS `foldervideos` (
  `folderId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  `added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `videoreports` (
  `videoId` int(11) NOT NULL,
  `reporterId` int(11) NOT NULL,
  `reportDate` datetime NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `foldervideos` CHANGE `addedById` `addedByIP` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `foldervideos` ADD INDEX( `folderId`, `videoId`);	
ALTER TABLE `youtube`.`foldervideos` DROP INDEX `folderId`, ADD UNIQUE `idxUnq` (`folderId`, `videoId`)COMMENT '';

CREATE TABLE IF NOT EXISTS `reportreasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reasonAz` varchar(100) NOT NULL,
  `reasonEn` varchar(100) NOT NULL,
  `reasonRu` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

ALTER TABLE `videoreports` ADD `reasonId` INT NOT NULL AFTER `reportDate`;