<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(21))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$fields = array("id" => $content['ID'],
					"name" => $content['VIDEONAME'],
					"info" => $content['INFORMATION'],
					"questions" => $content['VIDEOQUESTION'],
					"added" => $content['ADDDATE'],
					"lang" => $content['LANGUAGE'],
					"link" => $content['VIDEOLINK'],
					"addedBy" => $content['ADDEDBY'],
					"tags" => $content['TAGS'],
					"catName" => $content['CATEGORY'],
					"addedByIP" => $content['ADDEDBYIP'],
					"updated" => $content['UPDATED'],
					"duration" => $content['DURATION'],
					"reportCount" => $content['REPORTCOUNT']		
					);
	$links = $controller->getVideoLinks(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLEVIDEOLINKS']);
	return;
}
if ($_GET["action"]=="delete" && trim($_GET["videoId"]) != "")
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(9))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["videoId"]));
	$db->update("videos",array("isDeleted"=>1,
								"deleted"=>date("Y-m-d H:i:s"),
								"deletedById"=>$access->userId));
	if($db->count>0)
		$messages["success"] = $content["REMOVED"];
}
?>