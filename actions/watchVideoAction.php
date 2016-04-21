<?php
	$result = "success";
	$messages = array();
	
if ($_GET["action"]=="comment" && is_numeric($_GET["id"]))
{
	if($access->hasAccess)
		if(!$access->authorized(51))
		{
			$result = "error";
			$messages['noaccess'] = $content["INSUFFACCESS"];
			return;
		}
	if(!isset($_POST["comment"]) || $_POST["comment"] == "")
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	if(!$access->hasAccess && (!isset($_POST["email"]) || $_POST["email"] == ""))
	{
		$result = "error";
		$messages["noEmail"] = $content["NOEMAIL"];
	}
	if(!isset($_GET["id"]) || $_GET["id"] == "" || $_GET["id"] < 0)
	{
		$result = "error";
		$messages["noVideoId"] = $content["NOID"];
	}
	
	if($result == "success")
	{
		//$db->startTransaction();
		$isConfirmed = 1;
		$email = "";
		if(isset($_POST["email"]) && $_POST["email"] != "")
		{
			$email = $_POST["email"];
			$isConfirmed = 0;
		}
		
		
		$commentId = $db->insert("comments", array("comment"=>trim($_POST["comment"]),
												  "videoId"=>trim($_GET["id"]),
												  "createdById"=>$access->userId,
												  "userIP"=>$_SERVER['REMOTE_ADDR'],
												  "isConfirmed"=>$isConfirmed,
												  "email"=>$email,
												  "created"=>date("Y-m-d H:i:s")));
		if($commentId && isset($_POST["email"]) && $_POST["email"] != "")
		{
			$okMessage = $content["COMMENTSENT2CONF"];
			
			
		}
		if($commentId && $_POST["email"] == "")
		{
			$res = $db->rawQuery("select getEmailOnVideoComment,getEmailAfterMyComment,email,firstName,lastName from users
								where id = (select addedById from videos where id=".trim($_GET["id"]).")");
								//print_r($res);
			if($res[0]["getEmailOnVideoComment"] == 1 && $res[0]["email"] != "")
			{
				$mail->addAddress($res[0]["email"], $res[0]["firstName"].' '.$res[0]["lastName"]);     // Add a recipient Name is optional	
				$mail->Subject = $content["getEmailOnComment"];
				$mail->Body    = $content["getEmailOnCommentBody"]."<br><a href=$domain?page=watchVideo&id=".trim($_GET["id"]).">$domain</a>";
				$mail->send();
				$mail->ClearAllRecipients( );
			}
			
			$res = $db->rawQuery("select getEmailOnVideoComment,getEmailAfterMyComment,email,firstName,lastName from users
								where id in (select createdById from comments where videoId = ".trim($_GET["id"]).")
								and id != ".$access->userId);
								//print_r($res);
			for($i=0; $i<count($res); $i++)
			{
				if($res[$i]["getEmailAfterMyComment"] == 1 && $res[$i]["email"] != "")
				{
					$mail->addAddress($res[$i]["email"], $res[$i]["firstName"].' '.$res[$i]["lastName"]);     // Add a recipient Name is optional	
					$mail->Subject = $content["getEmailAfterMyComment"];
					$mail->Body    = $content["getEmailAfterMyCommentBody"]."<br><a href=$domain?page=watchVideo&id=".trim($_GET["id"]).">$domain</a>";
					$mail->send();
					$mail->ClearAllRecipients( );
				}
			}
		}
		//$db->commit();
	}
}
if($_GET["action"]=="editComment")
{
	if(!$access->authorized(52))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	if(!isset($_GET["commentId"]) || $_GET["commentId"] == "" || $_GET["commentId"]<0)
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	
	if(!isset($_POST["comment".$_GET["commentId"]]) || trim($_POST["comment".$_GET["commentId"]]) == "")
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	
	if(!isset($_GET["id"]) || $_GET["id"] == "" || $_GET["id"] < 0)
	{
		$result = "error";
		$messages["noVideoId"] = $content["NOID"];
	}
	if($result == "success")
	{
		//$db->startTransaction();
		$db->where("id=".$_GET["commentId"]." and createdById=".$access->userId);
		$commentId = $db->update("comments", array("comment"=>trim($_POST["comment".$_GET["commentId"]]),
												  "updatedByIP"=>$_SERVER['REMOTE_ADDR'],
												  "updatedById"=>$access->userId,
												  "updated"=>date("Y-m-d H:i:s")));
		
		//$db->commit();
		
	}	
}

if($_GET["action"]=="delComment")
{
	if(!isset($_GET["commentId"]) || $_GET["commentId"] == "" || $_GET["commentId"]<0)
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	if($result == "success")
	{
		$db->where("id=".$_GET["commentId"]." and createdById=".$access->userId);
		$db->delete("comments");
	}
}

if($_GET["action"]=="add2Folder")
{
	if(!$access->authorized(57))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	if(is_numeric($_GET["id"]) && is_numeric($_POST["folderId"]))
	{
		$res = $db->insert("foldervideos", array("folderId"=>trim($_POST["folderId"]),
												  "videoId"=>trim($_GET["id"]),
												  "addedByIP"=>$_SERVER['REMOTE_ADDR'],
												  "added"=>date("Y-m-d H:i:s")));
		if($db->count > 0) 
			$okMessage = $content["ADDEDTOFOLDER"];
		
	}
	if($_GET["from"] == "main")
	{
		header("Location: index.php");
	}
}
if ($_GET["action"]=="addNewFolder" && $access->hasAccess && trim($_POST["folderName"]) != "")
{
	if(strlen(trim($_POST["folderName"])) < 3)
	{
		$result = "error";
		$errorMessage = $content["SHORTFOLDERNAME"];
		return;
	}
	if(!$access->authorized(57))
	{
		$result = "error";
		$errorMessage = $content["INSUFFACCESS"];
		return;
	}
	
	if(is_numeric($_GET["id"]))
	{
		$tagStr = isset($_POST["tags"]) ? $_POST["tags"] : "";
		$tags = array_unique(explode(",", $tagStr));
		$continue = true;
		$db->startTransaction();
		$folderId = $db->insert("folders",array("name" => trim($_POST["folderName"]),
										  "created" =>date("Y-m-d H:i:s"),
										  "createdById" => $access->userId,
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
											"createdById"=>$access->userId));
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
				$res = $db->insert("foldervideos", array("folderId"=>trim($folderId),
													  "videoId"=>trim($_GET["id"]),
													  "addedByIP"=>$_SERVER['REMOTE_ADDR'],
													  "added"=>date("Y-m-d H:i:s")));
				if($db->count > 0) 
				{
					$db->commit();
					$okMessage = $content["ADDEDTOFOLDER"];
				}
			}
			else
				$db->rollback();
		}
		else
		{
			$db->rollback();
			$errorMessage = $content["FOLDERNOTADDED"];
		}
	}
	
}
if($_GET["action"]=="delFromFolder")
{
	if($_GET["id"] > 0)
	{
		$qry = "delete from foldervideos 
				where videoId = $_GET[id] and exists(select 1 from folders where folders.id=foldervideos.folderId and createdById=".$access->userId.")";
		$db->rawQuery($qry);
		if($db->count>0) 
			$okMessage = $content["REMOVEDFROMFOLDER"];
		
	}
	if($_GET["from"] == "main")
	{
		header("Location: index.php");
	}
}

