<?php

class Videos
{
	private $videos;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->videos = new Smarty;
		$this->videos->assign("lang",$controller->lang);
		
		$this->videos->assign("catId", isset($_GET["catId"]) ? $_GET["catId"] : "");
		$this->videos->assign("userId", isset($_GET["userId"]) ? $_GET["userId"] : "");
		$this->videos->assign("tagId", isset($_GET["tagId"]) ? $_GET["tagId"] : "");
		
		$folderId = "";
		$folderName = "";
		if(isset($_GET["folderId"]) && $_GET["folderId"] > 0)
		{
			$folderInfo = $this->getFolderName($controller, $_GET["folderId"]);
			$folderName = $folderInfo["name"]."(".$folderInfo["videoCount"].")";
			$folderId = $_GET["folderId"];
		}
		$this->videos->assign("folderName", $folderName);
		$this->videos->assign("folderId", $folderId);
		$this->videos->assign("addToFolder", $content['ADDTOMYFOLDER']);
		$data = $controller->getNotifications(1);
		
		$this->videos->assign("news1", $data["middleNote"]);
		$this->videos->assign("news2", $data["rightNote"]);
		if($controller->access->hasAccess)
		{
			$this->videos->assign("folders",$content['FOLDERS']);
			$this->videos->assign("folderName2",$content['FOLDERNAME']);
			$this->videos->assign("noFolderNotf",$content['NOFOLDERNOTF']);
			$this->videos->assign("foldersArr",$controller->getFolderNames($controller));
		}
		
		$this->videos->assign("errorMessage", isset($errorMessage) ? $errorMessage : "");
		$this->videos->assign("okMessage", isset($okMessage) ? $okMessage : "");
	}
	
	public function Show()
	{
		global $templatePath;
		
		
		$this->videos->display($templatePath."videos.tpl");
	}
	
	private function getFolderName($controller, $folderId)
	{
		$qry = "SELECT  f.name, count(*) videoCount
				FROM foldervideos fv
				inner join folders f on f.id=fv.folderId
				where f.id=$folderId and f.createdById=" . $controller->access->userId .
				" group by fv.folderId, f.name";
		$res = $controller->db->rawQuery($qry);
		return $res[0];
	}
}

?>