<?php

class Users
{
	private $users;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->users = new Smarty;
		$this->users->assign("users",$this->getUsers($controller->lang,$controller->db));
		$this->users->assign("titleUsers",$content["TITLEUSERS"]);
	}
	
	public function Show()
	{
		global $templatePath;
		$this->users->display($templatePath."users.tpl");
	}
	
	private function getUsers($lang,$db)
	{
		$qry = "select u.id, 
				concat(u.firstName,' ',u.lastName) user,concat('?userId=',u.id) url,
				CASE WHEN u.picturePath='' THEN './uploads/userPictures/noImage.png' ELSE ifNull(u.picturePath,'./uploads/userPictures/noImage.png') END picPath,
				count(v.id) videoCount
				from  users u 
				left join (select * from videos where isDeleted=0) v on v.addedById=u.id
				where u.isDeleted=0 and u.status='confirmed'
				group by u.id";
		$res = $db->rawQuery($qry);
		return $res;
	}
}

?>