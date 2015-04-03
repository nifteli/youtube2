ALTER TABLE  `users` ADD  `status` VARCHAR( 20 ) NOT NULL AFTER  `password` ,
ADD  `hash` VARCHAR( 255 ) NOT NULL AFTER  `status` ;