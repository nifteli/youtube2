<?php

class WatchVideo
{
	private $watchVideo;
	private $ok;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $okMessage;
		global $domain;
		
		$this->ok = false;
		$this->watchVideo = new Smarty;
		if(isset($_GET["id"]) && $_GET["id"] != "" && $_GET["id"]>0 && is_numeric($_GET["id"]))
		{
			$this->ok = true;
			$videoInfo = $this->getVideoInfo($_GET["id"],$controller->lang,$controller->db,$controller->access);
			
			if(count($videoInfo) < 1) { $this->ok = false; return; }
			$this->watchVideo->assign("catName",$videoInfo[0]["catName".$controller->lang]);
			$this->watchVideo->assign("pageTitle",str_replace('"',"'",$videoInfo[0]["catName".$controller->lang]."-".$videoInfo[0]["name"]));
			$this->watchVideo->assign("keywords",str_replace('"',"'",$videoInfo[0]["catName".$controller->lang].",".$videoInfo[0]["name"].",".$videoInfo[0]["tagsOrg"]));
			$this->watchVideo->assign("lang",$controller->lang);
			$this->watchVideo->assign("videoLink",$videoInfo[0]["link"]);
			$this->watchVideo->assign("videoName",((mb_strlen($videoInfo[0]["name"],"UTF-8")>65)?mb_substr($videoInfo[0]["name"],0,65,"UTF-8")."...":$videoInfo[0]["name"]));
			$this->watchVideo->assign("fullVideoName",$videoInfo[0]["name"]);
			$this->watchVideo->assign("likeCount",$videoInfo[0]["likeCount"]);
			$this->watchVideo->assign("likeCountTitle",$content["LIKECOUNTTITLE"]);
			$this->watchVideo->assign("dislikeCount",$videoInfo[0]["dislikeCount"]);
			$this->watchVideo->assign("dislikeCountTitle",$content["DISLIKECOUNTTITLE"]);
			$this->watchVideo->assign("viewCount",$videoInfo[0]["viewCount"]);
			$this->watchVideo->assign("viewCountTitle",$content["VIEWCOUNTTITLE"]);
			$this->watchVideo->assign("commentCount",$videoInfo[0]["commentCount"]);
			$this->watchVideo->assign("commentCountTitle",$content["COMMENTCOUNTTITLE"]);
			$this->watchVideo->assign("addedById",$videoInfo[0]["addedById"]);
			$this->watchVideo->assign("videoTags",$videoInfo[0]["tags"]);
			$this->watchVideo->assign("publishDate",$videoInfo[0]["added"]);
			$this->watchVideo->assign("publishDateTitle",$content['PUBLISHEDTITLE']);
			$this->watchVideo->assign("author",$videoInfo[0]["addedBy"]);
			$this->watchVideo->assign("isDeleted",$videoInfo[0]["isDeleted"]);
			$this->watchVideo->assign("userId",$videoInfo[0]["userId"]);
			$this->watchVideo->assign("authorTitle",$content["AUTHORTITLE"]);
			$this->watchVideo->assign("language",$videoInfo[0]["language"]);
			$this->watchVideo->assign("questions",$controller->getQuestions($videoInfo[0]["questions"]));
			$this->watchVideo->assign("info",$videoInfo[0]["info"]);
			$this->watchVideo->assign("catId",$videoInfo[0]["categoryId"]);
			$this->watchVideo->assign("videoId",$_GET["id"]);
			$this->watchVideo->assign("views",$content['VIEWS']);
			$this->watchVideo->assign("domain",$domain);
			$this->watchVideo->assign("hasAccess",$controller->access->hasAccess);
			$this->watchVideo->assign("curUserId",-1);
			if($controller->access->hasAccess)
			{
				$this->watchVideo->assign("liked",$this->isVideoLiked($controller));
				$this->watchVideo->assign("curUserId",$controller->access->userId);
			}
			$this->watchVideo->assign("email",$content['EMAIL']);
			$this->watchVideo->assign("tags",$content['TAGS']);
			$this->watchVideo->assign("published",$content['PUBLISHED']);
			$this->watchVideo->assign("reportVideo",$content['REPORTVIDEO']);
			$this->watchVideo->assign("reportVideoTitle",$content['REPORTVIDEOTITLE']);
			$this->watchVideo->assign("addToFolder",$content['ADDTOMYFOLDER']);
			$this->watchVideo->assign("addToFolderTitle",$content['ADDTOMYFOLDERTITLE']);
			$this->watchVideo->assign("recommended",$content['RECOMMENDED']);
			$this->watchVideo->assign("deleteConfirmation",$content['DELETECONFIRMATION']);
			$this->watchVideo->assign("folders",$content['FOLDERS']);
			$this->watchVideo->assign("folderName",$content['FOLDERNAME']);
			$this->watchVideo->assign("noFolderNotf",$content['NOFOLDERNOTF']);
			$this->watchVideo->assign("removeFromFolder",$content['REMOVEFROMFOLDER']);
			$this->watchVideo->assign("removeFromFolderTitle",$content['REMOVEFROMFOLDERTITLE']);
			$this->watchVideo->assign("addToNewFolder",$content['ADDTONEWFOLDER']);
			
			$this->watchVideo->assign("addComment",$content['ADDCOMMENT']);
			$this->watchVideo->assign("post",$content['POST']);
			$this->watchVideo->assign("edit",$content['EDIT']);
			$this->watchVideo->assign("editTitle",$content['EDITTITLE']);
			$this->watchVideo->assign("delete",$content['DELETE']);
			$this->watchVideo->assign("deleteTitle",$content['DELETETITLE']);
			$this->watchVideo->assign("fbTitle",$content['FBTITLE']);
			$this->watchVideo->assign("twtTitle",$content['TWTTITLE']);
			$this->watchVideo->assign("save",$content['SAVE']);
			$this->watchVideo->assign("cancel",$content['CANCEL']);
			$this->watchVideo->assign("reportDesc",$content['REPORTDESC']);
			$this->watchVideo->assign("reportReason",$content['REPORTREASON']);
			$this->watchVideo->assign("agreeWithRules",$content['AGREEWITHRULES']);
			$this->watchVideo->assign("rules",$content['WRULES']);
			$this->watchVideo->assign("emailVal",$_POST['email']);
			$this->watchVideo->assign("commentHint",$content['COMMENTHINT']);
			$this->watchVideo->assign("emailHint",$content['EMAILHINT']);
			$this->watchVideo->assign("langHint",$content['langHint']);
			$this->watchVideo->assign("questionHint",$content['questionHint']);
			$this->watchVideo->assign("tagsHint",$content['tagsHint']);
			$sort = 1;
			if(is_numeric($_GET["sort"]) && $_GET["sort"] == 1)
				$sort = 2;
			$this->watchVideo->assign("sort",$sort);
			
			
			$this->watchVideo->assign("categoryId",$videoInfo[0]["categoryId"]);
			if($controller->access->hasAccess)
			{
				$this->watchVideo->assign("isSubscribed",$controller->isSubscribed($videoInfo[0]["categoryId"]));
				$this->watchVideo->assign("subsCnt",$controller->getSubsCnt($videoInfo[0]["categoryId"]));
				$this->watchVideo->assign("unsubscribe",$content['UNSUBSCRIBE']);
				$this->watchVideo->assign("subscribe",$content['SUBSCRIBE']);
			}
			
			$this->watchVideo->assign("result", $result);
			$this->watchVideo->assign("messages", $messages);
			$this->watchVideo->assign("okMessage", $okMessage);
			$this->watchVideo->assign("cancel", $content["CANCEL"]);
			
			
			$this->watchVideo->assign("comments",$this->getComments($_GET["id"],$controller->lang,$controller->db,$controller->access,$sort));
			if($controller->access->hasAccess)
			{
				$this->watchVideo->assign("foldersArr",$controller->getFolderNames());
				$this->watchVideo->assign("added2Folder",$this->isAddedToFolder($_GET["id"],$controller));
			}
			$this->watchVideo->assign("reportReasons",$this->getReportReasons($controller));
			//$this->watchVideo->assign("addedFoldersArr",$this->getAddedFolders($_GET["id"],$controller));
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		if($this->ok)
			$this->watchVideo->display($templatePath."watchVideo.tpl");
	}
	
