<?php
//session_start();
//$sessionId = session_id(); 

//includes
$lang="az";//this will be detected according to user's profile info or IP by default
require_once(dirname(__FILE__)."/configs/paths.php");
require_once($langsPath."content_".$lang.".php");
require_once($confsPath."conf.php");
require_once($smartyPath."Smarty.class.php");
require_once($classesPath."commonFunctions.php");
//Page specific data load
include_once($templatePath."pageHeader.tpl");

//initiations
$dbConf = new Conf();
//$db 	= new MySQL();
//$access = new Access($db);//echo "username=".$access->userName;
$comm   = new CommonFunctions($db);
//end initiations

//defined which page to load into page
if(!isset($_GET["page"]))
{
	$comm->includeSection("header",$lang);
	//$comm->includeSection("categories",$lang);
	$comm->includeSection("videos",$lang);
	$comm->includeSection("footer",$lang);
}
?>