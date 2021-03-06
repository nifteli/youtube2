<?php
class Access{

	var $userId;
	var $hasAccess=false;
	var $userName;
	//var $userType;
	var $firstName;
	var $lastName;
	var $fatherName;
	var $picture;
	var $lang;
	var $langId;
	//var $secretQuestion;
	//var $secretAnswer;
	//var $phoneCode;
	var $db;
	var $isAdmin;
	var $auth;
	
	public function Access($db)
	{
		$this->db = $db; 
		$this->setValues($db);
		if($this->hasAccess)
			$this->setAuth($db);
	}
	
	public function setAuth($db)
	{
		$res = $db->rawQuery("SELECT * 
							  FROM roleaccess
							  where roleId=(select roleId from users where id=" . $this->userId . ")
							  order by accessTypeId");
		for($i=0; $i<count($res); $i++)
		{
			$this->auth[$res[$i]["accessTypeId"]] = array("startDate"=>$res[$i]["startDate"],"endDate"=>$res[$i]["endDate"]);
		}
	}
	
	public function authorized($accessId)
	{
		if(count($this->auth) < 1)
			return false;
		if(array_key_exists($accessId,$this->auth))
		{
			if($this->auth[$accessId]["endDate"] == "0000-00-00 00:00:00")
				$this->auth[$accessId]["endDate"] = "9999-01-01 00:00:00";
			if(date("Y-m-d H:i:s")>=$this->auth[$accessId]["startDate"] && date("Y-m-d H:i:s") <= $this->auth[$accessId]["endDate"])
				return true;
		}
		return false;
	}
	
	public function setValues($db)
	{
		if(!isset($_SESSION["userName"]) && isset($_POST["userName"]) && isset($_POST["password"]))
		{
			$db->where("status='confirmed' and isDeleted=0 and userName = '$_POST[userName]' and password = '" . md5($_POST["password"]) . "'");
			$result = $db->get("users");
			if($db->count == 1)
			{
				$_SESSION["userName"] = $result[0]["userName"];
				$_SESSION["userId"] = $result[0]["id"];//echo "session user id=".$_SESSION["userId"];
				$this->userName=$result[0]["userName"];
				$this->hasAccess=true;
				$this->userId=$result[0]["id"];
				$this->firstName=$result[0]["firstName"];
				$this->lastName=$result[0]["lastName"];
				$this->fatherName=$result[0]["fatherName"];
				$this->picture=$result[0]["picturePath"];
				$this->langId=$result[0]["languageId"];
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
				$_SESSION["userId"] = $result[0]["id"];
				$this->hasAccess=true;
				$this->userId=$result[0]["id"]; //echo $_SESSION["userId"];
				$this->firstName=$result[0]["firstName"];
				$this->lastName=$result[0]["lastName"];
				$this->fatherName=$result[0]["fatherName"];
				$this->picture=$result[0]["picturePath"];
				$this->langId=$result[0]["languageId"];
				$db->where("id=" . (isset($result[0]["languageId"])?$result[0]["languageId"]:1));
				$result2 = $db->get("languages");//echo $db->getLastQuery(); print_r($result2);
				$this->lang=strtolower($result2[0]["abbr"]);
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
