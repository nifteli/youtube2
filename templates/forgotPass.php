<?php

class ForgotPass
{
	private $forgotPass;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->forgotPass = new Smarty;
		$this->forgotPass->assign("email",$content['EMAIL']);
		if (isset($_POST["email"])) $this->forgotPass->assign("emailVal",$_POST["email"]);
		$this->forgotPass->assign("forgotPass",$content['FORGOTPASS']);
		$this->forgotPass->assign("sendToMail",$content['SENDTOMAIL']);
		
		if(isset($_GET["email"]) || isset($_GET["hash"]) || $_GET["email"] != "" || $_GET["hash"] != "")
		{
			$this->forgotPass->assign("rEmail",$_GET["email"]);
			$this->forgotPass->assign("rHash",$_GET["hash"]);
			$this->forgotPass->assign("password",$content['PASSWORD']);
			$this->forgotPass->assign("passwordAgain",$content['PASSWORDAGAIN']);
			$this->forgotPass->assign("save",$content['SAVE']);
		}
		if(isset($errorMessage))
			$this->forgotPass->assign("errorMessage",$errorMessage);
		if(isset($okMessage))
			$this->forgotPass->assign("okMessage",$okMessage);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->forgotPass->display($templatePath."forgotPass.tpl");
	}
}

?>