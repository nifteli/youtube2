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
	//print_r($_POST);
}

function showData($data,$db,$limit)
{
	$lang = $data["lang"];
	$page = $data['page'];
	//print_r($data);
	if(isset($data["catId"]) && $data["catId"]>0)
		$catId = $data["catId"];
	if(isset($data["exCatId"]) && $data["exCatId"]>0)
		$exCatId = $data["exCatId"];
	if(isset($data["q"]) && $data["q"]>0)
		$questions = $data["q"];
	if(isset($data["tagId"]) && $data["tagId"]>0)
		$tagId = $data["tagId"];
	if(isset($data["userId"]) && $data["userId"]>0)
		$userId = $data["userId"];
	if(isset($data["folderId"]) && $data["folderId"]>0)
		$folderId = $data["folderId"];
	$direction = "asc";
	if($data["direction"] == 2)
		$direction = "desc";
	// switch($data["orderBy"])
	// {
		// case 1:
			// $orderBy = " v.added $direction,catName$lang asc ";
			// break;
		// case 2:
			// $orderBy = " v.name $direction,catName$lang asc ";
			// break;
		// case 3:
			// $orderBy = " l.name$lang $direction,catName$lang asc ";
			// break;
		// case 4:
			// $orderBy = " q.question $direction,catName$lang asc ";
			// break;
		// case 5:
			// $orderBy = " catName$lang $direction ";
			// break;
		// case 6:
			// $orderBy = " v.duration $direction,catName$lang asc  ";
			// break;
		// case 7:
			// $orderBy = " viewCount $direction,catName$lang asc  ";
			// break;
		// case 8:
			// $orderBy = " vs.comments $direction,catName$lang asc  ";
			// break;
		// default:
			// $orderBy = " v.added desc,catName$lang asc ";
			// break;
	// }
	
	if($page==1)
		$start = 0;  
	else
		$start = ($page-1)*$limit;
		//echo "<pre>";print_r($data);echo "</pre>";
		//echo "page=$page; limit=$limit; start=$start";
	if(isset($folderId) && is_numeric($folderId))
		$fld .= ",fv.folderId ";
	$qry = "select * from (SELECT vs.views viewCount,
					vs.likes likeCount,
					vs.dislikes dislikeCount,vs.comments,
					v.id, v.name, v.info, v.duration,q.question,
					DATE_FORMAT(v.added,'%d %b %Y') added, v.added addDate,
					v.languageId, v.link, v.addedById,v.questions,
					concat(u.firstName,' ',u.lastName) addedBy,
                    GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
					GROUP_CONCAT(DISTINCT t.id ORDER BY t.name asc) tagIds, 
					vc.categoryId,fv.folderId,
					f.name folderName,
					c.catName$lang
			FROM videos v
            left join vwvideostats vs on v.id = vs.id
			join users u on u.id = v.addedById
			join videocats vc on vc.videoId = v.id
			join categories c on c.id = vc.categoryId
			left join languages l on l.id = v.languageId
            left join videotags vt on vt.videoId=v.id
			left join questions q on q.bitValue=v.questions
            left join tags t on t.id=vt.tagId
			left join foldervideos fv on fv.videoId=v.id
			left join folders f on f.id=fv.folderId
			where v.isDeleted=0 and lower(l.abbr)='$lang'
			group by v.id,vc.categoryId $fld
			order by v.id desc) a where 1=1 ";
	if(isset($catId)&& is_numeric($catId))
		$qry .= " and categoryId=$catId";
	if(isset($exCatId)&& is_numeric($exCatId))
		$qry .= " and categoryId!=$exCatId";
	if(isset($questions)&& is_numeric($questions))
		$qry .= " and questions&$questions";
	if(isset($userId) && is_numeric($userId) && !isset($folderId))
		$qry .= " and addedById=$userId";
	if(isset($folderId) && is_numeric($folderId))
		$qry .= " and folderId=$folderId";
	if(isset($tagId) && is_numeric($tagId))
		$qry .= " and (tagIds like '%,$tagId,%' or tagIds like '$tagId,%' or tagIds like '%,$tagId'  or tagIds ='$tagId')";
	// $qry .= " group by v.id,vc.categoryId
			// order by v.id desc";//echo $qry;
			//limit $start,$limit";
			//echo $qry;
	$res =$db->rawQuery($qry); 
	// echo $db->getLastError();
	// echo "<pre> aaaaa";print_r($res);echo "</pre>";
	if(count($res) == 0)
		return;
	for($i=0; $i<count($res); $i++)
	{
		$res2[$res[$i]["categoryId"]][] = $res[$i];
	}
	
	foreach($res2 as $key=>$value)
	{
		$cnt=0;
		$n++;
		foreach($value as $key1=>$value1)
		{
			if(is_array($value1))
			{
				$cnt++;
				if($cnt <= 8 && $n > ($page - 1)*4 && $n <= $page*4)
					$res3[] = $value1;
			}
		}
	}
	//$data["exCatId"] = $res[$limit-1]["categoryId"];
	//echo "n=$n"."exCatId=".$data["exCatId"];
	displayData($res3, $data);
}
function showAllData($data,$db,$limit)
{
	$lang = $data["lang"];
	$page = $data['page'];
	//print_r($data);
	if(isset($data["catId"]) && $data["catId"]>0)
		$catId = $data["catId"];
	if(isset($data["exCatId"]) && $data["exCatId"]>0)
		$exCatId = $data["exCatId"];
	if(isset($data["q"]) && $data["q"]>0)
		$questions = $data["q"];
	if(isset($data["tagId"]) && $data["tagId"]>0)
		$tagId = $data["tagId"];
	if(isset($data["userId"]) && $data["userId"]>0)
		$userId = $data["userId"];
	if(isset($data["folderId"]) && $data["folderId"]>0)
		$folderId = $data["folderId"];
	$direction = "asc";
	if($data["direction"] == 2)
		$direction = "desc";
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
			$orderBy = " v.added desc,catName$lang asc ";
			break;
	}
	
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
					DATE_FORMAT(v.added,'%d %b %Y') added, v.added addDate,
					v.languageId, v.link, v.addedById,v.questions,
					concat(u.firstName,' ',u.lastName) addedBy,
                    GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
					vc.categoryId,
					f.name folderName,
					c.catName$lang
			FROM videos v
            left join vwvideostats vs on v.id = vs.id
			join users u on u.id = v.addedById
			join videocats vc on vc.videoId = v.id
			join categories c on c.id = vc.categoryId
			left join languages l on l.id = v.languageId
            left join videotags vt on vt.videoId=v.id
			left join questions q on q.bitValue=v.questions
            left join tags t on t.id=vt.tagId
			left join foldervideos fv on fv.videoId=v.id
			left join folders f on f.id=fv.folderId
			where v.isDeleted=0 and lower(l.abbr)='$lang'";
	if(isset($catId)&& is_numeric($catId))
		$qry .= " and vc.categoryId=$catId";
	if(isset($exCatId)&& is_numeric($exCatId))
		$qry .= " and vc.categoryId!=$exCatId";
	if(isset($questions)&& is_numeric($questions))
		$qry .= " and v.questions&$questions";
	if(isset($userId) && is_numeric($userId) && !isset($folderId))
		$qry .= " and v.addedById=$userId";
	if(isset($folderId) && is_numeric($folderId))
		$qry .= " and fv.folderId=$folderId";
	if(isset($tagId) && is_numeric($tagId))
		$qry .= " and vt.tagId=$tagId";
	$qry .= " group by v.id,vc.categoryId
			order by $orderBy
			limit $start,$limit";
	$res =$db->rawQuery($qry); 
	
	
	displayAllData($res, $data);
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
					q.question,f.name folderName,
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
			left join foldervideos fv on fv.videoId=v.id
			left join folders f on f.id=fv.folderId
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
	
	displayAllData($res, $data,5);
}

