<?php 
/*if($access->hasAdminAccess())
{
	
	$_SESSION['userName'] = $_GET["userName"];
	$access->setValues($db); //echo $_SESSION['userName'];exit;
	header("Location: index.php");
}*/
if ($_GET["action"]=="login")
{
	//server side validations
	if(!isset($_POST["userName"]) || !isset($_POST["password"]) || trim($_POST["password"])=="" || trim($_POST["userName"]==""))
	{
		return;
	}
	else
	{
		$db->where("status='confirmed' and isDeleted=0 and userName = '$_POST[userName]' and password = '" . md5($_POST["password"]) . "'");
		$usr = $db->get("users");
		//check user if registered or not
		if($db->count == 1)
		{
			//session_start();
			$_SESSION['userName'] = $_POST["userName"];
			$access->setValues($db); //echo $_SESSION['userName'];exit;
			
			$upData = Array ('lastLoggedIn' => $db->now());
			$db->where("userName = '$_POST[userName]' and password = '" . md5($_POST["password"]) . "'");
			$cnt = $db->update("users", $upData);			
		}
		else
			$errorMessage=$content['WRONGLOGIN'];
	}
}
if ($_GET["action"]=="logout")
{
	session_destroy();
	$access->destroy();
}
?>