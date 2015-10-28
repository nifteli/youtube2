<?php

class AdminComments
{
	private $adminComments;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
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
		$this->adminComments->assign("lnAuthorId", $content['AUTHORID']);
		$this->adminComments->assign("lnAuthor", $content['AUTHOR']);
		$this->adminComments->assign("lnComment", $content['COMMENT']);
		$this->adminComments->assign("lnConfirmed", $content['CONFIRMED']);
		$this->adminComments->assign("lnConfirmer", $content['CONFIRMER']);
		$this->adminComments->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		
		$this->adminComments->assign("hasConfirmAccess", $controller->access->authorized(16));
		$this->adminComments->assign("hasDeleteAccess", $controller->access->authorized(27));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminComments->assign("createdVal", $_POST["created"]);
			$this->adminComments->assign("idVal", $_POST["id"]);
			$this->adminComments->assign("videoIdVal", $_POST["videoId"]);
			$this->adminComments->assign("authorIdVal", $_POST["authorId"]);
			$this->adminComments->assign("authorVal", $_POST["author"]);
			$this->adminComments->assign("commentVal", $_POST["comment"]);
			$this->adminComments->assign("confirmedVal", $_POST["confirmed"]);
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
		
		
		$this->adminComments->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("videoIdSortType", ($_GET["videoIdSortType"] == "" || $_GET["videoIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("authorIdSortType", ($_GET["authorIdSortType"] == "" || $_GET["authorIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("authorSortType", ($_GET["authorSortType"] == "" || $_GET["authorSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("commentSortType", ($_GET["commentSortType"] == "" || $_GET["commentSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmedSortType", ($_GET["confirmedSortType"] == "" || $_GET["confirmedSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminComments->assign("confirmerSortType", ($_GET["confirmerSortType"] == "" || $_GET["confirmerSortType"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
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