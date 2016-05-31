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
		$this->videos->assign("dataFunction","showData");
		if($_GET["df"] == 1)
			$this->videos->assign("dataFunction","showAllData");
		
		$this->videos->assign("catId", isset($_GET["catId"]) ? $_GET["catId"] : "");
		$this->videos->assign("userId", isset($_GET["userId"]) ? $_GET["userId"] : "");
		$this->videos->assign("tagId", isset($_GET["tagId"]) ? $_GET["tagId"] : "");
		$this->videos->assign("sortBy", $content["SORTBY"]);
		$this->videos->assign("sbDate", $content["SBDATE"]);
		$this->videos->assign("sbName", $content["SBNAME"]);
		$this->videos->assign("sbLang", $content["SBLANG"]);
		$this->videos->assign("sbQuestion", $content["SBQUESTION"]);
		$this->videos->assign("sbCategory", $content["SBCATEGORY"]);
		$this->videos->assign("sbDuration", $content["SBDURATION"]);
		$this->videos->assign("sbWatches", $content["SBWATCHES"]);
		$this->videos->assign("sbComments", $content["SBCOMMENTS"]);
		$this->videos->assign("addToNewFolder", $content["ADDTONEWFOLDER"]);
		$this->videos->assign("folderNm",$content['FOLDERNAME']);
		$this->videos->assign("tags",$content['TAGS']);
		$this->videos->assign("save",$content['SAVE']);
		$this->videos->assign("asc",$content['ASC']);
		$this->videos->assign("desc",$content['DESC']);
		if(is_numeric($_GET["catId"]))
			$this->videos->assign("catIdVal",$_GET["catId"]);
		if(is_numeric($_GET["q"]))
			$this->videos->assign("q",$_GET["q"]);
		if(is_numeric($_GET["tagId"]))
			$this->videos->assign("tagIdVal",$_GET["tagId"]);
		if(is_numeric($_GET["userId"]))
			$this->videos->assign("userIdVal",$_GET["userId"]);
		if(is_numeric($_GET["folderId"]))
			$this->videos->assign("folderIdVal",$_GET["folderId"]);	
		
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
		$qry = "SELECT  f.name, IfNULL(count(distinct v.id), 0) videoCount
				FROM foldervideos fv
				right join folders f on f.id=fv.folderId
				left join (select * from videos where isDeleted=0) v on v.id=fv.videoId
				where f.id=$folderId 
				group by fv.folderId, f.name";
		$res = $controller->db->rawQuery($qry);
		return $res[0];
	}
}

?>