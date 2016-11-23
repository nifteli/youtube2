<?php

class AdminComments
{
	private $adminComments;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminComments = new SmartyBC;
		$this->adminComments->assign("titleComments", $content['TITLECOMMENTS']);
		$this->adminComments->assign("save", $content['SAVE']);
		$this->adminComments->assign("lang", $controller->lang);
		$this->adminComments->assign("result", $result);
		$this->adminComments->assign("messages", $messages);
		$this->adminComments->assign("delete", $content['DELETE']);
		$this->adminComments->assign("edit", $content['EDIT']);
		$this->adminComments->assign("export", $content['EXPORT']);
		$this->adminComments->assign("filter", $content['FILTER']);
		$this->adminComments->assign("confirm", $content['CONFIRM']);
		
		$this->adminComments->assign("lnCreated", $content['ADDDATE']);
		$this->adminComments->assign("lnId", $content['ID']);
		$this->adminComments->assign("lnVideoId", $content['VIDEOID']);
		$this->adminComments->assign("lnLink", $content['VIDEOLINK']);
		$this->adminComments->assign("lnAuthorId", $content['AUTHORID']);
		$this->adminComments->assign("lnAuthor", $content['AUTHOR']);
		$this->adminComments->assign("lnComment", $content['COMMENT']);
		$this->adminComments->assign("lnConfirmed", $content['CONFIRMED']);
		$this->adminComments->assign("lnConfirmer", $content['CONFIRMER']);
		$this->adminComments->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		$this->adminComments->assign("lnUpdated", $content['UPDATED']);
		$this->adminComments->assign("lnConfirmDate", $content['CONFIRDATE']);
		$this->adminComments->assign("lnVideoName", $content['VIDEONAME']);
		$this->adminComments->assign("lnQuestion", $content['VIDEOQUESTION']);
		$this->adminComments->assign("lnUserIP", $content['ADDEDBYIP']);
		$this->adminComments->assign("lnUpdatedById", $content['UPDATEDBYID']);
		$this->adminComments->assign("lnUpdatedBy", $content['UPDATEDBY']);
		$this->adminComments->assign("lnUpdatedByIP", $content['UPDATEDBYIP']);
		$this->adminComments->assign("lnConfirmedById", $content['CONFIRMEDBYID']);
		$this->adminComments->assign("lnConfirmedByIP", $content['CONFIRMEDBYIP']);
		
		$this->adminComments->assign("createdCommentsHint", $content['createdCommentsHint']);
		$this->adminComments->assign("idCommentsHint", $content['idCommentsHint']);
		$this->adminComments->assign("videoIdCommentsHint", $content['videoIdCommentsHint']);
		$this->adminComments->assign("linkCommentsHint", $content['linkCommentsHint']);
		$this->adminComments->assign("createdByIdCommentsHint", $content['createdByIdCommentsHint']);
		$this->adminComments->assign("authorCommentsHint", $content['authorCommentsHint']);
		$this->adminComments->assign("commentCommentsHint", $content['commentCommentsHint']);
		$this->adminComments->assign("isConfirmedCommentsHint", $content['isConfirmedCommentsHint']);
		$this->adminComments->assign("confirmerCommentsHint", $content['confirmerCommentsHint']);
		$this->adminComments->assign("deleteCommentsHint", $content['deleteCommentsHint']);
		$this->adminComments->assign("confirmCommentsHint", $content['confirmCommentsHint']);
		$this->adminComments->assign("updatedCommentsHint", $content['updatedCommentsHint']);
		$this->adminComments->assign("confirmDateCommentsHint", $content['confirmDateCommentsHint']);
		$this->adminComments->assign("videoNameCommentsHint", $content['videoNameCommentsHint']);
		$this->adminComments->assign("questionCommentsHint", $content['questionCommentsHint']);
		$this->adminComments->assign("userIPCommentsHint", $content['userIPCommentsHint']);
		$this->adminComments->assign("updatedByIdCommentsHint", $content['updatedByIdCommentsHint']);
		$this->adminComments->assign("updatedByCommentsHint", $content['updatedByCommentsHint']);
		$this->adminComments->assign("updatedByIPCommentsHint", $content['updatedByIPCommentsHint']);
		$this->adminComments->assign("confirmedByIdCommentsHint", $content['confirmedByIdCommentsHint']);
		$this->adminComments->assign("confirmedByIPCommentsHint", $content['confirmedByIPCommentsHint']);
		
