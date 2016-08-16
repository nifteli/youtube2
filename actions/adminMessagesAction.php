<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(69))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array(
					"sentDate" => $content['SENTDATE'],
					"id" => $content['CODE'],
					"subject" => $content['SUBJECT'],
					"body" => $content['MESSAGEBODY'],
					"senderId" => $content['SENDERID'],
					"userName" => $content['SENDERUSERNAME'],
					//"senderName" => $content['SENDERNAME'],
					"senderIP" => $content['SENDERIP'],
					"to" => $content['TO'],
					"attachment" => $content['FILE']
					);
	$links = $controller->getMailInfo(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->logAction(42);
	$controller->exportToExcel($fields,$links,$content['MNMESSAGES']);
	return;
}
?>