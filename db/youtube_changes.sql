CREATE TABLE IF NOT EXISTS `subscriptions` (
  `userId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `subsDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `youtube`.`subscriptions` ADD UNIQUE `idxUnq` (`userId`, `catId`)COMMENT '';

ALTER TABLE `comments` ADD `email` VARCHAR(50) NOT NULL AFTER `isConfirmed`;