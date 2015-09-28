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

if($_GET["action"]=="add2Folder")
{
	if($_GET["id"] > 0 && $_POST["folderId"] > 0)
	{
		$res = $db->insert("foldervideos", array("folderId"=>trim($_POST["folderId"]),
												  "videoId"=>trim($_GET["id"]),
												  "addedByIP"=>$_SERVER['REMOTE_ADDR'],
												  "added"=>date("Y-m-d H:i:s")));
		if($db->count > 0) 
			$okMessage = $content["ADDEDTOFOLDER"];
		
	}
}

if($_GET["action"]=="delFromFolder")
{
	if($_GET["id"] > 0)
	{
		$qry = "delete from foldervideos 
				where videoId = $_GET[id] and exists(select 1 from folders where folders.id=foldervideos.folderId and createdById=".$access->userId.")";
		$db->rawQuery($qry);
		if($db->count>0) 
			$okMessage = $content["REMOVEDFROMFOLDER"];
		
	}
}

if($_GET["action"]=="reportVideo")
{
	if(trim($_GET["id"]) > 0 && $_POST["reasonId"] > 0)
	{
		$res = $db->insert("videoreports", array("videoId"=>trim($_GET["id"]),
												  "reasonId"=>$_POST["reasonId"],
												  "desc"=>trim($_POST["desc"]),
												  "reporterId"=>$access->userId,
												  "reportDate"=>date("Y-m-d H:i:s")));
		if($db->count > 0) 
			$okMessage = $content["REPORTSAVED"];
		
	}
}
?>