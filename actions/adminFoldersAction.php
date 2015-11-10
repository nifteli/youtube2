<?php
if ($_GET["action"]=="editFolder" && is_numeric($_POST["folderId"]) && trim($_POST["folderName"]) != "")
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(29))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".$_POST["folderId"]);
	$res = $db->update("folders",array("name"=>trim($_POST["folderName"])));
	if($res)
	{
		$messages["success"] = $content["FOLDEREDITED"];
		$db->commit();
	}
	else
	{
		$result = "error";
		$messages["err"] = $content["FOLDERNOTEDITED"];
		$db->rollback();
	}
}

if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(22))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array("id" => $content['ID'],
					"name" => $content['FOLDERNAME'],
					"createdById" => $content['AUTHORID'],
					"createdByIP" => $content['AUTHORIP'],
					"createdDate" => $content['ADDDATE'],
					"updatedDate" => $content['UPDATED'],
					"updatedById" => $content['UPDATEDBYID'],
					"updatedByIP" => $content['UPDATEDBYIP'],
					"updatedBy" => $content['UPDATEDBY'],
					"athor" => $content['AUTHOR']
					);
	$links = $controller->getFolders(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLEFOLDERS']);
	return;
}

if ($_GET["action"]=="delete" && is_numeric(trim($_GET["id"])))
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(12))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["id"]));
	$db->update("folders",array("isDeleted"=>1,
								"deleted"=>date("Y-m-d H:i:s"),
								"deletedById"=>$access->userId,
								"deletedByIP"=>$_SERVER["REMOTE_ADDR"]));
	if($db->count>0)
		$messages["success"] = $content["REMOVED"];
}
?>