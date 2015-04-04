ALTER TABLE `categories` CHANGE `questionId` `questions` SMALLINT NOT NULL;
CREATE TABLE IF NOT EXISTS `videotags` (
  `tagId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  PRIMARY KEY (`tagId`,`videoId`),
  KEY `videoId` (`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `tags` ADD `name` VARCHAR(50) NOT NULL ;
ALTER TABLE `videotags`
  DROP PRIMARY KEY,
   ADD PRIMARY KEY(
     `tagId`,
     `videoId`);
ALTER TABLE `videotags` ADD FOREIGN KEY (`tagId`) REFERENCES `youtube`.`tags`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `videotags` ADD FOREIGN KEY (`videoId`) REFERENCES `youtube`.`videos`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `categories` ADD INDEX(`catGroupId`);
ALTER TABLE `categories` CHANGE `catGroupId` `catGroupId` INT(11) NULL DEFAULT NULL;
update categories set catgroupid=null where catgroupid=0
ALTER TABLE `categories` CHANGE `createdById` `createdById` INT(11) NULL DEFAULT NULL;
update categories set createdbyid=null where createdbyid=0
ALTER TABLE `categories` CHANGE `deletedById` `deletedById` INT(11) NULL DEFAULT NULL;
update categories set deletedbyid=null where deletedbyid=0
ALTER TABLE `categories` ADD INDEX(`deletedById`);
ALTER TABLE `categories` ADD INDEX(`createdById`);
ALTER TABLE `categories` ADD FOREIGN KEY (`deletedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `categories` ADD FOREIGN KEY (`createdById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `categories` ADD FOREIGN KEY (`catGroupId`) REFERENCES `youtube`.`catgroups`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comments` CHANGE `confirmedById` `confirmedById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `comments` CHANGE `userId` `createdById` INT(11) NULL DEFAULT NULL COMMENT 'commenter Id';
ALTER TABLE `comments` CHANGE `isConfirmed` `isConfirmed` TINYINT(1) NOT NULL DEFAULT '0';
ALTER TABLE `comments` CHANGE `updatedById` `updatedById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `comments` ADD INDEX(`confirmedById`);
ALTER TABLE `comments` ADD INDEX(`createdById`);
ALTER TABLE `comments` ADD INDEX(`updatedById`);
ALTER TABLE `comments` ADD FOREIGN KEY (`confirmedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `comments` ADD FOREIGN KEY (`createdById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `comments` ADD FOREIGN KEY (`updatedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `folders` CHANGE `createdById` `createdById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `folders` CHANGE `updatedById` `updatedById` INT(11) NULL DEFAULT NULL, CHANGE `lastVideoAddedById` `lastVideoAddedById` INT(11) NULL DEFAULT NULL, CHANGE `deletedById` `deletedById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `folders` ADD INDEX(`createdById`);
ALTER TABLE `folders` ADD INDEX(`updatedById`);
ALTER TABLE `folders` ADD INDEX(`lastVideoAddedById`);
ALTER TABLE `folders` ADD INDEX(`deletedById`);
ALTER TABLE `folders` ADD FOREIGN KEY (`createdById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `folders` ADD FOREIGN KEY (`updatedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `folders` ADD FOREIGN KEY (`lastVideoAddedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `folders` ADD FOREIGN KEY (`deletedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `messages` CHANGE `userId` `createdById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `messages` ADD INDEX(`createdById`);
ALTER TABLE `messages` ADD FOREIGN KEY (`createdById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `searches` CHANGE `userId` `createdById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `searches` ADD INDEX(`createdById`);
ALTER TABLE `searches` ADD FOREIGN KEY (`createdById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `searches` CHANGE `userIP` `createdByIP` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `messages` CHANGE `userIP` `createdByIP` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `users` CHANGE `deletedById` `deletedById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `users` ADD INDEX(`deletedById`);
UPDATE `youtube`.`users` SET `deletedById` = NULL WHERE `deletedById` = 0;
ALTER TABLE `users` ADD FOREIGN KEY (`deletedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `videos` CHANGE `categoryId` `categoryId` INT(11) NULL DEFAULT NULL;
ALTER TABLE `videos` ADD INDEX(`categoryId`);
ALTER TABLE `videos` CHANGE `addedById` `addedById` INT(11) NULL DEFAULT NULL, CHANGE `updatedById` `updatedById` INT(11) NULL DEFAULT NULL, CHANGE `deletedById` `deletedById` INT(11) NULL DEFAULT NULL;
ALTER TABLE `videos` DROP `tags`;
ALTER TABLE `videos` ADD INDEX(`addedById`);
ALTER TABLE `videos` ADD INDEX(`updatedById`);
ALTER TABLE `videos` ADD INDEX(`deletedById`);
ALTER TABLE `videos` ADD FOREIGN KEY (`categoryId`) REFERENCES `youtube`.`categories`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `videos` ADD FOREIGN KEY (`addedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `videos` ADD FOREIGN KEY (`updatedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `videos` ADD FOREIGN KEY (`deletedById`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
CREATE TABLE IF NOT EXISTS `accesstypes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `roles` ADD `name` VARCHAR(50) NOT NULL AFTER `id`;
CREATE TABLE IF NOT EXISTS `roleaccess` (
  `roleId` int(11) NOT NULL,
  `accessTypeId` int(11) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `roleaccess` ADD PRIMARY KEY( `roleId`, `accessTypeId`);
ALTER TABLE `roleaccess` ADD FOREIGN KEY (`roleId`) REFERENCES `youtube`.`roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `roleaccess` ADD FOREIGN KEY (`accessTypeId`) REFERENCES `youtube`.`accesstypes`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
CREATE TABLE IF NOT EXISTS `profileviews` (
  `viewerId` int(11) NOT NULL,
  `viewedId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `lastViewed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `profileviews` ADD PRIMARY KEY( `viewerId`, `viewedId`);
ALTER TABLE `profileviews` ADD FOREIGN KEY (`viewerId`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `profileviews` ADD FOREIGN KEY (`viewedId`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
CREATE TABLE IF NOT EXISTS `videoviews` (
  `userId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  `action` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'watched = 0, liked = 1, disliked = -1',
  `actionDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `videoviews` ADD PRIMARY KEY( `userId`, `videoId`);
ALTER TABLE `videoviews` ADD FOREIGN KEY (`userId`) REFERENCES `youtube`.`users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `videoviews` ADD FOREIGN KEY (`videoId`) REFERENCES `youtube`.`videos`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `users` DROP `profileViewCount`, DROP `videoWatchCount`, DROP `videoLikeCount`, DROP `videoDislikeCount`;
