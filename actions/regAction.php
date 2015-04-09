<?php
//echo "<pre>"; print_r($_POST); echo "<pre>";exit;
if ($_GET["action"]=="reg")
{
	//server side validations
	if(!isset($_POST["username"]) || !isset($_POST["name"]) || !isset($_POST["gender"]) || !isset($_POST["email"]) || !isset($_POST["password"]) || !isset($_POST["passwordAgain"]) ||
		strlen($_POST["password"])<$minPasswordLength ||
		$_POST["passwordAgain"]!=$_POST["password"])
	{
		$errorMessage=$content["REGERROR"];
	}
	else
	{
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
			$id = $db->insert("users", array("userName"=>trim($_POST[username]),
											  "password"=> md5(trim($_POST["password"])),
											  "status"=>"pending",
											  "hash"=>"$hash",
											  "firstName"=>"$_POST[name]",
											  "lastName"=>"$_POST[surname]",
											  "gender"=>"$_POST[gender]",
											  "email"=>"$_POST[email]",
											  "registered"=>date("Y-m-d H:i:s"),
											  "registeredByIP"=>$_SERVER['REMOTE_ADDR'],
											  "lang"=>"$_POST[lang]",
											  "phoneNumber"=>"$_POST[phone]"
											  )
											  );
			if($id)
			{
				$mail->addAddress($_POST["email"], $_POST["name"].' '.$_POST["surname"]);     // Add a recipient Name is optional	
				$mail->Subject = $content["CONFIRMSUB"];
				$mail->Body    = $content["CONFIRMBODY"]."<br><a href=$domain?page=reg&action=confirm&userName=$_POST[username]&hash=$hash>$domain</a>";
				
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