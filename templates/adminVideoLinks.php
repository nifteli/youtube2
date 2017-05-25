<?php

class AdminVideoLinks
{
	private $adminVideoLinks;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminVideoLinks = new SmartyBC;
		$this->adminVideoLinks->assign("titleVideoLinks", $content['TITLEVIDEOLINKS']);
		
		$this->adminVideoLinks->assign("save", $content['SAVE']);
		$this->adminVideoLinks->assign("lang", $controller->lang);
		$this->adminVideoLinks->assign("languages", $controller->getLanguages());
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
		$this->adminVideoLinks->assign("lnUpdatedByIP", $content['UPDATEDBYIP']);
		$this->adminVideoLinks->assign("lnDeletedById", $content['DELETEDDBYID']);
		$this->adminVideoLinks->assign("lnDeletedByIP", $content['DELETEDDBYIP']);
		$this->adminVideoLinks->assign("lnDuration", $content['DURATION']);
		$this->adminVideoLinks->assign("lnViews", $content['VIEWCNT']);
		$this->adminVideoLinks->assign("lnAllViewCount", $content['allViewCount']);
		$this->adminVideoLinks->assign("lnFbCount", $content['fbCount']);
		$this->adminVideoLinks->assign("lnTwCount", $content['twCount']);
		$this->adminVideoLinks->assign("lnUserCntCommented", $content['USERCNTCOMMENTED']);
		$this->adminVideoLinks->assign("lnComments", $content['COMMENTCNT']);
		$this->adminVideoLinks->assign("lnTagCount", $content['TAGCNT']);
		$this->adminVideoLinks->assign("lnLikes", $content['LIKESCNT']);
		$this->adminVideoLinks->assign("lnDislikes", $content['DISLIKESCNT']);
		$this->adminVideoLinks->assign("lnUserReportedCnt", $content['USERREPORTEDCNT']);
		$this->adminVideoLinks->assign("lnUserCntAddedToFolder", $content['USERCNTADDEDTOFOLDER']);
		$this->adminVideoLinks->assign("lnAddedFolderCnt", $content['ADDEDFOLDERCNT']);
		$this->adminVideoLinks->assign("lnBroken", $content['broken']);
		$this->adminVideoLinks->assign("exportSearches", $content['EXPORTSEARCHES']);
		$this->adminVideoLinks->assign("undeleteConfirmation", $content['UNDELETECONFIRMATION']);
		
