<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'edit')
{
	$continue = true;
	$result="";
	
	$messages = array();
	
	//echo "<pre>"; print_r($_POST); echo "</pre>";return;
	$db->startTransaction();
	foreach($_POST["catAzArr"] as $id=>$data)
	{
		$db->where("id=".$id);
		$rst = $db->update("categories",array("catNameAz"=>$data,
											  "catInfoAz"=>$_POST["catInfoAzArr"][$id],
											  "catNameEn"=>$_POST["catEnArr"][$id],
											  "catInfoEn"=>$_POST["catInfoEnArr"][$id],
											  "catNameRu"=>$_POST["catRuArr"][$id],
											  "catInfoRu"=>$_POST["catInfoRuArr"][$id],
											  "img"=>"./uploads/catIcons/$id.png"
											  ));
				//echo $db->getLastQuery(); echo "res=".$rst; return;
		if(!$rst)
		{
			$result = "error";
			//echo "eror on update ".trim($tag);
			break;
		}
		else
		{
			$result = "success";
			//echo trim($tag)." updated<br>";
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

	$fields = array("name" => $content['TAG'],
					"lang" => $content['LANGUAGE']
					);
	$links = $controller->getTags(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
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
		$messages["success"] = $content["REMOVED"];
}
?>