	private function getVideoInfo($id,$lang,$db,$access)
	{
		$userId = 0;
		$IP = $_SERVER["REMOTE_ADDR"];
		if($access->hasAccess)
		{
			$userId = $access->userId;
			$IP = 0;
		}
			$db->rawQuery("insert into videoviews (userId,videoId,action,actionDate,IP,allViewCount) 
							values ($userId,$id,0,now(),'$IP',1)
							on duplicate key update
							actionDate = now(),allViewCount=allViewCount+1");
		$res = $db->rawQuery("
						SELECT count(vv.action) viewCount,
								SUM(IF(action = 1, 1, 0)) likeCount,
								SUM(IF(action = -1, 1, 0)) dislikeCount,
								vws.comments commentCount,
								v.id,v.name,v.info,v.duration,DATE_FORMAT(v.added,'%d %b %Y') added,v.languageId,v.link,v.questions,v.addedById,
								u.userName addedBy,u.isDeleted,u.id userId,
								tg.tags,tg.tagIds,
								vc.categoryId,
								c.catName$lang,
								l.name$lang language
						FROM videoviews vv
						right join videos v on v.id=vv.videoId
						inner join users u on u.id=v.addedById
						inner join videocats vc on vc.videoId=v.id
						inner join categories c on c.id = vc.categoryId
						left join vwvideostats vws on vws.id=v.id
						left join languages l on l.id=v.languageId
						left join (
							select videoId,GROUP_CONCAT(DISTINCT t.name ORDER BY t.name) AS tags,
							GROUP_CONCAT(DISTINCT t.id ORDER BY t.name) AS tagIds
							from videotags vt
							inner join tags t on t.id=vt.tagId
							group by vt.videoId
						) tg on tg.videoId=v.id
						where  v.isDeleted=0 and v.id=$id
						group by v.id,vc.categoryId");
		$tags = explode(",",$res[0]["tags"]);
		$tagIds = explode(",",$res[0]["tagIds"]);
		$res[0]["tagsOrg"] = $res[0]["tags"]; $res[0]["tags"] = "";
		for($i=0; $i<count($tags); $i++)
		{ 
			$res[0]["tags"] .= "<a href='index.php?tagId=".$tagIds[$i]."'>".$tags[$i]."</a>, ";
		}
		$res[0]["tags"] = rtrim($res[0]["tags"],",");
		
		return $res;
	}
	
	private function getComments($id,$lang,$db,$access,$sort)
	{
		global $content;
		$order = "asc";
		if($sort ==1)
			$order = "desc";
			
		$qry = "SELECT c.id commentId, c.comment,c.createdById,DATE_FORMAT(c.created,'%d %b %Y %T') created,c.updated,
				if(c.createdById!='NULL',
					(case when (u.isDeleted = 1) then concat('".$content["USER"]."-',u.id) else u.userName end),
					concat('".$content["GUEST"]."-',c.id)) author,
				if(u.picturePath!='',u.picturePath,'./uploads/images/noimage.png') picturePath
				FROM comments c
				left join users u on u.id=c.createdById
				where c.isConfirmed=1 and c.videoId=$id
				order by c.created $order"; //echo $qry;
		$res = $db->rawQuery($qry);
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
	
	private function isVideoLiked($controller)
	{
		$liked = 0;
		if(is_numeric($_GET["id"]))
		{ 
			$res = $controller->db->rawQuery("select action from videoviews where videoId=$_GET[id] and userId=".$controller->access->userId);
			if ($controller->db->count>0)
				return $res[0]["action"];
		} 
		return $liked;
	}
}

?>