		$this->adminVideoLinks->assign("vaddedVidLinksHint", $content['vaddedVidLinksHint']);
		$this->adminVideoLinks->assign("idVidLinksHint", $content['idVidLinksHint']);
		$this->adminVideoLinks->assign("nameVidLinksHint", $content['nameVidLinksHint']);
		$this->adminVideoLinks->assign("infoVidLinksHint", $content['infoVidLinksHint']);
		$this->adminVideoLinks->assign("langVidLinksHint", $content['langVidLinksHint']);
		$this->adminVideoLinks->assign("linkVidLinksHint", $content['linkVidLinksHint']);
		$this->adminVideoLinks->assign("catNameVidLinksHint", $content['catNameVidLinksHint']);
		$this->adminVideoLinks->assign("tagsVidLinksHint", $content['tagsVidLinksHint']);
		$this->adminVideoLinks->assign("questionsVidLinksHint", $content['questionsVidLinksHint']);
		$this->adminVideoLinks->assign("reportCountVidLinksHint", $content['reportCountVidLinksHint']);
		$this->adminVideoLinks->assign("deleteVidLinksHint", $content['deleteVidLinksHint']);
		$this->adminVideoLinks->assign("editVidLinksHint", $content['editVidLinksHint']);
		$this->adminVideoLinks->assign("updatedVidLinksHint", $content['updatedVidLinksHint']);
		$this->adminVideoLinks->assign("deletedVidLinksHint", $content['deletedVidLinksHint']);
		$this->adminVideoLinks->assign("addedByIdVidLinksHint", $content['addedByIdVidLinksHint']);
		$this->adminVideoLinks->assign("addedByIPVidLinksHint", $content['addedByIPVidLinksHint']);
		$this->adminVideoLinks->assign("updatedByIdVidLinksHint", $content['updatedByIdVidLinksHint']);
		$this->adminVideoLinks->assign("deletedByIdVidLinksHint", $content['deletedByIdVidLinksHint']);
		$this->adminVideoLinks->assign("durationVidLinksHint", $content['durationVidLinksHint']);
		$this->adminVideoLinks->assign("viewsVidLinksHint", $content['viewsVidLinksHint']);
		$this->adminVideoLinks->assign("allViewCountVidLinksHint", $content['allViewCountVidLinksHint']);
		$this->adminVideoLinks->assign("fbCountVidLinksHint", $content['fbCountVidLinksHint']);
		$this->adminVideoLinks->assign("twCountVidLinksHint", $content['twCountVidLinksHint']);
		$this->adminVideoLinks->assign("userCntCommentedVidLinksHint", $content['userCntCommentedVidLinksHint']);
		$this->adminVideoLinks->assign("commentsVidLinksHint", $content['commentsVidLinksHint']);
		$this->adminVideoLinks->assign("tagCountVidLinksHint", $content['tagCountVidLinksHint']);
		$this->adminVideoLinks->assign("likesVidLinksHint", $content['likesVidLinksHint']);
		$this->adminVideoLinks->assign("dislikesVidLinksHint", $content['dislikesVidLinksHint']);
		$this->adminVideoLinks->assign("userReportedCntVidLinksHint", $content['userReportedCntVidLinksHint']);
		$this->adminVideoLinks->assign("userCntAddedToFolderVidLinksHint", $content['userCntAddedToFolderVidLinksHint']);
		$this->adminVideoLinks->assign("addedFolderCntVidLinksHint", $content['addedFolderCntVidLinksHint']);
		$this->adminVideoLinks->assign("updatedByIPVidLinksHint", $content['updatedByIPVidLinksHint']);
		$this->adminVideoLinks->assign("deletedByIPVidLinksHint", $content['deletedByIPVidLinksHint']);
		$this->adminVideoLinks->assign("brokenVidLinksHint", $content['brokenVidLinksHint']);
				
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
			$this->adminVideoLinks->assign("updatedVal", $_POST["updated"]);
			$this->adminVideoLinks->assign("updatedTillVal", $_POST["updatedTill"]);
			$this->adminVideoLinks->assign("deletedVal", $_POST["deleted"]);
			$this->adminVideoLinks->assign("deletedTillVal", $_POST["deletedTill"]);
			$this->adminVideoLinks->assign("languageIdVal", $_POST["languageId"]);
			$this->adminVideoLinks->assign("linkVal", $_POST["link"]);
			$this->adminVideoLinks->assign("videoQuestionVal", $_POST["videoQuestion"]);
			$this->adminVideoLinks->assign("categoryVal", $_POST["category"]);
			$this->adminVideoLinks->assign("tagsVal", $_POST["tags"]);
			$this->adminVideoLinks->assign("reportCountVal", $_POST["reportCount"]);
			$this->adminVideoLinks->assign("questionsVal", $_POST["questions"]);
			$this->adminVideoLinks->assign("addedByIdVal", $_POST["addedById"]);
			$this->adminVideoLinks->assign("addedByIPVal", $_POST["addedByIP"]);
			$this->adminVideoLinks->assign("updatedByIdVal", $_POST["updatedById"]);
			$this->adminVideoLinks->assign("updatedByIPVal", $_POST["updatedByIP"]);
			$this->adminVideoLinks->assign("deletedByIdVal", $_POST["deletedById"]);
			$this->adminVideoLinks->assign("deletedByIPVal", $_POST["deletedByIP"]);
			$this->adminVideoLinks->assign("durationVal", $_POST["duration"]);
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
		
