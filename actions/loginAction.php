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
if ($_GET["action"]=="mailruLogin")
{
	$client_id = '734021'; // ID
	$client_secret = '4a441d5215dc337913e96e1e141c44b0'; // Секретный ключ   Приватный ключ:4bc10af9faf53ae040d3fc025e7e3dd0
	$redirect_uri = 'http://pfs.az/?action=mailruLogin'; // Ссылка на приложение

	$url = 'https://connect.mail.ru/oauth/authorize';

	$params = array(
		'client_id'     => $client_id,
		'response_type' => 'code',
		'redirect_uri'  => $redirect_uri
	);

	//echo $link = '<p><a href="' . $url . '?' . urldecode(http_build_query($params)) . '">Аутентификация через Mail.ru</a></p>';

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