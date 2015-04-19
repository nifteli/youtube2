<?php

class AddVideo
{
	private $videos;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->videos = new Smarty;
		$this->videos->assign("videoLink", $content['VIDEOLINK']);
		$this->videos->assign("videoLinkVal", isset($_POST["videoLink"]) ? $_POST["videoLink"] : "");
		$this->videos->assign("language", $content['LANGUAGE']);
		$this->videos->assign("languages", $controller->getLanguages());
		$this->videos->assign("languageVal", isset($_POST["language"]) ? $_POST["language"] : "");
		$this->videos->assign("videoQuestion", $content['VIDEOQUESTION']);
		$this->videos->assign("vqHow", $content['HOW']);
		$this->videos->assign("vqWhy", $content['WHY']);
		$this->videos->assign("vqWho", $content['WHO']);
		$this->videos->assign("vqWhat", $content['WHAT']);
		$this->videos->assign("videoQuestionVal", isset($_POST["videoQuestion"]) ? $_POST["videoQuestion"] : []);
		$this->videos->assign("videoName", $content['VIDEONAME']);
		$this->videos->assign("videoNameVal", isset($_POST["videoName"]) ? $_POST["videoName"] : "");
		$this->videos->assign("information", $content['INFORMATION']);
		$this->videos->assign("informationVal", isset($_POST["information"]) ? $_POST["information"] : "");
		$this->videos->assign("category", $content['CATEGORY']);
		$this->videos->assign("categoryVal", isset($_POST["category"]) ? json_encode($_POST["category"]) : json_encode([]));
		$this->videos->assign("tags", $content['TAGS']);
		$this->videos->assign("tagsVal", isset($_POST["tags"]) ? $_POST["tags"] : "");
		$this->videos->assign("addToMyFolder", $content['ADDTOMYFOLDER']);
		$this->videos->assign("cancel", $content['CANCEL']);
		$this->videos->assign("allCategories", json_encode($controller->getAllCategories()));
		$this->videos->assign("result", $result);
		$this->videos->assign("messages", $messages);
		
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->videos->display($templatePath."addVideo.tpl");
	}
}

?>