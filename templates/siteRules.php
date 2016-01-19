<?php

class SiteRules
{
	private $siteRules;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->siteRules = new Smarty;
		$this->siteRules->assign("siteRulesTitle",$content['SITERULES']);
		$data = $controller->getNotifications(1);//print_r($data);
		$this->siteRules->assign("body",$data["siteRules"]);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->siteRules->display($templatePath."siteRules.tpl");
	}
	
}

?>