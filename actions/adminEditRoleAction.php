<?php
//echo "<pre>"; print_r($_POST); echo "</pre>"; //exit;
if ($_GET["action"]=="save")
{
	$result = "success";
	$messages = array();
	
	if(!isset($_POST["roleId"]) || $_POST["roleId"] == "" || $_POST["roleId"] < 1)
	{
		$result = "error";
		$messages["roleIdErr"] = $content['ADMINROLESERR1'];
	}
	
	for($i=0; $i<count($_POST["hasAccess"]); $i++)
	{
		if(!isset($_POST["from"][$_POST["hasAccess"][$i]]) && $_POST["from"][$_POST["hasAccess"][$i]] == "")
		{
			$result = "error";
			$messages["fromErr1"] = $content['FROMERR1'];
			break;
		}
		if(!$controller->validate_Date($_POST["from"][$_POST["hasAccess"][$i]],$format,$dateFrom) ||
			($_POST["to"][$_POST["hasAccess"][$i]] != "" && !$controller->validate_Date($_POST["to"][$_POST["hasAccess"][$i]],$format,$dateTo)))
		{
			$result = "error";
			$messages["notValid"] = $content['VALERROR1'];
			break;
		}
		if($_POST["from"][$_POST["hasAccess"][$i]] > $_POST["to"][$_POST["hasAccess"][$i]] && $_POST["to"][$_POST["hasAccess"][$i]] != "")
		{
			$result = "error";
			$messages["fromErr2"] = $content['FROMERR2'];
			break;
		}
			
	}
	
	if($result == "success")
	{
		$db->startTransaction();
		$db->rawQuery("delete from roleaccess where roleId = $_POST[roleId]");
		
		//echo $db->getLastQuery()."<br>".$db->getLastError();
		
		for($i=0; $i<count($_POST["hasAccess"]); $i++)
		{
			$dateFrom = "";
			$dateTo = "";
			if($controller->validate_Date($_POST["from"][$_POST["hasAccess"][$i]],$format,$dateFrom) && 
			   ((isset($_POST["from"][$_POST["hasAccess"][$i]]) &&  $controller->validate_Date($_POST["to"][$_POST["hasAccess"][$i]],$format,$dateTo)) || 
			   (!isset($_POST["to"][$_POST["hasAccess"][$i]]) || $_POST["to"][$_POST["hasAccess"][$i]] == ""))
			  )
			$db->rawQuery("insert into roleaccess (roleId,accessTypeId,startDate,endDate) values ($_POST[roleId],".$_POST["hasAccess"][$i].",'$dateFrom','$dateTo')");
			//echo $db->getLastQuery()."<br>".$db->getLastError();
		}
		
		if($db->getLastError() != "")
		{
			$db->rollback();
			$result = "error";
			$messages["err"] = $content['ADMINROLESERR2'];
		}
		//else
			//$db->commit();
	} 
	
	if($result=="success")
		$messages["success"] = $content['ADMINROLESNOTF1'];
} 
?>