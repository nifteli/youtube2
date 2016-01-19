<?php

class EditRole
{
	private $editRole;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->editRole = new SmartyBC;
		if(isset($_GET["id"]) && is_numeric($_GET["id"]))
			$roleId = $_GET["id"];
		if(isset($_POST["roleId"]) && is_numeric($_POST["roleId"]))
			$roleId = $_POST["roleId"];
		$this->editRole->assign("titleRole", $this->getRoleName($controller,$roleId));
		$this->editRole->assign("actionName", $content['ACTIONNAME']);
		$this->editRole->assign("dateRange", $content['DATERANGE']);
		$this->editRole->assign("hasAccess", $content['HASACCESS']);
		
		$this->editRole->assign("save", $content['SAVE']);
		$this->editRole->assign("lang", $controller->lang);
		$this->editRole->assign("accessTypes", $this->getAccessTypes($controller));
		
		$setAccessesArr = $this->getSetAccesses($controller,$roleId,$fromArr,$toArr);
		$this->editRole->assign("roleId", $roleId);
		$this->editRole->assign("setAccessesArr", isset($setAccessesArr)?$setAccessesArr:array());
		$this->editRole->assign("fromArr", isset($fromArr)?$fromArr:array());
		$this->editRole->assign("toArr", isset($toArr)?$toArr:array());
		
		$this->editRole->assign("result", $result);
		$this->editRole->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->editRole->display($templatePath."editRole.tpl");
	}
	
	private function getAccessTypes($controller)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select id, name".$controller->lang." name from accesstypes");
		return $res;
	}
	
	private function getRoleName($controller,$id)
	{
		$controller->db->where("id=$id");
		$res = $controller->db->get("roles");
		return $res[0]["name"];
	}
	
	private function getSetAccesses($controller,$id,&$fromArr,&$toArr)
	{
		$controller->db->where("roleId=$id");
		$res = $controller->db->get("roleaccess");
		for($i=0; $i<count($res); $i++)
		{
			$fromArr[$res[$i]["accessTypeId"]] = $controller->getNormalizedDate($res[$i]["startDate"]);
			$toArr[$res[$i]["accessTypeId"]] = $controller->getNormalizedDate($res[$i]["endDate"]);
			$ret[] = $res[$i]["accessTypeId"];
		}
		return $ret;
	}
}

?>