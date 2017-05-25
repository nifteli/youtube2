<?php
//echo "<pre>"; print_r($_POST); echo "</pre>";
if ($_GET["action"]=="save")
{
	$result = "success";
	$messages = array();
	
	if(!isset($_POST["roleId"]) || $_POST["roleId"] == "" )
	{
		$result = "error";
		$messages["roleIdErr"] = $content['ADMINROLESERR1'];
	}
	
	
	if($lang == "az" || $lang == "ru")
		$format = "DD.MM.YYYY";
	else
		$format = "MM/DD/YYYY";
	
	if($result == "success")
	{
		$db->startTransaction();
		$db->rawQuery("delete from roleaccess where roleId = $_POST[roleId]");
		
		for($i=0; $i<count($_POST["hasAccess"]); $i++)
		{
			$dateFrom = "";
			$dateTo = "";
			if(validate_Date($_POST["from"][$i],$format,$dateFrom) && 
			   ((isset($_POST["to"][$i]) && $_POST["to"][$i] != "" &&  validate_Date($_POST["to"][$i],$format,$dateTo)) || (!isset($_POST["to"][$i]) || $_POST["to"][$i] == ""))
			  )
			$db->rawQuery("insert into roleaccess (roleId,accessTypeId,startDate,endDate) values ($_POST[roleId],".$_POST["accessId"][$i].",'$dateFrom','$dateTo')");
		}
		
		if($db->getLastError() != "")
		{
			$db->rollback();
			$result = "error";
			$messages["err"] = $content['ADMINROLESERR2'];
		}
		else
		{
			$db->commit();
			
		}
	} 
	
	if($result=="success")
	{
		$messages["success"] = $content['ADMINROLESNOTF1'];
		$controller->logAction(44);
	}
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

if ($_GET["action"]=="editRole" && is_numeric($_POST["roleId"]) && trim($_POST["roleName"]) != "")
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(37))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".$_POST["roleId"]);
	$res = $db->update("roles",array("name"=>trim($_POST["roleName"])));
	if($res)
	{
		$controller->logAction2(89,"RoleId=".$_POST["roleId"]);
		$messages["success"] = $content["ROLEEDITED"];
	}
	else
	{
		$result = "error";
		$messages["err"] = $content["ROLENOTEDITED"];
		$db->rollback();
	}
}

if ($_GET["action"]=="addNewRole" && $access->hasAccess && trim($_POST["roleName"]) != "" )
{ 
	if(!$access->authorized(36))
	{
		$result = "error";
		$messages["err"] = $content["INSUFFACCESS"];
		return;
	}
	
	$roleId = $db->insert("roles",array("name" => trim($_POST["roleName"]),
									  "created" =>date("Y-m-d H:i:s"),
									  "createdBy" => $access->userId)); 
	if($roleId)
	{
		$okMessage = $content["ROLEADDED"];
		$controller->logAction2(88,"RoleId=".$roleId);
	}
	else
	{
		$messages["err"] = $content["ROLENOTADDED"];
	}
	
}
if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(73))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array("createdDate" => $content['ADDDATE'],
					"id" => $content['ID'],
					"name" => $content['ROLENAME'],
					"author" => $content['AUTHOR']
					);
	$links = $controller->getRoles(1,0,$_POST,$cnt,"","");
	$controller->logAction2(91,"DateInterval=".$_POST["created"]."-".$_POST["createdTill"]);
	$controller->exportToExcel($fields,$links,$content['TITLEROLES']."-".$_POST["created"]."-".$_POST["createdTill"]);
	return;
}

if ($_GET["action"]=="delete" && is_numeric(trim($_GET["id"])))
{ 
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(38))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["id"]));
	$db->delete("roles");
	$messages["success"] = $content["ROLEDELETED"];
	$controller->logAction2(90,"RoleId=".$_GET["id"]);
	
}
?>