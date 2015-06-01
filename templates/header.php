<?php

class Header
{
	private $header;
	
	public function __construct($controller)
	{
		global $content;
		global $errorMessage;
		
		$this->header = new Smarty;
		$this->header->assign("search",$content['SEARCH']);
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
		$this->header->assign("randTags",$this->getRandTags($controller->lang,$controller->db));
		
		$this->header->assign("vqHow", $content['HOW']);
		$this->header->assign("vqWhy", $content['WHY']);
		$this->header->assign("vqWho", $content['WHO']);
		$this->header->assign("vqWhat", $content['WHAT']);
		
		$this->header->assign("errorMessage",$errorMessage);
		//print_r($controller->access);
		if(isset($controller->access->userName))
		{
			$this->header->assign("greeting",$content['GREETING']);
			$this->header->assign("adminPanel",$content['ADMINPANEL']);
			$this->header->assign("logout",$content['LOGOUT']);
			$this->header->assign("loggedUser",$controller->access->firstName);
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
				from videoTags vt
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