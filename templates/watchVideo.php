<?php

class WatchVideo
{
	private $watchVideo;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $okMessage;
		
		$this->watchVideo = new Smarty;
		if(isset($_GET["id"]) && $_GET["id"] != "" && $_GET["id"]>0)
		{
			$videoInfo = $this->getVideoInfo($_GET["id"],$controller->lang,$controller->db,$controller->access);
			$this->watchVideo->assign("catName",$videoInfo[0]["catName".$controller->lang]);
			$this->watchVideo->assign("lang",$controller->lang);
			$this->watchVideo->assign("videoLink",$videoInfo[0]["link"]);
			$this->watchVideo->assign("videoName",((strlen($videoInfo[0]["name"])>30)?substr($videoInfo[0]["name"],0,30)."...":$videoInfo[0]["name"]));
			$this->watchVideo->assign("likeCount",$videoInfo[0]["likeCount"]);
			$this->watchVideo->assign("dislikeCount",$videoInfo[0]["dislikeCount"]);
			$this->watchVideo->assign("viewCount",$videoInfo[0]["viewCount"]);
			$this->watchVideo->assign("addedById",$videoInfo[0]["addedById"]);
			$this->watchVideo->assign("videoTags",$videoInfo[0]["tags"]);
			$this->watchVideo->assign("publishDate",$videoInfo[0]["added"]);
			$this->watchVideo->assign("author",$videoInfo[0]["addedBy"]);
			$this->watchVideo->assign("language",$videoInfo[0]["language"]);
			$this->watchVideo->assign("questions",$controller->getQuestions($videoInfo[0]["questions"]));
			$this->watchVideo->assign("info",$videoInfo[0]["info"]);
			$this->watchVideo->assign("catId",$videoInfo[0]["categoryId"]);
			$this->watchVideo->assign("videoId",$_GET["id"]);
			$this->watchVideo->assign("views",$content['VIEWS']);
			$this->watchVideo->assign("hasAccess",$controller->access->hasAccess);
			$this->watchVideo->assign("curUserId",$controller->access->userId);
			$this->watchVideo->assign("email",$content['EMAIL']);
			$this->watchVideo->assign("tags",$content['TAGS']);
			$this->watchVideo->assign("published",$content['PUBLISHED']);
			$this->watchVideo->assign("reportVideo",$content['REPORTVIDEO']);
			$this->watchVideo->assign("addToFolder",$content['ADDTOMYFOLDER']);
			$this->watchVideo->assign("recommended",$content['RECOMMENDED']);
			$this->watchVideo->assign("deleteConfirmation",$content['DELETECONFIRMATION']);
			$this->watchVideo->assign("folders",$content['FOLDERS']);
			$this->watchVideo->assign("folderName",$content['FOLDERNAME']);
			$this->watchVideo->assign("noFolderNotf",$content['NOFOLDERNOTF']);
			$this->watchVideo->assign("removeFromFolder",$content['REMOVEFROMFOLDER']);
			
			$this->watchVideo->assign("addComment",$content['ADDCOMMENT']);
			$this->watchVideo->assign("post",$content['POST']);
			$this->watchVideo->assign("edit",$content['EDIT']);
			$this->watchVideo->assign("delete",$content['DELETE']);
			$this->watchVideo->assign("save",$content['SAVE']);
			$this->watchVideo->assign("cancel",$content['CANCEL']);
			$this->watchVideo->assign("reportDesc",$content['REPORTDESC']);
			$this->watchVideo->assign("reportReason",$content['REPORTREASON']);
			
			$this->watchVideo->assign("result", $result);
			$this->watchVideo->assign("messages", $messages);
			$this->watchVideo->assign("okMessage", $okMessage);
			
			
			$this->watchVideo->assign("comments",$this->getComments($_GET["id"],$controller->lang,$controller->db,$controller->access));
			if($access->hasAccess)
			{	
				$this->watchVideo->assign("foldersArr",$this->getFolders($controller));
				$this->watchVideo->assign("added2Folder",$this->isAddedToFolder($_GET["id"],$controller));
			}
			$this->watchVideo->assign("reportReasons",$this->getReportReasons($controller));
			//$this->watchVideo->assign("addedFoldersArr",$this->getAddedFolders($_GET["id"],$controller));
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->watchVideo->display($templatePath."watchVideo.tpl");
	}
	
	private function getVideoInfo($id,$lang,$db,$access)
	{
		if($access->hasAccess)
			$db->rawQuery("insert into videoviews (userId,videoId,action,actionDate) 
							values (".$access->userId.",$id,0,'".date("Y-m-d H:i:s")."')
							on duplicate key update
							actionDate = '".date("Y-m-d H:i:s")."'");
		$res = $db->rawQuery("
						SELECT count(vv.action) viewCount,
								SUM(IF(action = 1, 1, 0)) likeCount,
								SUM(IF(action = -1, 1, 0)) dislikeCount,
								v.id,v.name,v.info,v.duration,DATE_FORMAT(v.added,'%d %b %Y') added,v.languageId,v.link,v.questions,v.addedById,
								concat(u.firstName,' ',u.lastName) addedBy,
								tg.tags,
								vc.categoryId,
								c.catName$lang,
								l.name$lang language
						FROM videoviews vv
						right join videos v on v.id=vv.videoId
						inner join users u on u.id=v.addedById
						inner join videocats vc on vc.videoId=v.id
						inner join categories c on c.id = vc.categoryId
						left join languages l on l.id=v.languageId
						left join (
							select videoId,GROUP_CONCAT(DISTINCT t.name ORDER BY t.name) AS tags
							from videotags vt
							inner join tags t on t.id=vt.tagId
							group by vt.videoId
						) tg on tg.videoId=v.id
						where v.id=$id
						group by v.id,vc.categoryId");
		return $res;
	}
	
	private function getComments($id,$lang,$db,$access)
	{
		$qry = "SELECT c.id commentId, c.comment,c.createdById,DATE_FORMAT(c.created,'%d %b %Y %T') created,c.updated,
				concat(u.firstName,' ',u.lastName) author,if(u.picturePath!='',u.picturePath,'./uploads/images/noimage.jpg') picturePath
				FROM comments c
				inner join users u on u.id=c.createdById
				where c.videoId=$id";
		$res = $db->rawQuery($qry);
		return $res;
	}
	
	private function getFolders($controller)
	{
		$qry = "select id folderId, name folderName from folders where createdById=".$controller->access->userId;
		$res = $controller->db->rawQuery($qry);
		return $res;
	}
	
	private function getReportReasons($controller)
	{
		$qry = "select id, reason".$controller->lang." reason from reportreasons";
		$res = $controller->db->rawQuery($qry);
		return $res;
	}
	
	private function getAddedFolders($videoId,$controller)
	{
		$qry = "select f.id folderId, f.name folderName 
				from folders f
				inner join foldervideos fv on fv.folderId = f.id
				where fv.videoId = $videoId and createdById=".$controller->access->userId;
		$res = $controller->db->rawQuery($qry);
		return $res;
	}
	
	
	private function isAddedToFolder($videoId,$controller)
	{
		$qry = "select * from foldervideos fv
				inner join folders f on f.id = fv.folderId
				where fv.videoId = $videoId and f.createdById=".$controller->access->userId;
		$res = $controller->db->rawQuery($qry);//echo "ssss=".$db->count;
		if ($controller->db->count>0)
			return 1;
		return 0;
	}
}

?>