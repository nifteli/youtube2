<?php

class AdminGuests
{
	private $adminGuests;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminGuests = new SmartyBC;
		$this->adminGuests->assign("titleGuests", $content['TITLEGUESTS']);
		$this->adminGuests->assign("save", $content['SAVE']);
		$this->adminGuests->assign("lang", $controller->lang);
		$this->adminGuests->assign("result", $result);
		$this->adminGuests->assign("messages", $messages);
		$this->adminGuests->assign("delete", $content['DELETE']);
		$this->adminGuests->assign("edit", $content['EDIT']);
		$this->adminGuests->assign("export", $content['EXPORT']);
		$this->adminGuests->assign("filter", $content['FILTER']);
		$this->adminGuests->assign("confirm", $content['CONFIRM']);
		
		$this->adminGuests->assign("lnEntryDate", $content['ENTRYDATE']);
		$this->adminGuests->assign("lnIP", $content['IP']);
		$this->adminGuests->assign("lnDevice", $content['DEVICE']);
		$this->adminGuests->assign("lnBrowser", $content['BROWSER']);
		$this->adminGuests->assign("lnVideCntWatched", $content['VIDEOCNTWATCHED']);
		$this->adminGuests->assign("lnVideoCntCommented", $content['VIDEOCNTCOMMENTED']);
		$this->adminGuests->assign("lnCommentCnt", $content['COMMENTCNT']);
		$this->adminGuests->assign("lnSearchCnt", $content['SEARCHCNT']);
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminGuests->assign("entryDateVal", $_POST["entryDate"]);
			$this->adminGuests->assign("IPVal", $_POST["IP"]);
			$this->adminGuests->assign("deviceVal", $_POST["device"]);
			$this->adminGuests->assign("browserVal", $_POST["browser"]);
			$this->adminGuests->assign("videCntWatchedVal", $_POST["videCntWatched"]);
			$this->adminGuests->assign("videoCntCommentedVal", $_POST["videoCntCommented"]);
			$this->adminGuests->assign("commentCntVal", $_POST["commentCnt"]);
			$this->adminGuests->assign("searchCntVal", $_POST["searchCnt"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["entryDateSortType"]))
			$sortType = ($_GET["entryDateSortType"] == "" || $_GET["entryDateSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["IPSortType"]))
			$sortType = ($_GET["IPSortType"] == "" || $_GET["IPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deviceSortType"]))
			$sortType = ($_GET["deviceSortType"] == "" || $_GET["deviceSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["browserSortType"]))
			$sortType = ($_GET["browserSortType"] == "" || $_GET["browserSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videCntWatchedSortType"]))
			$sortType = ($_GET["videCntWatchedSortType"] == "" || $_GET["videCntWatchedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoCntCommentedSortType"]))
			$sortType = ($_GET["videoCntCommentedSortType"] == "" || $_GET["videoCntCommentedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["commentCntSortType"]))
			$sortType = ($_GET["commentCntSortType"] == "" || $_GET["commentCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["searchCntSortType"]))
			$sortType = ($_GET["searchCntSortType"] == "" || $_GET["searchCntSortType"] == "ASC")? 'DESC' : 'ASC';
		
		
		$this->adminGuests->assign("entryDateSortType", ($_GET["entryDateSortType"] == "" || $_GET["entryDateSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("IPSortType", ($_GET["IPSortType"] == "" || $_GET["IPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("deviceSortType", ($_GET["deviceSortType"] == "" || $_GET["deviceSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("browserSortType", ($_GET["browserSortType"] == "" || $_GET["browserSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("videCntWatchedSortType", ($_GET["videCntWatchedSortType"] == "" || $_GET["videCntWatchedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("videoCntCommentedSortType", ($_GET["videoCntCommentedSortType"] == "" || $_GET["videoCntCommentedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("commentCntSortType", ($_GET["commentCntSortType"] == "" || $_GET["commentCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminGuests->assign("searchCntSortType", ($_GET["searchCntSortType"] == "" || $_GET["searchCntSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
		$this->adminGuests->assign("perPage", $perPage);
		$this->adminGuests->assign("guests", $controller->getGuests($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminGuests->assign("guestPages",$controller->getPages($begin,$perPage,$cnt,"adminGuests"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminGuests->display($templatePath."adminGuests.tpl");
	}
	
}

?>