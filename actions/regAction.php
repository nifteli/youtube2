<?php
//echo "<pre>"; print_r($_POST); echo "</pre>";//exit;
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
	if($result)
	{
		if($_POST["onVideoComment"] == "on")	$getEmailOnVideoComment = 1;
		if($_POST["onComment"] == "on")	$getEmailAfterMyComment = 1;
		if($_POST["onNews"] == "on")	$getEmailOnNews = 1;
		
		$db->where("userName = '".trim($_POST["username"])."' or email='".trim($_POST["email"])."'");
		$users = $db->get("users");
		if($db->count>0)
		{
			$errorMessage=$content["USEREXISTS"];
		}
		else
		{
			//insert user registration data to database
			$hash=uniqid();
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
											  "languageId"=>$langIds[$_POST["langId"]],
											  "phoneNumber"=>"$_POST[phone]",
											  "getEmailOnVideoComment"=>$getEmailOnVideoComment,
											  "getEmailAfterMyComment"=>$getEmailAfterMyComment,
											  "getEmailOnNews"=>$getEmailOnNews
											  )
											  );
			if($id)
			{
				$mail->addAddress($_POST["email"], $_POST["name"].' '.$_POST["surname"]);     // Add a recipient Name is optional	
				$mail->Subject = $content["CONFIRMSUB"];
				$mail->Body    = $content["CONFIRMBODY"]."<br><a href=$domain?page=reg&action=confirm&userName=".trim($_POST["username"])."&hash=".$hash.">$domain</a>";
				//echo $content["CONFIRMBODY"]."<br><a href=$domain?page=reg&action=confirm&userName=".trim($_POST["username"])."&hash=".$hash.">$domain</a>";
				if(!$mail->send()) {
					//echo 'Message could not be sent.';
					//echo 'Mailer Error: ' . $mail->ErrorInfo;
				} else {
					$okMessage=$content["REGOK"];
				}
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