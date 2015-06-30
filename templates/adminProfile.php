<?php

class AdminProfile
{
	private $adminProfile;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->adminProfile = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminProfile->display($templatePath."adminProfile.tpl");
	}
}

?>