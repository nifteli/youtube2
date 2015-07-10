<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);
$lang = $_SESSION["lang"];
require_once($langsPath."content_".$lang.".php");


//LIKE DISLIKE actions
if($_GET["action"] == "likeIt" && 
	isset($_GET["videoId"]) && $_GET["videoId"] > 0 && 
	isset($_GET["flag"]) && $_GET["flag"] > 0 && 
	isset($_SESSION["userId"]) && $_SESSION["userId"] > 0)
{
	if($_GET["flag"] == 1)
	{
		$db->rawQuery("insert into videoviews (userId,videoId,action,actionDate) 
						values (".$_SESSION["userId"].",$_GET[videoId],1,'".date("Y-m-d H:i:s")."')
						on duplicate key update
						action = 1, actionDate = '".date("Y-m-d H:i:s")."'");
	}
	if($_GET["flag"] == 2)
	{
		$db->rawQuery("insert into videoviews (userId,videoId,action,actionDate) 
						values (".$_SESSION["userId"].",$_GET[videoId],-1,'".date("Y-m-d H:i:s")."')
						on duplicate key update
						action = -1, actionDate = '".date("Y-m-d H:i:s")."'");
	}
	//if($db->count>0)
	//{
		$res = $db->rawQuery("SELECT SUM(IF(action = 1, 1, 0)) likeCount,
									  SUM(IF(action = -1, 1, 0)) dislikeCount						  		
								FROM videoViews
								where videoId=".$_GET["videoId"]);
		if($res[0]["likeCount"]>=0 && $res[0]["dislikeCount"]>=0)
			echo $res[0]["likeCount"].";".$res[0]["dislikeCount"];
	//}
}

if($_GET["action"] == "getAccess" && $_GET["id"]>0)
{ 
$table = <<<TBL
<table border="1" id="t01" style="width:100%">
	<tr style="background-color:#B3AC96">
		<td>$content[ACTIONNAME]</td><td>$content[DATERANGE]</td><td>$content[HASACCESS]</td>
	</tr>
TBL;
	
$accessTypes = getAccessTypes($lang);
$ownedAccess = getOwnedAccess($_GET["id"]);
for($i=0; $i<count($accessTypes); $i++)
{
	$checked = "";
	$from = "";
	$to ="";
	for($j=0; $j<count($ownedAccess); $j++)
	{
		if($accessTypes[$i]["id"] == $ownedAccess[$j]["accessTypeId"])
		{
			$checked = "checked";
			$from = getNormalizedDate($ownedAccess[$j]["startDate"]);
			$to = getNormalizedDate($ownedAccess[$j]["endDate"]);
		}
	}
	$table .= "
	<tr>
		<td>".$accessTypes[$i]["name"]."</td>
		<td>
			<input type=hidden name=accessId[] id=accessId[] value=".$accessTypes[$i]["id"].">
			<input class=field style='width:80px' type=text name=from[] id=from".$accessTypes[$i]["id"]." value=$from>
			<input class=field style='width:80px' type=text name=to[] id=to".$accessTypes[$i]["id"]." value=$to>
		</td>
		<td><input type=checkbox name=hasAccess[] id=hasAccess[] $checked ></td>
	</tr>";
}
$table .= <<<TBL
	<tr>	
		<td colspan=3><br><input class="roleSave" class="login39" type="submit" value="$content[SAVE]" name="submit"></td>
	</tr>
</table>
TBL;
	
echo $table;
}

function getAccessTypes($lang)
{
	global $db;
	//$db->where("id=$id");
	$res = $db->rawQuery("select id, name".$lang." name from accesstypes");
	return $res;
}

function getOwnedAccess($id)
{
	global $db;
	$db->where("roleId=".$id);
	$res = $db->get("roleaccess");
	return $res;
}

function getNormalizedDate($rawDate)
{
	global $lang;
	list($year, $month, $day) = explode('-', $rawDate);//return $month.$day.$year;
	if($year == "0000")
		return "";
	$day = substr($rawDate,8,2);
	if($lang == 'az' || $lang == 'ru')
		$date = $day.".".$month.".".$year;
	if($lang == 'en')
		$date = $month . "/" . $day . "/" . $year;
	return $date;
}
?>