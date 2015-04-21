<?php
session_start();
$sessionId = session_id(); 

//includes
require_once(dirname(__FILE__)."/configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
require_once($classesPath."access.php");

$db = new MysqliDb($hostname, $username, $password, $database);
$access = new Access($db);

//set website language
if(isset($_GET["lang"])) 
{
	$_SESSION["lang"]=$_GET["lang"];
	$lang = $_SESSION["lang"];
}
else
	$lang = getUserLanguage($access);
require_once($langsPath."content_".$lang.".php");
///


require_once($smartyPath."Smarty.class.php");
require_once($classesPath."controller.php");


//Page specific data load
require $phpMailerPath.'PHPMailerAutoload.php';
require_once($confsPath."mailProperties.php");
require_once($facebookPath."facebook.php");

//initiations
//++//$dbConf = new Conf();

if(!$db) die("Database error");

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
			if(isset($_GET["action"])) 
				include_once($actionsPath."addVideoAction.php");
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

function getUserLanguage($access)
{
	global $defaultLang;
	$langs = array("az","en","ru");
	//echo "<pre>".print_r($access);echo "</pre>";
	if($access->hasAccess)
	{
		if(in_array($access->lang,$langs))
		{
			$_SESSION["lang"] = $access->lang;
			return $access->lang;
		}
		else
		{
			$_SESSION["lang"] = $defaultLang;
			return $defaultLang;
		}
	}
	else
	{
		$_SESSION["lang"] = $defaultLang;
		return $defaultLang;
	}
		
}

?>