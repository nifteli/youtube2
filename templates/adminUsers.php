<?php

class AdminUsers
{
	private $adminUsers;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
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
		$this->adminUsers->assign("exportMailInfo", $content['EXPORTMAILINFO']);
		
		$this->adminUsers->assign("canSeeDetails", $controller->access->authorized(70));
		
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
		
		$this->adminUsers->assign("createdUsersHint", $content['createdUsersHint']);
		$this->adminUsers->assign("idUsersHint", $content['idUsersHint']);
		$this->adminUsers->assign("userNameUsersHint", $content['userNameUsersHint']);
		$this->adminUsers->assign("nameUsersHint", $content['nameUsersHint']);
		$this->adminUsers->assign("lnRoleUsersHint", $content['lnRoleUsersHint']);
		$this->adminUsers->assign("viewProfileUsersHint", $content['viewProfileUsersHint']);
		$this->adminUsers->assign("setUserUsersHint", $content['setUserUsersHint']);
		$this->adminUsers->assign("deleteUsersHint", $content['deleteUsersHint']);
		$this->adminUsers->assign("updatedUsersHint", $content['updatedUsersHint']);
		$this->adminUsers->assign("deletedUsersHint", $content['deletedUsersHint']);
		$this->adminUsers->assign("fatherNameUsersHint", $content['fatherNameUsersHint']);
		$this->adminUsers->assign("birthDateUsersHint", $content['birthDateUsersHint']);
		$this->adminUsers->assign("adminUsersUsersHint", $content['adminUsersUsersHint']);
		$this->adminUsers->assign("telephoneUsersHint", $content['telephoneUsersHint']);
		$this->adminUsers->assign("noteUsersHint", $content['noteUsersHint']);
		$this->adminUsers->assign("genderUsersHint", $content['genderUsersHint']);
		$this->adminUsers->assign("languageUsersHint", $content['languageUsersHint']);
		$this->adminUsers->assign("professionUsersHint", $content['professionUsersHint']);
		$this->adminUsers->assign("interestsUsersHint", $content['interestsUsersHint']);
		$this->adminUsers->assign("registeredByIpUsersHint", $content['registeredByIpUsersHint']);
		$this->adminUsers->assign("regDeviceUsersHint", $content['regDeviceUsersHint']);
		$this->adminUsers->assign("regBrowserUsersHint", $content['regBrowserUsersHint']);
		$this->adminUsers->assign("updateUserIdUsersHint", $content['updateUserIdUsersHint']);
		$this->adminUsers->assign("deletedByIdUsersHint", $content['deletedByIdUsersHint']);
		$this->adminUsers->assign("getSiteNewsUsersHint", $content['getSiteNewsUsersHint']);
		$this->adminUsers->assign("getEmailOnCommentUsersHint", $content['getEmailOnCommentUsersHint']);
		$this->adminUsers->assign("getEmailAfterMyCommentUsersHint", $content['getEmailAfterMyCommentUsersHint']);
		$this->adminUsers->assign("deviceCountUsersHint", $content['deviceCountUsersHint']);
		$this->adminUsers->assign("browserCountUsersHint", $content['browserCountUsersHint']);
		$this->adminUsers->assign("viewCountUsersHint", $content['viewCountUsersHint']);
		$this->adminUsers->assign("videoCountUsersHint", $content['videoCountUsersHint']);
		$this->adminUsers->assign("likeCountUsersHint", $content['likeCountUsersHint']);
		$this->adminUsers->assign("dislikeCountUsersHint", $content['dislikeCountUsersHint']);
		$this->adminUsers->assign("commentCountUsersHint", $content['commentCountUsersHint']);
		$this->adminUsers->assign("reportCountUsersHint", $content['reportCountUsersHint']);
		$this->adminUsers->assign("videoCntInFolderUsersHint", $content['videoCntInFolderUsersHint']);
		$this->adminUsers->assign("folderCntUsersHint", $content['folderCntUsersHint']);
		$this->adminUsers->assign("tagClickCntUsersHint", $content['tagClickCntUsersHint']);
		$this->adminUsers->assign("tagClickedUsersHint", $content['tagClickedUsersHint']);
		$this->adminUsers->assign("catClickCntUsersHint", $content['catClickCntUsersHint']);
		$this->adminUsers->assign("catClickedUsersHint", $content['catClickedUsersHint']);
		$this->adminUsers->assign("subCatCntUsersHint", $content['subCatCntUsersHint']);
		$this->adminUsers->assign("searchCntUsersHint", $content['searchCntUsersHint']);
		$this->adminUsers->assign("videoCntCommentedUsersHint", $content['videoCntCommentedUsersHint']);
		