if($_GET["action"]=="reportVideo")
{
	if(trim($_GET["id"]) > 0 && $_POST["reasonId"] > 0)
	{
		$db->where("videoId=".trim($_GET["id"])." and reporterId=".$access->userId);
		$db->get("videoreports");
		if($db->count>0)
		{
			$result = "error";
			$messages[] = $content["DUPLICATEREPORT"];
			return;
		}
		if(strlen(trim($_POST["desc"])) < 5)
		{
			$result = "error";
			$messages[] = $content["SHORTDESC"];
			return;
		}
		
		$res = $db->insert("videoreports", array("videoId"=>trim($_GET["id"]),
												  "reasonId"=>$_POST["reasonId"],
												  "desc"=>trim($_POST["desc"]),
												  "reporterId"=>$access->userId,
												  "reportDate"=>date("Y-m-d H:i:s")));
		if($db->count > 0) 
		{
			$okMessage = $content["REPORTSAVED"];
			$res = $db->rawQuery("select email,firstName,lastName from users
								where roleId in (select roleId from roleaccess where accessTypeId=58)");
								//print_r($res);
			for($i=0; $i<count($res); $i++)
			{
				if($res[$i]["email"] != "")
				{
					$mail->addAddress($res[$i]["email"], $res[$i]["firstName"].' '.$res[$i]["lastName"]);     // Add a recipient Name is optional	
					$mail->Subject = $content["REPORTEMAILSUBJECT"];
					$mail->Body    = $content["REPORTEMAILBODY"].trim($_GET["id"]);
					$mail->send();
					$mail->ClearAllRecipients( );
				}
			}
		}
		
	}
}
?>