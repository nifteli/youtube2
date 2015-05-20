CREATE TABLE IF NOT EXISTS `foldertags` (
  `tagId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE  `tags` ADD  `langId` INT NOT NULL ;

ALTER TABLE  `youtube`.`tags` ADD UNIQUE  `idx_tags` (  `name` ,  `langId` ) COMMENT  '';