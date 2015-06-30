drop table accesstypes;
CREATE TABLE IF NOT EXISTS `accesstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameAz` varchar(500) NOT NULL,
  `nameRu` varchar(500) NOT NULL,
  `nameEn` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `accesstypes`
--

INSERT INTO `accesstypes` (`id`, `nameAz`, `nameRu`, `nameEn`) VALUES
(1, 'change profile info', '', ''),
(2, 'view user profile', '', ''),
(3, 'edit user profile', '', ''),
(4, 'delete users', '', ''),
(5, 'send email', '', ''),
(6, 'change access', '', ''),
(7, 'add video links', '', ''),
(8, 'edit video links', '', ''),
(9, 'delete video links', '', ''),
(10, 'edit comments', '', ''),
(11, 'create folders', '', ''),
(12, 'delete folders', '', ''),
(13, 'add video links from file', '', ''),
(14, 'edit video links by file', '', ''),
(15, 'delete video links by file', '', ''),
(16, 'confirm comments', '', ''),
(17, 'rename folder', '', ''),
(18, 'access webpage general settings', '', ''),
(19, 'export to excel guests', '', ''),
(20, 'export to excel categories', '', ''),
(21, 'export to excel videos', '', ''),
(22, 'export to excel folders', '', ''),
(23, 'export to excel tags', '', ''),
(24, 'export to excel comments', '', '');