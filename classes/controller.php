<?php
include($langsPath."content_".$lang.".php");
include("header.php");
include("categories.php");
include("videos.php");
include("footer.php");

class Controller //extends MySQL
{
//Variables
	
	private $db;
	
//End Variables
	
//GetSets
		
//End GetSets
	public function __construct($db) 
	{
		$this->db = $db; 
    }
	
	public function includeSection($section,$lang)
	{
		global $access;
		global $domain;
		global $user;
		global $product;
		global $langsPath;
		global $templatePath;
		global $classesPath;
		global $errorMessage;
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
		}
	}
	
	//this will be common function because categories panel are located in all pages
	public function getCategories($questionId)
	{
		return array(array("url" => "#", "catName" => "Music1","count" => "1896","subscribe"=>"#"),
					array("url" => "#", "catName" => "Hollywood","count" => "196","subscribe"=>"#"),
					array("url" => "#", "catName" => "Funny","count" => "588","subscribe"=>"#"),
					array("url" => "#", "catName" => "Science","count" => "8785","subscribe"=>"#"),
					array("url" => "#", "catName" => "Dance","count" => "85","subscribe"=>"#"),
					array("url" => "#", "catName" => "Sex","count" => "8889998877","subscribe"=>"#"),
					array("url" => "#", "catName" => "Something1","count" => "3","subscribe"=>"#"),
					array("url" => "#", "catName" => "Something2","count" => "5","subscribe"=>"#")
					);
	}
}
?>