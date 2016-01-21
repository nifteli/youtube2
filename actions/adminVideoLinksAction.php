<?php
if ($_GET["action"]=="load" && $_POST["action"] == 'addMany')
{
	$result = "success";
	$messages = array();

	//echo "<pre>"; print_r($data); echo "</pre>";return;
	if(!$access->authorized(13))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$target_file = $appDirectory . $tmpPath . basename($_FILES["data"]["name"]);
	$fileType = pathinfo($target_file,PATHINFO_EXTENSION); //echo $fileType;
	if(!isset($_FILES['data']['name']) || $_FILES['data']['tmp_name'] == "" )
	{
		$result = "error";
		$messages['noFile'] = $content["FILENOTADDED"];
		return;
	}
	if ($fileType != "xls" && $fileType != "xlsx" ) 
	{
		$result = "error";
		$messages['wrongType'] = $content["NOTEXCEL"];
		return;
	}
	
	$saveto = $tmpPath . $access->userId . basename($_FILES["data"]["name"]);
	move_uploaded_file($_FILES["data"]["tmp_name"], $saveto);
			
	//Read spreadsheeet workbook
	try 
	{
		$fileType = PHPExcel_IOFactory::identify($saveto);
		$objReader = PHPExcel_IOFactory::createReader($fileType);
		$objPHPExcel = $objReader->load($saveto);
	} 
	catch(Exception $e){
		die($e->getMessage());
	}
	//Get worksheet dimensions
	$sheet = $objPHPExcel->getSheet(0); 
	$highestRow = $sheet->getHighestRow(); //echo $highestRow;
	$highestColumn = 'G'; 

	//Loop through each row of the worksheet in turn
	for ($row = 4; $row <= $highestRow; $row++)
	{
		$continue = true;
		//  Read a row of data into an array
		$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
		//echo "<pre>"; print_r(trim($rowData[0][0])); echo "</pre>";
		if(trim($rowData[0][0]) != "" || trim($rowData[0][1]) != "" || trim($rowData[0][2]) != "" || trim($rowData[0][5]) != "")
		{
			$linkId = getLinkId(trim($rowData[0][0]));
			if (startsWith(trim($rowData[0][0]), "https://www.youtube.com/watch?"))
			{
				$data = json_decode(file_get_contents("https://www.googleapis.com/youtube/v3/videos?id=$linkId&key=$youtubeKey&fields=items(snippet(description,title),contentDetails(duration))&part=snippet,contentDetails"),true);
				if(trim($rowData[0][3]) == "")
					$rowData[0][3] = $data["items"][0]["snippet"]["title"];
				if(trim($rowData[0][4]) == "")
					$rowData[0][4] = $data["items"][0]["snippet"]["description"];
				$duration = getVideoDuration($data["items"][0]["contentDetails"]["duration"]);
				
				$db->startTransaction();
				$db->rawQuery("insert into videos (link,languageId,questions,name,info,added,addedById,addedByIP,duration)
								select '" .trim($rowData[0][0]) . "', l.id, q.id,'" . 
										   trim($rowData[0][3]) . "','" . 
										   trim($rowData[0][4]) . "','" . date("Y-m-d H:i:s") . "'," . $access->userId . ",'" . $_SERVER["REMOTE_ADDR"] . "'," . $duration .
								" from languages l 
								inner join questions q on q.question = '" . trim($rowData[0][2]) . "'
								where l.abbr = '" . trim($rowData[0][1]) . "'"
							  );
				$videoId = $db->getInsertId(); //echo "<br>videoid = ".$videoId." name".$rowData[0][3];
				if($videoId)
				{
					$db->rawQuery("insert into videoCats (categoryId,videoId)
								  select c.id, $videoId from categories c
								  inner join questions q on q.bitValue & c.questions
								  where catNameAz = '" . trim($rowData[0][5]) . "' and 
								  q.question = '" . trim($rowData[0][2]) . "'
								  ");
					
					if($db->count < 1)
					{
						$continue = false;
						//break;
					}
						//////////////////
					if($continue)
					{
						$tags = explode(",", trim($rowData[0][6]));
						foreach($tags as $tag)
						{
							$db->where("name='" . trim($tag) . "' and langId=" . $langIds[strtolower(trim($rowData[0][1]))]);
							$res = $db->getOne("tags");
							if ($db->count == 1) 
								$id = $res["id"];
							else
								$id = $db->insert("tags", array("name"=>trim($tag),
														"langId"=>$langIds[strtolower(trim($rowData[0][1]))]));
							if($id)
							{
								$id = $db->insert("videotags", array("tagId"=>$id,
													"videoId"=>$videoId));
							}
							
							if(!$id)
							{
								$continue = false;
								//break;
							}
							//echo "<br>lang=".strtolower(trim($rowData[0][1]))." status=".$continue." videotagsid=".$id;
						}
					}
				}
				else
					$continue = false;
				if(!$continue)
				{//echo "rolback";
					$db->rollback();
					$errRows .= $row . ",";
					//$result = "error";
					//$messages["dbError"] = $content['ADDVIDEOERROR8'];
				}
				else
				{
					$db->commit();
					$okRows .= $row . ",";
				}
			}
			else
				$errRows .= $row . ",";
		}
	}
	$errRows = rtrim($errRows, ",");
	$okRows = rtrim($okRows, ",");
	$messages["success"] = $content["LINKSADDED"].":" . $okRows;
	if($errRows != "")
		$messages["success"] .= "<br>".$content["LINKSNOTADDED"].$errRows;
		
	unlink($saveto);
}

if ($_GET["action"]=="load" && $_POST["action"] == 'editMany')
{
	$result = "success";
	$messages = array();

	//echo "<pre>"; print_r($data); echo "</pre>";return;
	if(!$access->authorized(14))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$target_file = $appDirectory . $tmpPath . basename($_FILES["data"]["name"]);
	$fileType = pathinfo($target_file,PATHINFO_EXTENSION); //echo $fileType;
	if(!isset($_FILES['data']['name']) || $_FILES['data']['tmp_name'] == "" )
	{
		$result = "error";
		$messages['noFile'] = $content["FILENOTADDED"];
		return;
	}
	if ($fileType != "xls" && $fileType != "xlsx" ) 
	{
		$result = "error";
		$messages['wrongType'] = $content["NOTEXCEL"];
		return;
	}
	
	$saveto = $tmpPath . $access->userId . basename($_FILES["data"]["name"]);
	move_uploaded_file($_FILES["data"]["tmp_name"], $saveto);
			
	//Read spreadsheeet workbook
	try 
	{
		$fileType = PHPExcel_IOFactory::identify($saveto);
		$objReader = PHPExcel_IOFactory::createReader($fileType);
		$objPHPExcel = $objReader->load($saveto);
	} 
	catch(Exception $e){
		die($e->getMessage());
	}
	//Get worksheet dimensions
	$sheet = $objPHPExcel->getSheet(0); 
	$highestRow = $sheet->getHighestRow(); //echo $highestRow;
	$highestColumn = 'G'; 

	//Loop through each row of the worksheet in turn
	for ($row = 4; $row <= $highestRow; $row++)
	{
		$continue = true;
		//  Read a row of data into an array
		$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
		//echo "<pre>"; print_r(trim($rowData[0][0])); echo "</pre>";
		if(trim($rowData[0][0]) != "")
		{
			if(is_numeric(trim($rowData[0][0])))
			{
				$sql = "update videos set ";
				if(trim($rowData[0][1]) != "" && $langIds[strtolower(trim($rowData[0][1]))] != "")
					$sql .= " languageId=" . $langIds[strtolower(trim($rowData[0][1]))] . ",";
				if(trim($rowData[0][2]) != "")
					$sql .= " questions=(select id from questions where question='" . trim($rowData[0][2]) . "' limit 1),";
				if(trim($rowData[0][3]) != "")
					$sql .= " name='" . trim($rowData[0][3]) . "',";
				if(trim($rowData[0][4]) != "")
					$sql .= " info='" . trim($rowData[0][4]) . "',";
				$sql .= " updated = '" . date("Y-m-d H:i:s") . "', updatedById = " . $access->userId . " where id=" . trim($rowData[0][0]);
				
				$db->startTransaction();
				$db->rawQuery($sql);
				if($db->count > 0)
				{
					if(trim($rowData[0][5]) != "")
					{
						$db->where("videoId=".trim($rowData[0][0]));
						$db->delete("videocats");
						$sql = "insert into videoCats (categoryId,videoId)
								  select c.id, " .trim($rowData[0][0]). " from categories c
								  inner join questions q on q.bitValue & c.questions
								  where catNameAz = '" . trim($rowData[0][5]) . "' and 
								  q.question = ";
						$sql .= (trim($rowData[0][2]) != "") ? "'" . trim($rowData[0][2]) . "'" : 
								"(select question from questions where (select questions from videos where id=" . trim($rowData[0][0]) . ")) ";
						$db->rawQuery($sql);
						//echo $sql;
						if($db->count < 1)
						{
							$continue = false;
							//break;
						}
					}
						//////////////////
					if($continue)
					{
						if(trim($rowData[0][6]) != "")
						{
							$db->where("videoId=".trim($rowData[0][0]));
							$db->delete("videotags");
							
							$tags = explode(",", trim($rowData[0][6]));
							$langId = $langIds[strtolower(trim($rowData[0][1]))];
							if($langId == "")
							{
								$db->where("id=".trim($rowData[0][0]));
								$res = $db->getOne("videos");
								$langId = $res["languageId"];
							}
							foreach($tags as $tag)
							{
								$db->where("name='" . trim($tag) . "' and langId=" . $langId);
								$res = $db->getOne("tags");
								if ($db->count == 1) 
									$id = $res["id"];
								else
									$id = $db->insert("tags", array("name"=>trim($tag),
															"langId"=> $langId)); //echo "<br>".$db->getLastQuery()."id=".$id;
								if($id)
								{
									$id = $db->insert("videotags", array("tagId"=>$id,
														"videoId"=>trim($rowData[0][0])));
								}
								
								if(!$id)
								{
									$continue = false;
									//break;
								}
								//echo "<br>lang=".strtolower(trim($rowData[0][1]))." status=".$continue." videotagsid=".$id;
							}
						}
					}
				}
				else
					$continue = false;
				if(!$continue)
				{//echo "rolback";
					$db->rollback();
					$errRows .= $row . ",";
					//$result = "error";
					//$messages["dbError"] = $content['ADDVIDEOERROR8'];
				}
				else
				{
					$db->commit();
					$okRows .= $row . ",";
				}
			}
			else
				$errRows .= $row . ",";
		}
	}
	$errRows = rtrim($errRows, ",");
	$okRows = rtrim($okRows, ",");
	$messages["success"] = $content["LINKSUPDATED"].":" . $okRows;
	if($errRows != "")
		$messages["success"] .= "<br>".$content["LINKSNOTUPDATED"].$errRows;
		
	unlink($saveto);
}

if ($_GET["action"]=="load" && $_POST["action"] == 'deleteMany')
{
	$result = "success";
	$messages = array();

	//echo "<pre>"; print_r($data); echo "</pre>";return;
	if(!$access->authorized(15))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$target_file = $appDirectory . $tmpPath . basename($_FILES["data"]["name"]);
	$fileType = pathinfo($target_file,PATHINFO_EXTENSION); //echo $fileType;
	if(!isset($_FILES['data']['name']) || $_FILES['data']['tmp_name'] == "" )
	{
		$result = "error";
		$messages['noFile'] = $content["FILENOTADDED"];
		return;
	}
	if ($fileType != "xls" && $fileType != "xlsx" ) 
	{
		$result = "error";
		$messages['wrongType'] = $content["NOTEXCEL"];
		return;
	}
	
	$saveto = $tmpPath . $access->userId . basename($_FILES["data"]["name"]);
	move_uploaded_file($_FILES["data"]["tmp_name"], $saveto);
			
	//Read spreadsheeet workbook
	try 
	{
		$fileType = PHPExcel_IOFactory::identify($saveto);
		$objReader = PHPExcel_IOFactory::createReader($fileType);
		$objPHPExcel = $objReader->load($saveto);
	} 
	catch(Exception $e){
		die($e->getMessage());
	}
	//Get worksheet dimensions
	$sheet = $objPHPExcel->getSheet(0); 
	$highestRow = $sheet->getHighestRow(); //echo $highestRow;
	$highestColumn = 'A'; 

	//Loop through each row of the worksheet in turn
	$in = " in(";
	for ($row = 4; $row <= $highestRow; $row++)
	{
		$rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
		//echo "<pre>"; print_r(trim($rowData[0][0])); echo "</pre>";
		if(trim($rowData[0][0]) != "" && is_numeric(trim($rowData[0][0])))
			$in .= trim($rowData[0][0]).",";
	}
	$in = rtrim($in,",") . ")"; //echo $in;
	$db->startTransaction();
	$db->rawQuery("delete from videos where id $in");
	if($db->count < 1)
	{
		$result = "error";
		$db->rollback();
		$messages["err1"] = $content["ERRORONDELETE"];
		unlink($saveto);
		return;
	}
	$db->rawQuery("delete from videocats where videoId $in");
	if($db->count < 1)
	{
		$result = "error";
		$db->rollback();
		$messages["err1"] = $content["ERRORONDELETE"];
		unlink($saveto);
		return;
	}
	$db->rawQuery("delete from videotags where videoId $in");
	if($db->count < 1)
	{
		$result = "error";
		$db->rollback();
		$messages["err1"] = $content["ERRORONDELETE"];
		unlink($saveto);
		return;
	}
	$messages["success"] = $content["LINKSDELETED"];
	$db->commit();
	unlink($saveto);
}

if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(21))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$fields = array("id" => $content['ID'],
					"name" => $content['VIDEONAME'],
					"info" => $content['INFORMATION'],
					"questions" => $content['VIDEOQUESTION'],
					"added" => $content['ADDDATE'],
					"lang" => $content['LANGUAGE'],
					"link" => $content['VIDEOLINK'],
					"addedBy" => $content['ADDEDBY'],
					"tags" => $content['TAGS'],
					"catName" => $content['CATEGORY'],
					"addedByIP" => $content['ADDEDBYIP'],
					"updated" => $content['UPDATED'],
					"duration" => $content['DURATION'],
					"reportCount" => $content['REPORTCOUNT'],	
					"deleted" => $content['DATEDELETED'],	
					"addedById" => $content['CREATEDBYID'],	
					"updatedById" => $content['UPDATEDBYID'],	
					"deletedById" => $content['DELETEDDBYID'],	
					"views" => $content['VIEWCNT'],	
					"userCntCommented" => $content['USERCNTCOMMENTED'],	
					"comments" => $content['COMMENTCNT'],	
					"tagCount" => $content['TAGCNT'],
					"likes" => $content['LIKESCNT'],
					"dislikes" => $content['DISLIKESCNT'],
					"userReportedCnt" => $content['USERREPORTEDCNT'],
					"userCntAddedToFolder" => $content['USERCNTADDEDTOFOLDER'],
					"addedFolderCnt" => $content['ADDEDFOLDERCNT']
					);
	$links = $controller->getVideoLinks(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['TITLEVIDEOLINKS']);
	return;
}

