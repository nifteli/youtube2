<?php 
/*if($access->hasAdminAccess())
{
	
	$_SESSION['userName'] = $_GET["userName"];
	$access->setValues($db); //echo $_SESSION['userName'];exit;
	header("Location: index.php");
}*/

if ($_GET["action"]=="delProfile" && $access->hasAccess)
{
	$db->where("id=" . $access->userId);
	$db->update("users",array("isDeleted"=>1,
								"deleted"=>date("Y-m-d H:i:s"),
								"deletedById"=>$access->userId,
								"deletedByIP"=>$_SERVER["REMOTE_ADDR"]));
	if($db->count>0)
	{
		$okMessage = $content["ACCOUNTREMOVED"];
		session_destroy();
		$access->destroy();
		if(isset($_COOKIE["arr"]["userName"]) && isset($_COOKIE["arr"]["password"]))
		{
			setcookie("arr[userName]", time() - 3600);
			setcookie("arr[password]", time() - 3600);
		}
	}
}
if ($_GET["action"]=="editFolder" && $access->hasAccess && is_numeric($_POST["folderId"]) && trim($_POST["folderName"]) != "")
{
	if(!$access->authorized(55))
	{
		$result = "error";
		$errorMessage = $content["INSUFFACCESS"];
		return;
	}
	if(strlen(trim($_POST["folderName"])) < 3 || strlen(trim($_POST["folderName"])) > 25)
	{
		$result = "error";
		$errorMessage = $content["SHORTFOLDERNAME"];
		return;
	}
	$tagStr = isset($_POST["tags"]) ? $_POST["tags"] : "";
	$tags = array_unique(explode(",", $tagStr));
	if(count($tags) < 2)
	{
		$result = "error";
		$errorMessage = $content["NOTENGOUGHTAG"];
		return;
	}
	foreach($tags as $tag)
	{
		if(strlen(trim($tag)) == 1)
		{
			$result = "error";
			$errorMessage = $content["SHORTTAG"];
			return;
		}
	}
	$continue = true;
	$db->startTransaction();
	$db->where("id=".$_POST["folderId"] . " and createdById=" . $access->userId);
	$res = $db->update("folders",array("name"=>trim($_POST["folderName"]),
										"updated"=>date("Y-m-d H:i:s"),
										"updatedById"=>$access->userId,
										"updatedByIP"=>$_SERVER['REMOTE_ADDR']
										));
	if($res)
	{
		$db->rawQuery("delete from foldertags where folderId=".$_POST["folderId"]);
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
										"createdById"=>$access->userId,
										"createdByIP"=>$_SERVER["REMOTE_ADDR"]));
			if($id)
			{
				
				$id = $db->insert("foldertags", array("tagId"=>$id,
									"folderId"=>$_POST["folderId"]));
									//echo "Error=".$db->getLastError()."<br>"; echo "Query=".$db->getLastQuery()."<br>";
			}
			
			if(!$id)
			{ 
				$continue = false;
				break;
			}
		}
		if($continue)
		{
			$db->commit();
			$controller->logAction2(74,"CatalogueId=".$_POST["folderId"]);
			$okMessage = $content["FOLDEREDITED"];
		}
		else
			$db->rollback();
		//$okMessage = $content["FOLDEREDITED"];
		//$db->commit();
	}
	else
	{
		$db->rollback();
		$errorMessage = $content["FOLDERNOTEDITED"];
	}
}

if ($_GET["action"]=="deleteFolder" && $access->hasAccess && is_numeric($_GET["id"]))
{
	if(!$access->authorized(56))
	{
		$result = "error";
		$errorMessage = $content["INSUFFACCESS"];
		return;
	}
	$db->startTransaction();
	$db->where("id=".$_GET["id"] . " and createdById=" . $access->userId);
	$res = $db->delete("folders");
	if($res)
	{
		$db->where("folderId=".$_GET["id"]);
		$res = $db->delete("foldervideos");
		$okMessage = $content["FOLDERDELETED"];
		$controller->logAction2(76,"CatalogueId=".$_GET["id"]);
		$db->commit();
	}
	else
	{
		$db->rollback();
		$errorMessage = $content["FOLDERNOTDELETED"];
	}
}

