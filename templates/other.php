<?php

class Other
{
	private $other;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->other = new Smarty;
		$this->other->assign("otherTitle",$content['OTHER']);
		$data = $controller->getNotifications(1);//print_r($data);
		$this->other->assign("body",$data["other"]);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->other->display($templatePath."other.tpl");
	}
	
}

?>