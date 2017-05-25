<?php

class AdminCategories
{
	private $adminCategories;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminCategories = new SmartyBC;
		$this->adminCategories->assign("titleCategories", $content['TITLECATEGORIES']);
		$this->adminCategories->assign("addCategory", $content['ADDCATEGORY']);
		$this->adminCategories->assign("pic", $content['PIC']);
		$this->adminCategories->assign("save", $content['SAVE']);
		$this->adminCategories->assign("lang", $controller->lang);
		$this->adminCategories->assign("result", $result);
		$this->adminCategories->assign("messages", $messages);
		$this->adminCategories->assign("delete", $content['DELETE']);
		$this->adminCategories->assign("edit", $content['EDIT']);
		$this->adminCategories->assign("export", $content['EXPORT']);
		$this->adminCategories->assign("filter", $content['FILTER']);
		$this->adminCategories->assign("undeleteConfirmation", $content['UNDELETECONFIRMATION']);
		
		$this->adminCategories->assign("vqHow", $content['HOW']);
		$this->adminCategories->assign("vqWhy", $content['WHY']);
		$this->adminCategories->assign("vqWho", $content['WHO']);
		$this->adminCategories->assign("vqWhat", $content['WHAT']);
		
		$this->adminCategories->assign("catGroupCatsHint", $content['catGroupCatsHint']);
		$this->adminCategories->assign("catAzCatsHint", $content['catAzCatsHint']);
		$this->adminCategories->assign("catInfoAzCatsHint", $content['catInfoAzCatsHint']);
		$this->adminCategories->assign("catEnCatsHint", $content['catEnCatsHint']);
		$this->adminCategories->assign("catInfoEnCatsHint", $content['catInfoEnCatsHint']);
		$this->adminCategories->assign("catRuCatsHint", $content['catRuCatsHint']);
		$this->adminCategories->assign("catInfoRuCatsHint", $content['catInfoRuCatsHint']);
		$this->adminCategories->assign("questionsCatsHint", $content['questionsCatsHint']);
		$this->adminCategories->assign("picCatsHint", $content['picCatsHint']);
		$this->adminCategories->assign("picCatsHint", $content['picCatsHint']);
		$this->adminCategories->assign("deleteCatsHint", $content['deleteCatsHint']);
		$this->adminCategories->assign("createdCatsHint", $content['createdCatsHint']);
		$this->adminCategories->assign("updatedCatsHint", $content['updatedCatsHint']);
		$this->adminCategories->assign("lastVideoAddedCatsHint", $content['lastVideoAddedCatsHint']);
		$this->adminCategories->assign("deletedCatsHint", $content['deletedCatsHint']);
		$this->adminCategories->assign("idCatsHint", $content['idCatsHint']);
		$this->adminCategories->assign("createdByIdCatsHint", $content['createdByIdCatsHint']);
		$this->adminCategories->assign("createdByCatsHint", $content['createdByCatsHint']);
		$this->adminCategories->assign("createdByIPCatsHint", $content['createdByIPCatsHint']);
		$this->adminCategories->assign("deletedByIdCatsHint", $content['deletedByIdCatsHint']);
		$this->adminCategories->assign("deletedByCatsHint", $content['deletedByCatsHint']);
		$this->adminCategories->assign("deletedByIPCatsHint", $content['deletedByIPCatsHint']);
		$this->adminCategories->assign("videoCntInCatCatsHint", $content['videoCntInCatCatsHint']);
		$this->adminCategories->assign("userCntSubscribedCatsHint", $content['userCntSubscribedCatsHint']);
		$this->adminCategories->assign("clickUserCntCatsHint", $content['clickUserCntCatsHint']);
		$this->adminCategories->assign("clickCntCatsHint", $content['clickCntCatsHint']);		
		
