<?php
$query = array();
if($_GET["s"] == "users" && isset($_GET["userId"]) && is_numeric($_GET["userId"]))
{
	$condName = "userId";
	$id = $_GET["userId"];
	$query["users"][1] = "select * from siteentry where userId=".$_GET["userId"];
	$query["users"][2] = "SELECT vw.userId,vw.videoId,v.name,vw.actionDate
						  FROM videoviews vw
						  left join videos v on v.id=vw.videoId
						  where userId=".$_GET["userId"];
	$query["users"][3] = "select v.id,v.link,v.name,v.added
    					from videos v
						where v.addedById=".$_GET["userId"];
	$query["users"][4] = "SELECT vw.userId,vw.videoId,v.name,vw.actionDate
						  FROM videoviews vw
						  left join videos v on v.id=vw.videoId
						  where action=1 and userId=".$_GET["userId"];
	$query["users"][5] = "SELECT vw.userId,vw.videoId,v.name,vw.actionDate
						  FROM videoviews vw
						  left join videos v on v.id=vw.videoId
						  where action=-1 and userId=".$_GET["userId"];
	$query["users"][6] = "select c.createdById userId,c.email,c.comment,c.videoId,v.name,c.created
						from comments c
						left join videos v on v.id=c.videoId
						where c.createdById=".$_GET["userId"];
	$query["users"][7] = "select vr.videoId,v.name,vr.reportDate,rr.reasonAz,vr.desc
						from videoreports vr
						left join videos v on v.id=vr.videoId
						left join reportreasons rr on rr.id=vr.reasonId
						where vr.reporterId=".$_GET["userId"];
	$query["users"][8] = "select fv.videoId,v.name,fv.added,f.name folderName,v.deleted
						from foldervideos fv
						left join videos v on v.id=fv.videoId
						left join folders f on f.id=fv.folderId
						where f.createdById=".$_GET["userId"];
	$query["users"][9] = "select f.createdById userId,f.name, f.created
						from folders f 
						where f.createdById=".$_GET["userId"];
	$query["users"][10] = "select c.userId,c.actionId tagId,t.name tag,c.clickDate
						from clicks c 
						left join tags t on t.id=c.actionId
						where c.actionType=1 and userId=".$_GET["userId"];
	$query["users"][11] = "select c.userId,c.actionId CategoryId,cat.catNameAz Category,c.clickDate
						from clicks c 
						left join categories cat on cat.id=c.actionId
						where c.actionType=2 and userId=".$_GET["userId"];
	$query["users"][12] = "select s.userId,s.catId categoryId,c.catNameAz Category,s.subsDate subscriptionDate
						from subscriptions s
						left join categories c on c.id=s.catId
						where userId=".$_GET["userId"];
	$query["users"][13] = "select s.createdById userId,s.keyword,s.created
						from searches s
						where createdById=".$_GET["userId"];
}
if($_GET["s"] == "videos" && isset($_GET["videoId"]) && is_numeric($_GET["videoId"]))
{
	$condName = "videoId";
	$id = $_GET["videoId"];
	$query["videos"][1] = "SELECT vw.userId,vw.videoId,v.name,vw.actionDate
						  FROM videoviews vw
						  left join videos v on v.id=vw.videoId
						  where videoId=".$_GET["videoId"];
	$query["videos"][2] = "select c.id commentId, c.createdById userId,c.email,c.comment,c.videoId,v.name,c.created
						from comments c
						left join videos v on v.id=c.videoId
						where c.videoId=".$_GET["videoId"];
	$query["videos"][3] = "select vt.videoId,v.name,t.name tag,DATE_FORMAT(t.created,'%d-%m-%Y %k:%i:%S') created,DATE_FORMAT(t.updated,'%d-%m-%Y %k:%i:%S') updated
						from videotags vt
						left join videos v on v.id=vt.videoId
						left join tags t on t.id=vt.tagId
						where vt.videoId=".$_GET["videoId"];
	$query["videos"][4] = "SELECT vw.userId,vw.videoId,v.name,vw.actionDate
					  FROM videoviews vw
					  left join videos v on v.id=vw.videoId
					  where action=1 and vw.videoId=".$_GET["videoId"];
	$query["videos"][5] = "SELECT vw.userId,vw.videoId,v.name,vw.actionDate
					  FROM videoviews vw
					  left join videos v on v.id=vw.videoId
					  where action=-1 and vw.videoId=".$_GET["videoId"];
	$query["videos"][6] = "select vr.videoId,v.name,vr.reportDate,rr.reasonAz,vr.desc
						from videoreports vr
						left join videos v on v.id=vr.videoId
						left join reportreasons rr on rr.id=vr.reasonId
						where vr.videoId=".$_GET["videoId"];
	$query["videos"][7] = "select f.createdById userId,fv.videoId,v.name,fv.added,f.name folderName,v.deleted
						from foldervideos fv
						left join videos v on v.id=fv.videoId
						left join folders f on f.id=fv.folderId
						where fv.videoId=".$_GET["videoId"];
}
if($_GET["s"] == "tags" && isset($_GET["tagId"]) && is_numeric($_GET["tagId"]))
{
	$condName = "tagId";
	$id = $_GET["tagId"];
	$query["tags"][1] = "select vt.videoId,v.name,v.added VideoAdded,v.updated,v.deleted,t.name tag
						from videotags vt
						left join videos v on v.id=vt.videoId
						left join tags t on t.id=vt.tagId
						where vt.tagId=".$_GET["tagId"];
	$query["tags"][2] = "select c.userId,c.actionId tagId,t.name tag,c.clickDate
					from clicks c 
					left join tags t on t.id=c.actionId
					where c.actionType=1 and c.actionId=".$_GET["tagId"];
}
if($_GET["s"] == "guests" && isset($_GET["ip"]) && $_GET["ip"] != "")
{
	$condName = "ip";
	$id = $_GET["ip"];
	$query["guests"][1] = "SELECT IP,vw.videoId,v.name,vw.actionDate
						  FROM videoviews vw
						  left join videos v on v.id=vw.videoId
						  where userId=0 and IP='".$_GET["ip"]."'";
	$query["guests"][2] = "select c.id,c.userIP IP,c.email,c.comment,c.videoId,v.name,c.created
						from comments c
						left join videos v on v.id=c.videoId
						where c.createdById is null and c.userIP='".$_GET["ip"]."'";
	$query["guests"][3] = "select createdByIP IP,s.keyword,s.created
						from searches s
						where createdById=0 and createdByIP='".$_GET["ip"]."'";
}
if($_GET["s"] == "cats" && isset($_GET["catId"]) && is_numeric($_GET["catId"]))
{
	$condName = "catId";
	$id = $_GET["catId"];
	$query["cats"][1] = "select vc.videoId,vc.categoryId,c.catNameAz Category,v.added VideoAdded,v.updated,v.deleted
						from videocats vc
						left join videos v on v.id=vc.videoId
						left join categories c on c.id=vc.categoryId
						where vc.categoryId=".$_GET["catId"];
	$query["cats"][2] = "select s.userId,s.catId categoryId,c.catNameAz Category,s.subsDate subscriptionDate
						from subscriptions s
						left join categories c on c.id=s.catId
						where s.catId=".$_GET["catId"];
	$query["cats"][3] = "select c.userId,c.actionId CategoryId,cat.catNameAz Category,c.clickDate
						from clicks c 
						left join categories cat on cat.id=c.actionId
						where c.actionType=2 and c.actionId=".$_GET["catId"];
}
if($_GET["s"] == "folders" && isset($_GET["folderId"]) && is_numeric($_GET["folderId"]))
{
	$query["folders"][1] = "SELECT ft.tagId, ft.folderId, t.*
							FROM foldertags ft
							inner join tags t on t.id=ft.tagId
							where folderId=$_GET[folderId]";
	$query["folders"][2] = "select fv.folderId,fv.videoId,v.name,v.added
							from foldervideos fv 
							inner join videos v on v.id=fv.videoId
							where fv.folderId=$_GET[folderId] and v.isDeleted=0";
}
if(isset($_POST["action"]) && $_POST["action"] == "export")
{
	//echo "<pre>"; print_r($_REQUEST); echo "</pre>";
	$data = $controller->getDetailData($query[$_GET["s"]][$_GET["q"]]);
	if(count($data) > 0)
	{
		foreach($data[0] as $key=>$value)
			$colNames[$key] = $key;

		//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
		$controller->exportToExcel($colNames,$data,$_GET["s"]."-".$_GET["title"]."-".$_GET["userId"].$_GET["videoId"].$_GET["tagId"].$_GET["ip"].$_GET["catId"].$_GET["folderId"]);
	}
}

if ($_GET["action"]=="filter" && $_POST["action"] == 'export')
{
	$result = "success";
	$messages = array();
	if(!$access->authorized(23))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}

	$fields = array("name" => $content['TAG'],
					"lang" => $content['LANGUAGE'],
					"created" => $content['DATECREATED'],
					"createdBy" => $content['CREATEDBY'],
					"updated" => $content['DATEUPDATED'],
					"updatedBy" => $content['UPDATEDBY'],
					"videoCntTagged" => $content['VIDEOCNTTAGGED'],
					"userCntClicked" => $content['USERCNTCLICKED'],
					"clickCnt" => $content['CLICKCNT']
					);
	$links = $controller->getTags(1,0,$_POST,$cnt,"","");
	//echo "<pre>"; print_r($links[0]); echo "</pre>";return;
	$controller->exportToExcel($fields,$links,$_GET["s"].$content['TITLETAGS']);
	return;
}

?>