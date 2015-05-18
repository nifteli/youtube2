<?php

class Users
{
	private $users;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->users = new Smarty;
		$this->users->assign("users",$this->getUsers($controller->lang,$controller->db));
	}
	
	public function Show()
	{
		global $templatePath;
		$this->users->display($templatePath."users.tpl");
	}
	
	private function getUsers($lang,$db)
	{
		$qry = "select v.addedById,count(*) videoCount,
				concat(u.firstName,' ',u.lastName) user,concat('?userId=',v.addedById) url,
				CASE WHEN u.picturePath='' THEN './uploads/userPictures/noImage.png' ELSE ifNull(u.picturePath,'./uploads/userPictures/noImage.png') END picPath
				from videos v
				inner join users u on u.id=v.addedById
				where v.isDeleted=0
				group by v.addedById";
		$res = $db->rawQuery($qry);
		return $res;
	}
}

?>