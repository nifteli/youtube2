<?php

class Profile
{
	private $profile;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->profile = new Smarty;
		$this->profile->assign("titleProfile", $content['TITLEPROFILE']);
		$this->profile->assign("lang", $controller->lang);
		$this->profile->assign("uName", $controller->access->userName);
		$this->profile->assign("userId", $controller->access->userId);
		
		$profile = $this->getUserProfile($controller->access-userId,$controller->db);
		//echo "<pre>"; print_r($profile); echo "</pre>";//exit; 
		if(count($profile)>0)
		{
			$this->profile->assign("picturePath", $profile["picturePath"]);
			$this->profile->assign("nameVal", $profile["firstName"]);
			$this->profile->assign("surnameVal", $profile["lastName"]);
			$this->profile->assign("fatherNameVal", $profile["fatherName"]);
			list($year, $month, $day) = explode('-', $profile["birthDate"]);
			if($controller->lang == 'az' || $controller->lang == 'ru')
				$date = $day . '.' . $month . '.' . $year;
			if($controller->lang == 'en')
				$date = $month . '/' . $day . '/' . $year;
			$this->profile->assign("birthDateVal", $date);
			$this->profile->assign("genderVal", ($profile["gender"] == "female"?2:1));
			$this->profile->assign("positionVal", $profile["profession"]);
			$this->profile->assign("interestsVal", $profile["interests"]);
			$this->profile->assign("notesVal", $profile["notes"]);
			$this->profile->assign("emailVal", $profile["email"]);
			$this->profile->assign("phoneVal", $profile["phoneNumber"]);
			$this->profile->assign("languageVal", $langIds[$profile["languageId"]]);
			$this->profile->assign("picturePath", $profile["picturePath"]);
			$this->profile->assign("getEmailOnCommentVal", ($profile["getEmailOnVideoComment"] == 1)?"on":"");
		}
		
		$this->profile->assign("code", $content['CODE']);
		$this->profile->assign("name", $content['NAME']);
		$this->profile->assign("surname", $content['SURNAME']);
		$this->profile->assign("fatherName", $content['FATHERNAME']);
		$this->profile->assign("birthDate", $content['BIRTHDATE']);
		$this->profile->assign("gender", $content['GENDER']);
		$this->profile->assign("male", $content['MALE']);
		$this->profile->assign("female", $content['FEMALE']);
		$this->profile->assign("position", $content['POSITION']);
		$this->profile->assign("interests", $content['INTERESTS']);
		$this->profile->assign("notes", $content['NOTE']);
		$this->profile->assign("picture", $content['PICTURE']);
		$this->profile->assign("email", $content['EMAIL']);
		$this->profile->assign("phone", $content['PHONE']);
		$this->profile->assign("language", $content['LANGUAGE']);
		$this->profile->assign("getEmailOnComment", $content['getEmailOnComment']);
		if(isset($_GET["action"]))
		{
			$this->profile->assign("nameVal", isset($_POST["name"]) ? $_POST["name"] : "");
			$this->profile->assign("surnameVal", isset($_POST["surname"]) ? $_POST["surname"] : "");
			$this->profile->assign("fatherNameVal", isset($_POST["fatherName"]) ? $_POST["fatherName"] : "");
			list($year, $month, $day) = explode('-', $profile["birthDate"]);
			if($controller->lang == 'az' || $controller->lang == 'ru')
				$date = $day . '.' . $month . '.' . $year;
			if($controller->lang == 'en')
				$date = $month . '/' . $day . '/' . $year;
			$this->profile->assign("birthDateVal", isset($_POST["bday"]) ? $date : "");
			$this->profile->assign("genderVal", isset($_POST["gender"]) ? $_POST["gender"] : "");
			$this->profile->assign("positionVal", isset($_POST["position"]) ? $_POST["position"] : "");
			$this->profile->assign("interestsVal", isset($_POST["interests"]) ? $_POST["interests"] : "");
			$this->profile->assign("notesVal", isset($_POST["notes"]) ? $_POST["notes"] : "");
			$this->profile->assign("emailVal", isset($_POST["email"]) ? $_POST["email"] : "");
			$this->profile->assign("phoneVal", isset($_POST["phone"]) ? $_POST["phone"] : "");
			$this->profile->assign("languageVal", isset($_POST["lang"]) ? $_POST["lang"] : "");
			$this->profile->assign("getEmailOnCommentVal", isset($_POST["getEmailOnComment"]) ? $_POST["getEmailOnComment"] : "");
		}
		$this->profile->assign("azerbaijani", $content['AZERBAIJANI']);
		$this->profile->assign("english", $content['ENGLISH']);
		$this->profile->assign("russian", $content['RUSSIAN']);
		$this->profile->assign("username", $content['USERNAME']);
		$this->profile->assign("password", $content['PASSWORD']);
		$this->profile->assign("passwordAgain", $content['PASSWORDAGAIN']);
		$this->profile->assign("cancel", $content['CANCEL']);
		$this->profile->assign("save", $content['SAVE']);
		
		$this->profile->assign("result", $result);
		$this->profile->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->profile->display($templatePath."profile.tpl");
	}
	
	private function getUserProfile($id,$db)
	{
		$db->where("id=$id");
		$res = $db->get("users");
		return $res[0];
	}
}

?>