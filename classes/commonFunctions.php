<?php
class CommonFunctions //extends MySQL
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
		include($langsPath."content_".$lang.".php");
		
		
		switch($section)
		{
			case "header":
				$header = new Smarty;
				$header->assign("search",$search);
				$header->assign("addVideo",$addVideo);
				$header->assign("userName",$userName);
				$header->assign("password",$password);
				$header->assign("signUp",$signUp);
				$header->assign("users",$users);
				$header->assign("userCnt",2343);
				$header->assign("tags",$tags);
				$header->assign("tagCnt",12133);
				$header->assign("videos",$videos);
				$header->assign("videoCnt",34234);
				$header->assign("login",$login);				
				$header->display($templatePath."header.tpl");
				break;
			case "categories":
				$categories = new Smarty;
				$categories->assign("how",$how);
				$categories->assign("why",$why);
				$categories->assign("what",$what);
				$categories->assign("who",$who);
				$categories->assign("catsHow",$this->getCategories($lang,1));
				$categories->assign("catsWhy",$this->getCategories($lang,2));
				$categories->assign("catsWhat",$this->getCategories($lang,4));
				$categories->assign("catsWho",$this->getCategories($lang,8));
				$categories->display($templatePath."categories.tpl");
				break;
			case "videos":
				$videos = new Smarty;
				//$videos->assign("detailSearch",$detailSearch);
				$videos->display($templatePath."videos.tpl");
				break;
			case "footer":
				$footer = new Smarty;
				//$header->assign("detailSearch",$detailSearch);
				$footer->display($templatePath."footer.tpl");
				break;
		}
	}
	
	//this will be common function because categories panel are located in all pages
	public function getCategories($lang,$questionId)
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