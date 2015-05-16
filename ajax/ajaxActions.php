<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);


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

?>