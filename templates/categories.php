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
		$this->categories->assign("general",$content['GENERAL']);
		$this->categories->assign("favorite",$content['FAVORITE']);
		$this->categories->assign("added",$content['ADDEDVIDEOS']);
		$this->categories->assign("deleteConfirmation",$content['DELETECONFIRMATION']);
		$this->categories->assign("otherUsers",$content['OTHERUSERS']);
		$this->categories->assign("myVideos",$content['MYVIDEOS']);
		
				
		$this->categories->assign("lang",$controller->lang);
		$this->categories->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		$this->categories->assign("okMessage", isset($okMessage) ? $okMessage : "");
		
		$this->categories->assign("catsHow",$controller->getCategories(4));
		$this->categories->assign("catsWhy",$controller->getCategories(8));
		$this->categories->assign("catsWhat",$controller->getCategories(1));
		$this->categories->assign("catsWho",$controller->getCategories(2));
		
		if($controller->access->hasAccess)
			$userId = $controller->access->userId;
		if(isset($_GET["userId"]) && is_numeric($_GET["userId"]) && $_GET["userId"] > 0)
			$userId = $_GET["userId"];
		$this->categories->assign("userId",$userId);
		$this->categories->assign("myUserId",$controller->access->userId);
			
		if($userId > 0)
		{
			if(isset($_GET["folderId"]) && is_numeric($_GET["folderId"]))
				$this->categories->assign("folderTab",1);
			if(isset($_GET["catId"]) && is_numeric($_GET["catId"]) && isset($_GET["userId"]) && is_numeric($_GET["userId"]))
				$this->categories->assign("catTab",1);	
			$this->categories->assign("hasAccess",1);
			$this->categories->assign("myFolders",$this->getMyFolders($controller,$userId));
			$this->categories->assign("userName",$controller->getUserName($userId));
			$this->categories->assign("myVideosHow",$controller->getCategories(4,$userId));
			$this->categories->assign("myVideosWhy",$controller->getCategories(8,$userId));
			$this->categories->assign("myVideosWhat",$controller->getCategories(1,$userId));
			$this->categories->assign("myVideosWho",$controller->getCategories(2,$userId));
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->categories->display($templatePath."categories.tpl");
	}
	
	private function getMyFolders($controller,$userId)
	{
		$qry = "SELECT  f.id folderId, f.name folderName, IfNULL(count(distinct v.id), 0) videoCount
				FROM foldervideos fv
				right join folders f on f.id=fv.folderId
				left join (select * from videos where isDeleted=0) v on v.id=fv.videoId
				where f.createdById=" . $userId .
				" group by fv.folderId, f.name
				order by f.created desc, f.name";
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