		$this->adminCategories->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		
		$this->adminCategories->assign("lnCatGroup", $content['CATGROUP']);
		$this->adminCategories->assign("lnCatAz", $content['CATAZ']);
		$this->adminCategories->assign("lnCatAzInfo", $content['CATINFOAZ']);
		$this->adminCategories->assign("lnCatEn", $content['CATEN']);
		$this->adminCategories->assign("lnCatEnInfo", $content['CATINFOEN']);
		$this->adminCategories->assign("lnCatRu", $content['CATRU']);
		$this->adminCategories->assign("lnCatRuInfo", $content['CATINFORU']);
		$this->adminCategories->assign("lnQuestion", $content['CATQUESTION']);
		$this->adminCategories->assign("lnCreated", $content['DATECREATED']);
		$this->adminCategories->assign("lnUpdated", $content['UPDATED']);
		$this->adminCategories->assign("lnlastVideoAdded", $content['LASTVIDEOADDED']);
		$this->adminCategories->assign("lnDeleted", $content['DELETED']);
		$this->adminCategories->assign("lnId", $content['ID']);
		$this->adminCategories->assign("lnCreatedById", $content['CREATEDBYID']);
		$this->adminCategories->assign("lnCreatedBy", $content['CREATEDBY']);
		$this->adminCategories->assign("lnCreatedByIP", $content['CREATEDBYIP']);
		$this->adminCategories->assign("lnDeletedById", $content['DELETEDDBYID']);
		$this->adminCategories->assign("lnDeletedBy", $content['DELETEDBY']);
		$this->adminCategories->assign("lnDeletedByIP", $content['DELETEDBYIP']);
		$this->adminCategories->assign("lnVideoCntInCat", $content['VIDEOCNTINCAT']);
		$this->adminCategories->assign("lnUserCntSubscribed", $content['USERCNTSUBSCRIBED']);
		$this->adminCategories->assign("lnClickUserCnt", $content['CLICKUSERCNT']);
		$this->adminCategories->assign("lnClickCnt", $content['CLICKCNT']);
		
		$this->adminCategories->assign("hasEditAccess", $controller->access->authorized(42));
		$this->adminCategories->assign("hasDeleteAccess", $controller->access->authorized(43));
		$this->adminCategories->assign("hasAddAccess", $controller->access->authorized(44));
		
