<?php

class AdminTags
{
	private $adminTags;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminTags = new SmartyBC;
		$this->adminTags->assign("languages", $controller->getLanguages());
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
		$this->adminTags->assign("undeleteConfirmation", $content['UNDELETECONFIRMATION']);
		$this->adminTags->assign("substitute", $content['SUBSTITUTE']);
		//$this->adminTags->assign("confirm", $content['CONFIRM']);
		
		$this->adminTags->assign("lnLang", $content['LANGUAGE']);
		$this->adminTags->assign("lnName", $content['TAG']);
		$this->adminTags->assign("lnNewTag", $content['NEWTAG']);
		$this->adminTags->assign("lnCreated", $content['DATECREATED']);
		$this->adminTags->assign("lnCreatedById", $content['CREATEDBYID']);
		$this->adminTags->assign("lnCreatedBy", $content['CREATEDBY']);
		$this->adminTags->assign("lnCreatedByIP", $content['CREATEDBYIP']);
		$this->adminTags->assign("lnUpdated", $content['DATEUPDATED']);
		$this->adminTags->assign("lnUpdatedById", $content['UPDATEDBYID']);
		$this->adminTags->assign("lnUpdatedBy", $content['UPDATEDBY']);
		$this->adminTags->assign("lnUpdatedByIP", $content['UPDATEDBYIP']);
		$this->adminTags->assign("lnVideoCntTagged", $content['VIDEOCNTTAGGED']);
		$this->adminTags->assign("lnUserCntClicked", $content['USERCNTCLICKED']);
		$this->adminTags->assign("lnClickCnt", $content['CLICKCNT']);
		$this->adminTags->assign("lnFolderCnt", $content['lnFolderCnt']);
		
		$this->adminTags->assign("langTagsHint", $content['langTagsHint']);
		$this->adminTags->assign("nameTagsHint", $content['nameTagsHint']);
		$this->adminTags->assign("lnNewTagTagsHint", $content['lnNewTagTagsHint']);
		$this->adminTags->assign("deleteTagsHint", $content['deleteTagsHint']);
		$this->adminTags->assign("createdTagsHint", $content['createdTagsHint']);
		$this->adminTags->assign("createdByIdTagsHint", $content['createdByIdTagsHint']);
		$this->adminTags->assign("createdByTagsHint", $content['createdByTagsHint']);
		$this->adminTags->assign("createdByIPTagsHint", $content['createdByIPTagsHint']);
		$this->adminTags->assign("updatedTagsHint", $content['updatedTagsHint']);
		$this->adminTags->assign("updatedByIdTagsHint", $content['updatedByIdTagsHint']);
		$this->adminTags->assign("updatedByTagsHint", $content['updatedByTagsHint']);
		$this->adminTags->assign("updatedByIPTagsHint", $content['updatedByIPTagsHint']);
		$this->adminTags->assign("videoCntTaggedTagsHint", $content['videoCntTaggedTagsHint']);
		$this->adminTags->assign("userCntClickedTagsHint", $content['userCntClickedTagsHint']);
		$this->adminTags->assign("clickCntTagsHint", $content['clickCntTagsHint']);
		$this->adminTags->assign("folderCntTagsHint", $content['folderCntTagsHint']);
		
		$this->adminTags->assign("hasEditAccess", $controller->access->authorized(31));
		$this->adminTags->assign("hasDeleteAccess", $controller->access->authorized(30));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminTags->assign("languageIdVal", $_POST["languageId"]);
			$this->adminTags->assign("createdVal", $_POST["created"]);
			$this->adminTags->assign("nameVal", $_POST["name"]);
			$this->adminTags->assign("createdTillVal", $_POST["createdTill"]);
			$this->adminTags->assign("updatedVal", $_POST["updated"]);
			$this->adminTags->assign("updatedTillVal", $_POST["updatedTill"]);
			$this->adminTags->assign("updatedByIdVal", $_POST["updatedById"]);
			$this->adminTags->assign("updatedByVal", $_POST["updatedBy"]);
			$this->adminTags->assign("updatedByIPVal", $_POST["updatedByIP"]);
			$this->adminTags->assign("createdByIdVal", $_POST["createdById"]);
			$this->adminTags->assign("createdByVal", $_POST["createdBy"]);
			$this->adminTags->assign("createdByIPVal", $_POST["createdByIP"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["langSortType"]))
			$sortType = ($_GET["langSortType"] == "" || $_GET["langSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["nameSortType"]))
			$sortType = ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdSortType"]))
			$sortType = ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdBySortType"]))
			$sortType = ($_GET["createdBySortType"] == "" || $_GET["createdBySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIdSortType"]))
			$sortType = ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIPSortType"]))
			$sortType = ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedSortType"]))
			$sortType = ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedByIdSortType"]))
			$sortType = ($_GET["updatedByIdSortType"] == "" || $_GET["updatedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedBySortType"]))
			$sortType = ($_GET["updatedBySortType"] == "" || $_GET["updatedBySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedByIPSortType"]))
			$sortType = ($_GET["updatedByIPSortType"] == "" || $_GET["updatedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoCntTaggedSortType"]))
			$sortType = ($_GET["videoCntTaggedSortType"] == "" || $_GET["videoCntTaggedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userCntClickedSortType"]))
			$sortType = ($_GET["userCntClickedSortType"] == "" || $_GET["userCntClickedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["clickCntSortType"]))
			$sortType = ($_GET["clickCntSortType"] == "" || $_GET["clickCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["folderCntSortType"]))
			$sortType = ($_GET["folderCntSortType"] == "" || $_GET["folderCntSortType"] == "ASC")? 'DESC' : 'ASC';

			
		$this->adminTags->assign("langSortType", ($_GET["langSortType"] == "" || $_GET["langSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("nameSortType", ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("createdByIdSortType", ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("createdBySortType", ($_GET["createdBySortType"] == "" || $_GET["createdBySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("createdByIPSortType", ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("updatedSortType", ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("updatedByIdSortType", ($_GET["updatedByIdSortType"] == "" || $_GET["updatedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("updatedBySortType", ($_GET["updatedBySortType"] == "" || $_GET["updatedBySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("updatedByIPSortType", ($_GET["updatedByIPSortType"] == "" || $_GET["updatedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("videoCntTaggedSortType", ($_GET["videoCntTaggedSortType"] == "" || $_GET["videoCntTaggedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("userCntClickedSortType", ($_GET["userCntClickedSortType"] == "" || $_GET["userCntClickedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("clickCntSortType", ($_GET["clickCntSortType"] == "" || $_GET["clickCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminTags->assign("folderCntSortType", ($_GET["folderCntSortType"] == "" || $_GET["folderCntSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
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