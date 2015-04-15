CREATE TABLE IF NOT EXISTS `videocats` (
  `videoId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`videoId`,`categoryId`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `videocats`
  ADD CONSTRAINT `videocats_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `videocats_ibfk_1` FOREIGN KEY (`videoId`) REFERENCES `videos` (`id`);
  
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL,
  `nameEn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nameAz` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nameRu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `nameEn`, `nameAz`, `nameRu`, `abbr`) VALUES
(1, 'Azerbaijani', 'Azərbaycan dili', 'Azerbaijani', 'AZ'),
(2, 'English', 'İngilis dili', 'English', 'EN'),
(3, 'Russian', 'Rus dili', 'Russian', 'RU'),
(4, 'French', 'Fransızca', 'French', 'FR');

ALTER TABLE `users` CHANGE `lang` `languageId` INT NULL DEFAULT NULL;
update users set languageid=null
ALTER TABLE `users` ADD INDEX(`languageId`);
ALTER TABLE `users` ADD FOREIGN KEY (`languageId`) REFERENCES `youtube`.`languages`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `videos` CHANGE `lang` `languageId` INT NULL DEFAULT NULL;
update videos set languageid=null
ALTER TABLE `videos` ADD INDEX(`languageId`);
ALTER TABLE `videos` ADD FOREIGN KEY (`languageId`) REFERENCES `youtube`.`languages`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
