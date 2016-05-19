<?php
session_start();
$sessionId = session_id(); 

 //echo "<pre>";print_r($_COOKIE);echo "</pre>";
// setcookie("arr[userName]", "admin2", time() + 3600);
// setcookie("arr[password]", "admin3", time() + 3600);

//includes
require_once(dirname(__FILE__)."/configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
require_once($classesPath."access.php");
$db = new MysqliDb($hostname, $username, $password, $database);
$access = new Access($db);

//set website language
if(isset($_GET["lang"]) && $_GET["lang"] != "" && in_array($_GET["lang"],$langs)) 
{
	$_SESSION["lang"]=$_GET["lang"];
	$lang = $_SESSION["lang"];
}
//elseif(isset($_SESSION["lang"]) && $_SESSION["lang"] != "")
	//$lang = $_SESSION["lang"];
//else
	$lang = getUserLanguage($access);
//echo "lang=".$_SESSION["lang"];
	
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
if($lang == "az" || $lang == "ru")
	$format = "DD.MM.YYYY";
else
	$format = "MM/DD/YYYY";

if(!$db) die("Database error");

//print_r($access);echo "ses=".$_SESSION["userId"];
$controller = new Controller($db);
//end initiations
//collect statistics
$controller->addSiteEntry();
$controller->addClicks();
//collect statistics

if(isset($_COOKIE["arr"]["userName"]) && isset($_COOKIE["arr"]["password"]))
{
	$db->where("status='confirmed' and isDeleted=0 and userName = '".$_COOKIE["arr"]["userName"]."' and password = '" . md5($_COOKIE["arr"]["password"]) . "'");
	$usr = $db->get("users");//echo $db->count."heee";
	if($db->count == 1)
		$controller->authenticate($_COOKIE["arr"]["userName"]);
}
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
}
else
{
	switch($_GET["page"])
	{
		/*case "logAdmin";
			include_once($actionsPath."loginAction.php");
			break;*/
		case "reg": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."regAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("reg");
			$controller->includeSection("footer");
			break;
		case "signIn":
			if(isset($_GET["action"])) 
				include_once($actionsPath."signInAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("signIn");
			$controller->includeSection("footer");
			break;
		case "addVideo": 
			if(!$access->hasAccess)
			{
				header("location:?page=signIn");
				return;
			}
			if(isset($_GET["action"])) 
				include_once($actionsPath."addVideoAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("addVideo");
			$controller->includeSection("footer");
			break;
		case "users": 
			//if(isset($_GET["action"])) 
				//include_once($actionsPath."usersAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("users");
			$controller->includeSection("footer");
			break;
		case "allTags": 
			//if(isset($_GET["action"])) 
				//include_once($actionsPath."allTagsAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("allTags");
			$controller->includeSection("footer");
			break;
		case "watchVideo": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."watchVideoAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("watchVideo");
			$controller->includeSection("footer");
			break;
		case "forgotPass": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."forgotPassAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("forgotPass");
			$controller->includeSection("footer");
			break;
		case "advSearch": 
			if(isset($_GET["action"])) 
				include_once($actionsPath."advSearchAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("advSearch");
			$controller->includeSection("footer");
			break;
		case "searchRes":
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("searchResults");
			$controller->includeSection("footer");
			break;
		case "profile":
			if(isset($_GET["action"])) 
				include_once($actionsPath."profileAction.php");
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("profile");
			$controller->includeSection("footer");
			break;
		case "about":
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("about");
			$controller->includeSection("footer");
			break;
		case "siteRules":
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("siteRules");
			$controller->includeSection("footer");
			break;
		case "other":
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("other");
			$controller->includeSection("footer");
			break;
		case "page1":
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("page1");
			$controller->includeSection("footer");
			break;
		case "page2":
			include_once($templatePath."pageHeader.tpl");
			$controller->includeSection("header");
			$controller->includeSection("categories");
			$controller->includeSection("page2");
			$controller->includeSection("footer");
			break;
		default:
			include_once($templatePath."pageHeader.tpl");
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
		$rusIPs = array("Ukraine","Belarus","Russian Federation");
		$country = ip_info("Visitor", "Country");
		if (in_array($country,$rusIPs))
		{
			$_SESSION["lang"] = "ru";
			return $_SESSION["lang"];
		}
		if($country == "Azerbaijan")
		{
			$_SESSION["lang"] = "az";
			return $_SESSION["lang"];
		}
		$_SESSION["lang"] = $defaultLang;
		return $defaultLang;
	}
		
}

function ip_info($ip = NULL, $purpose = "location", $deep_detect = TRUE) {
    $output = NULL;
    if (filter_var($ip, FILTER_VALIDATE_IP) === FALSE) {
        $ip = $_SERVER["REMOTE_ADDR"];
        if ($deep_detect) {
            if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP))
                $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP))
                $ip = $_SERVER['HTTP_CLIENT_IP'];
        }
    }
    $purpose    = str_replace(array("name", "\n", "\t", " ", "-", "_"), NULL, strtolower(trim($purpose)));
    $support    = array("country", "countrycode", "state", "region", "city", "location", "address");
    $continents = array(
        "AF" => "Africa",
        "AN" => "Antarctica",
        "AS" => "Asia",
        "EU" => "Europe",
        "OC" => "Australia (Oceania)",
        "NA" => "North America",
        "SA" => "South America"
    );
    if (filter_var($ip, FILTER_VALIDATE_IP) && in_array($purpose, $support)) {
        $ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip));
        if (@strlen(trim($ipdat->geoplugin_countryCode)) == 2) {
            switch ($purpose) {
                case "location":
                    $output = array(
                        "city"           => @$ipdat->geoplugin_city,
                        "state"          => @$ipdat->geoplugin_regionName,
                        "country"        => @$ipdat->geoplugin_countryName,
                        "country_code"   => @$ipdat->geoplugin_countryCode,
                        "continent"      => @$continents[strtoupper($ipdat->geoplugin_continentCode)],
                        "continent_code" => @$ipdat->geoplugin_continentCode
                    );
                    break;
                case "address":
                    $address = array($ipdat->geoplugin_countryName);
                    if (@strlen($ipdat->geoplugin_regionName) >= 1)
                        $address[] = $ipdat->geoplugin_regionName;
                    if (@strlen($ipdat->geoplugin_city) >= 1)
                        $address[] = $ipdat->geoplugin_city;
                    $output = implode(", ", array_reverse($address));
                    break;
                case "city":
                    $output = @$ipdat->geoplugin_city;
                    break;
                case "state":
                    $output = @$ipdat->geoplugin_regionName;
                    break;
                case "region":
                    $output = @$ipdat->geoplugin_regionName;
                    break;
                case "country":
                    $output = @$ipdat->geoplugin_countryName;
                    break;
                case "countrycode":
                    $output = @$ipdat->geoplugin_countryCode;
                    break;
            }
        }
    }
    return $output;
}


?>