		$this->adminCategories->assign("catGroups", $this->getCatGroups($controller));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{//echo "dddd";print_r($_POST["catInfoEn"]);
			$this->adminCategories->assign("flvideoQuestionVal",$_POST["flvideoQuestion"]);
			$this->adminCategories->assign("catAzVal", $_POST["catAz"]);
			$this->adminCategories->assign("catGroupVal", $_POST["catGroup"]);
			$this->adminCategories->assign("catInfoAzVal", $_POST["catInfoAz"]);
			$this->adminCategories->assign("catEnVal", $_POST["catEn"]);
			$this->adminCategories->assign("catInfoEnVal", $_POST["catInfoEn"]);
			$this->adminCategories->assign("catRuVal", $_POST["catRu"]);
			$this->adminCategories->assign("catInfoRuVal", $_POST["catInfoRu"]);
			
			$this->adminCategories->assign("createdVal", $_POST["created"]);
			$this->adminCategories->assign("createdTillVal", $_POST["createdTill"]);
			$this->adminCategories->assign("updatedVal", $_POST["updated"]);
			$this->adminCategories->assign("updatedTillVal", $_POST["updatedTill"]);
			$this->adminCategories->assign("lastVideoAddedVal", $_POST["lastVideoAdded"]);
			$this->adminCategories->assign("lastVideoAddedTillVal", $_POST["lastVideoAddedTill"]);
			$this->adminCategories->assign("deletedVal", $_POST["deleted"]);
			$this->adminCategories->assign("deletedTillVal", $_POST["deletedTill"]);
			$this->adminCategories->assign("idVal", $_POST["id"]);
			$this->adminCategories->assign("createdByIdVal", $_POST["createdById"]);
			$this->adminCategories->assign("createdByVal", $_POST["createdBy"]);
			$this->adminCategories->assign("createdByIPVal", $_POST["createdByIP"]);
			$this->adminCategories->assign("deletedByIdVal", $_POST["deletedById"]);
			$this->adminCategories->assign("deletedByIPVal", $_POST["deletedByIP"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		
		if(isset($_GET["catGroupSortType"]))
			$sortType = ($_GET["catGroupSortType"] == "" || $_GET["catGroupSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catAzSortType"]))
			$sortType = ($_GET["catAzSortType"] == "" || $_GET["catAzSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catInfoAzSortType"]))
			$sortType = ($_GET["catInfoAzSortType"] == "" || $_GET["catInfoAzSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catEnSortType"]))
			$sortType = ($_GET["catEnSortType"] == "" || $_GET["catEnSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catInfoEnSortType"]))
			$sortType = ($_GET["catInfoEnSortType"] == "" || $_GET["catInfoEnSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catRuSortType"]))
			$sortType = ($_GET["catRuSortType"] == "" || $_GET["catRuSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catInfoRuSortType"]))
			$sortType = ($_GET["catInfoRuSortType"] == "" || $_GET["catInfoRuSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoQuestionSortType"]))
			$sortType = ($_GET["videoQuestionSortType"] == "" || $_GET["videoQuestionSortType"] == "ASC")? 'DESC' : 'ASC';
		
		if(isset($_GET["createdSortType"]))
			$sortType = ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedSortType"]))
			$sortType = ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["lastVideoAddedSortType"]))
			$sortType = ($_GET["lastVideoAddedSortType"] == "" || $_GET["lastVideoAddedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedSortType"]))
			$sortType = ($_GET["deletedSortType"] == "" || $_GET["deletedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIdSortType"]))
			$sortType = ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdBySortType"]))
			$sortType = ($_GET["createdBySortType"] == "" || $_GET["createdBySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIPSortType"]))
			$sortType = ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedByIdSortType"]))
			$sortType = ($_GET["deletedByIdSortType"] == "" || $_GET["deletedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedBySortType"]))
			$sortType = ($_GET["deletedBySortType"] == "" || $_GET["deletedBySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedByIPSortType"]))
			$sortType = ($_GET["deletedByIPSortType"] == "" || $_GET["deletedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoCntInCatSortType"]))
			$sortType = ($_GET["videoCntInCatSortType"] == "" || $_GET["videoCntInCatSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userCntSubscribedSortType"]))
			$sortType = ($_GET["userCntSubscribedSortType"] == "" || $_GET["userCntSubscribedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["clickUserCntSortType"]))
			$sortType = ($_GET["clickUserCntSortType"] == "" || $_GET["clickUserCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["clickCntSortType"]))
			$sortType = ($_GET["clickCntSortType"] == "" || $_GET["clickCntSortType"] == "ASC")? 'DESC' : 'ASC';
		
		$this->adminCategories->assign("catAzSortType", ($_GET["catAzSortType"] == "" || $_GET["catAzSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catInfoAzSortType", ($_GET["catInfoAzSortType"] == "" || $_GET["catInfoAzSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catEnSortType", ($_GET["catEnSortType"] == "" || $_GET["catEnSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catInfoEnSortType", ($_GET["catInfoEnSortType"] == "" || $_GET["catInfoEnSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catRuSortType", ($_GET["catRuSortType"] == "" || $_GET["catRuSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catInfoRuSortType", ($_GET["catInfoRuSortType"] == "" || $_GET["catInfoRuSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("videoQuestionSortType", ($_GET["videoQuestionSortType"] == "" || $_GET["videoQuestionSortType"] == "ASC")? 'DESC' : 'ASC');
		
		$this->adminCategories->assign("catGroupSortType", ($_GET["catGroupSortType"] == "" || $_GET["catGroupSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("updatedSortType", ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("lastVideoAddedSortType", ($_GET["lastVideoAddedSortType"] == "" || $_GET["lastVideoAddedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("deletedSortType", ($_GET["deletedSortType"] == "" || $_GET["deletedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("createdByIdSortType", ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("createdBySortType", ($_GET["createdBySortType"] == "" || $_GET["createdBySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("createdByIPSortType", ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("deletedByIdSortType", ($_GET["deletedByIdSortType"] == "" || $_GET["deletedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("deletedBySortType", ($_GET["deletedBySortType"] == "" || $_GET["deletedBySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("deletedByIPSortType", ($_GET["deletedByIPSortType"] == "" || $_GET["deletedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("videoCntInCatSortType", ($_GET["videoCntInCatSortType"] == "" || $_GET["videoCntInCatSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("userCntSubscribedSortType", ($_GET["userCntSubscribedSortType"] == "" || $_GET["userCntSubscribedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("clickUserCntSortType", ($_GET["clickUserCntSortType"] == "" || $_GET["clickUserCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("clickCntSortType", ($_GET["clickCntSortType"] == "" || $_GET["clickCntSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
		$this->adminCategories->assign("perPage", $perPage);
		$this->adminCategories->assign("categories", $controller->getAdminCategories($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminCategories->assign("catPages",$controller->getPages($begin,$perPage,$cnt,"adminCategories"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminCategories->display($templatePath."adminCategories.tpl");
	}
	
	private function getCatGroups($controller)
	{
		return $controller->db->rawQuery("select id,catGroupNameAz name from catgroups");
	}
	
}

?>
