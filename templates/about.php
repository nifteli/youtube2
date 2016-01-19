<?php

class About
{
	private $about;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->about = new Smarty;
		$this->about->assign("aboutTitle",$content['ABOUT']);
		$data = $controller->getNotifications(1);//print_r($data);
		$this->about->assign("aboutBody",$data["aboutUs"]);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->about->display($templatePath."about.tpl");
	}
	
}

?>