<?php

class AdminVideoLinks
{
	private $adminVideoLinks;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminVideoLinks = new SmartyBC;
		$this->adminVideoLinks->assign("titleVideoLinks", $content['TITLEVIDEOLINKS']);
		
		$this->adminVideoLinks->assign("save", $content['SAVE']);
		$this->adminVideoLinks->assign("lang", $controller->lang);
		
		
		$this->adminVideoLinks->assign("result", $result);
		$this->adminVideoLinks->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminVideoLinks->display($templatePath."adminVideoLinks.tpl");
	}
	
	private function getAccessTypes($controller)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select id, name".$controller->lang." name from accesstypes");
		return $res;
	}
}

?>