<?php

class AdminTags
{
	private $adminTags;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminTags = new SmartyBC;
		$this->adminTags->assign("titleTags", $content['TITLETAGS']);
		$this->adminTags->assign("save", $content['SAVE']);
		$this->adminTags->assign("lang", $controller->lang);
		$this->adminTags->assign("result", $result);
		$this->adminTags->assign("messages", $messages);
		$this->adminTags->assign("delete", $content['DELETE']);
		$this->adminTags->assign("edit", $content['EDIT']);
		$this->adminTags->assign("export", $content['EXPORT']);
		$this->adminTags->assign("filter", $content['FILTER']);
		$this->adminTags->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		$this->adminTags->assign("substitute", $content['SUBSTITUTE']);
		//$this->adminTags->assign("confirm", $content['CONFIRM']);
		
		$this->adminTags->assign("lnLang", $content['LANGUAGE']);
		$this->adminTags->assign("lnName", $content['TAG']);
		$this->adminTags->assign("lnNewTag", $content['NEWTAG']);
		$this->adminTags->assign("lnCreated", $content['DATECREATED']);
		$this->adminTags->assign("lnCreatedBy", $content['CREATEDBY']);
		$this->adminTags->assign("lnUpdated", $content['DATEUPDATED']);
		$this->adminTags->assign("lnUpdatedBy", $content['UPDATEDBY']);
		$this->adminTags->assign("lnVideoCntTagged", $content['VIDEOCNTTAGGED']);
		$this->adminTags->assign("lnUserCntClicked", $content['USERCNTCLICKED']);
		$this->adminTags->assign("lnClickCnt", $content['CLICKCNT']);
		
		$this->adminTags->assign("hasEditAccess", $controller->access->authorized(31));
		$this->adminTags->assign("hasDeleteAccess", $controller->access->authorized(30));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminTags->assign("languageIdVal", $_POST["languageId"]);
			$this->adminTags->assign("nameVal", $_POST["name"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["langSortType"]))
			$sortType = ($_GET["langSortType"] == "" || $_GET["langSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["nameSortType"]))
			$sortType = ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC';
				
		
		$this->adminTags->assign("langSortType", ($_GET["langSortType"] == "" || $_GET["langSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("nameSortType", ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=10;
		$this->adminTags->assign("perPage", $perPage);
		$this->adminTags->assign("tags", $controller->getTags($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminTags->assign("tagPages",$controller->getPages($begin,$perPage,$cnt,"adminTags"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminTags->display($templatePath."adminTags.tpl");
	}
	
}

?>