		$this->adminComments->assign("hasConfirmAccess", $controller->access->authorized(16));
		$this->adminComments->assign("hasDeleteAccess", $controller->access->authorized(27));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminComments->assign("createdVal", $_POST["created"]);
			$this->adminComments->assign("createdTillVal", $_POST["createdTill"]);
			$this->adminComments->assign("idVal", $_POST["id"]);
			$this->adminComments->assign("videoIdVal", $_POST["videoId"]);
			$this->adminComments->assign("linkVal", $_POST["link"]);
			$this->adminComments->assign("authorIdVal", $_POST["authorId"]);
			$this->adminComments->assign("authorVal", $_POST["author"]);
			$this->adminComments->assign("commentVal", $_POST["comment"]);
			$this->adminComments->assign("confirmedVal", $_POST["confirmed"]);
			$this->adminComments->assign("updatedVal", $_POST["updated"]);
			$this->adminComments->assign("updatedTillVal", $_POST["updatedTill"]);
			$this->adminComments->assign("confirmDateVal", $_POST["confirmDate"]);
			$this->adminComments->assign("confirmDateTillVal", $_POST["confirmDateTill"]);
			$this->adminComments->assign("videoNameVal", $_POST["videoName"]);
			$this->adminComments->assign("questionVal", $_POST["question"]);
			$this->adminComments->assign("userIPVal", $_POST["userIP"]);
			$this->adminComments->assign("updatedByIdVal", $_POST["updatedById"]);
			$this->adminComments->assign("updatedByVal", $_POST["updatedBy"]);
			$this->adminComments->assign("updatedByIPVal", $_POST["updatedByIP"]);
			$this->adminComments->assign("confirmedByIdVal", $_POST["confirmedById"]);
			$this->adminComments->assign("confirmedByIPVal", $_POST["confirmedByIP"]);
			$this->adminComments->assign("confirmerVal", $_POST["confirmer"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["createdSortType"]))
			$sortType = ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoIdSortType"]))
			$sortType = ($_GET["videoIdSortType"] == "" || $_GET["videoIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["linkSortType"]))
			$sortType = ($_GET["linkSortType"] == "" || $_GET["linkSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["authorIdSortType"]))
			$sortType = ($_GET["authorIdSortType"] == "" || $_GET["authorIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["authorSortType"]))
			$sortType = ($_GET["authorSortType"] == "" || $_GET["authorSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["commentSortType"]))
			$sortType = ($_GET["commentSortType"] == "" || $_GET["commentSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["confirmedSortType"]))
			$sortType = ($_GET["confirmedSortType"] == "" || $_GET["confirmedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["confirmerSortType"]))
			$sortType = ($_GET["confirmerSortType"] == "" || $_GET["confirmerSortType"] == "ASC")? 'DESC' : 'ASC';
		
		if(isset($_GET["updatedSortType"]))
			$sortType = ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["confirmDateSortType"]))
			$sortType = ($_GET["confirmDateSortType"] == "" || $_GET["confirmDateSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["videoNameSortType"]))
			$sortType = ($_GET["videoNameSortType"] == "" || $_GET["videoNameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["questionSortType"]))
			$sortType = ($_GET["questionSortType"] == "" || $_GET["questionSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userIPSortType"]))
			$sortType = ($_GET["userIPSortType"] == "" || $_GET["userIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedByIdSortType"]))
			$sortType = ($_GET["updatedByIdSortType"] == "" || $_GET["updatedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedBySortType"]))
			$sortType = ($_GET["updatedBySortType"] == "" || $_GET["updatedBySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["updatedByIPSortType"]))
			$sortType = ($_GET["updatedByIPSortType"] == "" || $_GET["updatedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["confirmedByIdSortType"]))
			$sortType = ($_GET["confirmedByIdSortType"] == "" || $_GET["confirmedByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["confirmedByIPSortType"]))
			$sortType = ($_GET["confirmedByIPSortType"] == "" || $_GET["confirmedByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		
		$this->adminComments->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("videoIdSortType", ($_GET["videoIdSortType"] == "" || $_GET["videoIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("linkSortType", ($_GET["linkSortType"] == "" || $_GET["linkSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("authorIdSortType", ($_GET["authorIdSortType"] == "" || $_GET["authorIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("authorSortType", ($_GET["authorSortType"] == "" || $_GET["authorSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("commentSortType", ($_GET["commentSortType"] == "" || $_GET["commentSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmedSortType", ($_GET["confirmedSortType"] == "" || $_GET["confirmedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmerSortType", ($_GET["confirmerSortType"] == "" || $_GET["confirmerSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("updatedSortType", ($_GET["updatedSortType"] == "" || $_GET["updatedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmDateSortType", ($_GET["confirmDateSortType"] == "" || $_GET["confirmDateSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("videoNameSortType", ($_GET["videoNameSortType"] == "" || $_GET["videoNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("questionSortType", ($_GET["questionSortType"] == "" || $_GET["questionSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("userIPSortType", ($_GET["userIPSortType"] == "" || $_GET["userIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("updatedByIdSortType", ($_GET["updatedByIdSortType"] == "" || $_GET["updatedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("updatedBySortType", ($_GET["updatedBySortType"] == "" || $_GET["updatedBySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("updatedByIPSortType", ($_GET["updatedByIPSortType"] == "" || $_GET["updatedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmedByIdSortType", ($_GET["confirmedByIdSortType"] == "" || $_GET["confirmedByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmedByIPSortType", ($_GET["confirmedByIPSortType"] == "" || $_GET["confirmedByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
		$this->adminComments->assign("perPage", $perPage);
		$this->adminComments->assign("comments", $controller->getComments($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminComments->assign("commentPages",$controller->getPages($begin,$perPage,$cnt,"adminComments"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminComments->display($templatePath."adminComments.tpl");
	}
	
}

?>