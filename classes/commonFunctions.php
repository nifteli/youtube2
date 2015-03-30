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
				//$header->assign("detailSearch",$detailSearch);
				$header->display($templatePath."header.tpl");
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
}
?>