<?php
include($langsPath."content_".$lang.".php");
include($templatePath."header.php");
include($templatePath."categories.php");
include($templatePath."videos.php");
include($templatePath."footer.php");
include($templatePath."reg.php");
include($templatePath."addVideo.php");

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
			case "addVideo":
				$addVideo = new AddVideo($this);
				$addVideo->Show();
				break;
		}
	}
	
	//this will be common function because categories panel are located in all pages
	public function getCategories($questionId)
	{
		$this->db->join("(SELECT categoryId, COUNT(*) AS count
						  FROM videos
						  GROUP BY categoryId) AS v", "v.categoryId=c.id", "LEFT");
		$this->db->where("questions", $questionId);
		$this->db->groupBy("c.id,catName".$this->lang.",catInfo".$this->lang);
		$this->db->orderBy("catName".$this->lang,"asc");
		$cats = $this->db->get("categories c",null,"c.id,'#' as url,catName".$this->lang." as catName,catInfo".$this->lang." as catInfo,'#' as subscribe,IfNULL(v.count,0) AS count");
		//echo $this->db->getLastQuery ()."<br>";
		return $cats;
	}
}
?>