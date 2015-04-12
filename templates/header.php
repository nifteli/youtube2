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
		$this->header->assign("userCnt",2343);
		$this->header->assign("tags",$content['TAGS']);
		$this->header->assign("tagCnt",12133);
		$this->header->assign("videos",$content['VIDEOS']);
		$this->header->assign("videoCnt",34234);
		$this->header->assign("login",$content['LOGIN']);
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
}

?>