<?php

class AdminCategories
{
	private $adminCategories;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
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
		
		
		$this->adminCategories->assign("vqHow", $content['HOW']);
		$this->adminCategories->assign("vqWhy", $content['WHY']);
		$this->adminCategories->assign("vqWho", $content['WHO']);
		$this->adminCategories->assign("vqWhat", $content['WHAT']);
		
		
		$this->adminCategories->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		
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
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{//echo "dddd";print_r($_POST["catInfoEn"]);
			$this->adminCategories->assign("flvideoQuestionVal",$_POST["flvideoQuestion"]);
			$this->adminCategories->assign("catAzVal", $_POST["catAz"]);
			$this->adminCategories->assign("catInfoAzVal", $_POST["catInfoAz"]);
			$this->adminCategories->assign("catEnVal", $_POST["catEn"]);
			$this->adminCategories->assign("catInfoEnVal", $_POST["catInfoEn"]);
			$this->adminCategories->assign("catRuVal", $_POST["catRu"]);
			$this->adminCategories->assign("catInfoRuVal", $_POST["catInfoRu"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		
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
				
		
		$this->adminCategories->assign("catAzSortType", ($_GET["catAzSortType"] == "" || $_GET["catAzSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catInfoAzSortType", ($_GET["catInfoAzSortType"] == "" || $_GET["catInfoAzSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catEnSortType", ($_GET["catEnSortType"] == "" || $_GET["catEnSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catInfoEnSortType", ($_GET["catInfoEnSortType"] == "" || $_GET["catInfoEnSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catRuSortType", ($_GET["catRuSortType"] == "" || $_GET["catRuSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("catInfoRuSortType", ($_GET["catInfoRuSortType"] == "" || $_GET["catInfoRuSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminCategories->assign("videoQuestionSortType", ($_GET["videoQuestionSortType"] == "" || $_GET["videoQuestionSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
		$this->adminCategories->assign("perPage", $perPage);
		$this->adminCategories->assign("categories", $controller->getAdminCategories($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminCategories->assign("catPages",$controller->getPages($begin,$perPage,$cnt,"adminCategories"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminCategories->display($templatePath."adminCategories.tpl");
	}
	
}

?>