<?php

class AdminNotifications
{
	private $adminNotifications;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminNotifications = new SmartyBC;
		$this->adminNotifications->assign("titleNotifications", $content['TITLENOTIFICATIONS']);
		$this->adminNotifications->assign("save", $content['SAVE']);
		$this->adminNotifications->assign("lang", $controller->lang);
		$this->adminNotifications->assign("result", $result);
		$this->adminNotifications->assign("messages", $messages);
		$this->adminNotifications->assign("delete", $content['DELETE']);
		$this->adminNotifications->assign("edit", $content['EDIT']);
		
		$this->adminNotifications->assign("middleNote", $content['MIDDLENOTE']);
		$this->adminNotifications->assign("rightNote", $content['RIGHTNOTE']);
		$this->adminNotifications->assign("siteRules", $content['SITERULES']);
		$this->adminNotifications->assign("aboutUs", $content['ABOUTUS']);
		$this->adminNotifications->assign("other", $content['OTHER']);
		
		$notifications = $controller->getNotifications(1);
		
		$this->adminNotifications->assign("middleNoteVal", $notifications['middleNote']);
		$this->adminNotifications->assign("rightNoteVal", $notifications['rightNote']);
		$this->adminNotifications->assign("siteRulesVal", $notifications['siteRules']);
		$this->adminNotifications->assign("aboutUsVal", $notifications['aboutUs']);
		$this->adminNotifications->assign("otherVal", $notifications['other']);
		$this->adminNotifications->assign("page1Val", $notifications['page1']);
		$this->adminNotifications->assign("page2Val", $notifications['page2']);
		
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminNotifications->display($templatePath."adminNotifications.tpl");
	}
	
}

?>