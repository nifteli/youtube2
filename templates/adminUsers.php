<?php

class AdminUsers
{
	private $adminUsers;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminUsers = new SmartyBC;
		$this->adminUsers->assign("titleUsers", $content['TITLEUSERS']);
		
		/*$this->adminUsers->assign("actionName", $content['ACTIONNAME']);
		$this->adminUsers->assign("dateRange", $content['DATERANGE']);
		$this->adminUsers->assign("hasAccess", $content['HASACCESS']);
		$this->adminUsers->assign("save", $content['SAVE']);
		$this->adminUsers->assign("lang", $controller->lang);
		$this->adminUsers->assign("accessTypes", $this->getAccessTypes($controller));*/
		
		$this->adminUsers->assign("result", $result);
		$this->adminUsers->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminUsers->display($templatePath."adminUsers.tpl");
	}
	
	private function getAccessTypes($controller)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select id, name".$controller->lang." name from accesstypes");
		return $res;
	}
}

?>