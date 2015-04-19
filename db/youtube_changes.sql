ALTER TABLE `videos` DROP FOREIGN KEY `videos_ibfk_1`;
ALTER TABLE `videos` DROP `categoryId`;
ALTER TABLE `users` DROP `linksAddedCount`;
ALTER TABLE `users` DROP `videoCommentCount`;
ALTER TABLE `comments` ADD `videoId` INT NOT NULL AFTER `comment`;