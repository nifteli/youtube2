<?php

class AdminExports
{
	private $adminExports;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminExports = new SmartyBC;
		$this->adminExports->assign("titleExports", $content['TITLEEXPORTS']);
		$this->adminExports->assign("save", $content['SAVE']);
		$this->adminExports->assign("lang", $controller->lang);
		$this->adminExports->assign("result", $result);
		$this->adminExports->assign("messages", $messages);
		$this->adminExports->assign("delete", $content['DELETE']);
		$this->adminExports->assign("edit", $content['EDIT']);
		$this->adminComments->assign("export", $content['EXPORT']);
		
		
		
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminExports->display($templatePath."adminExports.tpl");
	}
	
}

?>