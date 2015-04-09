<?php

class Reg
{
	private $reg;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->reg = new Smarty;
		
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