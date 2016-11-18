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
					"createdDate" => $content['SEARCHDATE'],
					"keyword" => $content['KEYWORD'],
					"createdById" => $content['SEARCHERID'],
					"searcher" => $content['SEARCHER'],
					"createdByIP" => $content['SEARCHERIP']
					);
	$links = $controller->getSearches(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->logAction(38);
	$controller->exportToExcel($fields,$links,$content['MNSEARCHES']."-".$_POST["createdDate"]."-".$_POST["createdDateTill"]);
	return;
}
?>