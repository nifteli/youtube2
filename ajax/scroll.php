<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$lang = $_SESSION["lang"];
if(isset($_SESSION["userId"]))
	require_once($langsPath."content_".$lang.".php");
$db = new MysqliDb($hostname, $username, $password, $database);

if(isset($_POST['actionfunction']) && $_POST['actionfunction']!='' && $_POST['lang']!='')
{
	$actionfunction = $_POST['actionfunction'];
	call_user_func($actionfunction,$_POST,$db,$limit);
}

function showData($data,$db,$limit)
{
	$lang = $data["lang"];
	$page = $data['page'];
	if(isset($data["catId"]) && $data["catId"]>0)
		$catId = $data["catId"];
	if(isset($data["tagId"]) && $data["tagId"]>0)
		$tagId = $data["tagId"];
	if(isset($data["userId"]) && $data["userId"]>0)
		$userId = $data["userId"];
	if(isset($data["folderId"]) && $data["folderId"]>0)
		$folderId = $data["folderId"];
	if($page==1)
		$start = 0;  
	else
		$start = ($page-1)*$limit;
		//echo "<pre>";print_r($data);echo "</pre>";
		//echo "page=$page; limit=$limit; start=$start";
		
	$qry = "SELECT vs.views viewCount,
					vs.likes likeCount,
					vs.dislikes dislikeCount,vs.comments,
					v.id, v.name, v.info, v.duration,q.question,
					DATE_FORMAT(v.added,'%d %b %Y') added, 
					v.languageId, v.link, v.addedById,
					concat(u.firstName,' ',u.lastName) addedBy,
                    GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
					vc.categoryId,
					c.catName$lang
			FROM videos v
            left join vwvideostats vs on v.id = vs.id
			join users u on u.id = v.addedById
			join videocats vc on vc.videoId = v.id
			join categories c on c.id = vc.categoryId
			left join languages l on l.id = v.languageId
            left join videotags vt on vt.videoId=v.id
			left join questions q on q.id&v.questions
            left join tags t on t.id=vt.tagId
			left join foldervideos fv on fv.videoId=v.id
			where v.isDeleted=0 and lower(l.abbr)='$lang'";
	if(isset($catId)&& is_numeric($catId))
		$qry .= " and vc.categoryId=$catId";
	if(isset($userId) && is_numeric($userId) && !isset($folderId))
		$qry .= " and v.addedById=$userId";
	if(isset($folderId) && is_numeric($folderId))
		$qry .= " and fv.folderId=$folderId";
	if(isset($tagId) && is_numeric($tagId))
		$qry .= " and vt.tagId=$tagId";
	$qry .= " group by v.id,vc.categoryId
			order by v.added desc,catName$lang asc
			limit $start,$limit";//echo $qry;
	$res =$db->rawQuery($qry); 
	
	displayData($res, $data);
}

function showRecommended($data,$db,$limit)
{
	 //echo "<pre>";print_r($data);echo "</pre>";
	$lang = $data["lang"];
	$page = $data['page'];
	if(isset($data["catId"]) && $data["catId"]>0)
		$catId = $data["catId"];
	if(isset($data["tags"]) && $data["tags"] != "")
	{
		if (strpos($data["tags"],',') === false)
			$tagArr[0] = $data["tags"];
		else
			$tagArr = explode(",",$data["tags"]);
	}
	if($page==1)
		$start = 0;  
	else
		$start = ($page-1)*$limit;
		
	$qry = "Select * from (
			SELECT l.abbr, vs.views viewCount, vs.likes likeCount, vs.dislikes dislikeCount, v.id, v.name, v.info, v.duration,vs.comments,
					DATE_FORMAT(v.added,'%d %b %Y') added, v.languageId, v.link, v.addedById, concat(u.firstName,' ',u.lastName) addedBy, 
					q.question,
					GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags, vc.categoryId, c.catNameaz 
			FROM videos v 
			left join vwvideostats vs on v.id = vs.id 
			join users u on u.id = v.addedById 
			join videocats vc on vc.videoId = v.id 
			join categories c on c.id = vc.categoryId 
			left join languages l on l.id = v.languageId 
			left join videotags vt on vt.videoId=v.id 
			left join questions q on q.id&v.questions
			left join tags t on t.id=vt.tagId 
			where v.link!=(select link from videos where id=$data[videoId]) and v.isDeleted=0
			group by v.id,vc.categoryId ) a";
	if(isset($catId))
		$qry .= " where a.id !=".$data["videoId"]." and lower(a.abbr)='az' and (a.categoryId=$catId ";
	if(count($tagArr) > 0)
	{
		for ($i=0; $i<count($tagArr); $i++)
			$qry .= " or tags like '%" . $tagArr[$i] . "%'";
	}
	$qry .= " ) order by a.added desc,a.catNameaz asc 
			limit $start,$limit";//echo $qry;
		//echo $qry ;
	$res =$db->rawQuery($qry); 
	
	displayData($res, $data,5);
}

