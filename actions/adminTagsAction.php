<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'substitute' && count($_POST["newTag"]) > 0)
{
	$continue = true;
	$result="";
	
	$messages = array();
	
	//echo "<pre>"; print_r($_POST); echo "</pre>";return;
	$db->startTransaction();
	foreach($_POST["newTag"] as $key=>$tag)
	{
		if(trim($tag) !="" && $continue)
		{
		//echo "id=$key newTag=$value<br>";
			$db->where("name='" . trim($tag) . "' and langId=".$_POST["langId"][$key]);
			$res = $db->getOne("tags");
			if ($db->count == 1) 
			{		//echo trim($tag)." exists <br>";
				if($key == $res["id"])
				{		 //echo trim($tag)." equal to ".$res["name"]." coninue<br>";
					continue;
				}
				$db->where("id=".$res["id"]);
				$cnt = $db->delete("tags");
				if($cnt)
				{		//echo $res["name"]." deleted<br>";
					$db->where("tagId=".$res["id"]);
					$rst = $db->update("videoTags",array("tagid"=>$key));
					if(!$rst)
					{
						//echo "problem on update videoTags for ". $res["name"]."<br>";
						$continue = false;
					}
					//else echo "updated videoTags for ". $res["name"]."<br>";
				}
				else
				{
					$continue = false;
					//echo "problem on deletetion of duplicate tag ".$res["name"]."<br>";
				}
			}
			$db->where("id=" . $key);
			$res = $db->update("tags", array("name"=>trim($tag),
											  "updated"=>date("Y-m-d H:i:s"),
											  "updatedById"=>$access->userId,
											  "updatedByIP"=>$_SERVER["REMOTE_ADDR"]
											  ));
						
			if(!$res)
			{
				$continue = false;
				$result = "error";
				//echo "eror on update ".trim($tag);
				break;
			}
			else
			{
				$result = "success";
				$controller->logAction(19);
				//echo trim($tag)." updated<br>";
			}
		}
	}
	if($result == "success")
	{
		$messages['success'] = $content["SUCCESSFULLYSAVED"];
		$db->commit();
	}
	else
	{
		$messages['success'] = $content["ERRORONSAVE"];
		$db->rollback();
	}
}

if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(23))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array(
					"created" => $content['DATECREATED'],
					"lang" => $content['LANGUAGE'],
					"name" => $content['TAG'],
					"createdById" => $content['CREATEDBYID'],
					"createdBy" => $content['CREATEDBY'],
					"createdByIP" => $content['CREATEDBYIP'],
					"updated" => $content['DATEUPDATED'],
					"updatedById" => $content['UPDATEDBYID'],
					"updatedBy" => $content['UPDATEDBY'],
					"updatedByIP" => $content['UPDATEDBYIP'],
					"videoCntTagged" => $content['VIDEOCNTTAGGED'],
					"userCntClicked" => $content['USERCNTCLICKED'],
					"clickCnt" => $content['CLICKCNT']
					);
	$links = $controller->getTags(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->logAction(22);
	$controller->exportToExcel($fields,$links,$content['TITLETAGS']);
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
		$controller->logAction(21);
	}
}
?>