<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);
$lang = $_SESSION["lang"];
require_once($langsPath."content_".$lang.".php");

//Category subscription
if($_GET["action"] == "subscribe" && $_GET["catId"] && $_GET["catId"] > 0)
{
	$db->insert("subscriptions",array(
								"userId"=>$_SESSION["userId"],
								"catId"=>$_GET["catId"],
								"subsDate"=>date("Y-m-d H:i:s")
								));
	if($db->count>0)
		echo " <span id='subs".$_GET["catId"]."'><a class='subscription'  id='".$_GET["catId"].":0'> [$content[UNSUBSCRIBE]]</a></span>";
}
//Category unsubscription
if($_GET["action"] == "unSubscribe" && $_GET["catId"] && $_GET["catId"] > 0)
{
	$qry = "delete from subscriptions 
				where catId = $_GET[catId] and userId=".$_SESSION["userId"];
		$db->rawQuery($qry);
			echo " <span id='subs".$_GET["catId"]."'><a class='subscription'  id='".$_GET["catId"].":1'> [$content[SUBSCRIBE]]</a></span>";
}

//show user profile
if($_GET["action"] == "showProfile" && is_numeric($_GET["userId"]))
{
	$user = getUserProfile($_GET["userId"],$db);
	if($user["gender"] == 'Male')
		$mchecked = "checked";
	if($user["gender"] == 'Female')
		$fchecked = "checked";
	if($user["getEmailOnVideoComment"] == 1)
		$gchecked = "checked";	
	switch($user["languageId"])
	{
		case 5:
			$aselected = "selected";
			break;
		case 19:
			$eselected = "selected";
			break;
		case 67:
			$rselected = "selected";
			break;
	}
		
	$ret = "
		<div style='float:left; width:300'>
		<div class='topgap'>
		<label>$content[CODE]:</label>
		<div class='gap'>
			<input class='field' type='text' name='code' id='code' disabled value='$user[id]' style='width:300px'>
		</div>
		</div>
		<div class='topgap'>
			<label>$content[NAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='name' id='name' disabled value='$user[firstName]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[SURNAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='surname' id='surname' disabled value='$user[lastName]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[FATHERNAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='fatherName' id='fatherName' disabled value='$user[fatherName]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[BIRTHDATE]:</label>
			<div class='gap'>
				<input class='field' type='text' name='bday' id='bday' disabled value='$user[birthDate]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[GENDER]: $user[gender]</label>
			<div class='gender'>
				<input type='radio' name='gender' id='gender'  $mchecked >$content[MALE]
				<input type='radio' name='gender' id='gender'  $fchecked >$content[FEMALE]
			</div>
		</div>	
		<div class='topgap'>
			<label>$content[POSITION]:</label>
			<div class='gap'>
				<input class='field' type='text' name='position' id='position' disabled value='$user[profession]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[INTERESTS]:</label>
			<div class='gap'>
				<input class='field' type='text' name='interests' id='interests' disabled value='$user[interests]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[EMAIL]:</label>
			<div class='gap'>
				<input class='field' type='email' name='email' id='email' disabled value='$user[email]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[PHONE]:</label>
			<div class='gap'>
				<input class='field' type='text' name='phone' id='phone' disabled value='$user[phoneNumber]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
				<label>$content[LANGUAGE]:</label>
			<div class='gap'>
				<select class='field' name='lang' id='lang' disabled style='width:300px'>
					<option value='az' $aselected>$content[AZERBAIJANI]</option>
					<option value='en' $eselected>$content[ENGLISH]</option>
					<option value='ru' $rselected>$content[RUSSIAN]</option>
				</select>
			</div>
		</div>
		<br>
		<div class='topgap'>
			<label>$content[USERNAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='username' id='username' disabled value='$user[userName]' disabled style='width:300px'>
			</div>
		</div>
		
		<div class='topgap'>
			<label>$content[getEmailOnComment]:</label>
			<div class='gap'>
				<input class='emailCheck' type='checkbox' $gchecked name='getEmailOnComment' id='getEmailOnComment' disabled>
			</div>
		</div>
		</div>
		<div class='profilePic' style='float:right; width:150px;margin-left:0px; text-align:center'>
		<img src='$user[picturePath]' width=100 height=100>
		</div>	
	";
	echo $ret;
}

function getUserProfile($id,$db)
{
	$db->where("id=$id");
	$res = $db->get("users");
	return $res[0];
}

//LIKE DISLIKE actions
if($_GET["action"] == "likeIt" && 
	isset($_GET["videoId"]) && is_numeric($_GET["videoId"]) && 
	isset($_GET["flag"]) && is_numeric($_GET["flag"]) && 
	isset($_SESSION["userId"]) && is_numeric($_SESSION["userId"]))
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