<?php
//include($langsPath."content_".$lang.".php");
include($templatePath."header.php");
include($templatePath."categories.php");
include($templatePath."videos.php");
include($templatePath."footer.php");
include($templatePath."reg.php");
include($templatePath."addVideo.php");
include($templatePath."users.php");
include($templatePath."watchVideo.php");
include($templatePath."allTags.php");
include($templatePath."forgotPass.php");
include($templatePath."searchResults.php");
include($templatePath."advSearch.php");
include($templatePath."signIn.php");
//Admin classes
include($templatePath."adminMenu.php");
include($templatePath."adminProfile.php");
include($templatePath."adminFooter.php");
include($templatePath."adminRoles.php");
include($templatePath."editRole.php");
include($templatePath."adminVideoLinks.php");
include($templatePath."adminUsers.php");
include($templatePath."adminComments.php");
include($templatePath."adminFolders.php");
include($templatePath."adminTags.php");

class Controller //extends MySQL
{
//Variables
	
	public $db;
	public $lang;
	public $access;
	
//End Variables
	
//GetSets
		
//End GetSets
	public function __construct($db) 
	{
		global $lang;
		global $access;
		
		$this->access=$access;
		$this->db = $db; 
		$this->lang=$lang;
		//print_r($access);
    }
	
	public function includeSection($section)
	{
		global $domain;
		global $user;
		global $product;
		global $langsPath;
		global $templatePath;
		global $classesPath;
		
		global $okMessage;
		global $sessionId;
		
		
		switch($section)
		{
			case "header":
				$header = new Header($this);
				$header->Show();
				break;
			case "categories":
				$categories = new Categories($this);
				$categories->Show();
				break;
			case "signIn":
				$signIn = new SignIn($this);
				$signIn->Show();
				break;
			case "videos":
				$videos = new Videos($this);
				$videos->Show();
				break;
			case "footer":
				$footer = new Footer($this);
				$footer->Show();
				break;
			case "reg":
				$reg = new Reg($this);
				$reg->Show();
				break;
			case "users":
				$users = new Users($this);
				$users->Show();
				break;
			case "allTags":
				$allTags = new AllTags($this);
				$allTags->Show();
				break;
			case "watchVideo":
				$watchVideo = new WatchVideo($this);
				$watchVideo->Show();
				break;
			case "addVideo":
				$addVideo = new AddVideo($this);
				$addVideo->Show();
				break;
			case "forgotPass":
				$forgotPass = new ForgotPass($this);
				$forgotPass->Show();
				break;
			case "searchResults":
				$searchResults = new SearchResults($this);
				$searchResults->Show();
				break;
			case "advSearch":
				$advSearch = new AdvSearch($this);
				$advSearch->Show();
				break;
			case "adminMenu":
				$adminMenu = new AdminMenu($this);
				$adminMenu->Show();
				break;
			case "adminProfile":
				$adminProfile = new AdminProfile($this);
				$adminProfile->Show();
				break;
			case "adminFooter":
				$adminFooter = new AdminFooter($this);
				$adminFooter->Show();
				break;
			case "adminRoles":
				$adminRoles = new AdminRoles($this);
				$adminRoles->Show();
				break;
			case "editRole":
				$editRole = new EditRole($this);
				$editRole->Show();
				break;
			case "adminVideoLinks":
				$adminVideoLinks = new AdminVideoLinks($this);
				$adminVideoLinks->Show();
				break;
			case "adminComments":
				$adminComments = new AdminComments($this);
				$adminComments->Show();
				break;
			case "adminFolders":
				$adminFolders = new AdminFolders($this);
				$adminFolders->Show();
				break;
			case "adminTags":
				$adminTags = new AdminTags($this);
				$adminTags->Show();
				break;
			case "adminUsers":
				$adminUsers = new AdminUsers($this);
				$adminUsers->Show();
				break;
		}
	}
	
