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
?>