<?php

class AllTags
{
	private $allTags;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->allTags = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->allTags->display($templatePath."allTags.tpl");
	}
}

?>