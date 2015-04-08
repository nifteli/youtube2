<?php
echo "<pre>"; print_r($_POST); echo "<pre>";exit;
if ($_GET["action"]=="reg")
{
	//server side validations
	if(!isset($_POST["name"]) || !isset($_POST["surname"]) || !isset($_POST["email"]) || !isset($_POST["password"]) || !isset($_POST["passwordAgain"]) ||
		strlen($_POST["passwordAgain"])<8||strlen($_POST["password"])<8||
		$_POST["passwordAgain"]!=$_POST["password"])
	{
	$errorMessage=$regError;
	//echo $errorMessage;
	}
	else
	{
		$cnt = $db->CountRows("users",array("user_name"=>$_POST["email"]));
		if($cnt>0)
		{
			$errorMessage=$userExists;
		}
		else
		{
			//insert user registration data to database
			$hash=uniqid();
			$db->insert(array("user_name"=>"$_POST[email]",
							  "name"=>"$_POST[name]",
							  "surname"=>"$_POST[surname]",
							  "user_type"=>"1",
							  "password"=> md5($_POST["password"]),
							  "register_date"=>date("Y-m-d H:i:s"),
							  "status"=>"pending",
							  "hash"=>"$hash"),
							  "users");
			if($db->affected>0)
			{
				$mail->addAddress($_POST["email"], $_POST["name"].' '.$_POST["surname"]);     // Add a recipient Name is optional	
				$mail->Subject = $confirmReg;
				$mail->Body    = $confirmRegBody."<br><a href=$domain?page=register&action=confirm&userName=$_POST[email]&hash=$hash>$domain</a>";
				
				if(!$mail->send()) {
					//echo 'Message could not be sent.';
					//echo 'Mailer Error: ' . $mail->ErrorInfo;
				} else {
					$okMessage=$regOk;
				}
			}
		}
	}
}
if ($_GET["action"]=="confirm")
{
	if(!isset($_GET["userName"]) || !isset($_GET["hash"]))
	{
		$errorMessage=$errorOnConfirmation;
		return;
	}
	//check same username
	
	$cnt = $db->CountRows("users",array("user_name"=>$_GET["userName"],"hash"=>$_GET["hash"]));
	if($cnt==1)
	{
		$db->update("users",array("status"=>"confirmed"),array("user_name"=>$_GET["userName"],"hash"=>$_GET["hash"]));
		if($db->affected>0)
			$regConfirmed=$confirmed;
		else
			$regConfirmed=$alreadyConfirmed;
	}
	//echo $db->lastQuery.$db->affected;				

}
?>