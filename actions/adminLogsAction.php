<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(65))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array(
					"actionDate" => $content['ACTIONDATE'],
					"id" => $content['ID'],
					"actionName" => $content['ACTIONNAME'],
					"createdById" => $content['CREATEDBYID'],
					"createdBy" => $content['CREATEDBY'],
					"createdByIP" => $content['CREATEDBYIP']
					);
	$links = $controller->getLogs(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->logAction(51);
	$controller->exportToExcel($fields,$links,$content['MNLOGS']."-".$_POST["actionDate"]."-".$_POST["actionDateTill"]);
	return;
}
?>