if ($_GET["action"]=="filter" && $_POST["action"] == 'exportSearches')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(60))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	$fields = array("id" => $content['ID'],
					"keyword" => $content['KEYWORD'],
					"createdById" => $content['CREATEDBYID'],
					"createdByIP" => $content['CREATEDBYIP'],
					"created" => $content['DATECREATED'],
					"searcher" => $content['SEARCHER']
					);
	$links = $controller->getSearches(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$content['SEARCH']);
	return;
}


if ($_GET["action"]=="delete" && is_numeric(trim($_GET["videoId"])))
{
	$result = "success";
	$messages = array();
	
	if(!$access->authorized(9))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	
	$db->where("id=".trim($_GET["videoId"]));
	$db->update("videos",array("isDeleted"=>1,
								"deleted"=>date("Y-m-d H:i:s"),
								"deletedById"=>$access->userId));
	if($db->count>0)
		$messages["success"] = $content["REMOVED"];
}

function getLinkId($link)
{
	$parts = parse_url($link);
	$query = array();
	parse_str($parts['query'], $query);
	return $query['v'];
}

function getVideoDuration($youtube_time)
{
	preg_match_all('/(\d+)/',$youtube_time,$parts);

    // Put in zeros if we have less than 3 numbers.
    if (count($parts[0]) == 1) {
        array_unshift($parts[0], "0", "0");
    } elseif (count($parts[0]) == 2) {
        array_unshift($parts[0], "0");
    }

    $sec_init = $parts[0][2];
    $seconds = $sec_init%60;
    $seconds_overflow = floor($sec_init/60);

    $min_init = $parts[0][1] + $seconds_overflow;
    $minutes = ($min_init)%60;
    $minutes_overflow = floor(($min_init)/60);

    $hours = $parts[0][0] + $minutes_overflow;
	
	return $hours * 3600 + $minutes * 60 + $seconds;
}

function startsWith($haystack, $needle) 
{
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
}
?>