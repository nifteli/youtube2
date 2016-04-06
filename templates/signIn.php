<?php

class SignIn
{
	private $signIn;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		
		$this->signIn = new Smarty;
		$this->signIn->assign("login",$content['LOGIN']);
		$this->signIn->assign("forgotPass",$content['FORGOTPASS']);
		$this->signIn->assign("lang",$controller->lang);
		$this->signIn->assign("userName",$content['USERNAME']);
		$this->signIn->assign("password",$content['PASSWORD']);
		$this->signIn->assign("signUp",$content['SIGN_UP']);
		
		$this->signIn->assign("signInNote1",$content['SIGNINNOTE1']);
		$this->signIn->assign("signInNote2",$content['SIGNINNOTE2']);
		$this->signIn->assign("signInNote3",$content['SIGNINNOTE3']);
		$this->signIn->assign("signInNote4",$content['SIGNINNOTE4']);
		$this->signIn->assign("signInNote5",$content['SIGNINNOTE5']);
		$this->signIn->assign("signInNote6",$content['SIGNINNOTE6']);
		$this->signIn->assign("or",$content['OR']);
		$this->signIn->assign("rememberMe",$content['REMEMBERME']);
		$this->signIn->assign("src",$_GET["src"]);
		$this->signIn->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		//$this->videos->assign("okMessage", isset($okMessage) ? $okMessage : "");
		
		//$this->signIn->assign("signIn",$this->getUsers($controller->lang,$controller->db));
	}
	
	public function Show()
	{
		global $templatePath;
		$this->signIn->display($templatePath."signIn.tpl");
	}
}

?>