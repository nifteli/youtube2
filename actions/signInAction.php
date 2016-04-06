<?php 

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
			if($_POST["rememberMe"] == "on")
			{
				setcookie("arr[userName]", $_POST["userName"], time() + 3600);
				setcookie("arr[password]", $_POST["password"], time() + 3600);
			}
			authenticate($_POST["userName"]);
			
			if(trim($_POST["src"]) == "addVideo")
				header("Location: index.php?page=addVideo");
			else
				header("Location: index.php?src=".$_POST["src"]);
		}
		else
			$errorMessage=$content['WRONGLOGIN'];
	}
}

function authenticate($userName)
{
	global $access;
	global $db;
	
	$_SESSION['userName'] = $userName;
	$access->setValues($db); //echo $_SESSION['userName'];exit;
	
	$upData = Array ('lastLoggedIn' => $db->now());
	$db->where("userName = '" . $userName . "'");
	$cnt = $db->update("users", $upData);
}
?>