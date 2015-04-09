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
		if(isset($errorMessage))
			$this->videos->assign("errorMessage",$errorMessage);
		if(isset($okMessage))
			$this->videos->assign("okMessage",$okMessage);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->videos->display($templatePath."videos.tpl");
	}
}

?>