function showSearchResults($data,$db,$limit)
{
	$lang = $data["lang"];
	$page = $data['page'];
	$orderBy = " v.added desc,catName$lang asc ";
	
	$search = $data["search"];
	$language = $data["language"];
	$videoQuestion = $data["videoQuestion"];
	$category = $data["category"];
	$time = $data["time"];
	$interval = $data["interval"];
	$options = explode(",", $data["options"]);
	$direction = "asc";
	if($data["direction"] == 2)
		$direction = "desc";
	//print_r($data);echo "<br>";
	switch($data["orderBy"])
	{
		case 1:
			$orderBy = " v.added $direction,catName$lang asc ";
			break;
		case 2:
			$orderBy = " v.name $direction,catName$lang asc ";
			break;
		case 3:
			$orderBy = " l.name$lang $direction,catName$lang asc ";
			break;
		case 4:
			$orderBy = " q.question $direction,catName$lang asc ";
			break;
		case 5:
			$orderBy = " catName$lang $direction ";
			break;
		case 6:
			$orderBy = " v.duration $direction,catName$lang asc  ";
			break;
		case 7:
			$orderBy = " viewCount $direction,catName$lang asc  ";
			break;
		case 8:
			$orderBy = " vs.comments $direction,catName$lang asc  ";
			break;
		default:
			$orderBy = " v.added $direction,catName$lang asc ";
			break;
	}
	
	// remove when folders are linked to videos and folder table joined in the query below
	for($i = 0; $i < count($options); $i++)
	{
		if(substr($options[$i], 0, strlen("f.")) == "f.")
			$options[$i] = "";
	}
	$options = array_filter($options);
	//
	
	// format dates
	$fromDate = "0001-01-01";
	$toDate = "9999-12-31";
	$dtSeparator = ".";
	if($lang == "en")
		$dtSeparator = "/";
	$fromEx = explode($dtSeparator, $data["fromDate"]);
	$toEx = explode($dtSeparator, $data["toDate"]);
	if($lang == "en")
	{
		if($data["fromDate"] != "")
			$fromDate = $fromEx[2] . "-" . $fromEx[0] . "-" . $fromEx[1];
		if($data["toDate"] != "")
			$toDate = $toEx[2] . "-" . $toEx[0] . "-" . $toEx[1];
	}
	else
	{
		if($data["fromDate"] != "")
			$fromDate = $fromEx[2] . "-" . $fromEx[1] . "-" . $fromEx[0];
		if($data["toDate"] != "")
			$toDate = $toEx[2] . "-" . $toEx[1] . "-" . $toEx[0];
	}
	
	if($page==1)
		$start = 0;  
	else
		$start = ($page-1)*$limit;
		
	$qry = "SELECT vs.views viewCount,vs.likes likeCount,vs.dislikes dislikeCount,vs.comments,
					v.id, v.name, v.info, v.duration,v.questions,q.question,
					DATE_FORMAT(v.added,'%d %b %Y') added, 
					v.languageId, v.link, v.addedById,
					concat(u.firstName,' ',u.lastName) addedBy,
                    GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
					vc.categoryId,
					l.name$lang,
					c.catName$lang
			FROM videos v
            left join vwvideostats vs on v.id = vs.id
			join users u on u.id = v.addedById
			join videocats vc on vc.videoId = v.id
			join categories c on c.id = vc.categoryId
			left join languages l on l.id = v.languageId
            left join videotags vt on vt.videoId=v.id
			left join questions q on q.id&v.questions
            left join tags t on t.id=vt.tagId
            left join comments ct on ct.videoId=v.id
			where v.isDeleted=0 and ";
	$qry .= "(";
	
	if(count($options) == 0)
	{
		$qry .= createCondition("v.name", $search, "like", true); //" and v.name like '%$search%'";
		$qry .= " or " . createCondition("v.info", $search, "like", true);
	}
	else
	{
		$preCond = "";
		foreach($options as $option)
		{
			if(substr($option, -strlen("id")) == "id")			
				$qry .= $preCond . createCondition($option, "'$search'", "=", false);
			else
				$qry .= $preCond . createCondition($option, $search, "like", true);
			$preCond = " or ";
		}
	}
	
	$qry .= ")";
	if($language != "0")
		$qry .= " and " . createCondition("v.languageId", $language, "=", false);
	if($videoQuestion != "0")
		$qry .= " and " . createCondition("v.questions & ".$videoQuestion, $videoQuestion, "=", false);
	if($category != "0")
		$qry .= " and " . createCondition("c.id", $category, "=", false);
	if($interval != "0")
	{
		if($time == "1")
		{
			if($interval < 4)
				$qry .= " and " . createCondition("v.duration", ($interval * 60 * 60 + 1)  . " and " . (($interval + 1) * 60 * 60), "between", false);
			else
				$qry .= " and " . createCondition("v.duration", $interval * 60 * 60 + 1, ">=", false);
		}
		else
			$qry .= " and " . createCondition("v.duration", (($interval - 1) * 15 * 60 + 1) . " and " . ($interval * 15 * 60), "between", false);
	}
	if($fromDate != "" || $toDate != "")
		$qry .= " and " . createCondition("v.added", "'$fromDate' and '$toDate'", "between", false);
	
	$qry .= " group by v.id,vc.categoryId
			order by $orderBy
			limit $start,$limit";//echo $qry;
	$res =$db->rawQuery($qry);
	
	displayData($res, $data);
}

