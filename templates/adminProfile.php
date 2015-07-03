<?php

class AdminProfile
{
	private $adminProfile;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminProfile = new Smarty;
		$this->adminProfile->assign("titleProfile", $content['TITLEPROFILE']);
		$this->adminProfile->assign("lang", $controller->lang);
		$this->adminProfile->assign("uName", $controller->access->userName);
		$this->adminProfile->assign("userId", $controller->access->userId);
		
		$profile = $this->getUserProfile($controller->access-userId,$controller->db);
		//echo "<pre>"; print_r($profile); echo "</pre>";//exit; 
		if(count($profile)>0)
		{
			$this->adminProfile->assign("picturePath", $profile["picturePath"]);
			$this->adminProfile->assign("nameVal", $profile["firstName"]);
			$this->adminProfile->assign("surnameVal", $profile["lastName"]);
			$this->adminProfile->assign("fatherNameVal", $profile["fatherName"]);
			list($year, $month, $day) = explode('-', $profile["birthDate"]);
			if($controller->lang == 'az' || $controller->lang == 'ru')
				$date = $day . '.' . $month . '.' . $year;
			if($controller->lang == 'en')
				$date = $month . '/' . $day . '/' . $year;
			$this->adminProfile->assign("birthDateVal", $date);
			$this->adminProfile->assign("genderVal", ($profile["gender"] == "female"?2:1));
			$this->adminProfile->assign("positionVal", $profile["profession"]);
			$this->adminProfile->assign("interestsVal", $profile["interests"]);
			$this->adminProfile->assign("emailVal", $profile["email"]);
			$this->adminProfile->assign("phoneVal", $profile["phoneNumber"]);
			$this->adminProfile->assign("languageVal", $langIds[$profile["languageId"]]);
			$this->adminProfile->assign("picturePath", $profile["picturePath"]);
			$this->adminProfile->assign("getEmailOnCommentVal", ($profile["getEmailOnVideoComment"] == 1)?"on":"");
		}
		
		$this->adminProfile->assign("code", $content['CODE']);
		$this->adminProfile->assign("name", $content['NAME']);
		$this->adminProfile->assign("surname", $content['SURNAME']);
		$this->adminProfile->assign("fatherName", $content['FATHERNAME']);
		$this->adminProfile->assign("birthDate", $content['BIRTHDATE']);
		$this->adminProfile->assign("gender", $content['GENDER']);
		$this->adminProfile->assign("male", $content['MALE']);
		$this->adminProfile->assign("female", $content['FEMALE']);
		$this->adminProfile->assign("position", $content['POSITION']);
		$this->adminProfile->assign("interests", $content['INTERESTS']);
		$this->adminProfile->assign("picture", $content['PICTURE']);
		$this->adminProfile->assign("email", $content['EMAIL']);
		$this->adminProfile->assign("phone", $content['PHONE']);
		$this->adminProfile->assign("language", $content['LANGUAGE']);
		$this->adminProfile->assign("getEmailOnComment", $content['getEmailOnComment']);
		if(isset($_GET["action"]))
		{
			$this->adminProfile->assign("nameVal", isset($_POST["name"]) ? $_POST["name"] : "");
			$this->adminProfile->assign("surnameVal", isset($_POST["surname"]) ? $_POST["surname"] : "");
			$this->adminProfile->assign("fatherNameVal", isset($_POST["fatherName"]) ? $_POST["fatherName"] : "");
			list($year, $month, $day) = explode('-', $profile["birthDate"]);
			if($controller->lang == 'az' || $controller->lang == 'ru')
				$date = $day . '.' . $month . '.' . $year;
			if($controller->lang == 'en')
				$date = $month . '/' . $day . '/' . $year;
			$this->adminProfile->assign("birthDateVal", isset($_POST["bday"]) ? $date : "");
			$this->adminProfile->assign("genderVal", isset($_POST["gender"]) ? $_POST["gender"] : "");
			$this->adminProfile->assign("positionVal", isset($_POST["position"]) ? $_POST["position"] : "");
			$this->adminProfile->assign("interestsVal", isset($_POST["interests"]) ? $_POST["interests"] : "");
			$this->adminProfile->assign("emailVal", isset($_POST["email"]) ? $_POST["email"] : "");
			$this->adminProfile->assign("phoneVal", isset($_POST["phone"]) ? $_POST["phone"] : "");
			$this->adminProfile->assign("languageVal", isset($_POST["lang"]) ? $_POST["lang"] : "");
			$this->adminProfile->assign("getEmailOnCommentVal", isset($_POST["getEmailOnComment"]) ? $_POST["getEmailOnComment"] : "");
		}
		$this->adminProfile->assign("azerbaijani", $content['AZERBAIJANI']);
		$this->adminProfile->assign("english", $content['ENGLISH']);
		$this->adminProfile->assign("russian", $content['RUSSIAN']);
		$this->adminProfile->assign("username", $content['USERNAME']);
		$this->adminProfile->assign("password", $content['PASSWORD']);
		$this->adminProfile->assign("passwordAgain", $content['PASSWORDAGAIN']);
		$this->adminProfile->assign("cancel", $content['CANCEL']);
		$this->adminProfile->assign("save", $content['SAVE']);
		
		$this->adminProfile->assign("result", $result);
		$this->adminProfile->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminProfile->display($templatePath."adminProfile.tpl");
	}
	
	private function getUserProfile($id,$db)
	{
		$db->where("id=$id");
		$res = $db->get("users");
		return $res[0];
	}
}

?>