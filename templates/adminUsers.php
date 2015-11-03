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
		
		$this->adminUsers->assign("lnCreated", $content['DATECREATED']);
		$this->adminUsers->assign("lnId", $content['ID']);
		$this->adminUsers->assign("lnUsername", $content['LOGIN']);
		$this->adminUsers->assign("lnName", $content['NAME']);
		$this->adminUsers->assign("lnRole", $content['ROLENAME']);
		$this->adminUsers->assign("watchProfile", $content['WATCHPROFILE']);
		$this->adminUsers->assign("setUser", $content['SETUSER']);
		$this->adminUsers->assign("delete", $content['DELETE']);
		$this->adminUsers->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		
		$this->adminUsers->assign("hasDeleteAccess", $controller->access->authorized(27));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminUsers->assign("createdVal", $_POST["created"]);
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
	
}

?>