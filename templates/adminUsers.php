<?php

class AdminUsers
{
	private $adminUsers;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminUsers = new SmartyBC;
		$this->adminUsers->assign("titleUsers", $content['TITLEUSERS']);
		$this->adminUsers->assign("save", $content['SAVE']);
		$this->adminUsers->assign("lang", $controller->lang);
		$this->adminUsers->assign("result", $result);
		$this->adminUsers->assign("messages", $messages);
		$this->adminUsers->assign("delete", $content['DELETE']);
		$this->adminUsers->assign("edit", $content['EDIT']);
		$this->adminUsers->assign("export", $content['EXPORT']);
		$this->adminUsers->assign("filter", $content['FILTER']);
		$this->adminUsers->assign("confirm", $content['CONFIRM']);
		$this->adminUsers->assign("sendMail", $content['SENDMAIL']);
		$this->adminUsers->assign("saveRoles", $content['SAVEROLES']);
		$this->adminUsers->assign("to", $content['TO']);
		$this->adminUsers->assign("cc", $content['CC']);
		$this->adminUsers->assign("file", $content['FILE']);
		$this->adminUsers->assign("subject", $content['SUBJECT']);
		$this->adminUsers->assign("body", $content['MESSAGEBODY']);
		$this->adminUsers->assign("send", $content['SEND']);
		$this->adminUsers->assign("userProfile", $content['USERPROFILE']);
		
		$this->adminUsers->assign("lnCreated", $content['DATECREATED']);
		$this->adminUsers->assign("lnId", $content['ID']);
		$this->adminUsers->assign("lnUserName", $content['USERNAME']);
		$this->adminUsers->assign("lnName", $content['NAME']);
		$this->adminUsers->assign("lnRole", $content['ROLENAME']);
		$this->adminUsers->assign("lnUpdated", $content['DATEUPDATED']);
		$this->adminUsers->assign("lnDeleted", $content['DATEDELETED']);
		$this->adminUsers->assign("lnFatherName", $content['FATHERNAME']);
		$this->adminUsers->assign("lnBirthDate", $content['BIRTHDATE']);
		$this->adminUsers->assign("lnEmail", $content['EMAIL']);
		$this->adminUsers->assign("lnTelephone", $content['PHONE']);
		$this->adminUsers->assign("lnNote", $content['NOTE']);
		$this->adminUsers->assign("lnGender", $content['GENDER']);
		$this->adminUsers->assign("lnLanguage", $content['LANGUAGE']);
		$this->adminUsers->assign("lnProfession", $content['POSITION']);
		$this->adminUsers->assign("lnInterests", $content['INTERESTS']);
		$this->adminUsers->assign("lnRegisteredByIp", $content['REGISTEREDBYIP']);
		$this->adminUsers->assign("lnRegDevice", $content['REGDEVICE']);
		$this->adminUsers->assign("lnRegBrowser", $content['REGBROWSER']);
		$this->adminUsers->assign("lnUpdateUserId", $content['LASTUPDATEUSERID']);
		$this->adminUsers->assign("lnDeletedById", $content['DELETEDBYID']);
		$this->adminUsers->assign("lnGetSiteNews", $content['GETSITENEWS']);
		$this->adminUsers->assign("lnGetEmailOnComment", $content['getEmailOnComment']);
		$this->adminUsers->assign("lnGetEmailAfterMyComment", $content['getEmailAfterMyComment']);
		$this->adminUsers->assign("lnDeviceCount", $content['DEVICECOUNT']);
		$this->adminUsers->assign("lnBrowserCount", $content['BROWSERCOUNT']);
		$this->adminUsers->assign("lnViewCount", $content['VIEWCOUNT']);
		$this->adminUsers->assign("lnVideoCount", $content['VIDEOCOUNT']);
		$this->adminUsers->assign("lnLikeCount", $content['LIKECOUNT']);
		$this->adminUsers->assign("lnDislikeCount", $content['DISLIKECOUNT']);
		$this->adminUsers->assign("lnCommentCount", $content['COMMENTCOUNT']);
		$this->adminUsers->assign("lnReportCount", $content['REPORTCOUNT']);
		$this->adminUsers->assign("lnVideoCntInFolder", $content['VIDEOCNTINFOLDER']);
		$this->adminUsers->assign("lnFolderCnt", $content['FOLDERCNT']);
		$this->adminUsers->assign("lnTagClickCnt", $content['TAGCLICKCNT']);
		$this->adminUsers->assign("lnTagClicked", $content['TAGCLICKED']);
		$this->adminUsers->assign("lnCatClickCnt", $content['CATCLICKCNT']);
		$this->adminUsers->assign("lnCatClicked", $content['CATCLICKED']);
		$this->adminUsers->assign("lnSubCatCnt", $content['SUBCATCNT']);
		$this->adminUsers->assign("lnSearchCnt", $content['SEARCHCNT']);
		$this->adminUsers->assign("lnVideoCntCommented", $content['VIDEOCNTCOMMENTED']);
		
		$this->adminUsers->assign("delete", $content['DELETE']);
		$this->adminUsers->assign("viewProfile", $content['VIEWPROFILE']);
		$this->adminUsers->assign("setUser", $content['SETUSER']);
		$this->adminUsers->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		$this->adminUsers->assign("hasDeleteAccess", $controller->access->authorized(27));
		$this->adminUsers->assign("hasViewProfileAccess", $controller->access->authorized(2));
		$this->adminUsers->assign("hasSetUserAccess", $controller->access->authorized(34));
		$this->adminUsers->assign("roles", $this->getRoles($controller));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminUsers->assign("createdVal", $_POST["created"]);
			$this->adminUsers->assign("createdTillVal", $_POST["createdTill"]);
			$this->adminUsers->assign("idVal", $_POST["id"]);
			$this->adminUsers->assign("userNameVal", $_POST["userName"]);
			$this->adminUsers->assign("nameVal", $_POST["name"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["createdSortType"]))
			$sortType = ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userNameSortType"]))
			$sortType = ($_GET["userNameSortType"] == "" || $_GET["userNameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["nameSortType"]))
			$sortType = ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC';
				
		
		$this->adminUsers->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("userNameSortType", ($_GET["userNameSortType"] == "" || $_GET["userNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("nameSortType", ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
		$this->adminUsers->assign("perPage", $perPage);
		$this->adminUsers->assign("users", $controller->getUsers($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminUsers->assign("userPages",$controller->getPages($begin,$perPage,$cnt,"adminUsers"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminUsers->display($templatePath."adminUsers.tpl");
	}
	
	private function getRoles($controller)
	{
		return $controller->db->get("roles");
	}
	
}

?>