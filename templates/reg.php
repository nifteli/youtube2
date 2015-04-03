<?php

class Reg
{
	private $reg;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->reg = new Smarty;
		$this->reg->assign("search",$content['SEARCH']);
		
		$this->reg->assign("errorMessage",$errorMessage);
		$this->reg->assign("okMessage",$okMessage);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->reg->display($templatePath."reg.tpl");
	}
}

?>