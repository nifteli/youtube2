<?php

class Categories
{
	private $categories;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		$userId = 0;
		
		$this->categories = new Smarty;
		$this->categories->assign("how",$content['HOW']);
		$this->categories->assign("why",$content['WHY']);
		$this->categories->assign("what",$content['WHAT']);
		$this->categories->assign("who",$content['WHO']);
		$this->categories->assign("catalogues",$content['CATOLOGUES']);
		$this->categories->assign("added",$content['ADDED']);
		$this->categories->assign("addNewFolder",$content['ADDNEWFOLDER']);
		$this->categories->assign("newFolder",$content['NEWFOLDER']);
		$this->categories->assign("folderName",$content['FOLDERNAME']);
		$this->categories->assign("editFolder",$content['EDITFOLDER']);
		$this->categories->assign("save",$content['SAVE']);
		$this->categories->assign("deleteConfirmation",$content['DELETECONFIRMATION']);
		$this->categories->assign("tags",$content['TAGS']);
		$this->categories->assign("sbAlph",$content['SORTALPHABETICALLY']);
		$this->categories->assign("sbVideoCnt",$content['SORTVIDEOCOUNT']);
		$this->categories->assign("sbDate",$content['SORTDATE']);
		$this->categories->assign("asc",$content['ASC']);
		$this->categories->assign("desc",$content['DESC']);
		$this->categories->assign("dirVal",1);
		if(isset($_GET["dir"])) $this->categories->assign("dirVal",$_GET["dir"]);
		$this->categories->assign("by",1);
		if(isset($_GET["by"])) $this->categories->assign("by",$_GET["by"]);
		
				
		//echo "<pre>";print_r($cats);echo "</pre>";
		$this->categories->assign("lang",$controller->lang);
		$this->categories->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		$this->categories->assign("okMessage", isset($okMessage) ? $okMessage : "");
		
		$controller->getCategories(4,$catGroups,$cats);
		$this->categories->assign("catGroupsHow",$catGroups);
		$this->categories->assign("catsHow",$cats);
		
		$controller->getCategories(8,$catGroups,$cats);
		$this->categories->assign("catGroupsWhy",$catGroups);
		$this->categories->assign("catsWhy",$cats);
		$controller->getCategories(1,$catGroups,$cats);
		$this->categories->assign("catGroupsWhat",$catGroups);
		$this->categories->assign("catsWhat",$cats);
		$controller->getCategories(2,$catGroups,$cats);
		$this->categories->assign("catGroupsWho",$catGroups);
		$this->categories->assign("catsWho",$cats);
		//echo "eee";print_r($_POST);exit;
		$this->categories->assign("general","true");
		if($_REQUEST["src"] == "")
			$this->categories->assign("general","false");
		
			
		//$this->categories->assign("catsHow",$controller->getCategories(4));
		// $this->categories->assign("catsWhy",$controller->getCategories(8));
		// $this->categories->assign("catsWhat",$controller->getCategories(1));
		// $this->categories->assign("catsWho",$controller->getCategories(2));
		
		if($controller->access->hasAccess)
			$userId = $controller->access->userId;
		if(isset($_GET["userId"]) && is_numeric($_GET["userId"]) && $_GET["userId"] > 0)
			$userId = $_GET["userId"];
		$this->categories->assign("userId",$userId);
		$this->categories->assign("myUserId",$controller->access->userId);
			
		if(isset($_GET["catId"]) && is_numeric($_GET["catId"]))
			$this->categories->assign("currCatId",$_GET["catId"]);
		if($userId > 0)
		{
			if(isset($_GET["folderId"]) && is_numeric($_GET["folderId"]))
				$this->categories->assign("folderTab",1);
			if(isset($_GET["catId"]) && is_numeric($_GET["catId"]) && isset($_GET["userId"]) && is_numeric($_GET["userId"]))
				$this->categories->assign("catTab",1);	
				
			$this->categories->assign("hasAccess",1);
			$this->categories->assign("myFolders",$this->getMyFolders($controller,$userId));
			$this->categories->assign("userName",$controller->getUserName($userId));
			
			$controller->getCategories(4,$catGroups,$cats,$userId);
			$this->categories->assign("myCatGroupsHow",$catGroups);
			$this->categories->assign("myCatsHow",$cats);
			$controller->getCategories(8,$catGroups,$cats,$userId);
			$this->categories->assign("myCatGroupsWhy",$catGroups);
			$this->categories->assign("myCatsWhy",$cats);
			$controller->getCategories(1,$catGroups,$cats,$userId);
			$this->categories->assign("myCatGroupsWhat",$catGroups);
			$this->categories->assign("myCatsWhat",$cats);
			$controller->getCategories(2,$catGroups,$cats,$userId);
			$this->categories->assign("myCatGroupsWho",$catGroups);
			$this->categories->assign("myCatsWho",$cats);
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->categories->display($templatePath."categories.tpl"); 
	}
	
	private function getMyFolders($controller,$userId)
	{
		$by = "fc.folderName";
		$dir = "asc";
		if(is_numeric($_GET["by"]))
		{
			switch($_GET["by"])
			{
				case 1:
					$by = "fc.folderName";
					break;
				case 2:
					$by = "fc.videoCount";
					break;
				case 3:
					$by = "fc.folderName";
					break;
			}
		}
		if(is_numeric($_GET["dir"]))
		{
			switch($_GET["dir"])
			{
				case 1:
					$dir = "asc";
					break;
				case 2:
					$dir = "desc";
					break;
			}
		}
		$qry = "select fc.*,group_concat(t.name) tags from (
				SELECT  f.id folderId, f.name folderName, IfNULL(count(distinct v.id), 0) videoCount
				FROM foldervideos fv
				right join folders f on f.id=fv.folderId
				left join (select * from videos where isDeleted=0) v on v.id=fv.videoId
				where f.createdById=$userId
				group by fv.folderId, f.name
				order by f.created desc, f.name) fc 
				left join foldertags ft on ft.folderId=fc.folderId
				left join tags t on t.id=ft.tagId
				group by fc.folderId,fc.folderName,fc.videoCount
				order by $by $dir";
		$res = $controller->db->rawQuery($qry);
		return $res;
	}
	
	private function getMyVideos($controller)
	{
		$qry = "select id folderId, name folderName from folders where createdById=".$controller->access->userId;
		$res = $controller->db->rawQuery($qry);
		return $res;
	}
}

?>