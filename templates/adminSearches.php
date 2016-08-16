<?php

class AdminSearches
{
	private $adminSearches;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminSearches = new SmartyBC;
		$this->adminSearches->assign("lang", $controller->lang);
		$this->adminSearches->assign("result", $result);
		$this->adminSearches->assign("messages", $messages);
		$this->adminSearches->assign("delete", $content['DELETE']);
		$this->adminSearches->assign("edit", $content['EDIT']);
		$this->adminSearches->assign("export", $content['EXPORT']);
		$this->adminSearches->assign("filter", $content['FILTER']);
		$this->adminSearches->assign("confirm", $content['CONFIRM']);
		
		$this->adminSearches->assign("lnCreatedDate", $content['SEARCHDATE']);
		$this->adminSearches->assign("lnKeyword", $content['KEYWORD']);
		$this->adminSearches->assign("lnCreatedById", $content['SEARCHERID']);
		$this->adminSearches->assign("lnSearcher", $content['SEARCHER']);
		$this->adminSearches->assign("lnCreatedByIP", $content['SEARCHERIP']);
		
		
		$this->adminSearches->assign("createdDateSearchesHint", $content['createdDateSearchesHint']);
		$this->adminSearches->assign("keywordSearchesHint", $content['keywordSearchesHint']);
		$this->adminSearches->assign("createdByIdSearchesHint", $content['createdByIdSearchesHint']);
		$this->adminSearches->assign("searcherSearchesHint", $content['searcherSearchesHint']);
		$this->adminSearches->assign("createdByIPSearcesHint", $content['createdByIPSearcesHint']);
		
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminSearches->assign("createdDateVal", $_POST["createdDate"]);
			$this->adminSearches->assign("createdDateTillVal", $_POST["createdDateTill"]);
			$this->adminSearches->assign("keywordVal", $_POST["keyword"]);
			$this->adminSearches->assign("createdByIdVal", $_POST["createdById"]);
			$this->adminSearches->assign("searcherVal", $_POST["searcher"]);
			$this->adminSearches->assign("createdByIPVal", $_POST["createdByIP"]);
			
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["createdDateSortType"]))
			$sortType = ($_GET["createdDateSortType"] == "" || $_GET["createdDateSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["keywordSortType"]))
			$sortType = ($_GET["keywordSortType"] == "" || $_GET["keywordSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIdSortType"]))
			$sortType = ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["searcherSortType"]))
			$sortType = ($_GET["searcherSortType"] == "" || $_GET["searcherSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIPSortType"]))
			$sortType = ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		
		
		
		$this->adminSearches->assign("createdDateSortType", ($_GET["createdDateSortType"] == "" || $_GET["createdDateSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminSearches->assign("keywordSortType", ($_GET["keywordSortType"] == "" || $_GET["keywordSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminSearches->assign("createdByIdSortType", ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminSearches->assign("searcherSortType", ($_GET["searcherSortType"] == "" || $_GET["searcherSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminSearches->assign("createdByIPSortType", ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
		$this->adminSearches->assign("perPage", $perPage);
		$this->adminSearches->assign("searches", $controller->getSearches($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminSearches->assign("searchPages",$controller->getPages($begin,$perPage,$cnt,"adminSearches"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminSearches->display($templatePath."adminSearches.tpl");
	}
	
}

?>