<?php

class AdminVideoLinks
{
	private $adminVideoLinks;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminVideoLinks = new SmartyBC;
		$this->adminVideoLinks->assign("titleVideoLinks", $content['TITLEVIDEOLINKS']);
		
		$this->adminVideoLinks->assign("save", $content['SAVE']);
		$this->adminVideoLinks->assign("lang", $controller->lang);
		
		$this->adminVideoLinks->assign("lnId", $content['ID']);
		$this->adminVideoLinks->assign("lnName", $content['VIDEONAME']);
		$this->adminVideoLinks->assign("lnInfo", $content['INFORMATION']);
		$this->adminVideoLinks->assign("lnAdded", $content['ADDDATE']);
		$this->adminVideoLinks->assign("lnLang", $content['LANGUAGE']);
		$this->adminVideoLinks->assign("lnLink", $content['VIDEOLINK']);
		$this->adminVideoLinks->assign("lnAddedBy", $content['ADDEDBY']);
		$this->adminVideoLinks->assign("lnTags", $content['TAGS']);
		$this->adminVideoLinks->assign("lnCategory", $content['CATEGORY']);
		//echo "<pre>"; print_r($_POST); echo "</pre>";
		if(isset($_POST) && count($_POST) > 0)
		{
			$this->adminVideoLinks->assign("idVal", $_POST["id"]);
			$this->adminVideoLinks->assign("nameVal", $_POST["name"]);
			$this->adminVideoLinks->assign("infoVal", $_POST["info"]);
			$this->adminVideoLinks->assign("addedVal", $_POST["added"]);
			$this->adminVideoLinks->assign("languageIdVal", $_POST["languageId"]);
			$this->adminVideoLinks->assign("linkVal", $_POST["link"]);
			$this->adminVideoLinks->assign("addedByVal", $_POST["addedBy"]);
			$this->adminVideoLinks->assign("tagsVal", $_POST["tags"]);
		}			
		if (isset($_GET["begin"])) $begin = $_GET["begin"]; else $begin=1;
		if (isset($_GET["perPage"])) $perPage = $_GET["perPage"]; else $perPage=25;
		$this->adminVideoLinks->assign("videoLinks", $this->getVideoLinks($controller,$begin,$perPage,$_POST,$cnt));
		
		$this->adminVideoLinks->assign("videoLinkPages",$controller->getPages($controller,$begin,$perPage,$cnt,"adminVideoLinks"));
		$this->adminVideoLinks->assign("result", $result);
		$this->adminVideoLinks->assign("messages", $messages);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminVideoLinks->display($templatePath."adminVideoLinks.tpl");
	}
	
	private function getAccessTypes($controller)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select id, name".$controller->lang." name from accesstypes");
		return $res;
	}
	
	private function getVideoLinks($controller,$begin,$perPage,$post,&$cnt)
	{
		//$db->where("id=$id");
		$lang = $controller->lang;
		$qry = "select * from (
						SELECT v.id, v.name, v.info, DATE_FORMAT(v.added,'%d-%m-%Y') added, 
								l.name$lang lang, v.link,v.languageId,
								concat(u.firstName,' ',u.lastName) addedBy,
								GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
								c.catName$lang catName
						FROM videos v
						left join vwvideostats vs on v.id = vs.id
						join users u on u.id = v.addedById
						join videocats vc on vc.videoId = v.id
						join categories c on c.id = vc.categoryId
						left join languages l on l.id = v.languageId
						left join videotags vt on vt.videoId=v.id
						left join tags t on t.id=vt.tagId
						left join comments ct on ct.videoId=v.id
						group by v.id,vc.categoryId
						) v
						where 1=1 ";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and v.id=".trim($post["id"]);
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and v.name like '%" . trim($post["name"]) . "%'";
		if(isset($post["info"]) && $post["info"] != "")
			$qry .= " and v.info like '%" . trim($post["info"]) . "%'";
		if(isset($post["added"]) && $post["added"] != "")
			$qry .= " and v.added = '" . $controller->getDateForSelect(trim($post["added"])) . "'";
		if(isset($post["languageId"]) && $post["languageId"] != "")
			$qry .= " and v.languageId = " . trim($post["languageId"]);
		if(isset($post["link"]) && $post["link"] != "")
			$qry .= " and v.link like '%" . trim($post["link"]) . "%'";
		if(isset($post["addedBy"]) && $post["addedBy"] != "")
			$qry .= " and v.addedBy like '%" . trim($post["addedBy"]) . "%'";
		if(isset($post["tags"]) && $post["tags"] != "")
			$qry .= " and v.tags like '%" . trim($post["tags"]) . "%'";
		//echo $qry;
		$controller->db->rawQuery($qry);
		$cnt = $controller->db->count;
		$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		$res = $controller->db->rawQuery($qry);
		return $res;
	}
}

?>