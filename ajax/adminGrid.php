<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);

if(isset($_POST['action']) && $_POST['action']!='')
{
	$actionfunction = $_POST['action'];
	call_user_func($actionfunction,$_POST,$db);
}

function loadUsers($data,$db)
{
	$rowCount = $data['rowCount'];
	$start = ($data['current'] - 1) * $rowCount;
	$searchPhrase = $data['searchPhrase'];
	$orderBy = [];
	foreach($data['sort'] as $k => $v)
	{
		$orderBy[] = "$k $v";
	}
	
	$qry = "select created, id, userName from users ";
	$qry .= "order by $orderBy[0] ";
	$qry .= "limit $start, $rowCount";
	
	$res =$db->rawQuery($qry);
	
	displayData($res, $data);
}

function displayData($res, $data)
{
	$resObj['current'] = $data['current'];
	$resObj['rowCount'] = $data['rowCount'];
	$resObj['rows'] = $res;
	$resObj['total'] = 14;
	$jsonRes = json_encode($resObj);
	echo $jsonRes;
}

?>