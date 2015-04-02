<?php

class Footer
{
	private $footer;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->footer = new Smarty;
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->footer->display($templatePath."footer.tpl");
	}
}

?>