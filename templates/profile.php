<?php

class Profile
{
	private $profile;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $langIds;
		global $minPasswordLength;
		
		$this->profile = new Smarty;
		$this->profile->assign("titleProfile", $content['TITLEPROFILE']);
		$this->profile->assign("lang", $controller->lang);
		$this->profile->assign("uName", $controller->access->userName);
		$this->profile->assign("userId", $controller->access->userName);
		
		
		$profile = $this->getUserProfile($controller->access->userId,$controller->db);
		$this->profile->assign("minPassLength",$minPasswordLength);
		$this->profile->assign("passTooShort",$content["MINPASSLENGTH"]);
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
			$this->profile->assign("langIdVal", $profile["languageId"]);
			$this->profile->assign("picturePath", $profile["picturePath"]);
			$this->profile->assign("getEmailOnCommentVal", ($profile["getEmailOnVideoComment"] == 1)?"on":"");
			$this->profile->assign("getEmailAfterMyCommentVal", ($profile["getEmailAfterMyComment"] == 1)?"on":"");
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
		$this->profile->assign("getEmailAfterMyComment", $content['getEmailAfterMyComment']);
		
		/////
		$this->profile->assign("question",$content['SECRETQUESTION']);
		if (isset($_POST["question"])) $this->profile->assign("questionVal",trim($_POST["question"]));
		$this->profile->assign("answer",$content['SECRETANSWER']);
		if (isset($_POST["answer"])) $this->profile->assign("answerVal",trim($_POST["answer"]));
		$this->profile->assign("passNotEqual",$content['PASSNOTEQUAL']);
		$this->profile->assign("secQuestions",$controller->getSecretQuestions());
		$this->profile->assign("secretQuestionIdVal",trim($_POST["secretQuestionId"]));
		$this->profile->assign("secretAnswerVal",trim($_POST["secretAnswer"]));
		$this->profile->assign("minPassLength",$minPasswordLength);
		$this->profile->assign("passTooShort",$content["MINPASSLENGTH"]);
		//$this->profile->assign("lang",$controller->lang);
		if (isset($_POST["onNews"])) $this->profile->assign("onNewsVal",1);
		if (isset($_POST["onComment"])) $this->profile->assign("onCommentVal",1);
		if (isset($_POST["onVideoComment"])) $this->profile->assign("onVideoCommentVal",1);
		$this->profile->assign("languages", $controller->getLanguages());//echo isset($_POST["langId"])?trim($_POST["langId"]):$langIds[$controller->lang];
		
		$this->profile->assign("mandatory",$content['MANDATORY']);
		$this->profile->assign("optional",$content['OPTIONAL']);
		$this->profile->assign("userPassword",$content['USERPASSWORD']);
		$this->profile->assign("secQuestionNot",$content['SECQUESTIONNOT']);
		$this->profile->assign("receiveNot",$content['RECEIVENOT']);
		$this->profile->assign("onNewsNot",$content['ONNEWS']);
		$this->profile->assign("onCommentNot",$content['ONCOMMENT']);
		$this->profile->assign("onVideoCommentNot",$content['ONVIDEOCOMMENT']);
		$this->profile->assign("agreeNot",$content['AGREE']);
		$this->profile->assign("rules",$content['SIGNINNOTE2']);
		$this->profile->assign("validationError1",$content['VALIDATIONERR1']);
		$this->profile->assign("validationError2",$content['VALIDATIONERR2']);
		$this->profile->assign("validationError3",$content['VALIDATIONERR3']);
		$this->profile->assign("validationError4",$content['VALIDATIONERR4']);
		$this->profile->assign("validationError5",$content['VALIDATIONERR5']);
		$this->profile->assign("validationError6",$content['VALIDATIONERR6']);
		$this->profile->assign("validationError7",$content['VALIDATIONERR7']);
		$this->profile->assign("validationError8",$content['VALIDATIONERR8']);
		$this->profile->assign("validationError9",$content['VALIDATIONERR9']);
		$this->profile->assign("validationError10",$content['VALIDATIONERR10']);
		$this->profile->assign("validationError11",$content['VALIDATIONERR11']);
		$this->profile->assign("validationError12",$content['VALIDATIONERR12']);
		$this->profile->assign("validationError13",$content['VALIDATIONERR13']);
		$this->profile->assign("validationError14",$content['VALIDATIONERR14']);
		$this->profile->assign("validationError15",$content['VALIDATIONERR15']);
		$this->profile->assign("deleteProfile",$content['DELETEPROFILE']);
		$this->profile->assign("deleteProfileConfirmation",$content['deleteProfileConfirmation']);
		//////
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
			//$this->profile->assign("languageVal", isset($_POST["lang"]) ? $_POST["lang"] : "");
			$this->profile->assign("getEmailOnCommentVal", isset($_POST["getEmailOnComment"]) ? $_POST["getEmailOnComment"] : "");
			$this->profile->assign("getEmailAfterMyCommentVal", isset($_POST["getEmailAfterMyComment"]) ? $_POST["getEmailAfterMyComment"] : "");
			$this->profile->assign("langIdVal",isset($_POST["langId"])?trim($_POST["langId"]):$langIds[$controller->lang]);
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