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

if(!$access->hasAccess)
{
	header("location:index.php");
	return;
}
	//set website language
if(isset($_GET["lang"]) && $_GET["lang"] != "" && in_array($_GET["lang"],$langs)) 
{
	$_SESSION["lang"]=$_GET["lang"];
	$lang = $_SESSION["lang"];
}
elseif(isset($_SESSION["lang"]) && $_SESSION["lang"] != "")
	$lang = $_SESSION["lang"];
else
	$lang = getUserLanguage($access);

if($lang == "az" || $lang == "ru")
		$format = "DD.MM.YYYY";
	else
		$format = "MM/DD/YYYY";
	
require_once($langsPath."content_".$lang.".php");
///


require_once($smartyPath."Smarty.class.php");
require_once($smartyPath."SmartyBC.class.php");
require_once($classesPath."controller.php");


//Page specific data load
require $phpMailerPath.'PHPMailerAutoload.php';
require_once($confsPath."mailProperties.php");
//require_once($facebookPath."facebook.php");

//initiations
//++//$dbConf = new Conf();

if(!$db) die("Database error");

//print_r($access);echo "ses=".$_SESSION["userId"];
$controller = new Controller($db);
//end initiations


//defined which page to load into page
if(!isset($_GET["page"]) || (isset($_GET["page"]) && $_GET["page"] == "adminProfile") )
{
	if(isset($_GET["action"])) 
		include_once($actionsPath."adminProfileAction.php");
	include_once($templatePath."adminPageHeader.tpl");
	$controller->includeSection("adminMenu");
	$controller->includeSection("adminProfile");
	//$controller->includeSection("adminFooter");
	//echo "<pre>";print_r($access);echo "</pre>";
}
else
{
	include_once($templatePath."adminPageHeader.tpl");
	$controller->includeSection("adminMenu");
	switch($_GET["page"])
	{
		case "adminRoles": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."adminRolesAction.php");
			$controller->includeSection("adminRoles");
			break;
		case "editRole": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."adminEditRoleAction.php");
			$controller->includeSection("editRole");
			break;
		case "adminVideoLinks": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."adminVideoLinksAction.php");
			$controller->includeSection("adminVideoLinks");
			break;
		default:
			$controller->includeSection("adminProfile");
			break;
	}
}
$controller->includeSection("adminFooter");

function getUserLanguage($access)
{
	global $defaultLang;
	global $langs;
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