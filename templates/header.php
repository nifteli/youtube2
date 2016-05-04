<?php

class Header
{
	private $header;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		global $langIds;
		
		$this->header = new Smarty;
		$this->header->assign("search",$content['SEARCH']);
		$this->header->assign("advanced",$content['ADVANCED']);
		$this->header->assign("addVideo",$content['ADDVIDEO']);
		$this->header->assign("userName",$content['USERNAME']);
		$this->header->assign("password",$content['PASSWORD']);
		$this->header->assign("signUp",$content['SIGN_UP']);
		$this->header->assign("users",$content['USERS']);
		$this->header->assign("userCnt",$controller->getCount(1));
		$this->header->assign("tags",$content['TAGS']);
		$this->header->assign("tagCnt",$controller->getCount(2));
		$this->header->assign("videos",$content['VIDEOS']);
		$this->header->assign("videoCnt",$controller->getCount(3));
		$this->header->assign("login",$content['LOGIN']);
		$this->header->assign("forgotPass",$content['FORGOTPASS']);
		$this->header->assign("lang",$controller->lang);
		$this->header->assign("languageVal",$langIds[$controller->lang]);
		$this->header->assign("general",$content['GENERAL']);
		$this->header->assign("favorite",$content['FAVORITE']);
		$this->header->assign("added",$content['ADDEDVIDEOS']);
		$this->header->assign("otherUsers",$content['OTHERUSERS']);
		$this->header->assign("myVideos",$content['MYVIDEOS']);
		$this->header->assign("whoHint",$content['WHOHINT']);
		$this->header->assign("whatHint",$content['WHATHINT']);
		$this->header->assign("whyHint",$content['WHYHINT']);
		$this->header->assign("howHint",$content['HOWHINT']);
		
		
		$this->header->assign("about",$content['ABOUT']);
		$this->header->assign("allLangs",$content['ALLLANGS']);
		$this->header->assign("allCats",$content['ALLCATS']);
		$this->header->assign("all",$content['ALL']);
		$this->header->assign("moreThan4",$content['MORETHAN4']);
		$this->header->assign("lessThan15",$content['LESSTHAN15']);
		$this->header->assign("date",$content['DATE']);
		$this->header->assign("signIn",$content['SIGNIN']);
		$this->header->assign("hour",$content['HOUR']);
		$this->header->assign("minute",$content['MINUTE']);
		$this->header->assign("fromDate",$content['FROMDATE']);
		$this->header->assign("toDate",$content['TODATE']);
		$this->header->assign("profil",$content['PROFILE']);
		$this->header->assign("regOrEnterNote1",$content['REGORENTERNOTE1']);
		$this->header->assign("enterLink",$content['ENTERLINK']);
		$this->header->assign("regOrEnterNote2",$content['REGORENTERNOTE2']);
		$this->header->assign("regLink",$content['REGLINK']);
		$this->header->assign("searchVal",$_POST['search']);
		$this->header->assign("page",isset($_GET['page'])?$_GET['page']:"");
		
		$this->header->assign("randTags",$this->getRandTags($controller->lang,$controller->db));
		
		$this->header->assign("vqHow", $content['HOW']);
		$this->header->assign("vqWhy", $content['WHY']);
		$this->header->assign("vqWho", $content['WHO']);
		$this->header->assign("vqWhat", $content['WHAT']);
		$this->header->assign("languages", $controller->getLanguages());
		$this->header->assign("allCategories", json_encode($controller->getAllCategories()));
		
		$this->header->assign("errorMessage",$errorMessage);
		//print_r($controller->access);
		if(isset($controller->access->userName))
		{
			$this->header->assign("hasAccess",1);
			$this->header->assign("greeting",$content['GREETING']);
			$this->header->assign("adminPanel",$content['ADMINPANEL']);
			$this->header->assign("logout",$content['LOGOUT']);
			$this->header->assign("loggedUser",$controller->access->userName);
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->header->display($templatePath."header.tpl");
	}
	
	private function getRandTags($lang,$db)
	{
		$qry = "SELECT vt.tagId,t.name,count(*) cnt,1 size
				from videotags vt
				inner join tags t on t.id=vt.tagId
				inner join languages l on l.id=t.langId
				where l.abbr='$lang'
				group by vt.tagId,t.name
				ORDER BY t.id * RAND( )
				limit 30";
		$res = $db->rawQuery($qry);
		
		$maxCnt = $this->getMaxCnt($res);

		for($i=0; $i<count($res); $i++)
		{
			if($res[$i]["cnt"] >= $maxCnt - floor($maxCnt*0.1))
				$res[$i]["size"] = 5;
			if($res[$i]["cnt"] < $maxCnt - floor($maxCnt*0.1) && $res[$i]["cnt"] >= floor($maxCnt*0.7))
				$res[$i]["size"] = 4;
			if($res[$i]["cnt"] < floor($maxCnt*0.7) && $res[$i]["cnt"] >= floor($maxCnt*0.5))
				$res[$i]["size"] = 3;
			if($res[$i]["cnt"] < floor($maxCnt*0.5) && $res[$i]["cnt"] >= floor($maxCnt*0.3))
				$res[$i]["size"] = 2;
			if($res[$i]["cnt"] < floor($maxCnt*0.3))
				$res[$i]["size"] = 1;
		}
		
		return $res;
	}
	
	private function getMaxCnt($res)
	{
		$max = 0;
		for($i=0; $i<count($res); $i++)
		{
			if($res[$i]["cnt"] > $max)
				$max = $res[$i]["cnt"];
		}
		return $max;
	}
}

?>