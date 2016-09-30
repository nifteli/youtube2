<?php

class AddVideo
{
	private $videos;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $langIds;
		
		$this->videos = new Smarty;
		
		$this->videos->assign("videoLink", $content['VIDEOLINK']);
		$this->videos->assign("videoLinkVal", isset($_POST["videoLink"]) ? $_POST["videoLink"] : "");
		$this->videos->assign("language", $content['LANGUAGE']);
		$this->videos->assign("addVideoNote1", $content['ADDVIDEONOTE1']);
		$this->videos->assign("languages", $controller->getLanguages());
		$this->videos->assign("lang", $controller->lang);
		$this->videos->assign("languageVal", isset($_POST["language"]) ? $_POST["language"] : $langIds[$controller->lang]);
		$this->videos->assign("videoQuestion", $content['VIDEOQUESTION']);
		$this->videos->assign("vqHow", $content['HOW']);
		$this->videos->assign("vqWhy", $content['WHY']);
		$this->videos->assign("vqWho", $content['WHO']);
		$this->videos->assign("vqWhat", $content['WHAT']);
		$this->videos->assign("uncheckAll", $content['UNCKECKALL']);
		$this->videos->assign("confirm", $content['CONFIRM']);
		$this->videos->assign("reset", $content['RESET']);
		$this->videos->assign("videoQuestionVal", isset($_POST["videoQuestion"]) ? $_POST["videoQuestion"] : array());
		$this->videos->assign("videoName", $content['VIDEONAME']);
		$this->videos->assign("videoNameVal", isset($_POST["videoName"]) ? $_POST["videoName"] : "");
		$this->videos->assign("information", $content['INFORMATION']);
		$this->videos->assign("informationVal", isset($_POST["information"]) ? $_POST["information"] : "");
		$this->videos->assign("durationVal", isset($_POST["duration"]) ? $_POST["duration"] : "");
		$this->videos->assign("validVideoVal", isset($_POST["validVideo"]) ? $_POST["validVideo"] : "true");
		$this->videos->assign("category", $content['CATEGORY']);
		$this->videos->assign("categoryVal", isset($_POST["category"]) ? json_encode($_POST["category"]) : json_encode(array()));
		$this->videos->assign("tags", $content['TAGS']);
		$this->videos->assign("tagsVal", isset($_POST["tags"]) ? $_POST["tags"] : "");
		$this->videos->assign("addToMyFolder", $content['ADD']);
		$this->videos->assign("cancel", $content['CANCEL']);
		$this->videos->assign("save", $content['SAVE']);
		$this->videos->assign("addVideoError9", $content['ADDVIDEOERROR9']);
		$this->videos->assign("allCategories", json_encode($controller->getAllCategories()));
		
		$this->videos->assign("result", $result);
		$this->videos->assign("messages", $messages);
		
		if(isset($_GET["id"]) && $_GET["id"] > 0 && is_numeric($_GET["id"]) && $controller->hasAccessToVideo($_GET["id"]))
		{
			$videoInfo = $this->getVideoInfo($_GET["id"],$controller);
			$this->videos->assign("videoLinkVal", $videoInfo["link"]);
			$this->videos->assign("languageVal", $videoInfo["languageId"]);
			$this->videos->assign("videoQuestionVal", $videoInfo["questions"]);
			$this->videos->assign("videoNameVal", $videoInfo["name"]);
			$this->videos->assign("informationVal", $videoInfo["info"]);
			$this->videos->assign("durationVal", $videoInfo["duration"]);
			$this->videos->assign("videoLinkVal", $videoInfo["link"]);
			$this->videos->assign("videoLinkVal", $videoInfo["link"]);
			$this->videos->assign("validVideoVal", "true");
			$this->videos->assign("categoryVal", $videoInfo["categories"]);
			$this->videos->assign("tagsVal", $videoInfo["tags"]);
			$this->videos->assign("videoId", $_GET["id"]);
		}
		if(isset($_GET["videoId"]) && $_GET["videoId"] > 0 && is_numeric($_GET["videoId"]) && $controller->hasAccessToVideo($_GET["videoId"]))
			$this->videos->assign("videoId", $_GET["videoId"]);
		
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->videos->display($templatePath."addVideo.tpl");
	}
	
	private function getVideoInfo($id,$controller)
	{
		$res = $controller->db->rawQuery("select v.link,v.languageId,v.questions,v.name,v.added,v.info,v.duration
										  from videos v
										  where v.id=$id");
		$res[0]["questions"] = $controller->getVideoQuesArr($res[0]["questions"]);
		$res[0]["categories"] = $this->getCatsJson($controller,$id);
		$res[0]["tags"] = $this->getTagsGroup($controller,$id);
		return $res[0];
	}
	
	private function getCatsJson($controller,$id)
	{
		$res = $controller->db->rawQuery("select c.id
										 from videocats vc
										 inner join categories c on c.id=vc.categoryId
										 where vc.videoId=$id");
		for ($i=0; $i<count($res); $i++)
			$ret[] = $res[$i]["id"];
		return json_encode($ret);
	}
	
	private function getTagsGroup($controller,$id)
	{
		$res = $controller->db->rawQuery("select group_concat(t.name) name
										 from videotags vt
										 inner join tags t on t.id=vt.tagId
										 where vt.videoId=$id");
		return $res[0]["name"];
	}
}

?>