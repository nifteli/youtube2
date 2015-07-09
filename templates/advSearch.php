<?php

class AdvSearch
{
	private $advSearch;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->advSearch = new Smarty;
		
		$this->advSearch->assign("vqHow", $content['HOW']);
		$this->advSearch->assign("vqWhy", $content['WHY']);
		$this->advSearch->assign("vqWho", $content['WHO']);
		$this->advSearch->assign("vqWhat", $content['WHAT']);
		$this->advSearch->assign("search",$content['SEARCH']);
		$this->advSearch->assign("lang",$controller->lang);
		$this->advSearch->assign("languages", $controller->getLanguages());
		$this->advSearch->assign("allCategories", json_encode($controller->getAllCategories()));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->advSearch->display($templatePath."advSearch.tpl");
	}
}

?>