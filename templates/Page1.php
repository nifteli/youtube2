<?php

class Page1
{
	private $page1;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->page1 = new Smarty;
		$data = $controller->getNotifications(1);//print_r($data);
		$this->page1->assign("body",$data["page1"]);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->page1->display($templatePath."page1.tpl");
	}
	
}

?>