	//this will be common function because categories panel are located in all pages
	public function getCategories($questions,$userId="")
	{
		$join = "LEFT";
		$cond = "";
		if($userId != "")
		{
			$join = "INNER";
			$cond = " and v.addedById = $userId";
		}
		$this->db->join("videocats vc", "c.id = vc.categoryId", $join);
		$this->db->join("videos v", "v.id = vc.videoId", $join);
		$this->db->where("c.questions &  $questions " . $cond);
		$this->db->groupBy("c.id");
		$this->db->orderBy("c.catName".$this->lang,"asc");
		$cats = $this->db->get("categories c",null,"c.id, '#' as url, c.catName".$this->lang." as catName, c.catInfo".$this->lang." as catInfo, '#' as subscribe, IfNULL(count(vc.categoryid), 0) AS count");
		//echo $this->db->getLastQuery()."<br>";
		return $cats;
	}
	
	public function getAllCategories()
	{
		return $this->db->get("categories", null, "id, questions, catName".$this->lang." as catName");
	}
	
	public function getLanguages()
	{
		return $this->db->get("languages", null, "id, name".$this->lang." as name");
	}
	
	public function getCount($flag)
	{
		switch ($flag)
		{
			case 1:
				$this->db->where("status='confirmed' and isDeleted=0");
				$this->db->get("users");
				return $this->db->count;
			break;
			case 2:
				$this->db->get("tags");
				return $this->db->count;
			break;
			case 3:
				$this->db->where("isDeleted=0");
				$this->db->get("videos");
				return $this->db->count;
			break;
		}
		return 0;
	}

	public function getNormalizedDate($rawDate)
	{
		global $lang;
		list($year, $month, $day) = explode('-', $rawDate);//return $month.$day.$year;
		if($year == "0000")
			return "";
		$day = substr($rawDate,8,2);
		if($lang == 'az' || $lang == 'ru')
			$date = $day.".".$month.".".$year;
		if($lang == 'en')
			$date = $month . "/" . $day . "/" . $year;
		return trim($date);
	}
	
	public function getDateForSelect($date)
	{
		global $lang;
		if($lang == 'az' || $lang == 'ru')
			list($day, $month, $year) = explode('.', $date);
		if($lang == 'en')
			list($month, $day, $year) = explode('/', $date);
		return $day . '-' . $month . '-' . $year;
	}
	
	public function getFolderNames()
	{
		$qry = "select id folderId, name folderName from folders where createdById=".$this->access->userId;
		$res = $this->db->rawQuery($qry);
		return $res;
	}
	
	public function validate_Date($mydate,$format = 'DD-MM-YYYY',&$date) 
	{
		if($mydate == "")
			return true;
		if ($format == 'YYYY-MM-DD') list($year, $month, $day) = explode('-', $mydate);
		if ($format == 'YYYY/MM/DD') list($year, $month, $day) = explode('/', $mydate);
		if ($format == 'YYYY.MM.DD') list($year, $month, $day) = explode('.', $mydate);

		if ($format == 'DD-MM-YYYY') list($day, $month, $year) = explode('-', $mydate);
		if ($format == 'DD/MM/YYYY') list($day, $month, $year) = explode('/', $mydate);
		if ($format == 'DD.MM.YYYY') list($day, $month, $year) = explode('.', $mydate);

		if ($format == 'MM-DD-YYYY') list($month, $day, $year) = explode('-', $mydate);
		if ($format == 'MM/DD/YYYY') list($month, $day, $year) = explode('/', $mydate);
		if ($format == 'MM.DD.YYYY') list($month, $day, $year) = explode('.', $mydate);       

		if (is_numeric($year) && is_numeric($month) && is_numeric($day))
			if(checkdate($month,$day,$year))
			{
				$date = $year . '-' . $month . '-' . $day;
				return true;
			}
		return false;           
	}      
	
