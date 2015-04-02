<?php
session_start();
//$sessionId = session_id(); 

//includes
if(isset($_GET["lang"])) 
	$_SESSION["lang"]=$_GET["lang"];
if($_SESSION["lang"]=="")
	$_SESSION["lang"]="az";
$lang = $_SESSION["lang"];//this will be detected according to user's profile info or IP by default

require_once(dirname(__FILE__)."/configs/paths.php");
require_once($langsPath."content_".$lang.".php");
require_once($confsPath."conf.php");
require_once($smartyPath."Smarty.class.php");
require_once($classesPath."controller.php");
require_once($classesPath."MysqliDb.php");
require_once($classesPath."access.php");
//Page specific data load
include_once($templatePath."pageHeader.tpl");

//initiations
//++//$dbConf = new Conf();
$db = new MysqliDb($hostname, $username, $password, $database);
if(!$db) die("Database error");
$access = new Access($db);//echo "username=".$access->userName;
$controller = new Controller($db);
//end initiations

//defined which page to load into page
if(!isset($_GET["page"]))
{
	if(isset($_GET["action"])) 
		include_once($actionsPath."loginAction.php");
	$controller->includeSection("header",$lang);
	$controller->includeSection("categories",$lang);
	$controller->includeSection("videos",$lang);
	$controller->includeSection("footer",$lang);
}
else
{
	switch($_GET["page"])
	{
		/*case "logAdmin";
			include_once($actionsPath."loginAction.php");
			break;
		case "login": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."loginAction.php");
			$controller->includeSection("header",$lang);
			$controller->includeSection("horizontalMenu",$lang);
			$controller->includeSection("login",$lang);
			$controller->includeSection("footerLineMenu",$lang);
			break;*/
	}
}
?>