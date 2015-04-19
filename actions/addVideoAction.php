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
	if(!isset($_POST["language"]) || $_POST["language"] == "0")
	{
		$result = "error";
		$messages["language"] = "Language is not set";
	}
	if(!isset($_POST["videoQuestion"]) || $_POST["videoQuestion"] == [])
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
		
	if($result == "success")
	{
		$db->startTransaction();
		
		$questions = array_sum($_POST["videoQuestion"]);
		$categories = array_unique($_POST["category"]);
		
		$videoId = $db->insert("videos", array("link"=>trim($_POST["videoLink"]),
								  "languageId"=>$_POST["language"],
								  "questions"=>$questions,
								  "name"=>$_POST["videoName"],
								  "info"=>$_POST["information"],
								  "addedById"=>$access->userId,
								  "addedByIP"=>$_SERVER["REMOTE_ADDR"],
								  "duration"=>0
								  )
					);
		$cnt = count($categories);
		$id = true;
		foreach($categories as $key => $value)	
		{
			if($value != "0")
			{
				
				$id = $db->insert("videocats", array("videoId"=>$videoId,
								  	"categoryId"=>$value
							  	  	)
							);
			}
			
			if(!$id)
				$videoId = false;
		}
		
		if(!$videoId)
		{
			$db->rollback();
			$messages["dbError"] = "DB error";
		}
		else
			$db->commit();
		
	}
		
	if($result=="success")
		$messages["success"] = "Video added";
}
?>