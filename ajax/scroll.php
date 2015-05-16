<?php
require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);

if(isset($_REQUEST['actionfunction']) && $_REQUEST['actionfunction']!='' && $_REQUEST['lang']!='')
{
	$actionfunction = $_REQUEST['actionfunction'];
	call_user_func($actionfunction,$_REQUEST,$db,$limit);
}

function showData($data,$db,$limit)
{
	$lang = $data["lang"];
	$page = $data['page'];
	if(isset($data["catId"]) && $data["catId"]>0)
		$catId = $data["catId"];
	if($page==1)
		$start = 0;  
	else
		$start = ($page-1)*$limit;
		//echo "<pre>";print_r($data);echo "</pre>";
		//echo "page=$page; limit=$limit; start=$start";
		
	$qry = "SELECT count(vv.action) viewCount,
					SUM(IF(action = 1, 1, 0)) likeCount,
					SUM(IF(action = -1, 1, 0)) dislikeCount,
					v.id,v.name,v.info,v.duration,DATE_FORMAT(v.added,'%d %b %Y') added,v.languageId,v.link,
					concat(u.firstName,' ',u.lastName) addedBy,
					tg.tags,
					vc.categoryId,
					c.catName$lang
			FROM videoViews vv
			right join videos v on v.id=vv.videoId
			inner join users u on u.id=v.addedById
			inner join videocats vc on vc.videoId=v.id
			inner join categories c on c.id = vc.categoryId
			left join languages l on l.id=v.languageId
			left join (
				select videoId,GROUP_CONCAT(' ', (select DISTINCT t.name ORDER BY t.name)) AS tags
				from videoTags vt
				inner join tags t on t.id=vt.tagId
				group by vt.videoId
			) tg on tg.videoId=v.id
			where lower(l.abbr)='$lang'";
	if(isset($catId))
		$qry .= " and vc.categoryId=$catId";
	$qry .= " group by v.id,vc.categoryId
			order by catName$lang asc,v.added desc 
			limit $start,$limit";//echo $qry;
	$res =$db->rawQuery($qry);
	
	if($db->count>0)
	{
		$cat="";
		$str="";
		$cnt = 0;
		for($i=0; $i<$db->count; $i++)
		{
			if($cat != $res[$i]["catName".$lang])
			{
				$str .= "<div class='hollywd'>
							<h2>".$res[$i]["catName".$lang]."</h2>  
						</div>";
				$cat = $res[$i]["catName".$lang];
				$cnt = 0;
			}
			if($cnt % 4 == 0)
				$str .= "<div class='box-cont'>";
			$cnt++;
			
			$id = $res[$i]['id'];
			$link = getYoutubeImage($res[$i]['link']);
			$info = $res[$i]['info'];
			$name = (strlen($res[$i]['name']) > 18) ? substr(trim($res[$i]['name']), 0, 15)."..." : $res[$i]['name'];
			$tags = (strlen($res[$i]['tags']) > 17) ? substr(trim($res[$i]['tags']), 0, 14)."..." : $res[$i]['tags'];
			$viewCount = $res[$i]['viewCount'];
			$addedDate = $res[$i]['added'];
			$addedBy = (strlen($res[$i]['addedBy']) > 17) ? substr(trim($res[$i]['addedBy']), 0, 14)."..." : $res[$i]['addedBy'];
			$likes = $res[$i]['likeCount'];
			$dislikes = $res[$i]['dislikeCount'];
			
			$str .= "<div class='box'>
						 <a href='?page=watchVideo&id=$id'>
							<img src=$link width=152 height=79 alt='$info'/>
						 </a>
						 <a href='#'><img class='ico1' src='img/add-to-f.png' width=24 height=24 alt=''/></a>
						 <a href='#'><img class='ico2' src='img/edit-02.png' width=24 height=24 alt=''/></a>
						 <a href='?page=watchVideo?id=$id'>
						 	<h2>$name</h2>
						 </a>
						 <img class='shape' src='img/shape.png' width=140 height=1 alt=''/> 
						 <ul class='move'>
						 	<li>
						 		<img class='details' src='img/02.png'/>
						 		<span class='wood'>$tags</span>
						 	</li>
							<li>
								<img class='details2' src='img/eye.png'/><span class='views'>$viewCount</span>
							</li>
							<li>
								<img class='details3' src='img/publish.png' /><span class='date'>$addedDate</span>
							</li>
							<li>
								<img class='details4' src='img/user1.png'/>
								<span class='smith'>$addedBy</span>
							</li>
							<li class='likes'>
								<a href='?page=like&type=1'>
									<img src='img/like-01.png'/>
								</a>
								<p>$likes</p>
							</li>
							<li class='likes2'>
								<a href='?page=like&type=2'>
									<img src='img/like-02.png'/>
								</a>
								<p>$dislikes</p>
							</li>
						 </ul>
					</div>";
			if($cnt % 4 == 0 || $i + 1 == $db->count || $cat != $res[$i + 1]["catName".$lang])
				$str .= "</div>";
		}
		$str.="<input type='hidden' class='nextpage' value='".($page+1)."'><input type='hidden' class='isload' value='true'>";
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

?>