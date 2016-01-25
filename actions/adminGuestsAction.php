<?php
if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(62))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array("entryDate" => $content['ENTRYDATE'],
					"IP" => $content['IP'],
					"device" => $content['DEVICE'],
					"browser" => $content['BROWSER'],
					"videCntWatched" => $content['VIDEOCNTWATCHED'],
					"videoCntCommented" => $content['VIDEOCNTCOMMENTED'],
					"commentCnt" => $content['COMMENTCNT'],
					"searchCnt" => $content['SEARCHCNT']
					);
	$links = $controller->getGuests(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLEGUESTS']);
	return;
}
?>