<?php
class Access{

	var $userId;
	var $hasAccess=false;
	var $userName;
	//var $userType;
	var $name;
	var $surname;
	var $secretQuestion;
	var $secretAnswer;
	//var $phoneCode;
	var $db;
	var $isAdmin;
	
	public function Access($db)
	{
		$this->setValues($db);
		$this->db = $db; 
	}
	
	public function setValues($db)
	{
		//echo "username = ".$_SESSION["userName"];
		if(isset($_SESSION["userName"]))
		{
			/*$result = $db->select("users",array("user_name"=>$_SESSION["userName"],"status"=>"confirmed"),"","0,1",false,"and","*");
			//echo $db->lastQuery;
			if($result!=false)
			{
				$this->userName=$_SESSION["userName"];
				$this->hasAccess=true;
				$this->userType=$result[0]["user_type"];
				$this->userId=$result[0]["user_id"];
				$this->name=$result[0]["name"];
				$this->surname=$result[0]["surname"];
				$this->secretQuestion=$result[0]["secret_question"];
				$this->secretAnswer=$result[0]["secret_answer"];
				$this->phoneCode=$result[0]["sms_code"];
				$this->isAdmin=$result[0]["isAdmin"];
				
				//echo "<pre>"; print_r($result); echo "</pre>";
			}*/
		}
	}
	
	public function destroy()
	{
		/*unset($this->userName);
		$this->hasAccess=false;
		unset($this->userType);
		unset($this->userId);
		unset($this->name);
		unset($this->surname);*/
	}
	
	public function hasAccess() 
	{
		return $this->hasAccess;
	}
	
	public function hasAdminAccess() 
	{
		if($this->isAdmin)
			return true;
		return false;
	}
	
	public function getGreeting()
	{
		if(isset($this->name))
			return $this->name;
	}
}
?>
