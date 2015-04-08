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
		$this->reg->assign("surname",$content['SURNAME']);
		$this->reg->assign("captcha",$content['CAPTCHA']);
		$this->reg->assign("gender",$content['GENDER']);
		$this->reg->assign("phone",$content['PHONE']);
		$this->reg->assign("register",$content['REGISTER']);
		$this->reg->assign("cancel",$content['CANCEL']);
		$this->reg->assign("male",$content['MALE']);
		$this->reg->assign("female",$content['FEMALE']);
		$this->reg->assign("email",$content['EMAIL']);
		$this->reg->assign("language",$content['LANGUAGE']);
		$this->reg->assign("username",$content['USERNAME']);
		$this->reg->assign("password",$content['PASSWORD']);
		
		$this->reg->assign("errorMessage",$errorMessage);
		$this->reg->assign("okMessage",$okMessage);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->reg->display($templatePath."reg.tpl");
	}
}

?>