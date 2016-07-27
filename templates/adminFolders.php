<?php

class AdminFolders
{
	private $adminFolders;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminFolders = new SmartyBC;
		$this->adminFolders->assign("titleFolders", $content['TITLEFOLDERS']);
		$this->adminFolders->assign("save", $content['SAVE']);
		$this->adminFolders->assign("lang", $controller->lang);
		$this->adminFolders->assign("result", $result);
		$this->adminFolders->assign("messages", $messages);
		$this->adminFolders->assign("delete", $content['DELETE']);
		$this->adminFolders->assign("edit", $content['EDIT']);
		$this->adminFolders->assign("export", $content['EXPORT']);
		$this->adminFolders->assign("filter", $content['FILTER']);
		$this->adminFolders->assign("deleteConfirmation", $content['DELETECONFIRMATION']);
		$this->adminFolders->assign("folderName",$content['FOLDERNAME']);
		$this->adminFolders->assign("editFolder",$content['EDITFOLDER']);
		$this->adminFolders->assign("tags",$content['TAGS']);
		//$this->adminFolders->assign("confirm", $content['CONFIRM']);

		$this->adminFolders->assign("createdFolderHint",$content['createdFolderHint']);
		$this->adminFolders->assign("idFolderHint",$content['idFolderHint']);
		$this->adminFolders->assign("createdByIdFolderHint",$content['createdByIdFolderHint']);
		$this->adminFolders->assign("authorFolderHint",$content['authorFolderHint']);
		$this->adminFolders->assign("nameFolderHint",$content['nameFolderHint']);
		$this->adminFolders->assign("tagsFolderHint",$content['tagsFolderHint']);
		$this->adminFolders->assign("deleteFolderHint",$content['deleteFolderHint']);
		$this->adminFolders->assign("editFolderHint",$content['editFolderHint']);
		
		$this->adminFolders->assign("lnCreated", $content['ADDDATE']);
		$this->adminFolders->assign("lnId", $content['ID']);
		$this->adminFolders->assign("lnAuthorId", $content['AUTHORID']);
		$this->adminFolders->assign("lnAuthor", $content['AUTHOR']);
		$this->adminFolders->assign("lnName", $content['FOLDERNAME']);
		$this->adminFolders->assign("lnTags", $content['TAGS']);
		$this->adminFolders->assign("addFolder", $content['ADDFOLDER']);
		$this->adminFolders->assign("users", $controller->getAllUsers());
		
		$this->adminFolders->assign("hasEditAccess", $controller->access->authorized(29));
		$this->adminFolders->assign("hasDeleteAccess", $controller->access->authorized(12));
		
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminFolders->assign("createdVal", $_POST["created"]);
			$this->adminFolders->assign("createdTillVal", $_POST["createdTill"]);
			$this->adminFolders->assign("idVal", $_POST["id"]);
			$this->adminFolders->assign("authorIdVal", $_POST["authorId"]);
			$this->adminFolders->assign("authorVal", $_POST["author"]);
			$this->adminFolders->assign("nameVal", $_POST["name"]);
			$this->adminFolders->assign("tagsVal", $_POST["tags"]);
		}
		if(isset($_GET["sortBy"]) && $_GET["sortBy"] != "")
			$sortBy = trim($_GET["sortBy"]);
		if(isset($_GET["createdSortType"]))
			$sortType = ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["idSortType"]))
			$sortType = ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["authorIdSortType"]))
			$sortType = ($_GET["authorIdSortType"] == "" || $_GET["authorIdSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["authorSortType"]))
			$sortType = ($_GET["authorSortType"] == "" || $_GET["authorSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["nameSortType"]))
			$sortType = ($_GET["nametSortType"] == "" || $_GET["nametSortType"] == "ASC")? 'DESC' : 'ASC';
		if(isset($_GET["tags"]))
			$sortType = ($_GET["tags"] == "" || $_GET["tags"] == "ASC")? 'DESC' : 'ASC';
		
		
		$this->adminFolders->assign("createdSortType", ($_GET["createdSortType"] == "" || $_GET["createdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminFolders->assign("idSortType", ($_GET["idSortType"] == "" || $_GET["idSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminFolders->assign("authorIdSortType", ($_GET["authorIdSortType"] == "" || $_GET["authorIdSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminFolders->assign("authorSortType", ($_GET["authorSortType"] == "" || $_GET["authorSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminFolders->assign("nameSortType", ($_GET["nameSortType"] == "" || $_GET["nameSortType"] == "ASC")? 'DESC' : 'ASC');
		$this->adminFolders->assign("tags", ($_GET["tags"] == "" || $_GET["tags"] == "ASC")? 'DESC' : 'ASC');
		
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=10;
		$this->adminFolders->assign("perPage", $perPage);
		$this->adminFolders->assign("folders", $controller->getFolders($begin,$perPage,$_POST,$cnt,$sortBy,$sortType));
		$this->adminFolders->assign("folderPages",$controller->getPages($begin,$perPage,$cnt,"adminFolders"));
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminFolders->display($templatePath."adminFolders.tpl");
	}
	
}

?>