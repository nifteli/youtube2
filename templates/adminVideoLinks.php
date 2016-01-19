<?php

class AdminVideoLinks
{
	private $adminVideoLinks;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminVideoLinks = new SmartyBC;
		$this->adminVideoLinks->assign("titleVideoLinks", $content['TITLEVIDEOLINKS']);
		
		$this->adminVideoLinks->assign("save", $content['SAVE']);
		$this->adminVideoLinks->assign("lang", $controller->lang);
		
		$this->adminVideoLinks->assign("lnId", $content['ID']);
		$this->adminVideoLinks->assign("lnName", $content['VIDEONAME']);
		$this->adminVideoLinks->assign("lnInfo", $content['INFORMATION']);
		$this->adminVideoLinks->assign("lnAdded", $content['ADDDATE']);
		$this->adminVideoLinks->assign("lnLang", $content['LANGUAGE']);
		$this->adminVideoLinks->assign("lnLink", $content['VIDEOLINK']);
		$this->adminVideoLinks->assign("lnUpdated", $content['DATEUPDATED']);
		$this->adminVideoLinks->assign("lnDeleted", $content['DATEDELETED']);
		$this->adminVideoLinks->assign("lnAddedById", $content['CREATEDBYID']);
		$this->adminVideoLinks->assign("lnAddedByIP", $content['CREATEDBYIP']);
		$this->adminVideoLinks->assign("lnUpdatedById", $content['UPDATEDBYID']);
		$this->adminVideoLinks->assign("lnDeletedById", $content['DELETEDDBYID']);
		$this->adminVideoLinks->assign("lnDuration", $content['DURATION']);
		$this->adminVideoLinks->assign("lnViews", $content['VIEWCNT']);
		$this->adminVideoLinks->assign("lnUserCntCommented", $content['USERCNTCOMMENTED']);
		$this->adminVideoLinks->assign("lnComments", $content['COMMENTCNT']);
		$this->adminVideoLinks->assign("lnTagCount", $content['TAGCNT']);
		$this->adminVideoLinks->assign("lnLikes", $content['LIKESCNT']);
		$this->adminVideoLinks->assign("lnDislikes", $content['DISLIKESCNT']);
		$this->adminVideoLinks->assign("lnUserReportedCnt", $content['USERREPORTEDCNT']);
		$this->adminVideoLinks->assign("lnUserCntAddedToFolder", $content['USERCNTADDEDTOFOLDER']);
		$this->adminVideoLinks->assign("lnAddedFolderCnt", $content['ADDEDFOLDERCNT']);
		
		$this->adminVideoLinks->assign("videoQuestion", $content['VIDEOQUESTION']);
		$this->adminVideoLinks->assign("lnTags", $content['TAGS']);
		$this->adminVideoLinks->assign("lnCategory", $content['CATEGORY']);
		$this->adminVideoLinks->assign("filter", $content['FILTER']);
		$this->adminVideoLinks->assign("what", $content['WHAT']);
		$this->adminVideoLinks->assign("who", $content['WHO']);
		$this->adminVideoLinks->assign("why", $content['WHY']);
		$this->adminVideoLinks->assign("how", $content['HOW']);
		$this->adminVideoLinks->assign("delete", $content['DELETE']);
		$this->adminVideoLinks->assign("edit", $content['EDIT']);
		$this->adminVideoLinks->assign("export", $content['EXPORT']);
		$this->adminVideoLinks->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		$this->adminVideoLinks->assign("hasEditAccess", $controller->access->authorized(8));
		$this->adminVideoLinks->assign("addMany", $content['ADDMANY']);
		$this->adminVideoLinks->assign("editMany", $content['EDITMANY']);
		$this->adminVideoLinks->assign("deleteMany", $content['DELETEMANY']);
		$this->adminVideoLinks->assign("addVideo", $content['ADDVIDEO']);
		$this->adminVideoLinks->assign("template", $content['TEMPLATE']);
		
		$this->adminVideoLinks->assign("reportCount", $content['REPORTCOUNT']);
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminVideoLinks->assign("idVal", $_POST["id"]);
			$this->adminVideoLinks->assign("nameVal", $_POST["name"]);
			$this->adminVideoLinks->assign("infoVal", $_POST["info"]);
			$this->adminVideoLinks->assign("addedVal", $_POST["added"]);
			$this->adminVideoLinks->assign("addedTillVal", $_POST["addedTill"]);
			$this->adminVideoLinks->assign("languageIdVal", $_POST["languageId"]);
			$this->adminVideoLinks->assign("linkVal", $_POST["link"]);
			$this->adminVideoLinks->assign("videoQuestionVal", $_POST["videoQuestion"]);
			$this->adminVideoLinks->assign("categoryVal", $_POST["category"]);
			$this->adminVideoLinks->assign("tagsVal", $_POST["tags"]);
			$this->adminVideoLinks->assign("reportCountVal", $_POST["reportCount"]);
			$this->adminVideoLinks->assign("questionsVal", $_POST["questions"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["nameSortType"]))
			$sortType = ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["infoSortType"]))
			$sortType = ($_GET["infoSortType"] == "" || $_GET["infoSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["addedSortType"]))
			$sortType = ($_GET["addedSortType"] == "" || $_GET["addedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["langSortType"]))
			$sortType = ($_GET["langSortType"] == "" || $_GET["langSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["linkSortType"]))
			$sortType = ($_GET["linkSortType"] == "" || $_GET["linkSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catNameSortType"]))
			$sortType = ($_GET["catNameSortType"] == "" || $_GET["catNameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["tagsSortType"]))
			$sortType = ($_GET["tagsSortType"] == "" || $_GET["tagsSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["questionsSortType"]))
			$sortType = ($_GET["questionsSortType"] == "" || $_GET["questionsSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["reportCountSortType"]))
			$sortType = ($_GET["reportCountSortType"] == "" || $_GET["reportCountSortType"] == "ASC")? 'DESC' : 'ASC';
		
		
		$this->adminVideoLinks->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("nameSortType", ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("infoSortType", ($_GET["infoSortType"] == "" || $_GET["infoSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("addedSortType", ($_GET["addedSortType"] == "" || $_GET["addedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("langSortType", ($_GET["langSortType"] == "" || $_GET["langSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("linkSortType", ($_GET["linkSortType"] == "" || $_GET["linkSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("catNameSortType", ($_GET["catNameSortType"] == "" || $_GET["catNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("tagsSortType", ($_GET["tagsSortType"] == "" || $_GET["tagsSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("questionsSortType", ($_GET["questionsSortType"] == "" || $_GET["questionsSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("reportCountSortType", ($_GET["reportCountSortType"] == "" || $_GET["reportCountSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
		$this->adminVideoLinks->assign("perPage", $perPage);
		$this->adminVideoLinks->assign("videoLinks", $controller->getVideoLinks($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		
		$this->adminVideoLinks->assign("videoLinkPages",$controller->getPages($begin,$perPage,$cnt,"adminVideoLinks"));
		$this->adminVideoLinks->assign("result", $result);
		$this->adminVideoLinks->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminVideoLinks->display($templatePath."adminVideoLinks.tpl");
	}
	
	private function getAccessTypes($controller)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select id, name".$controller->lang." name from accesstypes");
		return $res;
	}
	
}

?>