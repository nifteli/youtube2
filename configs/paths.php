<?php
$domain="http://localhost:88/youtube/index.php";
$rootDirectory = $_SERVER['DOCUMENT_ROOT'];
$appDirectory = $rootDirectory . "/youtube/";
$classesPath = $appDirectory."/classes/";
$confsPath = $appDirectory."/configs/";
$templatePath = $appDirectory."/templates/";
$smartyPath = $classesPath."plugins/Smarty/";
$langsPath = $appDirectory."/langs/";
$actionsPath = $appDirectory."actions/";
$phpMailerPath = $classesPath."plugins/PHPMailer/";
$facebookPath = $classesPath."plugins/Facebook/";
$userPicsPath =  "/uploads/userPictures/";
$tmpPath = $appDirectory . "/tmp/";
//$productImagesPath=$appDirectory."productImages/";
//$bannerPath=$appDirectory."img/banners/";

//$allowedExts = array("gif", "jpeg", "jpg", "png","JPG","JPEG","PNG","GIF");
//$maxImageSize=20000000;
//$minDimension=400;
?>