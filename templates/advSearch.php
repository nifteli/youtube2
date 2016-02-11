<?php

class AdvSearch
{
	private $advSearch;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->advSearch = new Smarty;
		$this->advSearch->assign("allLangs",$content['ALLLANGS']);
		$this->advSearch->assign("allCats",$content['ALLCATS']);
		$this->advSearch->assign("all",$content['ALL']);
		$this->advSearch->assign("moreThan4",$content['MORETHAN4']);
		$this->advSearch->assign("lessThan15",$content['LESSTHAN15']);
		$this->advSearch->assign("date",$content['DATE']);
		$this->advSearch->assign("signIn",$content['SIGNIN']);
		$this->advSearch->assign("hour",$content['HOUR']);
		$this->advSearch->assign("minute",$content['MINUTE']);
		$this->advSearch->assign("fromDate",$content['FROMDATE']);
		$this->	advSearch->assign("toDate",$content['TODATE']);
		$this->advSearch->assign("profil",$content['PROFILE']);
		$this->advSearch->assign("regOrEnterNote1",$content['REGORENTERNOTE1']);
		$this->advSearch->assign("enterLink",$content['ENTERLINK']);
		$this->advSearch->assign("regOrEnterNote2",$content['REGORENTERNOTE2']);
		$this->advSearch->assign("regLink",$content['REGLINK']);
		
		$this->advSearch->assign("selectAll",$content['SELECTALL']);
		$this->advSearch->assign("opt1",$content['OPT1']);
		$this->advSearch->assign("opt2",$content['OPT2']);
		$this->advSearch->assign("opt3",$content['OPT3']);
		$this->advSearch->assign("opt4",$content['OPT4']);
		$this->advSearch->assign("opt5",$content['OPT5']);
		$this->advSearch->assign("opt6",$content['OPT6']);
		$this->advSearch->assign("opt7",$content['OPT7']);
		$this->advSearch->assign("opt8",$content['OPT8']);
		$this->advSearch->assign("opt9",$content['OPT9']);
		$this->advSearch->assign("opt10",$content['OPT10']);
		$this->advSearch->assign("opt11",$content['OPT11']);
		
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