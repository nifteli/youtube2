<?php
if ($_GET["action"]=="sendMail")
{
//echo "<pre>"; print_r($_POST); echo "</pre>";//return;
	$result = "success";
	$messages = array();
	if(!$access->authorized(5))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$emails = explode(";",$_POST["to"]);
	$ccs = explode(";", $_POST["cc"]);
	//echo "emails=";print_r($emails);return;
	if(count($emails) > 0)
	{
		foreach($emails as $key => $email)
			$mail->addAddress($email);
		foreach($ccs as $key => $cc)
			$mail->addCC($cc);
			
		$mail->Subject = $_POST["subject"];
		$mail->Body    = $_POST["body"];
		
		//print_r($_FILES);return;
		if(isset($_FILES['attachment']['name']) || $_FILES['attachment']['tmp_name'] != "" )
		{
			$saveto = $tmpPath . $access->userId . basename($_FILES["attachment"]["name"]);
			move_uploaded_file($_FILES["attachment"]["tmp_name"], $saveto);
			$mail->AddAttachment($saveto);
		}
		
		if(!$mail->send())
			$result = "error";
		
			//echo "Mailer Error: " . $mail->ErrorInfo;
	}
	else
	{
		$result = "error";
	}
	
	if($result == "success")
	{
		$messages["success"] = $content["MAILSENT"];
		$db->insert("emails",array("sentDate" => date("Y-m-d H:i:s"),
								   "senderId" => $access->userId,
								   "subject" => $_POST["subject"],
								   "body" => $_POST["body"],
								   "senderIP" => $_SERVER["REMOTE_ADDR"],
								   "to" => $_POST["to"],
								   "attachment" => basename($_FILES["attachment"]["name"]),
								   ));
		if(file_exists($saveto))
			unlink($saveto);
	}
	else
		$messages["success"] = $content["MAILNOTSENT"];
	
}
//echo  "<br><br><br><pre>";print_r($_POST);echo  "</pre>";
if ($_GET["action"]=="set" && $_POST["action"] == "saveRoles")
{ 
	$result = "";
	$messages = array();
	if(!$access->authorized(39))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	if(count($_POST["roleId"]) >0)
	foreach ($_POST["roleId"] as $key=>$value)
	{
		if(trim($value) != "")
		{
			$db->where("id=".$key);
			$res = $db->update("users",array("roleId"=>$value));
			if(!$res)
			{
				$result = "error";
				break;
			}
			else
				$result = "success";
		}
	} 
	if($result == "success")
		$messages["success"] = $content["ROLESEDITED"];
	else
		$messages["success"] = $content["ROLESNOTEDITED"];
	
}
if ($_GET["action"]=="delete" && is_numeric(trim($_GET["id"])))
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(4))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["id"]));
	$db->update("users",array("isDeleted"=>1,
								"deleted"=>date("Y-m-d H:i:s"),
								"deletedById"=>$access->userId,
								"deletedByIP"=>$_SERVER["REMOTE_ADDR"]));
	if($db->count>0)
		$messages["success"] = $content["REMOVED"];
}

if ($_GET["action"]=="setUser" && is_numeric(trim($_GET["id"])))
{
	
	if(!$access->authorized(34))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id = " . trim($_GET["id"]));
	$usr = $db->getOne("users");
	//check user if registered or not
	if($db->count == 1)
	{ //echo "set values";print_r($usr); return;
		$_SESSION['userName'] = $usr["userName"];
		$access->setValues($db);
		header("Location: index.php");
	}
}

if ($_GET["action"]=="set" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(40))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array(
					"createdDate" => $content['DATECREATED'],
					"updatedDate" => $content['DATEUPDATED'],
					"deletedDate" => $content['DATEDELETED'],
					"id" => $content['CODE'],
					"userName" => $content['USERNAME'],
					"firstName" => $content['NAME'],
					"fatherName" => $content['FATHERNAME'],
					"status" => $content['STATUS'],
					"roleName" => $content['ROLENAME'],
					"lastName" => $content['SURNAME'],
					"bDate" => $content['BIRTHDATE'],
					"email" => $content['EMAIL'],
					"phoneNumber" => $content['PHONE'],
					"notes" => $content['NOTES'],
					"gender" => $content['GENDER'],
					"lang" => $content['LANGUAGE'],
					"profession" => $content['POSITION'],
					"interests" => $content['INTERESTS'],
					"registeredByIP" => $content['REGISTEREDBYIP'],
					"regDevice" => $content['REGDEVICE'],
					"regBrowser" => $content['REGBROWSER'],
					"updateUserId" => $content['LASTUPDATEUSERID'],
					"deletedById" => $content['DELETEDBYID'],
					"getEmailOnNews" => $content['GETSITENEWS'],
					"getEmailOnVideoComment" => $content['getEmailOnComment'],
					"getEmailAfterMyComment" => $content['getEmailAfterMyComment'],
					"lastLoginDate" => $content['LASTLOGINDATE'],
					"deviceCount" => $content['DEVICECOUNT'],
					"browserCount" => $content['BROWSERCOUNT'],
					"videoviews" => $content['VIEWCOUNT'],
					"videos" => $content['VIDEOCOUNT'],
					"likes" => $content['LIKECOUNT'],
					"dislikes" => $content['DISLIKECOUNT'],
					"comments" => $content['COMMENTCOUNT'],
					"reportCount" => $content['REPORTCOUNT'],
					"videoCntInFolder" => $content['VIDEOCNTINFOLDER'],
					"folderCnt" => $content['FOLDERCNT'],
					"tagClickCnt" => $content['TAGCLICKCNT'],
					"tagClicked" => $content['TAGCLICKED'],
					"catClickCnt" => $content['CATCLICKCNT'],
					"catClicked" => $content['CATCLICKED'],
					"subCatCnt" => $content['SUBCATCNT'],
					"videoCntCommented" => $content['VIDEOCNTCOMMENTED'],
					"searchCnt" => $content['SEARCHCNT']
					);
	$links = $controller->getUsers(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLEUSERS']);
	return;
}
if ($_GET["action"]=="set" && $_POST["action"] == 'exportMailInfo')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(59))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array("id" => $content['CODE'],
					"sentDate" => $content['SENTDATE'],
					"senderId" => $content['SENDERID'],
					"subject" => $content['SUBJECT'],
					"body" => $content['MESSAGEBODY'],
					"senderIP" => $content['SENDERIP'],
					"to" => $content['TO'],
					"senderName" => $content['SENDERNAME'],
					"userName" => $content['SENDERUSERNAME'],
					"attachment" => $content['FILE']
					);
	$links = $controller->getMailInfo(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['EMAIL']);
	return;
}
?>