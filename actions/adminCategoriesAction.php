<?php

//echo "<pre>"; print_r($_POST); print_r($_FILES); echo "</pre>";//return;
if ($_GET["action"]=="filter" && $_POST["action"] == 'edit')
{
	$result="";
	//echo "<br><br><br>here";
	////////////
	$uploads_dir =  $appDirectory .$catImgPath;
	if(count($_FILES["catImgArr"]["error"]) > 0)
	foreach ($_FILES["catImgArr"]["error"] as $key => $error) {
		if ($error == UPLOAD_ERR_OK) {
			$tmp_name = $_FILES["catImgArr"]["tmp_name"][$key];
			$name[$key] = $key.$_FILES["catImgArr"]["name"][$key];
			move_uploaded_file($tmp_name, $uploads_dir.$name[$key]);
		}
	}
	/////////////
	
	$messages = array();
	
	//echo "<pre>"; print_r($_FILES); echo "</pre>";//return;
	$db->startTransaction();
	if(count($_POST["catAzArr"]) > 0)
	foreach($_POST["catAzArr"] as $id=>$data)
	{
		$upFileName = basename($_FILES["catImgArr"]["name"][$id]);
		if($_FILES["catImgArr"]["name"][$id] =! "")
		{
			$target_file = $appDirectory .$catImgPath . $upFileName;
			$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
			if(($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "pjpeg" || $imageFileType == "gif") &&
				$_FILES["catImgArr"]["size"][$id] < $maxPicSize * 1024 * 1024)
			{
				move_uploaded_file($_FILES["catImgArr"]["tmp_name"][$id], $catImgPath.$id.".".$imageFileType);
			}
		}
		$updArr = array("catNameAz"=>$data,
						  "catGroupId"=>trim($_POST["catGroupIdArr"][$id]),
						  "catInfoAz"=>trim($_POST["catInfoAzArr"][$id]),
						  "catNameEn"=>trim($_POST["catEnArr"][$id]),
						  "catInfoEn"=>trim($_POST["catInfoEnArr"][$id]),
						  "catNameRu"=>trim($_POST["catRuArr"][$id]),
						  "catInfoRu"=>trim($_POST["catInfoRuArr"][$id]),
						  "questions"=>array_sum($_POST["videoQuestion"][$id]),
						  "updated"=>date("Y-m-d H:i:s"));
		if(trim($name[$id]) != "")
			$updArr["img"] = ".".$catImgPath.$name[$id];
		$db->where("id=".$id);
		$rst = $db->update("categories",$updArr);
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

if ($_GET["action"]=="addCat")
{
	$result="success";
	if(!$access->authorized(44))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	if(trim($_POST["catAz1"]) != "" && trim($_POST["catEn1"]) != "" && trim($_POST["catRu1"]) != "" )
	{
		$uploads_dir =  $appDirectory .$catImgPath;
		
		
		$insArr = array("catNameAz"=>trim($_POST["catAz1"]),"catNameEn"=>trim($_POST["catEn1"]),"catNameRu"=>trim($_POST["catRu1"]),
						"createdById"=> $access->userId, "createdByIP"=>$_SERVER["REMOTE_ADDR"],"created"=>date("Y-m-d H:i:s"),
						"questions"=>array_sum($_POST["videoQuestion"][0]));
		//echo "<pre>";print_r($_POST);echo "</pre>";
		if(trim($_POST["catGroup1"]) != "")
			$insArr["catGroupId"] = trim($_POST["catGroup1"]);
		if(trim($_POST["catInfoAz1"]) != "")
			$insArr["catInfoAz"] = trim($_POST["catInfoAz1"]);
		if(trim($_POST["catInfoEn1"]) != "")
			$insArr["catInfoEn"] = trim($_POST["catInfoEn1"]);
		if(trim($_POST["catInfoRu1"]) != "")
			$insArr["catInfoRu"] = trim($_POST["catInfoRu1"]);
		$id = $db->insert("categories",$insArr);
		if($id)
		{
			if ($_FILES["img"]["error"] == UPLOAD_ERR_OK) 
			{
				$tmp_name = $_FILES["img"]["tmp_name"];
				$name = $id.$_FILES["img"]["name"];
				move_uploaded_file($tmp_name, $uploads_dir.$name);
				$db->where("id=$id");
				$db->update("categories",array("img"=>".".$catImgPath.$name));
			}
			$messages['success'] = $content["SUCCESSFULLYSAVED"];
		}
		else
		{
			$result = "error";
			$messages['success'] = $content["ERRORONSAVE"];
		}
		
	}
}

if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(20))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array(
					"created" => $content['LASTVIDEOADDED'],
					"updated" => $content['UPDATED'],
					"lastVideoAdded" => $content['LASTVIDEOADDED'],
					"deleted" => $content['DELETED'],
					"id" => $content['ID'],
					"catQuestion" => $content['CATQUESTION'],
					"catGroup" => $content['CATGROUP'],
					"catInfoAz" => $content['CATAZ'],
					"catInfoAz" => $content['CATINFOAZ'],
					"catEn" => $content['CATEN'],
					"catInfoEn" => $content['CATINFOEN'],
					"catRu" => $content['CATRU'],
					"catInfoRu" => $content['CATINFORU'],
					"createdById" => $content['CREATEDBYID'],
					"createdBy" => $content['CREATEDBY'],
					"createdByIP" => $content['CREATEDBYIP'],
					"deletedById" => $content['DELETEDDBYID'],
					"deletedBy" => $content['DELETEDBY'],
					"deletedByIP" => $content['DELETEDBYIP'],
					"videoCntInCat" => $content['VIDEOCNTINCAT'],
					"userCntSubscribed" => $content['USERCNTSUBSCRIBED'],
					"clickUserCnt" => $content['CLICKUSERCNT'],
					"clickCnt" => $content['CLICKCNT']
					);
	$links = $controller->getAdminCategories(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLECATEGORIES']);
	return;
}

if ($_GET["action"]=="delete" && is_numeric(trim($_GET["id"])))
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(43))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["id"]));
	$db->update("categories",array("isDeleted"=>1,
								"deleted"=>date("Y-m-d H:i:s"),
								"deletedById"=>$access->userId,
								"deletedByIP"=>$_SERVER["REMOTE_ADDR"]));
	if($db->count>0)
		$messages["success"] = $content["REMOVED"];
}
?>