function showSearchResults($data,$db,$limit)
{
	$lang = $data["lang"];
	$page = $data['page'];
	$orderBy = " a.vadded desc,catName$lang asc ";
	
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
	//print_r($options);echo "<br>";
	switch($data["orderBy"])
	{
		case 1:
			$orderBy = " a.vadded $direction,catName$lang asc ";
			break;
		case 2:
			$orderBy = " a.name $direction,catName$lang asc ";
			break;
		case 3:
			$orderBy = " a.name$lang $direction,catName$lang asc ";
			break;
		case 4:
			$orderBy = " a.question $direction,catName$lang asc ";
			break;
		case 5:
			$orderBy = " catName$lang $direction ";
			break;
		case 6:
			$orderBy = " a.duration $direction,catName$lang asc  ";
			break;
		case 7:
			$orderBy = " viewCount $direction,catName$lang asc  ";
			break;
		case 8:
			$orderBy = " a.comments $direction,catName$lang asc  ";
			break;
		default:
			$orderBy = " a.vadded desc,catName$lang asc ";
			break;
	}
	
	// remove when folders are linked to videos and folder table joined in the query below
	// for($i = 0; $i < count($options); $i++)
	// {
		// if(substr($options[$i], 0, strlen("f.")) == "f.")
			// $options[$i] = "";
	// }
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
		
	$qry = "select * from (SELECT vs.views viewCount,vs.likes likeCount,vs.dislikes dislikeCount,vs.comments,
					v.id, v.name, v.info, v.duration,v.questions,q.question,
					DATE_FORMAT(v.added,'%d %b %Y') added, v.added vadded,
					v.languageId, v.link, v.addedById,
					concat(u.firstName,' ',u.lastName) addedBy,u.id userId,
                    GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
					GROUP_CONCAT(DISTINCT t.id ORDER BY t.name asc) tagIds,
					vc.categoryId,
					l.name$lang,
					c.catName$lang,
					f.name folderName,f.id folderId,
					ct.id commentId,ct.comment
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
			left join foldervideos fv on fv.videoId=v.id
			left join folders f on f.id=fv.folderId
			where v.isDeleted=0 
			group by v.id,vc.categoryId) a 
			where ";
	$qry .= "(";
	//echo "<pre>";print_r($options);echo "</pre>";
	if(count($options) == 0)
	{
		$qry .= createCondition("a.name", $search, "like", true); //" and v.name like '%$search%'";
		$qry .= " or " . createCondition("a.info", $search, "like", true);
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
	if(is_numeric($language))
		$qry .= " and " . createCondition("a.languageId", $language, "=", false);
	if(is_numeric($videoQuestion))
		$qry .= " and " . createCondition("a.questions & ".$videoQuestion, $videoQuestion, "=", false);
	if($category != "0" && is_numeric($category))
		$qry .= " and " . createCondition("a.categoryId", $category, "=", false);
	if($interval != "0")
	{
		if($interval < 5)
			$qry .= " and " . createCondition("a.duration", (($interval - 1) * 15 * 60 + 1) . " and " . ($interval * 15 * 60), "between", false);
		elseif($interval<8)
			$qry .= " and " . createCondition("a.duration", (($interval - 4) * 60 * 60 + 1)  . " and " . (($interval - 3) * 60 * 60), "between", false);
		else
			$qry .= " and " . createCondition("a.duration", ($interval - 4) * 60 * 60 + 1, ">=", false);
	}
	if($fromDate != "" || $toDate != "")
		$qry .= " and " . createCondition("a.vadded", "'$fromDate' and '$toDate 23:59:59'", "between", false);
	
	$qry .= " 
			order by $orderBy
			limit $start,$limit";//echo $qry;
	$res =$db->rawQuery($qry);
	//print_r($res[1]);
	//linkTags($res);
	displayAllData($res, $data);
}

