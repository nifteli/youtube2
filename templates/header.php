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
		$this->header->assign("addVideo",$content['ADD_VIDEO']);
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
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->header->display($templatePath."header.tpl");
	}
}

?>