<?php
require_once(dirname(__FILE__)."/configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
$db = new MysqliDb($hostname, $username, $password, $database);

if(isset($_REQUEST['actionfunction']) && $_REQUEST['actionfunction']!='')
{
	$actionfunction = $_REQUEST['actionfunction'];
	call_user_func($actionfunction,$_REQUEST,$db,$limit,"az");
}

function showData($data,$db,$limit,$lang)
{
	$page = $data['page'];
	if($page==1)
		$start = 0;  
	else
		$start = ($page-1)*$limit;
		
	$res =$db->rawQuery("SELECT count(vv.action) viewCount,
								SUM(IF(action = 1, 1, 0)) likeCount,
								SUM(IF(action = -1, 1, 0)) dislikeCount,
								v.id,v.name,v.info,v.duration,v.addedDate,v.languageId,
								concat(u.firstName,' ',u.lastName) addedBy,
								tg.tags,
								vc.categoryId,
								c.catName$lang
						FROM videoViews vv
						right join videos v on v.id=vv.videoId
						inner join users u on u.id=v.addedById
						inner join videocats vc on vc.videoId=v.id
						inner join categories c on c.id = vc.categoryId
						left join (
							select videoId,GROUP_CONCAT(DISTINCT t.name ORDER BY t.name) AS tags
							from videoTags vt
							inner join tags t on t.id=vt.tagId
							group by vt.videoId
						) tg on tg.videoId=v.id
						group by v.id,vc.categoryId
						order by catName$lang asc,v.addedDate desc
						limit $start,$limit");//echo $db->getLastQuery();
	
	if($db->count>0)
	{
		$cat="";
		for($i=0; $i<$db->count; $i++)
		{
			if($cat != $res[$i]["catName".$lang])
			{
				$str .= "<div class='hollywd'>
							<h2>".$res[$i]["catName".$lang]."</h2>  
						</div>";
				$cat = $res[$i]["catName".$lang];
			}
			$str .= "<div class='box-cont'>";
			for($j=1; $j<=4; $j++)
			{
				$str .= "<div class='box'>";
				$str .= "<a href='?page=watchVideo?id=".$res[$i][id]."'><img src='img/player.png' width=152 height=79 alt='".$res[$i][info]."'/></a>
						<a href='#'><img class='ico1' src='img/add-to-f.png' width=24 height=24 alt=''/></a>
						<a href='#'><img class='ico2' src='img/edit-02.png' width=24 height=24 alt=''/></a>
						<a href='?page=watchVideo?id=".$res[$i][id]."'><h2>".$res[$i][name].$res[$i][id]."</h2></a>
						<img class='shape' src='img/shape.png' width=140 height=1 alt=''/> 
						<ul class='move'>
							<li><img class='details' src='img/02.png' /><span class='wood'>".$res[$i][tags]."</span></li>
							<li><img class='details2' src='img/eye.png'/><span class='views'>".$res[$i][viewCount]."</span></li>
							<li><img class='details3' src='img/publish.png' /><span class='date'>".$res[$i][addedDate]."</span></li>
							<li><img class='details4' src='img/user1.png' /><span class='smith'>".$res[$i][addedBy]."</span></li>
							<li class='likes'><a href='?page=like&type=1'><img src='img/like-01.png'/></a><p>".$res[$i][likeCount]."</p></li>
							<li class='likes2'><a href='?page=like&type=2'><img src='img/like-02.png'/></a><p>".$res[$i][dislikeCount]."</p></li>
						</ul>";
				$str .= "</div>";
				if($j<4) $i++;
				if($cat != $res[$i]["catName".$lang])
				{
					if($j<4)
						$i--;
					break;
				}
			}
			$str .= "</div>";
		}
	$str.="<input type='hidden' class='nextpage' value='".($page+1)."'><input type='hidden' class='isload' value='true'>";
	echo $str;
	}
	
	/*$variable = <<<XYZ
<div class="hollywd">
			<h2>Hollywood</h2>  
		</div>
		<div class="box-cont">
			<div class="box">
				<a href="?page=watchVideo"><img src="img/player.png" width="152" height="79" alt=""/></a>
				<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
				<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
				<a href="?page=watchVideo"><h2>The Devil's Double</h2></a>
				<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
				<ul class="move">
					<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
					<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
					<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
					<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
					<li class="likes"><a href="?page=like&type=1"><img src="img/like-01.png"/></a><p>13245</p></li>
					<li class="likes2"><a href="?page=like&type=2"><img src="img/like-02.png"/></a><p>3245</p></li>
				</ul>
			</div>
		   <div class="box">
				<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
				<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
				<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
				<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
				<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
				<ul class="move">
					<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
					<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
					<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
					<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
					<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
					<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
				</ul>
			</div>
		   <div class="box">
				<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
				<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
				<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
				<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
				<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
				<ul class="move">
					<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
					<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
					<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
					<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
					<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
					<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
				</ul>
			</div>
			<div class="box">
				<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
				<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
				<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
				<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
				<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
				<ul class="move">
					<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
					<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
					<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
					<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
					<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
					<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
				</ul>
			</div>
		</div>  
		
XYZ;
echo $variable;*/
	/*$sql = "select * from categories order by id asc limit $start,$limit";
	$str='';
	$data = $con->query($sql);
	if($data!=null && $data->num_rows>0)
	{
		while( $row = $data->fetch_array(MYSQLI_ASSOC))
			$str.="<div class='data-container'><p>".$row['id']."</p><p>".$row['catNameAz']."</p><p>".$row['catNameRu']."</p></div>";
		$str.="<input type='hidden' class='nextpage' value='".($page+1)."'><input type='hidden' class='isload' value='true'>";
	}

	echo $str; */

}

?>