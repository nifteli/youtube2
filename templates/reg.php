<?php

class Reg
{
	private $reg;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		global $minPasswordLength;
		
		$this->reg = new Smarty;
		
		
		if (isset($_POST["langId"])) $this->reg->assign("langIdVal",$_POST["langId"]);
		$this->reg->assign("name",$content['NAME']);
		if (isset($_POST["name"])) $this->reg->assign("nameVal",$_POST["name"]);
		$this->reg->assign("surname",$content['SURNAME']);
		if (isset($_POST["surname"])) $this->reg->assign("surnameVal",$_POST["surname"]);
		$this->reg->assign("captcha",$content['CAPTCHA']);
		if (isset($_POST["captcha"])) $this->reg->assign("captchaVal",$_POST["captcha"]);
		$this->reg->assign("gender",$content['GENDER']);
		if (isset($_POST["gender"])) $this->reg->assign("genderVal",$_POST["gender"]);
		$this->reg->assign("phone",$content['PHONE']);
		if (isset($_POST["phone"])) $this->reg->assign("phoneVal",$_POST["phone"]);
		$this->reg->assign("register",$content['REGISTER']);
		$this->reg->assign("cancel",$content['CANCEL']);
		$this->reg->assign("male",$content['MALE']);
		$this->reg->assign("female",$content['FEMALE']);
		$this->reg->assign("email",$content['EMAIL']);
		if (isset($_POST["email"])) $this->reg->assign("emailVal",$_POST["email"]);
		$this->reg->assign("language",$content['LANGUAGE']);
		if (isset($_POST["language"])) $this->reg->assign("languageVal",$_POST["language"]);
		$this->reg->assign("username",$content['USERNAME']);
		if (isset($_POST["username"])) $this->reg->assign("usernameVal",$_POST["username"]);
		$this->reg->assign("password",$content['PASSWORD']);
		$this->reg->assign("passwordAgain",$content['PASSWORDAGAIN']);
		$this->reg->assign("dateOfBirth",$content['BIRTHDATE']);
		if (isset($_POST["dateOfBirth"])) $this->reg->assign("dateOfBirthVal",$_POST["dateOfBirth"]);
		$this->reg->assign("profession",$content['POSITION']);
		if (isset($_POST["profession"])) $this->reg->assign("professionVal",$_POST["profession"]);
		$this->reg->assign("interests",$content['INTERESTS']);
		if (isset($_POST["interests"])) $this->reg->assign("interestsVal",$_POST["interests"]);
		$this->reg->assign("question",$content['SECRETQUESTION']);
		if (isset($_POST["question"])) $this->reg->assign("questionVal",$_POST["question"]);
		$this->reg->assign("answer",$content['SECRETANSWER']);
		if (isset($_POST["answer"])) $this->reg->assign("answerVal",$_POST["answer"]);
		$this->reg->assign("passNotEqual",$content['PASSNOTEQUAL']);
		$this->reg->assign("secQuestions",$controller->getSecretQuestions());
		$this->reg->assign("secretQuestionIdVal",$_POST["secretQuestionId"]);
		$this->reg->assign("secretAnswerVal",$_POST["secretAnswer"]);
		$this->reg->assign("minPassLength",$minPasswordLength);
		$this->reg->assign("passTooShort",$content["MINPASSLENGTH"]);
		$this->reg->assign("lang",$controller->lang);
		if (isset($_POST["onNews"])) $this->reg->assign("onNewsVal",1);
		if (isset($_POST["onComment"])) $this->reg->assign("onCommentVal",1);
		if (isset($_POST["onVideoComment"])) $this->reg->assign("onVideoCommentVal",1);
		$this->reg->assign("mandatory",$content['MANDATORY']);
		$this->reg->assign("optional",$content['OPTIONAL']);
		$this->reg->assign("userPassword",$content['USERPASSWORD']);
		$this->reg->assign("secQuestionNot",$content['SECQUESTIONNOT']);
		$this->reg->assign("receiveNot",$content['RECEIVENOT']);
		$this->reg->assign("onNewsNot",$content['ONNEWS']);
		$this->reg->assign("onCommentNot",$content['ONCOMMENT']);
		$this->reg->assign("onVideoCommentNot",$content['ONVIDEOCOMMENT']);
		$this->reg->assign("agreeNot",$content['AGREE']);
		$this->reg->assign("rules",$content['SIGNINNOTE2']);
		
		
		if(isset($errorMessage))
			$this->reg->assign("errorMessage",$errorMessage);
		if(isset($okMessage))
			$this->reg->assign("okMessage",$okMessage);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->reg->display($templatePath."reg.tpl");
	}
}

?>