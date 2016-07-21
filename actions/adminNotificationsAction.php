<?php

if ($_GET["action"]=="save")
{
	$result="success";
	if(!$access->authorized(45))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	if(trim($_POST["middleNote"]) == "<br>") $_POST["middleNote"]="";
	if(trim($_POST["rightNote"]) == "<br>") $_POST["rightNote"]="";
	if(trim($_POST["siteRules"]) == "<br>") $_POST["siteRules"]="";
	if(trim($_POST["aboutUs"]) == "<br>") $_POST["aboutUs"]="";
	if(trim($_POST["other"]) == "<br>") $_POST["other"]="";
	if(trim($_POST["page1"]) == "<br>") $_POST["page1"]="";
	if(trim($_POST["page2"]) == "<br>") $_POST["page2"]="";
	$db->where("id=1");
	$res = $db->update("notifications",array("middleNote"=>trim($_POST["middleNote"]),
										"rightNote"=>trim($_POST["rightNote"]),
										"siteRules"=>trim($_POST["siteRules"]),
										"aboutUs"=>trim($_POST["aboutUs"]),
										"other"=>trim($_POST["other"]),
										"page1"=>trim($_POST["page1"]),
										"page2"=>trim($_POST["page2"])
									));
	if($res)
		$messages['success'] = $content["SUCCESSFULLYSAVED"];
	else
	{
		$result = "error";
		$messages['success'] = $content["ERRORONSAVE"];
	}
		
}


?>