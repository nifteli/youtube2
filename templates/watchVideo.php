<?php

class WatchVideo
{
	private $watchVideo;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->watchVideo = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->watchVideo->display($templatePath."watchVideo.tpl");
	}
}

?>