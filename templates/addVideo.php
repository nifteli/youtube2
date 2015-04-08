<?php

class AddVideo
{
	private $videos;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->videos = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->videos->display($templatePath."addVideo.tpl");
	}
}

?>