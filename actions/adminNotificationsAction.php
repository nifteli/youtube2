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
	
	$db->where("id=1");
	$res = $db->update("notifications",array("middleNote"=>trim($_POST["middleNote"]),
										"rightNote"=>trim($_POST["rightNote"]),
										"siteRules"=>trim($_POST["siteRules"]),
										"aboutUs"=>trim($_POST["aboutUs"]),
										"other"=>trim($_POST["other"])
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