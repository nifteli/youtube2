<?php

class AdminFooter
{
	private $adminFooter;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->adminFooter = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminFooter->display($templatePath."adminFooter.tpl");
	}
}

?>