function linkTags(&$res)
{
	for($i=0; $i<count($res); $i++)
	{
		$tags = explode(",",$res[$i]["tags"]);
		$tagIds = explode(",",$res[$i]["tagIds"]);
		$res[$i]["tagsOrg"] = $res[$i]["tags"]; $res[$i]["tags"] = "";
		for($j=0; $j<count($tags); $j++)
		{ 
			$res[$i]["tags"] .= "<a href='index.php?tagId=".$tagIds[$j]."'>".$tags[$j]."</a>, ";
		}
		$res[$i]["tags"] = rtrim($res[$i]["tags"],",");
	}
}

function displayAllData($res, $data, $colCnt=4)
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
			
			if($cnt % $colCnt == 0)
				$str .= "<div class='box-cont'>";
			$cnt++;
			
			$id = $res[$i]['id'];
			$link = getYoutubeImage($res[$i]['link']);
			$info = $res[$i]['info'];
			$name = (mb_strlen($res[$i]['name'],"UTF-8") > 18) ? mb_substr(trim($res[$i]['name']), 0, 18,"UTF-8")."..." : $res[$i]['name'];
			$tags = (mb_strlen($res[$i]['tags'],"UTF-8") > 18) ? mb_substr (trim($res[$i]['tags']), 0, 18,"UTF-8")."..." : $res[$i]['tags'];
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
							<img src=$link width=190 height=100 title='$info'/>
							</div>
						 </a>";
			if(is_numeric($_SESSION["userId"]))
			{
				$str .= "<div class='addVideoBtn' id='$id'>  ";
				if(isAddedToFolder($id))
					$str .= "<a href='#'><img onclick='addRemFromFolder($id,1,0,\"".$res[$i]["folderName"]."\")'  src='img/remove.png' width='15' height='15' title='$content[REMOVEFROMFOLDER]'/></a>";
				else
					$str .= "<a href='#add2FolderModal' onClick=\"submitForm($id)\"><img src='img/add.png' width='15' height='15' title='$content[ADDTOMYFOLDER]'/></a>";
				$str .= "</div>";
			}
						 
						 
			//if(isset($_SESSION["userId"]) && $res[$i]['addedById'] != $_SESSION["userId"])
				//$str .= " style='visibility: hidden;'";
			$str .= "<div class='ico1'>".gmdate('H:i:s',$res[$i]["duration"])."</div>
					<div class='videoName'>
					<a href='?page=watchVideo&id=$id' title='".$res[$i]['name']."'>".trim($name)."</a>
					 </div>
					 <img class='shape' src='img/shape.png' width=170 height=0 alt=''/> </div>
					 <div class='videoDet'>
						<div class='stat1'> 
							<img class='details' width=15 height=10 src='img/tags2.png' title='".$content["HINTTAGS"]."' />
							<span class='wood' title='".$res[$i]['tags']."'>$tags</span>
						</div>	
						<div class='stat2'> 	
								<img width=12 height=10 src='img/question.png' title='".$content["HINTQUESTION"]."' /><span class='views' title='".$content["HINTQUESTION"]."' >" . $res[$i]["question"] . "</span>
								<img width=15 height=10 src='img/eye.png' title='".$content["VIEWCOUNTTITLE"]."' /><span class='views' title='".$content["VIEWCOUNTTITLE"]."' >$viewCount</span>
								<img width=15 height=10 src='img/comments.png' title='".$content["COMMENTCOUNTTITLE"]."' /><span class='views' title='".$content["COMMENTCOUNTTITLE"]."' >" . $res[$i]["comments"] . "</span>
						</div>						 
					 </div>
				</div>";
			if($cnt % $colCnt == 0 || $i + 1 == count($res))
				$str .= "</div>";
		}
		$str.="<input type='hidden' class='nextpage' value='".($page+1)."'><input type='hidden' class='isload' value='true'> 
				<input type='hidden' class='orderBy' value='".$data["orderBy"]."'>"; 
		echo $str;
	}
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
							<h2><a href='?df=1&catId=" . $res[$i]["categoryId"] . "&q=" . $res[$i]["questions"] . "'>".$res[$i]["catName".$lang]."</a>";
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
			$name = (mb_strlen($res[$i]['name'],"UTF-8") > 19) ? mb_substr(trim($res[$i]['name']), 0, 19,"UTF-8")."..." : $res[$i]['name'];
			$tags = (mb_strlen($res[$i]['tags'],"UTF-8") > 19) ? mb_substr (trim($res[$i]['tags']), 0, 19,"UTF-8")."..." : $res[$i]['tags'];
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
							<img src=$link width=190 height=100 title='$info'/>
							</div>
						 </a>";
			if(is_numeric($_SESSION["userId"]))
			{
				$str .= "<div class='addVideoBtn' id='$id'>  ";
				if(isAddedToFolder($id))
					$str .= "<a href='#'><img onclick='addRemFromFolder($id,1,0,\"".$res[$i]["folderName"]."\")' src='img/remove.png' width='15' height='15' title='$content[REMOVEFROMFOLDER]'/></a>";
				else
					$str .= "<a href='#add2FolderModal' onClick=\"submitForm($id)\"><img src='img/add.png' width='15' height='15' title='$content[ADDTOMYFOLDER]'/></a>";
				$str .= "</div>";
			}
						 
						 
			//if(isset($_SESSION["userId"]) && $res[$i]['addedById'] != $_SESSION["userId"])
				//$str .= " style='visibility: hidden;'";
			$str .= "<div class='ico1'>".gmdate('H:i:s',$res[$i]["duration"])."</div>
					<div class='videoName'>
					<a href='?page=watchVideo&id=$id' title='".$res[$i]['name']."'>".trim($name)."</a>
					 </div>
					 <img class='shape' src='img/shape.png' width=170 height=0 alt=''/> </div>
					 <div class='videoDet'>
						<div class='stat1'> 
							<img class='details' width=15 height=10 src='img/tags2.png' title='".$content["HINTTAGS"]."' />
							<span class='wood' title='".$res[$i]['tags']."'>$tags</span>
						</div>	
						<div class='stat2'> 	
								<img width=12 height=10 src='img/question.png' title='".$content["HINTQUESTION"]."' /><span class='views' title='".$content["HINTQUESTION"]."' >" . $res[$i]["question"] . "</span>
								<img width=15 height=10 src='img/eye.png' title='".$content["VIEWCOUNTTITLE"]."' /><span class='views' title='".$content["VIEWCOUNTTITLE"]."' >$viewCount</span>
								<img width=15 height=10 src='img/comments.png' title='".$content["COMMENTCOUNTTITLE"]."' /><span class='views' title='".$content["COMMENTCOUNTTITLE"]."' >" . $res[$i]["comments"] . "</span>
						</div>						 
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
	// $queryString = parse_url($url, PHP_URL_QUERY);
	// parse_str($queryString, $params);
	// $v = $params['v'];  
	//DISPLAY THE IMAGE
	preg_match("#(?<=v=)[a-zA-Z0-9-]+(?=&)|(?<=v\/)[^&\n]+(?=\?)|(?<=v=)[^&\n]+|(?<=youtu.be/)[^&\n]+#", $url, $matches);
	$v = $matches[0]; //print_r($matches);
	return (strlen($v)>0) ? "'http://i3.ytimg.com/vi/$v/default.jpg'" : "";
}

function createCondition($column, $value, $operator, $accentSensitive)
{
	$accent = array("?", "i", "ö", "ü", "ğ", "ç", "s");
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