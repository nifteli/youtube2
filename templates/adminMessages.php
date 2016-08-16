<?php

class AdminMessages
{
	private $adminMessages;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminMessages = new SmartyBC;
		$this->adminMessages->assign("lang", $controller->lang);
		$this->adminMessages->assign("result", $result);
		$this->adminMessages->assign("messages", $messages);
		$this->adminMessages->assign("delete", $content['DELETE']);
		$this->adminMessages->assign("edit", $content['EDIT']);
		$this->adminMessages->assign("export", $content['EXPORT']);
		$this->adminMessages->assign("filter", $content['FILTER']);
		$this->adminMessages->assign("confirm", $content['CONFIRM']);
		
		$this->adminMessages->assign("lnSentDate", $content['SENTDATE']);
		$this->adminMessages->assign("lnId", $content['CODE']);
		$this->adminMessages->assign("lnSubject", $content['SUBJECT']);
		$this->adminMessages->assign("lnBody", $content['MESSAGEBODY']);
		$this->adminMessages->assign("lnSenderId", $content['SENDERID']);
		$this->adminMessages->assign("lnUserName", $content['SENDERNAME']);
		$this->adminMessages->assign("lnSenderIP", $content['SENDERIP']);
		$this->adminMessages->assign("lnTo", $content['TO']);
		$this->adminMessages->assign("lnAttachment", $content['FILE']);
		
		$this->adminMessages->assign("sentDateMessagesHint", $content['sentDateMessagesHint']);
		$this->adminMessages->assign("idMessagesHint", $content['idMessagesHint']);
		$this->adminMessages->assign("subjectMessagesHint", $content['subjectMessagesHint']);
		$this->adminMessages->assign("bodyMessagesHint", $content['bodyMessagesHint']);
		$this->adminMessages->assign("senderIdMessagesHint", $content['senderIdMessagesHint']);
		$this->adminMessages->assign("userNameMessagesHint", $content['userNameMessagesHint']);
		$this->adminMessages->assign("senderIPMessagesHint", $content['senderIPMessagesHint']);
		$this->adminMessages->assign("toMessagesHint", $content['toMessagesHint']);
		$this->adminMessages->assign("attachmentMessagesHint", $content['attachmentMessagesHint']);
		
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminMessages->assign("sentDateVal", $_POST["sentDate"]);
			$this->adminMessages->assign("sentDateTillVal", $_POST["sentDateTill"]);
			$this->adminMessages->assign("idVal", $_POST["id"]);
			$this->adminMessages->assign("subjectVal", $_POST["subject"]);
			$this->adminMessages->assign("bodyVal", $_POST["body"]);
			$this->adminMessages->assign("browserVal", $_POST["browser"]);
			$this->adminMessages->assign("senderIdVal", $_POST["senderId"]);
			$this->adminMessages->assign("userNameVal", $_POST["userName"]);
			$this->adminMessages->assign("senderIPVal", $_POST["senderIP"]);
			$this->adminMessages->assign("toVal", $_POST["to"]);
			
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["sentDateSortType"]))
			$sortType = ($_GET["sentDateSortType"] == "" || $_GET["sentDateSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["subjectSortType"]))
			$sortType = ($_GET["subjectSortType"] == "" || $_GET["subjectSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["bodySortType"]))
			$sortType = ($_GET["bodySortType"] == "" || $_GET["bodySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["senderIdSortType"]))
			$sortType = ($_GET["senderIdSortType"] == "" || $_GET["senderIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["userNameSortType"]))
			$sortType = ($_GET["userNameSortType"] == "" || $_GET["userNameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["senderIPSortType"]))
			$sortType = ($_GET["senderIPSortType"] == "" || $_GET["senderIPSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["toSortType"]))
			$sortType = ($_GET["toSortType"] == "" || $_GET["toSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["attachmentSortType"]))
			$sortType = ($_GET["attachmentSortType"] == "" || $_GET["attachmentSortType"] == "ASC")? 'DESC' : 'ASC';
		
		
		
		$this->adminMessages->assign("sentDateSortType", ($_GET["sentDateSortType"] == "" || $_GET["sentDateSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("subjectSortType", ($_GET["subjectSortType"] == "" || $_GET["subjectSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("bodySortType", ($_GET["bodySortType"] == "" || $_GET["bodySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("senderIdSortType", ($_GET["senderIdSortType"] == "" || $_GET["senderIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("userNameSortType", ($_GET["userNameSortType"] == "" || $_GET["userNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("senderIPSortType", ($_GET["senderIPSortType"] == "" || $_GET["senderIPSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("toSortType", ($_GET["toSortType"] == "" || $_GET["toSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminMessages->assign("attachmentSortType", ($_GET["attachmentSortType"] == "" || $_GET["attachmentSortType"] == "ASC")? 'DESC' : 'ASC');
		
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"];else $perPage=$recsPerPage;
		$this->adminMessages->assign("perPage", $perPage);
		$this->adminMessages->assign("messages2", $controller->getMailInfo($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminMessages->assign("messagePages",$controller->getPages($begin,$perPage,$cnt,"adminMessages"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminMessages->display($templatePath."adminMessages.tpl");
	}
	
}

?>