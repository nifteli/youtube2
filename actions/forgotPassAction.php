<?php
//echo "<pre>"; print_r($_POST); echo "<pre>";exit;
if ($_GET["action"]=="sendToMail")
{
	//server side validations
	if(!isset($_POST["email"]) || $_POST["email"] == "")
		$errorMessage=$content["EMAILERROR"];
	else
	{
		$db->where("status='confirmed' and isDeleted=0 and email='".trim($_POST["email"])."'");
		$users = $db->get("users");
		if($db->count == 0)
		{
			$errorMessage=$content["NOSUCHEMAIL"];
		}
		else
		{
			//update hash for reset
			$hash=uniqid();
			$db->where ("email = '".trim($_POST["email"])."'");
			$db->update("users", array("hash"=>"$hash"));
			if($db->count>0)
			{
				$mail->addAddress($_POST["email"]);     // Add a recipient Name is optional	
				$mail->Subject = $content["RESETPASS"];
				$mail->Body    = $content["RESETPASSBODY"]."<br><a href=$domain?page=forgotPass&email=$_POST[email]&hash=$hash>$domain</a>";
				
				if(!$mail->send()){ 
					//echo 'Message could not be sent.';
					//echo 'Mailer Error: ' . $mail->ErrorInfo;
				}else 
					$okMessage=$content["RESETMAILSENT"];
			}
		}
	}
}
if ($_GET["action"]=="resetPass")
{
	if(!isset($_GET["email"]) || !isset($_GET["hash"]) || $_GET["email"] == "" || $_GET["hash"] == "")
	{
		$errorMessage=$content["RESETCONFERR1"];
		return;
	}
	if(!isset($_POST["password"]) || !isset($_POST["passwordAgain"]) ||
		strlen($_POST["password"])<$minPasswordLength ||
		$_POST["passwordAgain"]!=$_POST["password"])
	{
		$errorMessage=$content["RESETCONFERR2"];
		return;
	}
	
	$db->where("email = '$_GET[email]' and hash = '$_GET[hash]'");
	$db->update("users",array("password"=> "'".md5(trim($_POST["password"]))."'","hash"=>"'".uniqid()."'"));//echo $db->getLastQuery();echo $db->getLastError();
	if($db->count>0)
		$okMessage=$content["PASSRESET"];
	else
		$errorMessage=$content["PASSNOTRESET"];
}
?>