		if(isset($_GET["updatedSortType"]))
			$sortType = ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedSortType"]))
			$sortType = ($_GET["deletedSortType"] == "" || $_GET["deletedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["addedByIdSortType"]))
			$sortType = ($_GET["addedByIdSortType"] == "" || $_GET["addedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["addedByIPSortType"]))
			$sortType = ($_GET["addedByIPSortType"] == "" || $_GET["addedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedByIdSortType"]))
			$sortType = ($_GET["updatedByIdSortType"] == "" || $_GET["updatedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedByIPSortType"]))
			$sortType = ($_GET["updatedByIPSortType"] == "" || $_GET["updatedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedByIdSortType"]))
			$sortType = ($_GET["deletedByIdSortType"] == "" || $_GET["deletedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedByIPSortType"]))
			$sortType = ($_GET["deletedByIPSortType"] == "" || $_GET["deletedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["durationSortType"]))
			$sortType = ($_GET["durationSortType"] == "" || $_GET["durationSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["viewsSortType"]))
			$sortType = ($_GET["viewsSortType"] == "" || $_GET["viewsSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["allViewCountSortType"]))
			$sortType = ($_GET["allViewCountSortType"] == "" || $_GET["allViewCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["fbCountSortType"]))
			$sortType = ($_GET["fbCountSortType"] == "" || $_GET["fbCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["twCountSortType"]))
			$sortType = ($_GET["twCountSortType"] == "" || $_GET["twCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userCntCommentedSortType"]))
			$sortType = ($_GET["userCntCommentedSortType"] == "" || $_GET["userCntCommentedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["commentsSortType"]))
			$sortType = ($_GET["commentsSortType"] == "" || $_GET["commentsSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["tagCountSortType"]))
			$sortType = ($_GET["tagCountSortType"] == "" || $_GET["tagCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["likesSortType"]))
			$sortType = ($_GET["likesSortType"] == "" || $_GET["likesSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["dislikesSortType"]))
			$sortType = ($_GET["dislikesSortType"] == "" || $_GET["dislikesSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userReportedCntSortType"]))
			$sortType = ($_GET["userReportedCntSortType"] == "" || $_GET["userReportedCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userCntAddedToFolderSortType"]))
			$sortType = ($_GET["userCntAddedToFolderSortType"] == "" || $_GET["userCntAddedToFolderSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["addedFolderCntSortType"]))
			$sortType = ($_GET["addedFolderCntSortType"] == "" || $_GET["addedFolderCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["brokenSortType"]))
			$sortType = ($_GET["brokenSortType"] == "" || $_GET["brokenSortType"] == "ASC")? 'DESC' : 'ASC';
		
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
		$this->adminVideoLinks->assign("updatedSortType", ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("deletedSortType", ($_GET["deletedSortType"] == "" || $_GET["deletedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("addedByIdSortType", ($_GET["addedByIdSortType"] == "" || $_GET["addedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("addedByIPSortType", ($_GET["addedByIPSortType"] == "" || $_GET["addedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("updatedByIdSortType", ($_GET["updatedByIdSortType"] == "" || $_GET["updatedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("updatedByIPSortType", ($_GET["updatedByIPSortType"] == "" || $_GET["updatedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("deletedByIdSortType", ($_GET["deletedByIdSortType"] == "" || $_GET["deletedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("deletedByIPSortType", ($_GET["deletedByIPSortType"] == "" || $_GET["deletedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("durationSortType", ($_GET["durationSortType"] == "" || $_GET["durationSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("viewsSortType", ($_GET["viewsSortType"] == "" || $_GET["viewsSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("allViewCountSortType", ($_GET["allViewCountSortType"] == "" || $_GET["allViewCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("fbCountSortType", ($_GET["fbCountSortType"] == "" || $_GET["fbCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("twCountSortType", ($_GET["twCountSortType"] == "" || $_GET["twCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("userCntCommentedSortType", ($_GET["userCntCommentedSortType"] == "" || $_GET["userCntCommentedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("commentsSortType", ($_GET["commentsSortType"] == "" || $_GET["commentsSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("tagCountSortType", ($_GET["tagCountSortType"] == "" || $_GET["tagCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("likesSortType", ($_GET["likesSortType"] == "" || $_GET["likesSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("dislikesSortType", ($_GET["dislikesSortType"] == "" || $_GET["dislikesSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("userReportedCntSortType", ($_GET["userReportedCntSortType"] == "" || $_GET["userReportedCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("userCntAddedToFolderSortType", ($_GET["userCntAddedToFolderSortType"] == "" || $_GET["userCntAddedToFolderSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("addedFolderCntSortType", ($_GET["addedFolderCntSortType"] == "" || $_GET["addedFolderCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminVideoLinks->assign("brokenSortType", ($_GET["brokenSortType"] == "" || $_GET["brokenSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
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