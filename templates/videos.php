<?php

class Videos
{
	private $videos;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->videos = new Smarty;
		$this->videos->assign("lang",$controller->lang);
		
		$this->videos->assign("catId", isset($_GET["catId"]) ? $_GET["catId"] : "");
		$this->videos->assign("userId", isset($_GET["userId"]) ? $_GET["userId"] : "");
		$this->videos->assign("tagId", isset($_GET["tagId"]) ? $_GET["tagId"] : "");
		$this->videos->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		$this->videos->assign("okMessage", isset($okMessage) ? $okMessage : "");
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->videos->display($templatePath."videos.tpl");
	}
}

?>