<?php
	$result = "success";
	$messages = array();
	
if ($_GET["action"]=="comment")
{
	if(!isset($_POST["comment"]) || $_POST["comment"] == "")
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	if(!$access->hasAccess && (!isset($_POST["email"]) || $_POST["email"] == ""))
	{
		$result = "error";
		$messages["noEmail"] = $content["NOEMAIL"];
	}
	if(!isset($_GET["id"]) || $_GET["id"] == "" || $_GET["id"] < 0)
	{
		$result = "error";
		$messages["noVideoId"] = $content["NOID"];
	}
	
	if($result == "success")
	{
		//$db->startTransaction();
		
		$commentId = $db->insert("comments", array("comment"=>trim($_POST["comment"]),
												  "videoId"=>trim($_GET["id"]),
												  "createdById"=>$access->userId,
												  "userIP"=>$_SERVER['REMOTE_ADDR'],
												  "isConfirmed"=>1,
												  "created"=>date("Y-m-d H:i:s")));
		
		//$db->commit();
		
	}
}
if($_GET["action"]=="editComment")
{
	if(!isset($_GET["commentId"]) || $_GET["commentId"] == "" || $_GET["commentId"]<0)
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	
	if(!isset($_POST["comment".$_GET["commentId"]]) || trim($_POST["comment".$_GET["commentId"]]) == "")
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	
	if(!isset($_GET["id"]) || $_GET["id"] == "" || $_GET["id"] < 0)
	{
		$result = "error";
		$messages["noVideoId"] = $content["NOID"];
	}
	if($result == "success")
	{
		//$db->startTransaction();
		$db->where("id=".$_GET["commentId"]." and createdById=".$access->userId);
		$commentId = $db->update("comments", array("comment"=>trim($_POST["comment".$_GET["commentId"]]),
												  "updatedByIP"=>$_SERVER['REMOTE_ADDR'],
												  "updatedById"=>$access->userId,
												  "updated"=>date("Y-m-d H:i:s")));
		
		//$db->commit();
		
	}	
}

if($_GET["action"]=="delComment")
{
	if(!isset($_GET["commentId"]) || $_GET["commentId"] == "" || $_GET["commentId"]<0)
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	if($result == "success")
	{
		$db->where("id=".$_GET["commentId"]." and createdById=".$access->userId);
		$db->delete("comments");
	}
}
?>