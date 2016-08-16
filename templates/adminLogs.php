<?php

class AdminLogs
{
	private $adminLogs;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $recsPerPage;
		
		$this->adminLogs = new SmartyBC;
		$this->adminLogs->assign("lang", $controller->lang);
		$this->adminLogs->assign("result", $result);
		$this->adminLogs->assign("messages", $messages);
		$this->adminLogs->assign("delete", $content['DELETE']);
		$this->adminLogs->assign("edit", $content['EDIT']);
		$this->adminLogs->assign("export", $content['EXPORT']);
		$this->adminLogs->assign("filter", $content['FILTER']);
		$this->adminLogs->assign("confirm", $content['CONFIRM']);
		
		$this->adminLogs->assign("lnActionDate", $content['ACTIONDATE']);
		$this->adminLogs->assign("lnId", $content['ID']);
		$this->adminLogs->assign("lnActionName", $content['ACTIONNAME']);
		$this->adminLogs->assign("lnCreatedById", $content['CREATEDBYID']);
		$this->adminLogs->assign("lnCreatedBy", $content['CREATEDBY']);
		$this->adminLogs->assign("lnCreatedByIP", $content['CREATEDBYIP']);
		
		
		$this->adminLogs->assign("actionDateLogsHint", $content['actionDateLogsHint']);
		$this->adminLogs->assign("idLogsHint", $content['idLogsHint']);
		$this->adminLogs->assign("actionNameLogsHint", $content['actionNameLogsHint']);
		$this->adminLogs->assign("createdByIdLogsHint", $content['createdByIdLogsHint']);
		$this->adminLogs->assign("createdByLogsHint", $content['createdByLogsHint']);
		$this->adminLogs->assign("createdByIPLogsHint", $content['createdByIPLogsHint']);
		
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminLogs->assign("actionDateVal", $_POST["actionDate"]);
			$this->adminLogs->assign("actionDateTillVal", $_POST["actionDateTill"]);
			$this->adminLogs->assign("idVal", $_POST["id"]);
			$this->adminLogs->assign("actionNameVal", $_POST["actionName"]);
			$this->adminLogs->assign("createdByIdVal", $_POST["createdById"]);
			$this->adminLogs->assign("createdByVal", $_POST["createdBy"]);			
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["actionDateSortType"]))
			$sortType = ($_GET["actionDateSortType"] == "" || $_GET["actionDateSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["actionNameSortType"]))
			$sortType = ($_GET["actionNameSortType"] == "" || $_GET["actionNameSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIdSortType"]))
			$sortType = ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdBySortType"]))
			$sortType = ($_GET["createdBySortType"] == "" || $_GET["createdBySortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["createdByIPSortType"]))
			$sortType = ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC';
		
		
		
		$this->adminLogs->assign("actionDateSortType", ($_GET["actionDateSortType"] == "" || $_GET["actionDateSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminLogs->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminLogs->assign("actionNameSortType", ($_GET["actionNameSortType"] == "" || $_GET["actionNameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminLogs->assign("createdByIdSortType", ($_GET["createdByIdSortType"] == "" || $_GET["createdByIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminLogs->assign("createdBySortType", ($_GET["createdBySortType"] == "" || $_GET["createdBySortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminLogs->assign("createdByIPSortType", ($_GET["createdByIPSortType"] == "" || $_GET["createdByIPSortType"] == "ASC")? 'DESC' : 'ASC');
		
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=$recsPerPage;
		$this->adminLogs->assign("perPage", $perPage);
		$this->adminLogs->assign("logs", $controller->getLogs($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminLogs->assign("logPages",$controller->getPages($begin,$perPage,$cnt,"adminLogs"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminLogs->display($templatePath."adminLogs.tpl");
	}
	
}

?>