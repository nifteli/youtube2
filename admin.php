<?php
session_start();
$sessionId = session_id(); 

//includes
require_once(dirname(__FILE__)."/configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
require_once($classesPath."access.php");
require_once($phpExcelPath."PHPExcel.php");

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
	$controller->includeSection("adminRoles");
	$controller->logAction(1);
	//$controller->includeSection("adminFooter");
	//echo "<pre>";print_r($access);echo "</pre>";
}
else
{
	switch($_GET["page"])
	{
		case "adminRoles": 
			if($access->authorized(35))
			{
				$controller->logAction2(87,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminRolesAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminRoles");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "editRole": 
			if($access->authorized(37))
			{
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminEditRoleAction.php");
				$controller->includeSection("editRole");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminVideoLinks": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(25))
			{
				$controller->logAction2(68,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminVideoLinksAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminVideoLinks");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminReports": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(25))
			{
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminReports");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminComments": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(26))
			{
				$controller->logAction2(81,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminCommentsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminComments");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminFolders": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(28))
			{
				$controller->logAction2(72,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminFoldersAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminFolders");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminTags": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(32))
			{
				$controller->logAction2(79,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminTagsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminTags");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminCategories": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(41))
			{
				$controller->logAction2(66,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminCategoriesAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminCategories");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminNotifications": //echo "<pre>"; print_r($access->auth); echo "</pre>";
			if($access->authorized(46))
			{
				$controller->logAction2(84,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminNotificationsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminNotifications");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminUsers":
			if($access->authorized(33))
			{
				$controller->logAction2(61,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminUsersAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminUsers");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminGuests":
			if($access->authorized(61))
			{
				$controller->logAction2(62,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminGuestsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminGuests");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminSearches":
			if($access->authorized(64))
			{
				$controller->logAction2(65,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminSearchesAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminSearches");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminMessages":
			if($access->authorized(68))
			{
				$controller->logAction2(63,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminMessagesAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminMessages");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminLogs":
			if($access->authorized(66))
			{
				$controller->logAction2(85,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminLogsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminLogs");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminDetails":
			if($access->authorized(63))
			{
				//if(isset($_GET["action"])) 
				include_once($actionsPath."adminDetailsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminDetails");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
		case "adminAttachments":
			if($access->authorized(71))
			{
				$controller->logAction2(64,"");
				if(isset($_GET["action"])) 
					include_once($actionsPath."adminAttachmentsAction.php");
				include_once($templatePath."adminPageHeader.tpl");
				$controller->includeSection("adminMenu");
				$controller->includeSection("adminAttachments");
			}
			else
			{
				echo "No access";
				return;
			}
			break;
			
		default:
			include_once($templatePath."adminPageHeader.tpl");
			$controller->includeSection("adminMenu");
			$controller->includeSection("adminRoles");
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