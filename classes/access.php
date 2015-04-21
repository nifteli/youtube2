<?php
class Access{

	var $userId;
	var $hasAccess=false;
	var $userName;
	//var $userType;
	var $firstName;
	var $lastName;
	var $fatherName;
	var $lang;
	//var $secretQuestion;
	//var $secretAnswer;
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
		if(!isset($_SESSION["userName"]))
		{
			$db->where("status='confirmed' and isDeleted=0 and userName = '$_POST[userName]' and password = '" . md5($_POST["password"]) . "'");
			$result = $db->get("users");
			if($db->count == 1)
			{
				$this->userName=$_SESSION["userName"];
				$this->hasAccess=true;
				$this->userId=$result[0]["id"];
				$this->firstName=$result[0]["firstName"];
				$this->lastName=$result[0]["lastName"];
				$this->fatherName=$result[0]["fatherName"];
				$db->where("id=" . (isset($result[0]["languageId"])?$result[0]["languageId"]:1));
				$result2 = $db->get("languages");//echo $db->getLastQuery(); print_r($result2);
				$this->lang=strtolower($result2[0]["abbr"]);
				//$this->userType=$result[0]["user_type"];
				//$this->secretQuestion=$result[0]["secret_question"];
				//$this->secretAnswer=$result[0]["secret_answer"];
				//$this->phoneCode=$result[0]["sms_code"];
				//$this->isAdmin=$result[0]["isAdmin"];
				
				//echo "<pre>"; print_r($result); echo "</pre>";
			}
		}
		else
		{
			$db->where("status='confirmed' and isDeleted=0 and userName = '$_SESSION[userName]'");
			$result = $db->get("users");
			if($db->count == 1)
			{
				$this->userName=$_SESSION["userName"];
				$this->hasAccess=true;
				$this->userId=$result[0]["id"];
				$this->firstName=$result[0]["firstName"];
				$this->lastName=$result[0]["lastName"];
				$this->fatherName=$result[0]["fatherName"];
				$this->lang=$result[0]["lang"];
			}
		}
	}
	
	public function destroy()
	{
		unset($this->userName);
		$this->hasAccess=false;
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
		if(isset($this->firstName))
			return $this->firstName;
	}
}
?>
