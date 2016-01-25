<?php

class AdminMenu
{
	private $adminMenu;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->adminMenu = new Smarty;
		
		$this->adminMenu->assign("mnAdminPanel", $content['MNADMINPANEL']);
		$this->adminMenu->assign("mnProfile", $content['MNPROFILE']);
		$this->adminMenu->assign("mnRoles", $content['MNROLES']);
		$this->adminMenu->assign("mnUsers", $content['MNUSERS']);
		$this->adminMenu->assign("mnVideoLinks", $content['MNVIDEOLINKS']);
		$this->adminMenu->assign("mnComments", $content['MNCOMMENTS']);
		$this->adminMenu->assign("mnFolders", $content['MNFOLDERS']);
		$this->adminMenu->assign("mnTags", $content['MNTAGS']);
		$this->adminMenu->assign("mnGuests", $content['MNGUESTS']);
		$this->adminMenu->assign("mnDefinitions", $content['MNDEFINITIONS']);
		$this->adminMenu->assign("mnCategories", $content['MNCATEGORIES']);
		$this->adminMenu->assign("mnNotifications", $content['MNNOTIFICATIONS']);
		
		$this->adminMenu->assign("logout",$content['LOGOUT']);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminMenu->display($templatePath."adminMenu.tpl");
	}
}

?>