<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);

if(isset($_GET['action']) && $_GET['action']!='')
{
	$actionfunction = $_GET['action'];
	call_user_func($actionfunction,$_POST,$db);
}

function loadUsers($data,$db)
{
	$draw = intval($data['draw']);
	$start = intval($data['start']);
	$length  = intval($data['length']);
	
	/*$start = ($data['current'] - 1) * $rowCount;
	$searchPhrase = $data['searchPhrase'];
	$orderBy = [];
	foreach($data['sort'] as $k => $v)
	{
		$orderBy[] = "$k $v";
	}*/
	
	$qry = "select created, id, userName, concat('row_', id) as DT_RowId from users ";
	//$qry .= "order by $orderBy[0] ";
	$qry .= "limit $start, $length";
	
	$res =$db->rawQuery($qry);
	
	$recordsTotal = 14;
	$recordsFiltered = 14;
	
	displayData($res, $draw, $recordsTotal, $recordsFiltered);
}

function displayData($res, $draw, $recordsTotal, $recordsFiltered)
{
	$resObj['draw'] = $draw;
	$resObj['recordsTotal'] = $recordsTotal;
	$resObj['recordsFiltered'] = $recordsFiltered;
	$resObj['data'] = $res;
	$jsonRes = json_encode($resObj);
	echo $jsonRes;
}

?>