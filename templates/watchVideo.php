<?php

class WatchVideo
{
	private $watchVideo;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->watchVideo = new Smarty;
		if(isset($_GET["id"]) && $_GET["id"] != "")
		{
			$videoInfo = $this->getVideoInfo($_GET["id"],$controller->lang,$controller->db);
			$this->watchVideo->assign("catName",$videoInfo[0]["catName".$controller->lang]);
			$this->watchVideo->assign("videoLink",$videoInfo[0]["link"]);
			$this->watchVideo->assign("videoName",((strlen($videoInfo[0]["name"])>30)?substr($videoInfo[0]["name"],0,30)."...":$videoInfo[0]["name"]));
			$this->watchVideo->assign("likeCount",$videoInfo[0]["likeCount"]);
			$this->watchVideo->assign("dislikeCount",$videoInfo[0]["dislikeCount"]);
			$this->watchVideo->assign("viewCount",$videoInfo[0]["viewCount"]);
			$this->watchVideo->assign("videoTags",$videoInfo[0]["tags"]);
			$this->watchVideo->assign("publishDate",$videoInfo[0]["added"]);
			$this->watchVideo->assign("author",$videoInfo[0]["addedBy"]);
		}
		$this->watchVideo->assign("views",$content['VIEWS']);
		$this->watchVideo->assign("tags",$content['TAGS']);
		$this->watchVideo->assign("published",$content['USERS']);
		$this->watchVideo->assign("reportVideo",$content['REPORTVIDEO']);
		$this->watchVideo->assign("addToFolder",$content['ADDTOMYFOLDER']);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->watchVideo->display($templatePath."watchVideo.tpl");
	}
	
	private function getVideoInfo($id,$lang,$db)
	{
		$res = $db->rawQuery("SELECT count(vv.action) viewCount,
								SUM(IF(action = 1, 1, 0)) likeCount,
								SUM(IF(action = -1, 1, 0)) dislikeCount,
								v.id,v.name,v.info,v.duration,DATE_FORMAT(v.added,'%d %b %Y') added,v.languageId,v.link,
								concat(u.firstName,' ',u.lastName) addedBy,
								tg.tags,
								vc.categoryId,
								c.catName$lang
						FROM videoViews vv
						right join videos v on v.id=vv.videoId
						inner join users u on u.id=v.addedById
						inner join videocats vc on vc.videoId=v.id
						inner join categories c on c.id = vc.categoryId
						left join languages l on l.id=v.languageId
						left join (
							select videoId,GROUP_CONCAT(DISTINCT t.name ORDER BY t.name) AS tags
							from videoTags vt
							inner join tags t on t.id=vt.tagId
							group by vt.videoId
						) tg on tg.videoId=v.id
						where v.id=$id
						group by v.id,vc.categoryId");
		return $res;
	}
}

?>