function displayData($res, $data, $colCnt=4)
{
	$lang = $data["lang"];
	$page = $data['page'];
	global $content;
	global $db;
	
	if(count($res)>0)
	{
		$cat="";
		$str="";
		$cnt = 0;
		for($i=0; $i<count($res); $i++)
		{
			if($cat != $res[$i]["catName".$lang])
			{
				$str .= "<div class='hollywd'>
							<h2>".$res[$i]["catName".$lang];
				if(isset($_SESSION["userId"]))
				{
					$subscribed = isSubscribed($res[$i]["categoryId"]);
					$subsCnt = $db->rawQuery("select count(*) cnt from subscriptions where catId=".$res[$i]["categoryId"]);
					
					if($subscribed)
						$str .= " <span style='float: right;' id='subs".$res[$i]["categoryId"]."'><a class='subscription'  id='".$res[$i]["categoryId"].":0'> [$content[UNSUBSCRIBE]]</a> (".$subsCnt[0]["cnt"].")</span>";
					else
						$str .= " <span style='float: right;' id='subs".$res[$i]["categoryId"]."'><a class='subscription' id='".$res[$i]["categoryId"].":1'> [$content[SUBSCRIBE]]</a> (".$subsCnt[0]["cnt"].")</span>";
				}
				$str .= "</h2></div>";
				$cat = $res[$i]["catName".$lang];
				$cnt = 0;
			}
			if($cnt % $colCnt == 0)
				$str .= "<div class='box-cont'>";
			$cnt++;
			
			$id = $res[$i]['id'];
			$link = getYoutubeImage($res[$i]['link']);
			$info = $res[$i]['info'];
			$name = (mb_strlen($res[$i]['name'],"UTF-8") > 18) ? mb_substr(trim($res[$i]['name']), 0, 14,"UTF-8")."..." : $res[$i]['name'];
			$tags = (mb_strlen($res[$i]['tags'],"UTF-8") > 17) ? mb_substr (trim($res[$i]['tags']), 0, 14,"UTF-8")."..." : $res[$i]['tags'];
			$viewCount = $res[$i]['viewCount'];
			$addedDate = $res[$i]['added'];
			$addedBy = (mb_strlen($res[$i]['addedBy'],"UTF-8") > 17) ? mb_substr (trim($res[$i]['addedBy']), 0, 14)."..." : $res[$i]['addedBy'];
			$likes = $res[$i]['likeCount'];
			$dislikes = $res[$i]['dislikeCount'];
			//echo "<br><br><br><br><br>added=".$res[$i]['addedById'] ."sessionid=". $_SESSION["userId"];
			$str .= "<div class='box'>
						 <a href='?page=watchVideo&id=$id'>
							<div style='text-align: center'>
							<div class='videoImage'>
							<img src=$link width=170 height=90 title='$info'/>
							</div>
						 </a>";
			if(is_numeric($_SESSION["userId"]))
			{
				$str .= "<div class='addVideoBtn'>";
				if(isAddedToFolder($id))
					$str .= "<a href='?page=watchVideo&id=$id&action=delFromFolder&from=main'><img src='img/remove.png' width='15' height='15' title='$content[REMOVEFROMFOLDER]'/></a>";
				else
					$str .= "<a href='#add2FolderModal' onClick=\"submitForm('?page=watchVideo&id=$id&action=add2Folder&from=main')\"><img src='img/add.png' width='15' height='15' title='$content[ADDTOMYFOLDER]'/></a>";
				$str .= "</div>";
			}
						 
						 
			//if(isset($_SESSION["userId"]) && $res[$i]['addedById'] != $_SESSION["userId"])
				//$str .= " style='visibility: hidden;'";
			$str .= "<div class='ico1'>".gmdate('H:i:s',$res[$i]["duration"])."</div>
					<div class='videoName'>
					<a href='?page=watchVideo&id=$id' title='".$res[$i]['name']."'>".trim($name)."</a>
					 </div>
					 <img class='shape' src='img/shape.png' width=170 height=1 alt=''/> </div>
					 <div class='videoDet'>
						 <ul class='move'>
							<li>
								<img width=12 height=10 src='img/question.png'/><span class='views'>" . $res[$i]["question"] . "</span>
								<img width=15 height=10 src='img/eye.png'/><span class='views'>$viewCount</span>
								<img width=15 height=10 src='img/comments.png'/><span class='views'>" . $res[$i]["comments"] . "</span>
							</li>
							<li>
								<img class='details' width=15 height=10 src='img/tags2.png'/>
								<span class='wood'>$tags</span>
							</li>
							
						 </ul>
					 </div>
				</div>";
			if($cnt % $colCnt == 0 || $i + 1 == count($res) || $cat != $res[$i + 1]["catName".$lang])
				$str .= "</div>";
		}
		$str.="<input type='hidden' class='nextpage' value='".($page+1)."'><input type='hidden' class='isload' value='true'> 
				<input type='hidden' class='orderBy' value='".$data["orderBy"]."'>";
		echo $str;
	}
}

