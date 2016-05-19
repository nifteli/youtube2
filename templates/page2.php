<?php

class Page2
{
	private $page2;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->page2 = new Smarty;
		$data = $controller->getNotifications(1);//print_r($data);
		$this->page2->assign("body",$data["page2"]);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->page2->display($templatePath."page2.tpl");
	}
	
}

?>