		$this->adminUsers->assign("delete", $content['DELETE']);
		$this->adminUsers->assign("viewProfile", $content['VIEWPROFILE']);
		$this->adminUsers->assign("setUser", $content['SETUSER']);
		$this->adminUsers->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		$this->adminUsers->assign("hasDeleteAccess", $controller->access->authorized(27));
		$this->adminUsers->assign("hasViewProfileAccess", $controller->access->authorized(2));
		$this->adminUsers->assign("hasSetUserAccess", $controller->access->authorized(34));
		$this->adminUsers->assign("roles", $this->getRoles($controller));
		$this->adminUsers->assign("langs", $controller->getLanguages());
		$this->adminUsers->assign("language", $content["LANGUAGE"]);
		$this->adminUsers->assign("gender", $content["GENDER"]);
		$this->adminUsers->assign("male", $content["MALE"]);
		$this->adminUsers->assign("female", $content["FEMALE"]);
		
		//echo "<pre>"; print_r($_POST["roleIdFlt"]); echo "</pre>";
		$this->adminUsers->assign("roleIdFltVal", "-1");
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminUsers->assign("createdVal", $_POST["created"]);
			$this->adminUsers->assign("createdTillVal", $_POST["createdTill"]);
			$this->adminUsers->assign("idVal", $_POST["id"]);
			$this->adminUsers->assign("userNameVal", $_POST["userName"]);
			$this->adminUsers->assign("nameVal", $_POST["name"]);
			if($_POST["roleIdFlt"] >-1)
				$this->adminUsers->assign("roleIdFltVal", $_POST["roleIdFlt"]);

			$this->adminUsers->assign("updatedDateVal", $_POST["updatedDate"]);
			$this->adminUsers->assign("updatedDateTillVal", $_POST["updatedDateTill"]);
			$this->adminUsers->assign("deletedDateVal", $_POST["deletedDate"]);
			$this->adminUsers->assign("deletedDateTillVal", $_POST["deletedDateTill"]);
			$this->adminUsers->assign("fatherNameVal", $_POST["fatherName"]);
			$this->adminUsers->assign("birthDateVal", $_POST["birthDate"]);
			$this->adminUsers->assign("birthDateTillVal", $_POST["birthDateTill"]);
			$this->adminUsers->assign("emailVal", $_POST["email"]);
			$this->adminUsers->assign("phoneNumberVal", $_POST["phoneNumber"]);
			$this->adminUsers->assign("notesVal", $_POST["notes"]);
			$this->adminUsers->assign("genderVal", $_POST["gender"]);
			$this->adminUsers->assign("langIdVal", $_POST["langId"]);
			$this->adminUsers->assign("professionVal", $_POST["profession"]);
			$this->adminUsers->assign("interestsVal", $_POST["interests"]);
			$this->adminUsers->assign("registeredByIPVal", $_POST["registeredByIP"]);
			$this->adminUsers->assign("regDeviceVal", $_POST["regDevice"]);
			$this->adminUsers->assign("regBrowserVal", $_POST["regBrowser"]);
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
		