	public function getQuestions($id)
	{
		global $content;
		$ret="";
		//echo $id; echo "id shift "; echo  $id&2;
		//if (($id&2) > 0) echo "here";
		if (($id&1) == 1) 
			$ret = $content['WHAT']."/";
		if (($id&2) == 2)
			$ret .= $content['WHO']."/";
		if (($id&4) == 4)
			$ret .= $content['HOW']."/";
		if (($id&8) == 8)
			$ret .= $content['WHY']."/";
		return rtrim($ret, "/");
	}
	
	public function getPages($begin,$perPage,$cnt,$page)
	{
		$visPageCnt = 8;
		$start = 1;
		if($begin ==1 ) {$disabled = "disabled"; $pageUrl="#";}
		else {$disabled = ""; $pageUrl="?page=$page&begin=" . ($begin-1) ."&perPage=$perPage";}
		$ret[] = array("pageUrl"=>$pageUrl,"pageStatus" => $disabled,"pageNum"=>"«");
		$pageNum = ceil($cnt / $perPage);
		//echo "count=".$cnt."<br>pagenum=".$pageNum;
		$disabled = "";
		$end = $pageNum;
		if($pageNum > $visPageCnt)
			$end = $visPageCnt;
		if($begin >= $visPageCnt)
		{
			$start = $begin - $visPageCnt +2;
			if($pageNum <= $start+$visPageCnt-1)
				$end = $pageNum;
			else
				$end = $start+$visPageCnt-1;
		}
		for($i=$start; $i<=$end; $i++)
		{
			if($begin == $i) {$disabled = "disabled";$pageUrl = "#";}
			else {$disabled = "";$pageUrl = "?page=$page&begin=$i&perPage=$perPage";}
			$ret[] = array("pageUrl"=>$pageUrl,"pageStatus" => $disabled,"pageNum"=>"$i");
		}
		$disabled = "";
		if($begin ==$pageNum ) {$disabled = "disabled"; $pageUrl="";}
		else {$disabled = ""; $pageUrl="?page=$page&begin=" . ($begin+1) . "&perPage=$perPage";}
		$ret[] = array("pageUrl"=>$pageUrl,"pageStatus" => $disabled,"pageNum"=>"»");
		
		return $ret;
	}

	public function getVideoLinks($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "STR_TO_DATE(added, '%d-%m-%y')";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (
						SELECT v.id, v.name, v.info, DATE_FORMAT(v.added,'%d-%m-%Y') added, v.addedByIP,DATE_FORMAT(v.updated,'%d-%m-%Y') updated,v.duration,v.questions,
								l.name$lang lang, v.link,v.languageId,
								concat(u.firstName,' ',u.lastName) addedBy,
								concat(u2.firstName,' ',u2.lastName) updatedBy,
								concat(u3.firstName,' ',u3.lastName) deletedBy,
								GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
								c.catName$lang catName,
								vs.reportCount,v.isDeleted,DATE_FORMAT(v.deleted,'%d-%m-%Y') deleted
						FROM videos v
						left join vwvideostats vs on v.id = vs.id
						join users u on u.id = v.addedById
						left join users u2 on u2.id = v.updatedById
						left join users u3 on u3.id = v.deletedById
						join videocats vc on vc.videoId = v.id
						join categories c on c.id = vc.categoryId
						left join languages l on l.id = v.languageId
						left join videotags vt on vt.videoId=v.id
						left join tags t on t.id=vt.tagId
						left join comments ct on ct.videoId=v.id
						group by v.id,vc.categoryId
						) v
						where v.isDeleted=0 ";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and v.id=".trim($post["id"]);
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and v.name like '%" . trim($post["name"]) . "%'";
		if(isset($post["info"]) && $post["info"] != "")
			$qry .= " and v.info like '%" . trim($post["info"]) . "%'";
		if(isset($post["added"]) && $post["added"] != "")
			$qry .= " and v.added = '" . $this->getDateForSelect(trim($post["added"])) . "'";
		if(isset($post["languageId"]) && $post["languageId"] != "")
			$qry .= " and v.languageId = " . trim($post["languageId"]);
		if(isset($post["link"]) && $post["link"] != "")
			$qry .= " and v.link like '%" . trim($post["link"]) . "%'";
		if(isset($post["addedBy"]) && $post["addedBy"] != "")
			$qry .= " and v.addedBy like '%" . trim($post["addedBy"]) . "%'";
		if(isset($post["category"]) && $post["category"] != "")
			$qry .= " and catName like '%" . trim($post["category"]) . "%'";
		if(isset($post["tags"]) && $post["tags"] != "")
			$qry .= " and v.tags like '%" . trim($post["tags"]) . "%'";
		if(isset($post["questions"]) && $post["questions"] != "")
			$qry .= " and v.questions & " . trim($post["questions"]);
		if(isset($post["reportCount"]) && $post["reportCount"] != "")
			$qry .= " and v.reportCount = " . trim($post["reportCount"]);
		$qry .= " order by $sortBy $sortType";
		//echo $qry;
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		$res = $this->db->rawQuery($qry);
		for($i=0; $i<count($res); $i++)
		{
			$res[$i]["questions"] = $this->getQuestions($res[$i]["questions"]);
			$res[$i]["duration"] =gmdate('H:i:s',$res[$i]["duration"]);
		}
		return $res;
	}
	
