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
			authenticate($_POST["userName"]);
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
if ($_GET["action"]=="fbLogin")
{
	$config = array(
		  'appId' => '1621049338132733',
		  'secret' => '0c8144e175ecb2f732f524ed49a8d57f',
		  'fileUpload' => false, // optional
		  'allowSignedRequest' => false, // optional, but should be set to false for non-canvas apps
	  );

	$facebook = new Facebook($config);
	$user_id = $facebook->getUser();
	if($user_id) 
	{
		  try 
		  {
				$user_profile = $facebook->api('/me','GET');
				if(is_array($user_profile) && isset($user_profile["id"]))
				{
					$db->where("status='confirmed' and isDeleted=0 and userName = 'fb" . $user_profile["id"] . "'");
					$usr = $db->get("users");
					//check user if registered or not
					if($db->count == 0)
					{
						$hash=uniqid();
						$id = $db->insert("users", array("userName"=>"fb" . $user_profile["id"],
											  "password"=> md5($hash),
											  "status"=>"confirmed",
											  "firstName"=>$user_profile["first_name"],
											  "lastName"=>$user_profile["last_name"],
											  "gender"=>$user_profile["gender"],
											  "registered"=>date("Y-m-d H:i:s"),
											  "registeredByIP"=>$_SERVER['REMOTE_ADDR']
											  )
											  );
					}
					authenticate("fb" . $user_profile["id"]);
				}
		  } 
		  catch(FacebookApiException $e) 
		  {
				$login_url = $facebook->getLoginUrl(); 
				header("Location: ".$login_url);
		  }   
	}
	else 
	{
		  $login_url = $facebook->getLoginUrl();
		  header("Location: ".$login_url);
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