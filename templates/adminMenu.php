<?php

class AdminMenu
{
	private $adminMenu;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->adminMenu = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminMenu	->display($templatePath."adminMenu.tpl");
	}
}

?>