	public function exportToExcel($fields,$data,$filename)
	{
		$objPHPExcel = new PHPExcel();  
		$objPHPExcel->setActiveSheetIndex(0);  
		$rowCount = 1;  
		$column = 'A';
		
		foreach($fields as $value)
		{
			$objPHPExcel->getActiveSheet()->setCellValue($column.$rowCount, $value);
			$column++;
		}

		$rowCount = 2;
		for($i=0; $i<count($data); $i++)
		{
			$column = 'A';
			foreach($fields as $key => $value)
			{
				$objPHPExcel->getActiveSheet()->setCellValue($column.$rowCount, $data[$i][$key]);
				$column++;
			}
			$rowCount++;
		}
		 
		// Redirect output to a client’s web browser (Excel5) 
		header('Content-Type: application/vnd.ms-excel'); 
		header("Content-Disposition: attachment;filename=$filename.xls"); 
		header('Cache-Control: max-age=0'); 
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5'); 
		$objWriter->save('php://output');
	}
	
	public function hasAccessToVideo($videoId)
	{
		$this->db->where("id=$videoId and addedById=".$this->access->userId);
		$this->db->get("videos");
		if($this->db->count == 1)
			return true;
		if($this->access->authorized(8))
			return true;
		return false;
	}
	
	public function getComments($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "c.created ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (SELECT c.*,
				DATE_FORMAT(c.created,'%d-%m-%Y %k:%i:%S') createdDate,
				DATE_FORMAT(c.updated,'%d-%m-%Y %k:%i:%S') updatedDate,
				if(c.createdById!='NULL',concat(u.firstName,' ',u.lastName),c.email) author, 
				concat(u2.firstName,' ',u2.lastName) confirmer,
				concat(u3.firstName,' ',u3.lastName) updatedBy
				from comments c
				left join users u on u.id=c.createdById
				left join users u2 on u2.id=c.confirmedById
				left join users u3 on u3.id=c.updatedById
				) c
				where 1=1 ";
				
		if(isset($post["created"]) && $post["created"] != "")
			$qry .= " and DATE_FORMAT(c.created,'%d-%m-%Y') = '" . $this->getDateForSelect(trim($post["created"])) . "'";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and c.id=".trim($post["id"]);
		if(isset($post["videoId"]) && $post["videoId"] != "")
			$qry .= " and c.videoId=".trim($post["videoId"]);
		if(isset($post["authorId"]) && $post["authorId"] != "")
			$qry .= " and c.createdById=".trim($post["authorId"]);
		if(isset($post["author"]) && $post["author"] != "")
			$qry .= " and c.author like '%" . trim($post["author"]) . "%'";
		if(isset($post["comment"]) && $post["comment"] != "")
			$qry .= " and c.comment like '%" . trim($post["comment"]) . "%'";
		if(isset($post["confirmed"]) && $post["confirmed"] != "")
			$qry .= " and c.isConfirmed=".trim($post["confirmed"]);
		if(isset($post["confirmer"]) && $post["confirmer"] != "")
			$qry .= " and c.confirmer like '%" . trim($post["confirmer"]) . "%'";
		
