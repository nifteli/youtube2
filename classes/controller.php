<?php
include($langsPath."content_".$lang.".php");
include($templatePath."header.php");
include($templatePath."categories.php");
include($templatePath."videos.php");
include($templatePath."footer.php");
include($templatePath."reg.php");
include($templatePath."addVideo.php");
include($templatePath."users.php");
include($templatePath."watchVideo.php");
include($templatePath."allTags.php");

class Controller //extends MySQL
{
//Variables
	
	private $db;
	private $lang;
	public $access;
	
//End Variables
	
//GetSets
		
//End GetSets
	public function __construct($db) 
	{
		global $lang;
		global $access;
		
		$this->access=$access;
		$this->db = $db; 
		$this->lang=$lang;
		//print_r($access);
    }
	
	public function includeSection($section)
	{
		global $domain;
		global $user;
		global $product;
		global $langsPath;
		global $templatePath;
		global $classesPath;
		
		global $okMessage;
		global $sessionId;
		
		
		switch($section)
		{
			case "header":
				$header = new Header($this);
				$header->Show();
				break;
			case "categories":
				$categories = new Categories($this);
				$categories->Show();
				break;
			case "videos":
				$videos = new Videos($this);
				$videos->Show();
				break;
			case "footer":
				$footer = new Footer($this);
				$footer->Show();
				break;
			case "reg":
				$reg = new Reg($this);
				$reg->Show();
				break;
			case "users":
				$users = new Users($this);
				$users->Show();
				break;
			case "allTags":
				$allTags = new AllTags($this);
				$allTags->Show();
				break;
			case "watchVideo":
				$watchVideo = new WatchVideo($this);
				$watchVideo->Show();
				break;
			case "addVideo":
				$addVideo = new AddVideo($this);
				$addVideo->Show();
				break;
		}
	}
	
	//this will be common function because categories panel are located in all pages
	public function getCategories($questions)
	{
		$this->db->join("videocats vc", "c.id = vc.categoryId", "LEFT");
		$this->db->join("videos v", "v.id = vc.videoId", "LEFT");
		$this->db->where("c.questions", $questions, "&");
		$this->db->groupBy("c.id");
		$this->db->orderBy("c.catName".$this->lang,"asc");
		$cats = $this->db->get("categories c",null,"c.id, '#' as url, c.catName".$this->lang." as catName, c.catInfo".$this->lang." as catInfo, '#' as subscribe, IfNULL(count(vc.categoryid), 0) AS count");
		return $cats;
	}
	
	public function getAllCategories()
	{
		return $this->db->get("categories", null, "id, questions, catName".$this->lang." as catName");
	}
	
	public function getLanguages()
	{
		return $this->db->get("languages", null, "id, name".$this->lang." as name");
	}
}
?>