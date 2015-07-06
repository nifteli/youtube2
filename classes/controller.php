<?php
//include($langsPath."content_".$lang.".php");
include($templatePath."header.php");
include($templatePath."categories.php");
include($templatePath."videos.php");
include($templatePath."footer.php");
include($templatePath."reg.php");
include($templatePath."addVideo.php");
include($templatePath."users.php");
include($templatePath."watchVideo.php");
include($templatePath."allTags.php");
include($templatePath."forgotPass.php");
include($templatePath."searchResults.php");
include($templatePath."advSearch.php");
//Admin classes
include($templatePath."adminMenu.php");
include($templatePath."adminProfile.php");
include($templatePath."adminFooter.php");
include($templatePath."adminRoles.php");

class Controller //extends MySQL
{
//Variables
	
	public $db;
	public $lang;
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
			case "forgotPass":
				$forgotPass = new ForgotPass($this);
				$forgotPass->Show();
				break;
			case "searchResults":
				$searchResults = new SearchResults($this);
				$searchResults->Show();
				break;
			case "advSearch":
				$advSearch = new AdvSearch($this);
				$advSearch->Show();
				break;
			case "adminMenu":
				$adminMenu = new AdminMenu($this);
				$adminMenu->Show();
				break;
			case "adminProfile":
				$adminProfile = new AdminProfile($this);
				$adminProfile->Show();
				break;
			case "adminFooter":
				$adminFooter = new AdminFooter($this);
				$adminFooter->Show();
				break;
			case "adminRoles":
				$adminRoles = new AdminRoles($this);
				$adminRoles->Show();
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
	
	public function getCount($flag)
	{
		switch ($flag)
		{
			case 1:
				$this->db->where("status='confirmed' and isDeleted=0");
				$this->db->get("users");
				return $this->db->count;
			break;
			case 2:
				$this->db->get("tags");
				return $this->db->count;
			break;
			case 3:
				$this->db->where("isDeleted=0");
				$this->db->get("videos");
				return $this->db->count;
			break;
		}
		return 0;
	}

}
?>