<?php
if ($_GET["action"]=="add")
{
	if(!$access->authorized(48))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$result = "success";
	$messages = array();
	
	if(!isset($_POST["videoLink"]) || $_POST["videoLink"] == "")
	{
		$result = "error";
		$messages["videoLink"] = $content['ADDVIDEOERROR1'];
	}
	else if(!isset($_POST["validVideo"]) || $_POST["validVideo"] == "false")
	{
		$result = "error";
		$messages["videoLink"] = $content['ADDVIDEOERROR2'];
	}
	if(!isset($_POST["language"]) || $_POST["language"] == "0")
	{
		$result = "error";
		$messages["language"] = $content['ADDVIDEOERROR3'];
	}
	if(!isset($_POST["videoQuestion"]) || $_POST["videoQuestion"] == array())
	{
		$result = "error";
		$messages["videoQuestion"] = $content['ADDVIDEOERROR4'];
	}
	if(!isset($_POST["videoName"]) || $_POST["videoName"] == "")
	{
		$result = "error";
		$messages["videoName"] = $content['ADDVIDEOERROR5'];
	}
	if(!isset($_POST["category"]) || array_sum($_POST["category"]) == 0)
	{
		$result = "error";
		$messages["category"] = $content['ADDVIDEOERROR6'];
	}
	
	//check if videolink is added to the category before
	if(isset($_POST["category"]) && array_sum($_POST["category"]) > 0)
	{
		$categories = array_unique($_POST["category"]);
		$cats = join(",", $categories);
	}
	if(isset($_POST["category"]) && array_sum($_POST["category"]) > 0 && !isset($_GET["videoId"]))
	{
		$res = $db->rawQuery("SELECT GROUP_CONCAT(' ', c.catName$lang) duplicates FROM 
								videos v
								inner join videocats vc on vc.videoId=v.id
								inner join categories c on c.id=vc.categoryId
								WHERE v.link='". trim($_POST["videoLink"]) ."' and vc.categoryId in (".$cats.") 
								group by v.link");
		if($db->count>0)
		{
			$result = "error";
			$messages["duplicate"] = $content['ADDVIDEOERROR7'].$res[0]["duplicates"];
		}	
		
	}
	$tagStr = isset($_POST["tags"]) ? $_POST["tags"] : "";
	$tags = array_unique(explode(",", $tagStr));
	
	if(count($tags) < 3)
	{
		$result = "error";
		$messages["notEnoughTags"] = $content['ADDVIDEOERROR10'];
	}
		
	if($result == "success")
	{
		$questions = array_sum($_POST["videoQuestion"]);
		$db->startTransaction();
		
		
		
		$continue = true;
		
		if(isset($_GET["videoId"]) && $_GET["videoId"] > 0 && is_numeric($_GET["videoId"]))
		{
			if(!$access->authorized(49))
			{
				$result = "error";
				$messages['noaccess'] = $content["INSUFFACCESS"];
				return;
			}
			$videoId = $_GET["videoId"];
			if($access->authorized(8))
				$db->where("id=".$videoId);
			else
				$db->where("id=".$videoId." and addedById=".$access->userId	);
			$db->update("videos", array("link"=>trim($_POST["videoLink"]),
									  "languageId"=>$_POST["language"],
									  "questions"=>$questions,
									  "name"=>$_POST["videoName"],
									  "updated"=>date("Y-m-d H:i:s"),
									  "info"=>$_POST["information"],
									  "updatedById"=>$access->userId,
									  "duration"=>$_POST["duration"]));
			if($db->count == 0)
			{
				$result = 'error';
				$messages["noAccess"] = $content["INSUFFACCESS"];
			}

		}
		else
			$videoId = $db->insert("videos", array("link"=>trim($_POST["videoLink"]),
									  "languageId"=>$_POST["language"],
									  "questions"=>$questions,
									  "name"=>$_POST["videoName"],
									  "added"=>date("Y-m-d H:i:s"),
									  "info"=>$_POST["information"],
									  "addedById"=>$access->userId,
									  "addedByIP"=>$_SERVER["REMOTE_ADDR"],
									  "duration"=>$_POST["duration"]));
		if($videoId)
		{
			$db->where("videoId=".$videoId);
			$db->delete("videocats");
			
			foreach($categories as $key => $value)	
			{
				if($value != "0")
				{
					$id = $db->insert("videocats", array("videoId"=>$videoId,
									  	"categoryId"=>$value));
					$db->where("id =".$value);
					$db->update("categories",array("lastVideoAdded"=>date("Y-m-d H:i:s")));
					
					$subject = $content["SUBSCRIPTIONSUBJECT"];
					$body = $content["SUBSCRIPTIONBODY"]."\n <br> <a href='$domain?page=watchVideo&id=$videoId'>$domain?page=watchVideo&id=$videoId</a>";
					$db->rawQuery("insert into subsmails (sendTo,subject,body,status) 
									SELECT 
									u.email,'$subject','" . base64_encode ($body) . "',0
									FROM subscriptions s
									inner join users u on u.id=s.userId
									where s.catId=$value and u.email!='' and u.email is not null");
					if(!$id)
					{
						$continue = false;
						//break;
					}
				}
				
				
			}
			if($continue)
			{
				$db->where("videoId=".$videoId);
				$db->delete("videotags");
			
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
												"createdById"=>$access->userId,
												"createdByIP"=>$_SERVER["REMOTE_ADDR"]));
					if($id)
					{
						$id = $db->insert("videotags", array("tagId"=>$id,
									  		"videoId"=>$videoId));
					}
					
					if(!$id)
					{
						$continue = false;
						break;
					}
				}
			}
			
		}
		
		if(!$continue)
		{
			$db->rollback();
			$result = "error";
			$messages["dbError"] = $content['ADDVIDEOERROR8'];
		}
		else
			$db->commit();
		
	}
		
	if($result=="success")
		$messages["success"] = $content['ADDVIDEONOTF1'];
}
?>