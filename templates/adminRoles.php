<?php

class AdminRoles
{
	private $adminRoles;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminRoles = new SmartyBC;
		$this->adminRoles->assign("titleRoles", $content['TITLEROLES']);
		$this->adminRoles->assign("actionName", $content['ACTIONNAME']);
		$this->adminRoles->assign("dateRange", $content['DATERANGE']);
		$this->adminRoles->assign("hasAccess", $content['HASACCESS']);
		$this->adminRoles->assign("save", $content['SAVE']);
		$this->adminRoles->assign("lang", $controller->lang);
		$this->adminRoles->assign("accessTypes", $this->getAccessTypes($controller));
		
		$this->adminRoles->assign("result", $result);
		$this->adminRoles->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminRoles->display($templatePath."adminRoles.tpl");
	}
	
	private function getAccessTypes($controller)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select id, name".$controller->lang." name from accesstypes");
		return $res;
	}
}

?>