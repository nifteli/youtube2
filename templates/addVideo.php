<?php

class AddVideo
{
	private $videos;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $okMessage;
		
		$this->videos = new Smarty;
		$this->videos->assign("videoLink",$content['VIDEOLINK']);
		if (isset($_POST["videoLink"])) $this->videos->assign("videoLinkVal",$_POST["videoLink"]);
		$this->videos->assign("language",$content['LANGUAGE']);
		$this->videos->assign("langAz",$content['LANGAZ']);
		$this->videos->assign("langRu",$content['LANGRU']);
		$this->videos->assign("langEn",$content['LANGEN']);
		if (isset($_POST["language"])) $this->videos->assign("languageVal",$_POST["language"]);
		$this->videos->assign("videoQuestion",$content['VIDEOQUESTION']);
		$this->videos->assign("vqHow",$content['HOW']);
		$this->videos->assign("vqWhy",$content['WHY']);
		$this->videos->assign("vqWho",$content['WHO']);
		$this->videos->assign("vqWhat",$content['WHAT']);
		if (isset($_POST["videoQuestion"])) $this->videos->assign("videoQuestionVal",$_POST["videoQuestion"]);
		$this->videos->assign("videoName",$content['VIDEONAME']);
		if (isset($_POST["videoName"])) $this->videos->assign("videoNameVal",$_POST["videoName"]);
		$this->videos->assign("information",$content['INFORMATION']);
		if (isset($_POST["information"])) $this->videos->assign("informationVal",$_POST["information"]);
		$this->videos->assign("category",$content['CATEGORY']);
		if (isset($_POST["category"])) $this->videos->assign("categoryVal",$_POST["category"]);
		$this->videos->assign("tags",$content['TAGS']);
		if (isset($_POST["tags"])) $this->videos->assign("tagsVal",$_POST["tags"]);
		$this->videos->assign("addToMyFolder",$content['ADDTOMYFOLDER']);
		$this->videos->assign("cancel",$content['CANCEL']);
		
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->videos->display($templatePath."addVideo.tpl");
	}
}

?>