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
	$tagStr = isset($_POST["tagsp"]) ? $_POST["tagsp"] : "";
	$tags = array_unique(explode(",", $tagStr));
	if(count($tags) < 2)
	{
		$result = "error";
		$messages["err"] = $content["NOTENGOUGHTAG"];
		return;
	}
	foreach($tags as $tag)
	{
		if(strlen(trim($tag)) == 1)
		{
			$result = "error";
			$messages["err"] = $content["SHORTTAG"];
			return;
		}
	}
	$continue = true;
	$db->startTransaction();
	$db->where("id=".$_POST["folderId"]);
	$res = $db->update("folders",array("name"=>trim($_POST["folderName"]),
										"updated"=>date("Y-m-d H:i:s"),
										"updatedById"=>$access->userId,
										"updatedByIP"=>$_SERVER['REMOTE_ADDR']));
	if($res)
	{
		$db->rawQuery("delete from foldertags where folderId=".$_POST["folderId"]);
		foreach($tags as $tag)
		{
			$db->where("name='" . trim($tag) . "' and langId=".$langIds[$_SESSION["lang"]]);
			$res = $db->getOne("tags");
			
			
			if ($db->count == 1) 
				$id = $res["id"];
			else
				$id = $db->insert("tags", array("name"=>trim($tag),
										"langId"=>$langIds[$_SESSION["lang"]],
										"created"=>date("Y-m-d H:i:s"),
										"createdById"=>$access->userId));
			if($id)
			{
				
				$id = $db->insert("foldertags", array("tagId"=>$id,
									"folderId"=>$_POST["folderId"]));
									//echo "Error=".$db->getLastError()."<br>"; echo "Query=".$db->getLastQuery()."<br>";
			}
			
			if(!$id)
			{ 
				$continue = false;
				break;
			}
		}
		if($continue)
		{
			$db->commit();
			$controller->logAction(16);
			$messages["success"] = $content["FOLDEREDITED"];
		}
		else
			$db->rollback();
	}
	else
	{
		$result = "error";
		$messages["err"] = $content["FOLDERNOTEDITED"];
		$db->rollback();
	}
	
	
	// $db->where("id=".$_POST["folderId"]);
	// $res = $db->update("folders",array("name"=>trim($_POST["folderName"])));
	// if($res)
	// {
		// $messages["success"] = $content["FOLDEREDITED"];
		// $db->commit();
	// }
	// else
	// {
		// $result = "error";
		// $messages["err"] = $content["FOLDERNOTEDITED"];
		// $db->rollback();
	// }
}

if ($_GET["action"]=="addNewFolder" && $access->hasAccess && trim($_POST["folderName"]) != "" && is_numeric($_POST["userId"]))
{ 
	if(!$access->authorized(55))
	{
		$result = "error";
		$messages["err"] = $content["INSUFFACCESS"];
		return;
	}
	if(strlen(trim($_POST["folderName"])) < 3 || strlen(trim($_POST["folderName"])) > 25)
	{
		$result = "error";
		$messages["err"] = $content["SHORTFOLDERNAME"];
		return;
	}
	$tagStr = isset($_POST["tagsp"]) ? $_POST["tagsp"] : "";
	$tags = array_unique(explode(",", $tagStr));
	if(count($tags) < 2)
	{
		$result = "error";
		$messages["err"] = $content["NOTENGOUGHTAG"];
		return;
	}
	foreach($tags as $tag)
	{
		if(strlen(trim($tag) == 1))
		{
			$result = "error";
			$messages["err"] = $content["SHORTTAG"];
			return;
		}
	}
	$continue = true;
	$db->startTransaction();
	$folderId = $db->insert("folders",array("name" => trim($_POST["folderName"]),
									  "created" =>date("Y-m-d H:i:s"),
									  "createdById" => $_POST["userId"],
									  "createdByIP" => $_SERVER['REMOTE_ADDR'])); 
	if($folderId)
	{
		foreach($tags as $tag)
		{
			$db->where("name='" . trim($tag) . "' and langId=".$langIds[$_SESSION["lang"]]);
			$res = $db->getOne("tags");
			if ($db->count == 1) 
				$id = $res["id"];
			else
				$id = $db->insert("tags", array("name"=>trim($tag),
										"langId"=>$langIds[$_SESSION["lang"]],
										"created"=>date("Y-m-d H:i:s"),
										"createdById"=>$_POST["userId"]));
			if($id)
			{
				$id = $db->insert("foldertags", array("tagId"=>$id,
									"folderId"=>$folderId));
			}
			
			if(!$id)
			{
				$continue = false;
				break;
			}
		}
		if($continue)
		{
			$db->commit();
			$okMessage = $content["FOLDERADDED"];
			$controller->logAction(15);
		}
		else
			$db->rollback();
	}
	else
	{
		$db->rollback();
		$messages["err"] = $content["FOLDERNOTADDED"];
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

	$fields = array("createdDate" => $content['ADDDATE'],
					"updatedDate" => $content['UPDATED'],
					"lastVideoAddedDate" => $content['LASTVIDEOADDED'],
					"deletedDate" => $content['DELETED'],
					"id" => $content['ID'],
					"name" => $content['FOLDERNAME'],
					"tags" => $content['TAGS'],
					"createdById" => $content['AUTHORID'],
					"athor" => $content['AUTHOR'],
					"createdByIP" => $content['AUTHORIP'],
					"updatedById" => $content['UPDATEDBYID'],
					"updatedByIP" => $content['UPDATEDBYIP'],
					"updatedBy" => $content['UPDATEDBY'],
					"deletedById" => $content['DELETEDBYID'],
					"deletedBy" => $content['DELETEDBY'],
					"deletedByIP" => $content['DELETEDBYIP'],
					"tagCnt" => $content['lnTagCnt'],
					"videoCnt" => $content['lnVideoCnt']
					);
	$links = $controller->getFolders(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->logAction(18);
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
	{
		$messages["success"] = $content["REMOVED"];
		$controller->logAction(17);
	}
}
?>