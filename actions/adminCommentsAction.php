<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(24))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array(
					"createdDate" => $content['ADDDATE'],
					"updatedDate" => $content['UPDATED'],
					"confirmed" => $content['CONFIRDATE'],
					"id" => $content['ID'],
					"comment" => $content['COMMENT'],
					"isConfirmed" => $content['CONFIRMED'],
					"videoId" => $content['VIDEOID'],
					"link" => $content['VIDEOLINK'],
					"videoName" => $content['VIDEONAME'],
					"question" => $content['VIDEOQUESTION'],
					"createdById" => $content['AUTHORID'],
					"athor" => $content['AUTHOR'],
					"userIP" => $content['AUTHORIP'],
					"updatedById" => $content['UPDATEDBYID'],
					"updatedBy" => $content['UPDATEDBY'],
					"updatedByIP" => $content['UPDATEDBYIP'],
					"confirmedById" => $content['CONFIRMEDBYID'],
					"confirmer" => $content['CONFIRMER'],
					"confirmedByIP" => $content['CONFIRMERIP']
					);
	$links = $controller->getComments(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLECOMMENTS']."-".$_POST["created"]."-".$_POST["createdTill"]);
	$controller->logAction2(14,"DateInterval=".$_POST["created"]."-".$_POST["createdTill"]);
	return;
}
if ($_GET["action"]=="delete" && is_numeric(trim($_GET["id"])))
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(27))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["id"]));
	$cnt = $db->delete("comments");
	if($cnt > 0)
	{
		$messages["success"] = $content["REMOVED"];
		$controller->logAction2(13,"CommentId=".$_GET["id"]);
	}
}

if ($_GET["action"]=="confirm" && is_numeric(trim($_GET["id"])))
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(16))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["id"]));
	$db->update("comments",array("isConfirmed"=>1,"confirmed"=>date("Y-m-d H:i:s"),"confirmedById"=>$access->userId,"confirmedByIP"=>$_SERVER["REMOTE_ADDR"]));
	if($db->count > 0)
	{
		$messages["success"] = $content["CHANGED"];
		$controller->logAction2(50,"CommentId=".$_GET["id"]);
	}
}

if ($_GET["action"]=="editComment" && is_numeric($_POST["pcommentId"]) && trim($_POST["pcomment"]) != "")
{
	$result = "success";
	$messages = array();
	$db->where("id=".$_POST["pcommentId"]);
	$res = $db->update("comments",array("comment"=>trim($_POST["pcomment"]),
										"updated"=>date("Y-m-d H:i:s"),
										"updatedById"=>$access->userId,
										"updatedByIP"=>$_SERVER['REMOTE_ADDR'])); echo $db->getLastError();echo $db->getLastQuery();
	if($res > 0)
	{
		$messages["success"] = $content["COMMENTUPDATED"];
		$controller->logAction2(12,"CommentId=".$_POST["pcommentId"]);
		//$controller->logAction(13);
	}
}
?>