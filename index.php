<?php
session_start();
$sessionId = session_id(); 

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
require $phpMailerPath.'PHPMailerAutoload.php';
require_once($confsPath."mailProperties.php");
require_once($facebookPath."facebook.php");

//initiations
//++//$dbConf = new Conf();
$db = new MysqliDb($hostname, $username, $password, $database);
if(!$db) die("Database error");
$access = new Access($db);//echo "username=".$access->userName;
//print_r($access);
$controller = new Controller($db);
//end initiations

//defined which page to load into page
if(!isset($_GET["page"]))
{
	if(isset($_GET["action"])) 
		include_once($actionsPath."loginAction.php");
	include_once($templatePath."pageHeader.tpl");
	$controller->includeSection("header");
	$controller->includeSection("categories");
	$controller->includeSection("videos");
	$controller->includeSection("footer");
	//echo "<pre>";print_r($access);echo "</pre>";
}
else
{
	include_once($templatePath."pageHeader.tpl");
	switch($_GET["page"])
	{
		/*case "logAdmin";
			include_once($actionsPath."loginAction.php");
			break;*/
		case "reg": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."regAction.php");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("reg");
			$controller->includeSection("footer");
			break;
		case "addVideo": 
			//if(isset($_GET["action"])) 
				//include_once($actionsPath."addVideoAction.php");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("addVideo");
			$controller->includeSection("footer");
			break;
		case "users": 
			//if(isset($_GET["action"])) 
				//include_once($actionsPath."usersAction.php");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("users");
			$controller->includeSection("footer");
			break;
		case "allTags": 
			//if(isset($_GET["action"])) 
				//include_once($actionsPath."allTagsAction.php");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("allTags");
			$controller->includeSection("footer");
			break;
		case "watchVideo": 
			//if(isset($_GET["action"])) 
				//include_once($actionsPath."watchVideo.php");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("watchVideo");
			$controller->includeSection("footer");
			break;
		default:
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("videos");
			$controller->includeSection("footer");
			break;
	}
}
?>