if ($_GET["action"]=="addNewFolder" && $access->hasAccess && trim($_POST["folderName"]) != "")
{
	if(!$access->authorized(55))
	{
		$result = "error";
		$errorMessage = $content["INSUFFACCESS"];
		return;
	}
	if(strlen(trim($_POST["folderName"])) < 3 || strlen(trim($_POST["folderName"])) > 25)
	{
		$result = "error";
		$errorMessage = $content["SHORTFOLDERNAME"];
		return;
	}
	$tagStr = isset($_POST["tags"]) ? $_POST["tags"] : "";
	$tags = array_unique(explode(",", $tagStr));
	if(count($tags) < 2)
	{
		$result = "error";
		$errorMessage = $content["NOTENGOUGHTAG"];
		return;
	}
	foreach($tags as $tag)
	{
		if(strlen(trim($tag) == 1))
		{
			$result = "error";
			$errorMessage = $content["SHORTTAG"];
			return;
		}
	}
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
										"createdById"=>$access->userId,
										"createdByIP"=>$_SERVER["REMOTE_ADDR"]));
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
			$db->commit();
			$controller->logAction2(73,"CatalogueId=".$folderId);
			$okMessage = $content["FOLDERADDED"];
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
if ($_GET["action"]=="delete")
{
	if($_GET["videoId"] > 0)
	{
		if(!$access->authorized(50))
		{
			$result = "error";
			$messages['noaccess'] = $content["INSUFFACCESS"];
			return;
		}
		//$db->startTransaction();
		//$db->rawQuery("delete from videos where addedById=".$access->userId." and id=".$_GET["videoId"]);
		$db->where("addedById=".$access->userId." and id=".$_GET["videoId"]);
		$db->update("videos",array("isDeleted"=>1,
								   "deletedById"=>$access->userId,
								   "deleted"=>date("Y-m-d H:i:s"),
								   "deletedByIP"=>$_SERVER['REMOTE_ADDR']));
		$controller->logAction2(9,"VideoId=".$_GET["videoId"]);
		// {
			// $db->where("videoId=".$_GET["videoId"]);
			// $db->delete("videocats");
			// $db->where("videoId=".$_GET["videoId"]);
			// $db->delete("videotags");
			// $db->where("videoId=".$_GET["videoId"]);
			// $db->delete("videoviews");
			// $db->commit();
		// }
		// else 
			// $db->rollback();
	}
}
if ($_GET["action"]=="login")
{
	//server side validations
	if(!isset($_POST["userName"]) || !isset($_POST["password"]) || trim($_POST["password"])=="" || trim($_POST["userName"]==""))
	{
		return;
	}

	else
	{
		$db->where("status='confirmed' 
					and isDeleted=0 
					and (userName = '$_POST[userName]' or email = '$_POST[userName]' or phoneNumber = '$_POST[userName]')
					and password = '" . md5($_POST["password"]) . "'");
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
			if($_POST["src"] == "addVideo")
				header("Location: index.php?page=addVideo");
		}
		else
			$errorMessage=$content['WRONGLOGIN'];
	}
}
if ($_GET["action"]=="logout")
{
	session_unset(); 
	session_destroy();
	$access->destroy();
	if(isset($_COOKIE["arr"]["userName"]) && isset($_COOKIE["arr"]["password"]))
	{
		setcookie("arr[userName]", time() - 3600);
		setcookie("arr[password]", time() - 3600);
	}
	$controller->logAction(54);
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
											  "registeredByIP"=>$_SERVER['REMOTE_ADDR'],
											  "languageId"=>5
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
if ($_GET["action"]=="mailruLogin")
{
	$client_id = '734021'; // ID
	$client_secret = '4a441d5215dc337913e96e1e141c44b0'; // Nae?aoiue ee??   I?eaaoiue ee??:4bc10af9faf53ae040d3fc025e7e3dd0
	$redirect_uri = 'http://pfs.az/?action=mailruLogin'; // Nnueea ia i?eei?aiea

	$url = 'https://connect.mail.ru/oauth/authorize';

	$params = array(
		'client_id'     => $client_id,
		'response_type' => 'code',
		'redirect_uri'  => $redirect_uri
	);

	//echo $link = '<p><a href="' . $url . '?' . urldecode(http_build_query($params)) . '">Aooaioeoeeaoey ?a?ac Mail.ru</a></p>';

	if (isset($_GET['code'])) {
		$result = false;
		$params = array(
			'client_id'     => $client_id,
			'client_secret' => $client_secret,
			'grant_type'    => 'authorization_code',
			'code'          => $_GET['code'],
			'redirect_uri'  => $redirect_uri
		);

		$url = 'https://connect.mail.ru/oauth/token';

		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_POSTFIELDS, urldecode(http_build_query($params)));
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		$result = curl_exec($curl);
		curl_close($curl);

		$tokenInfo = json_decode($result, true);

		if (isset($tokenInfo['access_token'])) {
			$sign = md5("app_id={$client_id}method=users.getInfosecure=1session_key={$tokenInfo['access_token']}{$client_secret}");

			$params = array(
				'method'       => 'users.getInfo',
				'secure'       => '1',
				'app_id'       => $client_id,
				'session_key'  => $tokenInfo['access_token'],
				'sig'          => $sign
			);

			$userInfo = json_decode(file_get_contents('http://www.appsmail.ru/platform/api' . '?' . urldecode(http_build_query($params))), true);
			if (isset($userInfo[0]['uid'])) {
				$userInfo = array_shift($userInfo);
				$result = true;
			}
			
			if(isset($userInfo['uid']))
			{
				$db->where("status='confirmed' and isDeleted=0 and userName = 'm" . $userInfo['uid'] . "'");
				$usr = $db->get("users");
				//check user if registered or not
				if($db->count == 0)
				{
					$hash=uniqid();
					$id = $db->insert("users", array("userName"=>"m" . $userInfo['uid'],
										  "password"=> md5($hash),
										  "status"=>"confirmed",
										  "firstName"=>$userInfo['first_name'],
										  "lastName"=>$userInfo['last_name'],
										  "gender"=>$userInfo['sex'],
										  "registered"=>date("Y-m-d H:i:s"),
										  "email"=>$userInfo['email'],
										  "registeredByIP"=>$_SERVER['REMOTE_ADDR']
										  )
										  );
				}
				authenticate("m" . $userInfo["uid"]);
			}
		}
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