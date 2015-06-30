<?php

class AdminRoles
{
	private $adminRoles;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->adminRoles = new SmartyBC;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminRoles->display($templatePath."adminRoles.tpl");
	}
}

?>