<?php

class Users
{
	private $users;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->users = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->users->display($templatePath."users.tpl");
	}
}

?>