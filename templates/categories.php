<?php

class Categories
{
	private $categories;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->categories = new Smarty;
		$this->categories->assign("how",$content['HOW']);
		$this->categories->assign("why",$content['WHY']);
		$this->categories->assign("what",$content['WHAT']);
		$this->categories->assign("who",$content['WHO']);
		
		$this->categories->assign("catsHow",$controller->getCategories(8));
		$this->categories->assign("catsWhy",$controller->getCategories(4));
		$this->categories->assign("catsWhat",$controller->getCategories(1));
		$this->categories->assign("catsWho",$controller->getCategories(2));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->categories->display($templatePath."categories.tpl");
	}
}

?>