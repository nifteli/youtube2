<?php
if ($_GET["action"]=="add")
{
	$result = "success";
	$messages = array();
	
	if(!isset($_POST["videoLink"]) || $_POST["videoLink"] == "")
	{
		$result = "error";
		$messages["videoLink"] = "Video Link is not set";
	}
	else if(!isset($_POST["validVideo"]) || $_POST["validVideo"] == "false")
	{
		$result = "error";
		$messages["videoLink"] = "Video does not exist";
	}
	if(!isset($_POST["language"]) || $_POST["language"] == "0")
	{
		$result = "error";
		$messages["language"] = "Language is not set";
	}
	if(!isset($_POST["videoQuestion"]) || $_POST["videoQuestion"] == array())
	{
		$result = "error";
		$messages["videoQuestion"] = "Video question is not set";
	}
	if(!isset($_POST["videoName"]) || $_POST["videoName"] == "")
	{
		$result = "error";
		$messages["videoName"] = "Video name is not set";
	}
	if(!isset($_POST["category"]) || array_sum($_POST["category"]) == 0)
	{
		$result = "error";
		$messages["category"] = "Category is not set";
	}
	
	//check if videolink is added to the category before
	$categories = array_unique($_POST["category"]);
	$cats = join(",", $categories);
	$res = $db->rawQuery("SELECT GROUP_CONCAT(' ', c.catName$lang) duplicates FROM 
							videos v
							inner join videocats vc on vc.videoId=v.id
							inner join categories c on c.id=vc.categoryId
							WHERE v.link='". trim($_POST["videoLink"]) ."' and vc.categoryId in (".$cats.") 
							group by v.link");
	if($db->count>0)
	{
		$result = "error";
		$messages["duplicate"] = "This video link is already added to category ".$res[0]["duplicates"];
	}	
	
	$tagStr = isset($_POST["tags"]) ? $_POST["tags"] : "";
	
		
	if($result == "success")
	{
		$db->startTransaction();
		
		$questions = array_sum($_POST["videoQuestion"]);
		$tags = explode(",", $tagStr);
		$continue = true;
		
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
			foreach($categories as $key => $value)	
			{
				if($value != "0")
				{
					
					$id = $db->insert("videocats", array("videoId"=>$videoId,
									  	"categoryId"=>$value));
					if(!$id)
					{
						$continue = false;
						break;
					}
				}
				
				
			}
			if($continue)
			{
				foreach($tags as $tag)
				{
					$id = $db->insert("tags", array("name"=>trim($tag)));
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
			$messages["dbError"] = "DB error";
		}
		else
			$db->commit();
		
	}
		
	if($result=="success")
		$messages["success"] = "Video added";
}
?>