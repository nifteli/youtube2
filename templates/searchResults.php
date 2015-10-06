<?php

class SearchResults
{
	private $searchRes;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->searchRes = new Smarty;
		$this->searchRes->assign("lang", $controller->lang);
		//$this->searchRes->assign("userId", isset($_GET["userId"]) ? $_GET["userId"] : "");
		$this->searchRes->assign("search", $_POST["search"]);
		$this->searchRes->assign("language", $_POST["language"]);
		$this->searchRes->assign("videoQuestion", isset($_POST["videoQuestion"]) ? array_sum($_POST["videoQuestion"]) : 0);
		$this->searchRes->assign("category", $_POST["category"]);
		$this->searchRes->assign("time", $_POST["time"]);
		$this->searchRes->assign("interval", $_POST["interval".$_POST["time"]]);
		$this->searchRes->assign("fromDate", $_POST["fromDate"]);
		$this->searchRes->assign("toDate", $_POST["toDate"]);
		$this->searchRes->assign("options", isset($_POST["opt"]) ? implode("," ,$_POST["opt"]) : "");
		
		$this->searchRes->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		$this->searchRes->assign("okMessage", isset($okMessage) ? $okMessage : "");
		
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->searchRes->display($templatePath."searchResults.tpl");
	}
}

?>