function getYoutubeImage($url)
{
	$queryString = parse_url($url, PHP_URL_QUERY);
	parse_str($queryString, $params);
	$v = $params['v'];  
	//DISPLAY THE IMAGE
	return (strlen($v)>0) ? "'http://i3.ytimg.com/vi/$v/default.jpg'" : "";
}

function createCondition($column, $value, $operator, $accentSensitive)
{
	$accent = array("ə", "ı", "ö", "ü", "ğ", "ç", "ş");
	$replace = array("e", "i", "o", "u", "g", "c", "s");
	
	$str = "";
	if(!$accentSensitive)
	{
		$str .= "$column $operator ";
		if($operator == "like") 
			$str .= "'%$value%'";
		else
			$str .= $value;
	}
	else
	{
		$value = str_replace($accent, $replace, mb_strtolower($value, 'UTF-8'));
		$replaceStr = "###";
		for($i = 0; $i < count($accent); $i++)
			$replaceStr = str_replace("###", "REPLACE(###, '" . $accent[$i] . "', '" . $replace[$i] . "')", $replaceStr);
		$replaceStr = str_replace("###", "LOWER($column)", $replaceStr);
		$str .= "$replaceStr $operator ";
		if($operator == "like") 
			$str .= "'%$value%'";
		else
			$str .= "'$value'";
	}
	
	return $str;
}

function isSubscribed($catId)
{
	global $db;
	$db->where("catId=$catId and userId=".$_SESSION["userId"]);
	$db->get("subscriptions");
	if($db->count>0)
		return true;
	return false;
}

function isAddedToFolder($videoId)
{
	global $db;
	$qry = "select * from foldervideos fv
			inner join folders f on f.id = fv.folderId
			where fv.videoId = $videoId and f.createdById=".$_SESSION["userId"];
	$res = $db->rawQuery($qry);//echo "ssss=".$db->count;
	if ($db->count>0)
		return 1;
	return 0;
}

?>