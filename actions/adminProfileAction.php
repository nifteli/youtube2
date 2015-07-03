<?php
//echo "<pre>"; print_r($_POST); echo "</pre>";//exit;
if ($_GET["action"]=="save")
{
	$result = "success";
	$messages = array();
	
	if(!isset($_POST["name"]) || $_POST["name"] == "")
	{
		$result = "error";
		$messages["name"] = $content['ADMINPROFILEERR1'];
	}
	
	if(!isset($_POST["email"]) || $_POST["email"] == "")
	{
		$result = "error";
		$messages["email"] = $content['ADMINPROFILEERR2'];
	}
	
	if(!isset($_POST["password"]) || $_POST["password"] == "" || $_POST["passwordAgain"] == "" || !isset($_POST["passwordAgain"]))
	{
		$result = "error";
		$messages["password"] = $content['ADMINPROFILEERR3'];
	}
	
	if($_POST["password"] != $_POST["passwordAgain"])
	{
		$result = "error";
		$messages["notEqPass"] = $content['ADMINPROFILEERR4'];
	}
	
	if(!isset($_POST["bday"]) || $_POST["bday"] != "")
	{
		if($lang == "az" || $lang == "ru")
			$format = "DD.MM.YYYY";
		else
			$format = "MM/DD/YYYY";
		//echo $_POST["bday"]." ".$format;
		if(!validate_Date($_POST["bday"],$format,$date))
		{
			$result = "error";
			$messages["bdayErr"] = $content['ADMINPROFILEERR8'];
		}
		else
			$_POST["bday"] = $date;
		//echo "<br>".$date;
	}
	
	if(isset($_FILES['pic']['name']) && $_FILES['pic']['name'] != "")
	{
		$target_file = $appDirectory .$userPicsPath . basename($_FILES["pic"]["name"]);
		$uploadOk = 1;
		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		
		if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "pjpeg" && $imageFileType != "gif" ) 
		{
			$result = "error";
			$messages["typeErr"] = $content['ADMINPROFILEERR5'];
		}
		
		if ($_FILES["pic"]["size"] > $maxPicSize * 1024 * 1024 && ($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "pjpeg" || $imageFileType == "gif" )) 
		{
			$pathParts = pathinfo($_FILES["pic"]["tmp_name"]);
			
			$filename = compressImage($_FILES["pic"]["tmp_name"], $tmpPath . $pathParts['basename'], $imageQuality); 
			//echo filesize("tmp/" . $pathParts['basename']);
			if (filesize($tmpPath . $pathParts['basename']) < $maxPicSize * 1024 * 1024)
			{
				unlink($_FILES["pic"]["tmp_name"]);
				$_FILES["pic"]["tmp_name"] = $tmpPath . $pathParts['basename'];
				//echo " new path ".$_FILES["pic"]["tmp_name"];
			}
			else
			{
				$result = "error";
				$messages["typeErr"] = $content['ADMINPROFILEERR6'];
			}
		}
	}
	
	if($result == "success")
	{
		$arr = array();
		if (isset($_FILES['pic']['name']) && $_FILES['pic']['name'] != "")
		{
			$saveto = $appDirectory . $userPicsPath . $access->userId.".jpeg";
			copy($_FILES['pic']['tmp_name'], $saveto);
			unlink($_FILES['pic']['tmp_name']);
			$arr["picturePath"] = '.'.$userPicsPath . $access->userId.".jpeg";
			//echo $_FILES['pic']['tmp_name'];
			//echo "<br>to dir".$saveto;
			//echo "ddddddd  ".$_FILES['pic']['tmp_name'].$saveto;
		}
		$gender = "male";
		if($_POST["gender"] == 2)
			$gender = "female";
		$arr["password"] =  md5(trim($_POST["password"])) ;
		if(isset($_POST["name"]) && $_POST["name"] != "")
			$arr["firstName"] =  $_POST["name"] ;
		if(isset($_POST["surname"]) && $_POST["surname"] != "")
			$arr["lastName"] =  $_POST["surname"] ;
		if(isset($_POST["fatherName"]) && $_POST["fatherName"] != "")
			$arr["fatherName"] =  $_POST["fatherName"] ;
		if(isset($_POST["bday"]) && $_POST["bday"] != "")
			$arr["birthDate"] =  $_POST["bday"] ;
		$arr["gender"] = $gender;
		$arr["email"] =  $_POST["email"] ;
		$arr["languageId"] = $langIds[$_POST["lang"]];
		if(isset($_POST["position"]) && $_POST["position"] != "")
			$arr["profession"] =  $_POST["position"] ;
		if(isset($_POST["interests"]) && $_POST["interests"] != "")
		$arr["interests"] =  $_POST["interests"] ;
		if(isset($_POST["phone"]) && $_POST["phone"] != "")
			$arr["phoneNumber"] =  $_POST["phone"] ;
		if(isset($_POST["getEmailOnComment"]) && $_POST["getEmailOnComment"] == "on")
			$arr["getEmailOnVideoComment"] = 1;
		
		$db->where ("id = " . $access->userId);
		$db->update("users", $arr);
		//echo $db->getlastquery();
		if($db->getLastError() != "")
		{
			$result = "error";
			$messages["err"] = $content['ADMINPROFILEERR7'];
		}
	}
	
	if($result=="success")
		$messages["success"] = $content['ADMINPROFILENOTF1'];
}

function compressImage($source_url, $destination_url, $quality) 
{
	$info = getimagesize($source_url); 
	if ($info['mime'] == 'image/jpeg') 
		$image = imagecreatefromjpeg($source_url); 
	elseif ($info['mime'] == 'image/gif') 
		$image = imagecreatefromgif($source_url); 
	elseif ($info['mime'] == 'image/png') 
		$image = imagecreatefrompng($source_url); 
	imagejpeg($image, $destination_url, $quality); 
	return $destination_url; 
} 

function validate_Date($mydate,$format = 'DD-MM-YYYY',&$date) 
{
    if ($format == 'YYYY-MM-DD') list($year, $month, $day) = explode('-', $mydate);
    if ($format == 'YYYY/MM/DD') list($year, $month, $day) = explode('/', $mydate);
    if ($format == 'YYYY.MM.DD') list($year, $month, $day) = explode('.', $mydate);

    if ($format == 'DD-MM-YYYY') list($day, $month, $year) = explode('-', $mydate);
    if ($format == 'DD/MM/YYYY') list($day, $month, $year) = explode('/', $mydate);
    if ($format == 'DD.MM.YYYY') list($day, $month, $year) = explode('.', $mydate);

    if ($format == 'MM-DD-YYYY') list($month, $day, $year) = explode('-', $mydate);
    if ($format == 'MM/DD/YYYY') list($month, $day, $year) = explode('/', $mydate);
    if ($format == 'MM.DD.YYYY') list($month, $day, $year) = explode('.', $mydate);       

    if (is_numeric($year) && is_numeric($month) && is_numeric($day))
        if(checkdate($month,$day,$year))
		{
			$date = $year . '-' . $month . '-' . $day;
			return true;
		}
    return false;           
}      
?>