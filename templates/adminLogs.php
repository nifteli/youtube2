<?php

class AdminLogs
{
	private $adminLogs;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminLogs = new SmartyBC;
		$this->adminLogs->assign("lang", $controller->lang);
		$this->adminLogs->assign("result", $result);
		$this->adminLogs->assign("messages", $messages);
		$this->adminLogs->assign("delete", $content['DELETE']);
		$this->adminLogs->assign("edit", $content['EDIT']);
		$this->adminLogs->assign("export", $content['EXPORT']);
		$this->adminLogs->assign("filter", $content['FILTER']);
		$this->adminLogs->assign("confirm", $content['CONFIRM']);
		
		$this->adminLogs->assign("lnEntryDate", $content['ENTRYDATE']);
		$this->adminLogs->assign("lnId", $content['ID']);
		$this->adminLogs->assign("lnIP", $content['IP']);
		$this->adminLogs->assign("lnDevice", $content['DEVICE']);
		$this->adminLogs->assign("lnBrowser", $content['BROWSER']);
		$this->adminLogs->assign("lnVideCntWatched", $content['VIDEOCNTWATCHED']);
		$this->adminLogs->assign("lnVideoCntCommented", $content['VIDEOCNTCOMMENTED']);
		$this->adminLogs->assign("lnCommentCnt", $content['COMMENTCNT']);
		$this->adminLogs->assign("lnSearchCnt", $content['SEARCHCNT']);
		
		$this->adminLogs->assign("entryDateGuestHint", $content['entryDateGuestHint']);
		
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminLogs->assign("entryDateVal", $_POST["entryDate"]);
			
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["entryDateSortType"]))
			$sortType = ($_GET["entryDateSortType"] == "" || $_GET["entryDateSortType"] == "ASC")? 'DESC' : 'ASC';
		
		
		
		$this->adminLogs->assign("entryDateSortType", ($_GET["entryDateSortType"] == "" || $_GET["entryDateSortType"] == "ASC")? 'DESC' : 'ASC');
		
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
		$this->adminLogs->assign("perPage", $perPage);
		$this->adminLogs->assign("logs", $controller->getSearches($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminLogs->assign("logPages",$controller->getPages($begin,$perPage,$cnt,"adminLogs"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminLogs->display($templatePath."adminLogs.tpl");
	}
	
}

?>