		$qry .= " order by $sortBy $sortType";
		//echo $qry;
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		$res = $this->db->rawQuery($qry);
		
		return $res;
	}
	
	public function getFolders($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "f.created ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (SELECT f.*,
				DATE_FORMAT(f.created,'%d-%m-%Y %k:%i:%S') createdDate,
				DATE_FORMAT(f.updated,'%d-%m-%Y %k:%i:%S') updatedDate,
				concat(u.firstName,' ',u.lastName) author, 
				concat(u3.firstName,' ',u3.lastName) updatedBy
				from folders f
				left join users u on u.id=f.createdById
				left join users u3 on u3.id=f.updatedById
				) f
				where isDeleted=0 ";
				
		if(isset($post["created"]) && $post["created"] != "")
			$qry .= " and DATE_FORMAT(f.created,'%d-%m-%Y') = '" . $this->getDateForSelect(trim($post["created"])) . "'";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and f.id=".trim($post["id"]);
		if(isset($post["authorId"]) && $post["authorId"] != "")
			$qry .= " and f.createdById=".trim($post["authorId"]);
		if(isset($post["author"]) && $post["author"] != "")
			$qry .= " and f.author like '%" . trim($post["author"]) . "%'";
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and f.name like '%" . trim($post["comment"]) . "%'";
		
		$qry .= " order by $sortBy $sortType";
		//echo $qry;
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		$res = $this->db->rawQuery($qry);
		
		return $res;
	}
	
	public function getTags($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "t.name ";
			$sortType = "asc";
		}
		$lang = $this->lang;
		$qry = "select t.id,t.name,t.langId,
						l.nameAz lang
				from tags t
				inner join languages l on l.id=t.langId
				where 1=1 ";
				
		if(isset($post["languageId"]) && is_numeric($post["languageId"]))
			$qry .= " and t.langId=".trim($post["languageId"]);
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and t.name like '%" . trim($post["name"]) . "%'";
		
		$qry .= " order by $sortBy $sortType";
		//echo $qry;
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		$res = $this->db->rawQuery($qry);
		return $res;
	}
	
	public function getUsers($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "u.registered ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "SELECT u.*,r.name roleName,l.nameAz lang,
				DATE_FORMAT(u.registered,'%d-%m-%Y %k:%i:%S') createdDate,
				DATE_FORMAT(u.lastLoggedIn,'%d-%m-%Y %k:%i:%S') lastLoginDate,
				DATE_FORMAT(u.birthDate,'%d-%m-%Y') bDate,
				concat(u.firstName,' ',u.lastName) name
				FROM users u
				left join roles r on r.id=u.roleId
				left join languages l on l.id=u.languageId
				where isDeleted=0 ";
		
		if(isset($post["created"]) && $post["created"] != "")
			$qry .= " and DATE_FORMAT(u.registered,'%d-%m-%Y') = '" . $this->getDateForSelect(trim($post["created"])) . "'";
		if(isset($post["id"]) && is_numeric($post["id"]))
			$qry .= " and u.id=".trim($post["id"]);
		if(isset($post["userName"]) && $post["userName"] != "")
			$qry .= " and u.userName like '%" . trim($post["userName"]) . "%'";
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and concat(u.firstName,' ',u.lastName) like '%" . trim($post["name"]) . "%'";
		
		$qry .= " order by $sortBy $sortType";
		//echo $qry;
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		$res = $this->db->rawQuery($qry);
		return $res;
	}
	
	function getSecretQuestions()
	{
		return $this->db->get("secretquestions");
	}
	
}
?>