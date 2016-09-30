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
		$this->forgotPass->assign("lang",$controller->lang);
		$this->forgotPass->assign("forgotPass",$content['FORGOTPASS']);
		$this->forgotPass->assign("sendToMail",$content['SENDTOMAIL']);
		$this->forgotPass->assign("secQuestions",$controller->getSecretQuestions());
		$this->forgotPass->assign("question",$content['SECRETQUESTION']);
		$this->forgotPass->assign("answer",$content['SECRETANSWER']);
		$this->forgotPass->assign("or",$content['OR']);
		$this->forgotPass->assign("forgotPassNote",$content['FORGOTPASSNOTE']);
		$this->forgotPass->assign("changePass",$content['CHANGEPASS']);
		$this->forgotPass->assign("password",$content['PASSWORD']);
		$this->forgotPass->assign("passwordAgain",$content['PASSWORDAGAIN']);
		$this->forgotPass->assign("save",$content['SAVE']);
		$this->forgotPass->assign("userName",$content['USERNAME']);
		
		if(isset($_GET["email"]) && isset($_GET["hash"]) && $_GET["email"] != "" && $_GET["hash"] != "")
		{
			$this->forgotPass->assign("rEmail",$_GET["email"]);
			$this->forgotPass->assign("rHash",$_GET["hash"]);
		}
		if(is_numeric($_POST["secretQuestionId"]) && trim($_POST["secretAnswer"]) != "" && trim($_POST["uname"]) != "")
		{
			if($this->checkAnswer(trim($_POST["uname"]),$_POST["secretQuestionId"],trim($_POST["secretAnswer"]),$controller,$rEmail,$rHash))
			{
				$this->forgotPass->assign("secret",1);
				$this->forgotPass->assign("rEmail",$rEmail);
				$this->forgotPass->assign("rHash",$rHash);
			}
			else
			{
				$errorMessage = "Secret question and/or answer is incorrect";
			}
				
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
	
	public function checkAnswer($userName,$secId,$answer,$controller,&$rEmail,&$rHash)
	{
		$controller->db->where("secretAnswer='".$answer."' and secretQuestionId=".$secId." and userName='".$userName."'");
		$res = $controller->db->get("users");
		if($controller->db->count > 0)
		{
			$rEmail = $res[0]["email"];
			$rHash = $res[0]["hash"];
			//echo $email.$hash;
			return true;
		}
		return false;
			
	}
}

?>