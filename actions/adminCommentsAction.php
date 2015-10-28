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

	$fields = array("id" => $content['ID'],
					"comment" => $content['COMMENT'],
					"videoId" => $content['VIDEOID'],
					"createdById" => $content['AUTHORID'],
					"userIP" => $content['AUTHORIP'],
					"createdDate" => $content['ADDDATE'],
					"updatedDate" => $content['UPDATED'],
					"updatedById" => $content['UPDATEDBYID'],
					"updatedByIP" => $content['UPDATEDBYIP'],
					"updatedBy" => $content['UPDATEDBY'],
					"athor" => $content['AUTHOR'],
					"isConfirmed" => $content['CONFIRMED'],
					"confirmedByIP" => $content['CONFIRMERIP'],
					"confirmer" => $content['CONFIRMER']
					);
	$links = $controller->getComments(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLECOMMENTS']);
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
		$messages["success"] = $content["REMOVED"];
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
	$db->update("comments",array("isConfirmed"=>1,"confirmedById"=>$access->userId,"confirmedByIP"=>$_SERVER["REMOTE_ADDR"]));
	if($db->count > 0)
		$messages["success"] = $content["CHANGED"];
}
?>