		if(isset($_GET["updatedSortType"]))
			$sortType = ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedSortType"]))
			$sortType = ($_GET["deletedSortType"] == "" || $_GET["deletedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["fatherNameSortType"]))
			$sortType = ($_GET["fatherNameSortType"] == "" || $_GET["fatherNameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["birthDateSortType"]))
			$sortType = ($_GET["birthDateSortType"] == "" || $_GET["birthDateSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["emailSortType"]))
			$sortType = ($_GET["emailSortType"] == "" || $_GET["emailSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["telephoneSortType"]))
			$sortType = ($_GET["telephoneSortType"] == "" || $_GET["telephoneSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["noteSortType"]))
			$sortType = ($_GET["noteSortType"] == "" || $_GET["noteSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["genderSortType"]))
			$sortType = ($_GET["genderSortType"] == "" || $_GET["genderSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["languageSortType"]))
			$sortType = ($_GET["languageSortType"] == "" || $_GET["languageSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["professionSortType"]))
			$sortType = ($_GET["professionSortType"] == "" || $_GET["professionSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["interestsSortType"]))
			$sortType = ($_GET["interestsSortType"] == "" || $_GET["interestsSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["registeredByIpSortType"]))
			$sortType = ($_GET["registeredByIpSortType"] == "" || $_GET["registeredByIpSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["regDeviceSortType"]))
			$sortType = ($_GET["regDeviceSortType"] == "" || $_GET["regDeviceSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["regBrowserSortType"]))
			$sortType = ($_GET["regBrowserSortType"] == "" || $_GET["regBrowserSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updateUserIdSortType"]))
			$sortType = ($_GET["updateUserIdSortType"] == "" || $_GET["updateUserIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deletedByIdSortType"]))
			$sortType = ($_GET["deletedByIdSortType"] == "" || $_GET["deletedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["getSiteNewsSortType"]))
			$sortType = ($_GET["getSiteNewsSortType"] == "" || $_GET["getSiteNewsSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["getEmailOnCommentSortType"]))
			$sortType = ($_GET["getEmailOnCommentSortType"] == "" || $_GET["getEmailOnCommentSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["getEmailAfterMyCommentSortType"]))
			$sortType = ($_GET["getEmailAfterMyCommentSortType"] == "" || $_GET["getEmailAfterMyCommentSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["deviceCountSortType"]))
			$sortType = ($_GET["deviceCountSortType"] == "" || $_GET["deviceCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["browserCountSortType"]))
			$sortType = ($_GET["browserCountSortType"] == "" || $_GET["browserCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["viewCountSortType"]))
			$sortType = ($_GET["viewCountSortType"] == "" || $_GET["viewCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoCountSortType"]))
			$sortType = ($_GET["videoCountSortType"] == "" || $_GET["videoCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["likeCountSortType"]))
			$sortType = ($_GET["likeCountSortType"] == "" || $_GET["likeCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["dislikeCountSortType"]))
			$sortType = ($_GET["dislikeCountSortType"] == "" || $_GET["dislikeCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["commentCountSortType"]))
			$sortType = ($_GET["commentCountSortType"] == "" || $_GET["commentCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["reportCountSortType"]))
			$sortType = ($_GET["reportCountSortType"] == "" || $_GET["reportCountSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoCntInFolderSortType"]))
			$sortType = ($_GET["videoCntInFolderSortType"] == "" || $_GET["videoCntInFolderSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["folderCntSortType"]))
			$sortType = ($_GET["folderCntSortType"] == "" || $_GET["folderCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["tagClickCntSortType"]))
			$sortType = ($_GET["tagClickCntSortType"] == "" || $_GET["tagClickCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["tagClickedSortType"]))
			$sortType = ($_GET["tagClickedSortType"] == "" || $_GET["tagClickedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catClickCntSortType"]))
			$sortType = ($_GET["catClickCntSortType"] == "" || $_GET["catClickCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["catClickedSortType"]))
			$sortType = ($_GET["catClickedSortType"] == "" || $_GET["catClickedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["subCatCntSortType"]))
			$sortType = ($_GET["subCatCntSortType"] == "" || $_GET["subCatCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["searchCntSortType"]))
			$sortType = ($_GET["searchCntSortType"] == "" || $_GET["searchCntSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoCntCommentedSortType"]))
			$sortType = ($_GET["videoCntCommentedSortType"] == "" || $_GET["videoCntCommentedSortType"] == "ASC")? 'DESC' : 'ASC';
				
		
		$this->adminUsers->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("userNameSortType", ($_GET["userNameSortType"] == "" || $_GET["userNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("nameSortType", ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("updatedSortType", ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("deletedSortType", ($_GET["deletedSortType"] == "" || $_GET["deletedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("fatherNameSortType", ($_GET["fatherNameSortType"] == "" || $_GET["fatherNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("birthDateSortType", ($_GET["birthDateSortType"] == "" || $_GET["birthDateSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("emailSortType", ($_GET["emailSortType"] == "" || $_GET["emailSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("telephoneSortType", ($_GET["telephoneSortType"] == "" || $_GET["telephoneSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("noteSortType", ($_GET["noteSortType"] == "" || $_GET["noteSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("genderSortType", ($_GET["genderSortType"] == "" || $_GET["genderSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("languageSortType", ($_GET["languageSortType"] == "" || $_GET["languageSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("professionSortType", ($_GET["professionSortType"] == "" || $_GET["professionSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("interestsSortType", ($_GET["interestsSortType"] == "" || $_GET["interestsSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("registeredByIpSortType", ($_GET["registeredByIpSortType"] == "" || $_GET["registeredByIpSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("regDeviceSortType", ($_GET["regDeviceSortType"] == "" || $_GET["regDeviceSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("regBrowserSortType", ($_GET["regBrowserSortType"] == "" || $_GET["regBrowserSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("updateUserIdSortType", ($_GET["updateUserIdSortType"] == "" || $_GET["updateUserIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("deletedByIdSortType", ($_GET["deletedByIdSortType"] == "" || $_GET["deletedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("getSiteNewsSortType", ($_GET["getSiteNewsSortType"] == "" || $_GET["getSiteNewsSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("getEmailOnCommentSortType", ($_GET["getEmailOnCommentSortType"] == "" || $_GET["getEmailOnCommentSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("getEmailAfterMyCommentSortType", ($_GET["getEmailAfterMyCommentSortType"] == "" || $_GET["getEmailAfterMyCommentSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("deviceCountSortType", ($_GET["deviceCountSortType"] == "" || $_GET["deviceCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("browserCountSortType", ($_GET["browserCountSortType"] == "" || $_GET["browserCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("viewCountSortType", ($_GET["viewCountSortType"] == "" || $_GET["viewCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("videoCountSortType", ($_GET["videoCountSortType"] == "" || $_GET["videoCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("likeCountSortType", ($_GET["likeCountSortType"] == "" || $_GET["likeCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("dislikeCountSortType", ($_GET["dislikeCountSortType"] == "" || $_GET["dislikeCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("commentCountSortType", ($_GET["commentCountSortType"] == "" || $_GET["commentCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("reportCountSortType", ($_GET["reportCountSortType"] == "" || $_GET["reportCountSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("videoCntInFolderSortType", ($_GET["videoCntInFolderSortType"] == "" || $_GET["videoCntInFolderSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("folderCntSortType", ($_GET["folderCntSortType"] == "" || $_GET["folderCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("tagClickCntSortType", ($_GET["tagClickCntSortType"] == "" || $_GET["tagClickCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("tagClickedSortType", ($_GET["tagClickedSortType"] == "" || $_GET["tagClickedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("catClickCntSortType", ($_GET["catClickCntSortType"] == "" || $_GET["catClickCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("catClickedSortType", ($_GET["catClickedSortType"] == "" || $_GET["catClickedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("subCatCntSortType", ($_GET["subCatCntSortType"] == "" || $_GET["subCatCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("searchCntSortType", ($_GET["searchCntSortType"] == "" || $_GET["searchCntSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminUsers->assign("videoCntCommentedSortType", ($_GET["videoCntCommentedSortType"] == "" || $_GET["videoCntCommentedSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
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