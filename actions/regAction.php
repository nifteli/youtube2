<?php
//echo "<pre>"; print_r($_POST); echo "</pre>";//exit;
//echo "<pre>"; print_r($_FILES); echo "</pre>";//exit;
if ($_GET["action"]=="reg")
{
	$result = true;
	//server side validations
	if(trim($_POST["username"]) == "" || trim($_POST["name"]) == "" || trim($_POST["gender"]) == "" || trim($_POST["email"]) == "" || trim($_POST["password"]) == "" || trim($_POST["passwordAgain"]) == "" ||
		strlen(trim($_POST["password"]))<$minPasswordLength ||
		$_POST["passwordAgain"] != $_POST["password"])
	{
		$result = false;
		$errorMessage=$content["REGERROR"];
	}
	if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) 
	{
		$result = false;
		$errorMessage=$content["NOTVALIDEMAIL"];
	}
	if(!$controller->validate_Date($_POST["dateOfBirth"],$format,$birthDate))
	{
		$result = false;
		$errorMessage=$content["NOTVALIDDATE"];
	}
	
	if(isset($_FILES['pic']['name']) && $_FILES['pic']['name'] != "")
	{ //echo "eee";
		$target_file = $appDirectory .$userPicsPath . basename($_FILES["pic"]["name"]);
		$uploadOk = 1;
		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		
		if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "pjpeg" && $imageFileType != "gif" ) 
		{
			$result = false;
			$errorMessage = $content['ADMINPROFILEERR5'];
		}
		
		
		if ($_FILES["pic"]["size"] > $maxPicSize * 1024 * 1024 && ($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "pjpeg" || $imageFileType == "gif" )) 
		{
			$pathParts = pathinfo($_FILES["pic"]["tmp_name"]);
			
			$filename = $controller->compressImage($_FILES["pic"]["tmp_name"], $tmpPath . $pathParts['basename'], $imageQuality); 
			//echo "filesize=".filesize("tmp/" . $pathParts['basename'])."<br> allowed_size=".$maxPicSize * 1024 * 1024;
			if (filesize($tmpPath . $pathParts['basename']) < $maxPicSize * 1024 * 1024)
			{
				unlink($_FILES["pic"]["tmp_name"]);
				$_FILES["pic"]["tmp_name"] = $tmpPath . $pathParts['basename'];
				//echo "<br> new path ".$_FILES["pic"]["tmp_name"];
			}
			else
			{
				$result = false;
				$errorMessage = $content['ADMINPROFILEERR6'];
			}
		}
	}
	
	if($result)
	{ 
		$getEmailOnVideoComment = 0; $getEmailAfterMyComment = 0; $getEmailOnNews = 0;
		if($_POST["onVideoComment"] == "on")	$getEmailOnVideoComment = 1;
		if($_POST["onComment"] == "on")	$getEmailAfterMyComment = 1;
		if($_POST["onNews"] == "on")	$getEmailOnNews = 1;
		
		$db->where("(userName = '".trim($_POST["username"])."' or email='".trim($_POST["email"])."') and isDeleted=0");
		$users = $db->get("users");
		if($db->count>0)
		{
			$errorMessage=$content["USEREXISTS"];
		}
		else
		{
			$regBrowser=$_SERVER['HTTP_USER_AGENT'];
			if(preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i',$regBrowser)||preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i',substr($regBrowser,0,4)))
				$regDevice = "Mobile device";
			else 
				$regDevice = "Computer";
			//insert user registration data to database
			$hash=uniqid();
			$picturePath = "";
			if (isset($_FILES['pic']['name']) && $_FILES['pic']['name'] != "")
			{
				$saveto = $appDirectory . $userPicsPath . $access->userId.".jpeg";
				copy($_FILES['pic']['tmp_name'], $saveto);
				unlink($_FILES['pic']['tmp_name']);
				$picturePath = '.'.$userPicsPath . $access->userId.".jpeg";
				//echo $_FILES['pic']['tmp_name'];
				//echo "<br>to dir".$saveto;
				//echo "ddddddd  ".$_FILES['pic']['tmp_name'].$saveto;
			}
			$id = $db->insert("users", array("userName"=>trim($_POST["username"]),
											  "password"=> md5(trim($_POST["password"])),
											  "status"=>"pending",
											  "hash"=>"$hash",
											  "firstName"=>"$_POST[name]",
											  "lastName"=>"$_POST[surname]",
											  "gender"=>"$_POST[gender]",
											  "email"=>trim($_POST["email"]),
											  "birthDate" => $birthDate,
											  "profession" => $_POST["profession"],
											  "interests" =>  $_POST["interests"],
											  "secretQuestionId" =>  $_POST["secretQuestionId"],
											  "secretAnswer" =>  $_POST["secretAnswer"],
											  "registered"=>date("Y-m-d H:i:s"),
											  "registeredByIP"=>$_SERVER['REMOTE_ADDR'],
											  "languageId"=>$_POST["langId"],
											  "phoneNumber"=>"$_POST[phone]",
											  "getEmailOnVideoComment"=>$getEmailOnVideoComment,
											  "getEmailAfterMyComment"=>$getEmailAfterMyComment,
											  "getEmailOnNews"=>$getEmailOnNews,
											  "regDevice"=>$regDevice,
											  "regBrowser"=>$regBrowser,
											  "picturePath"=>$picturePath
											  )
											  );echo $db->getLastError(); //echo "reg".$id;
			if($id)
			{
				$mail->addAddress($_POST["email"], $_POST["name"].' '.$_POST["surname"]);     // Add a recipient Name is optional	
				$mail->Subject = $content["CONFIRMSUB"];
				$mail->Body    = $content["CONFIRMBODY"]."<br><a href=$domain?page=reg&action=confirm&userName=".trim($_POST["username"])."&hash=".$hash.">$domain</a>";
				//echo $content["CONFIRMBODY"]."<br><a href=$domain?page=reg&action=confirm&userName=".trim($_POST["username"])."&hash=".$hash.">$domain</a>";
				$mail->send();
					//echo 'Message could not be sent.';
					//echo 'Mailer Error: ' . $mail->ErrorInfo;
				$okMessage=$content["REGOK"];
				
			}
		}
	}
}
if ($_GET["action"]=="confirm")
{
	if(!isset($_GET["userName"]) || !isset($_GET["hash"]))
	{
		$errorMessage=$content["CONFIRMATIONERR"];
		return;
	}
	//check same username
	$db->where("userName = '$_GET[userName]' and hash = '$_GET[hash]'");
	$users = $db->get("users");
	if($db->count==1)
	{
		$db->where("userName = '$_GET[userName]' and hash = '$_GET[hash]'");
		$cnt = $db->update("users", array("status"=>"confirmed"));
		if($db->count>0)
			$okMessage=$content["REGCONFIRMED"];
		else
			$okMessage=$content["ALREADYCONFIRMED"];
	}				

}
?>