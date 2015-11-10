<?php

class Categories
{
	private $categories;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
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
		$this->categories->assign("hasAccess",$controller->access->hasAccess);
		$this->categories->assign("userId",$controller->access->userId);
		$this->categories->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		$this->categories->assign("okMessage", isset($okMessage) ? $okMessage : "");
		
		$this->categories->assign("catsHow",$controller->getCategories(4));
		$this->categories->assign("catsWhy",$controller->getCategories(8));
		$this->categories->assign("catsWhat",$controller->getCategories(1));
		$this->categories->assign("catsWho",$controller->getCategories(2));
		
		if($controller->access->hasAccess)
		{
			$this->categories->assign("myFolders",$this->getMyFolders($controller));
			$this->categories->assign("myVideosHow",$controller->getCategories(4,$controller->access->userId));
			$this->categories->assign("myVideosWhy",$controller->getCategories(8,$controller->access->userId));
			$this->categories->assign("myVideosWhat",$controller->getCategories(1,$controller->access->userId));
			$this->categories->assign("myVideosWho",$controller->getCategories(2,$controller->access->userId));
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->categories->display($templatePath."categories.tpl");
	}
	
	private function getMyFolders($controller)
	{
		$qry = "SELECT  f.id folderId, f.name folderName, IfNULL(count(distinct v.id), 0) videoCount
				FROM foldervideos fv
				right join folders f on f.id=fv.folderId
				left join (select * from videos where isDeleted=0) v on v.id=fv.videoId
				where f.createdById=" . $controller->access->userId .
				" group by fv.folderId, f.name";
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