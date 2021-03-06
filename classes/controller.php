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
include($templatePath."profile.php");
//Admin classes
include($templatePath."adminMenu.php");
include($templatePath."adminProfile.php");
include($templatePath."adminFooter.php");
//include($templatePath."adminRoles.php");
include($templatePath."editRole.php");
include($templatePath."adminVideoLinks.php");
include($templatePath."adminUsers.php");
include($templatePath."adminComments.php");
include($templatePath."adminFolders.php");
include($templatePath."adminTags.php");
include($templatePath."adminCategories.php");
include($templatePath."adminNotifications.php");
include($templatePath."about.php");
include($templatePath."other.php");
include($templatePath."page1.php");
include($templatePath."page2.php");
include($templatePath."adminGuests.php");
include($templatePath."adminReports.php");
include($templatePath."adminDetails.php");
include($templatePath."adminSearches.php");
include($templatePath."adminMessages.php");
include($templatePath."adminLogs.php");
include($templatePath."adminAttachments.php");
include($templatePath."adminRoles1.php");

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
			case "profile":
				$profile = new Profile($this);
				$profile->Show();
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
			case "adminCategories":
				$adminCategories = new AdminCategories($this);
				$adminCategories->Show();
				break;
			case "adminNotifications":
				$adminNotifications = new AdminNotifications($this);
				$adminNotifications->Show();
				break;
			case "adminGuests":
				$adminGuests = new AdminGuests($this);
				$adminGuests->Show();
				break;
			case "adminSearches":
				$adminSearches = new AdminSearches($this);
				$adminSearches->Show();
				break;
			case "adminMessages":
				$adminMessages = new AdminMessages($this);
				$adminMessages->Show();
				break;
			case "adminLogs":
				$adminLogs = new AdminLogs($this);
				$adminLogs->Show();
				break;
			case "adminReports":
				$adminReports = new AdminReports($this);
				$adminReports->Show();
				break;
			case "adminDetails":
				$adminDetails = new AdminDetails($this);
				$adminDetails->Show();
				break;
			case "adminAttachments":
				$adminAttachments = new AdminAttachments($this);
				$adminAttachments->Show();
				break;
			case "about":
				$about = new About($this);
				$about->Show();
				break;
			case "other":
				$other = new Other($this);
				$other->Show();
				break;
			case "page1":
				$page1 = new Page1($this);
				$page1->Show();
				break;
			case "page2":
				$page2 = new Page2($this);
				$page2->Show();
				break;
		}
	}
	
	//this will be common function because categories panel are located in all pages
	public function getCategories($questions,&$catGroups,&$cats,$userId="")
	{
		$catGroups = array();
		$cats = array();
		$join = "LEFT";
		//$cond = 1;
		$cond="";
		if($userId != "")
		{
			$join = "INNER";
			$cond = " and v.addedById = $userId";
		}
		if($this->access->hasAccess)
			$userId = $this->access->userId;
		else
			$userId = -1; 
		// $this->db->join("videocats vc", "c.id = vc.categoryId", $join);
		// $this->db->join("videos v", "v.id = vc.videoId", $join);
		// $this->db->where(" c.questions &  $questions " . $cond);
		// $this->db->groupBy("c.id");
		// $this->db->orderBy("c.catName".$this->lang,"asc");
		// $cats = $this->db->get("categories c",null,"c.id, '#' as url, c.catName".$this->lang." as catName, c.catInfo".$this->lang." as catInfo, '#' as subscribe, IfNULL(count(vc.categoryid), 0) AS count");
		//echo $this->db->getLastQuery()."<br>";
		// $qry = "select a.*, ifnull(count(a.videoId),0) count
							// from(
							// SELECT c.id, c.catName".$this->lang." as catName,catNameAz, 
								// (case when (c.catInfo".$this->lang." = '') then 'hererherer' else c.catInfo".$this->lang." end) catInfo,
								// '#' as subscribe,c.img,
								// cg.id catGroupId,cg.catGroupName".$this->lang." as catGroupName, cg.info".$this->lang." as catGroupInfo,
								// ifnull(v.isDeleted,0) isDeleted,v.id videoId
								// FROM categories c 
								// $join JOIN videocats vc on c.id = vc.categoryId 
								// $join JOIN (select * from videos where languageId=(select id from languages where LOWER(abbr) = '".$this->lang."')) v on v.id = vc.videoId 
								// left join catgroups cg on cg.id=c.catGroupId
							// WHERE  c.questions & $questions $cond) a
							// where isDeleted=0
							// group by a.id,a.catName,a.catInfo
							// order by catGroupName,
							// (case when (catNameAz like '%Digər%') then 'яяяяяя' else catName end)"; //echo $qry;
		$qry = "select
				(case when (a.catInfo = '') then group_concat(trim(b.name)) else a.catInfo end) catInfo,
				s.userId,a.id,a.catName,a.subscribe,a.img,a.catGroupId,a.catGroupName,a.catGroupInfo,a.isDeleted,a.videoId,a.count,a.questions
				from (
				select a.*, ifnull(count(a.videoId),0) count
						from(SELECT c.id, c.catName".$this->lang." as catName,catNameAz,c.catInfo".$this->lang." catInfo,
								'#' as subscribe,c.img,cg.id catGroupId,cg.catGroupName".$this->lang." as catGroupName, cg.info".$this->lang." as catGroupInfo,
								ifnull(v.isDeleted,0) isDeleted,v.id videoId,v.questions
							FROM categories c 
							left JOIN videocats vc on c.id = vc.categoryId 
							left JOIN (select * from videos where questions &  $questions and languageId=(select id from languages where LOWER(abbr) = '".$this->lang."')) v on v.id = vc.videoId 
							left join catgroups cg on cg.id=c.catGroupId
							WHERE c.isDeleted=0 and c.questions &  $questions $cond ) a
						where isDeleted=0
						group by a.id,a.catName,a.catInfo) a
						left join 
						(select name,categoryId from (
				select max_name.name,max_name.categoryId,max_name.added
				from
				(select vc.categoryId,max(v.added) added
				from videos v
				inner join videocats vc on vc.videoId=v.id 
				group by categoryId) as max_added
				join 
				(select name,added,vc.categoryId from videos v
					inner join videocats vc on vc.videoId=v.id) 
				as max_name on (max_added.added=max_name.added and max_name.categoryId=max_added.categoryId)
				union all
				select max_name.name,max_name.categoryId,max(max_name.added) added
				from
				(select vc.categoryId,max(v.added) added
				from videos v
				inner join videocats vc on vc.videoId=v.id
				where isDeleted=0 
				group by categoryId) as max_added
				join 
				(select name,added,vc.categoryId from videos v
					inner join videocats vc on vc.videoId=v.id
					where isDeleted=0) 
				as max_name on (max_added.added>max_name.added and max_name.categoryId=max_added.categoryId) 
				group by max_name.categoryId) a
				order by categoryId) b on a.id=b.categoryId
				left join (select * from subscriptions where userId=$userId) s on s.catId= a.id
				group by a.id
				order by catGroupName,
				(case when (catNameAz like '%Digər%') then 'яяяяяя' else catName end)";//echo $qry;exit;;
		$rawCats = $this->db->rawQuery($qry);
		
		$catGroups = array();
		for($i=0; $i<count($rawCats); $i++)
		{
			if(!isset($catGroups[$rawCats[$i]["catGroupId"]]["name"]))
			{
				$catGroups[$rawCats[$i]["catGroupId"]]["name"] =  $rawCats[$i]["catGroupName"];
				$catGroups[$rawCats[$i]["catGroupId"]]["info"] =  $rawCats[$i]["catGroupInfo"];
			}
			$cats[$rawCats[$i]["catGroupId"]][] = $rawCats[$i];
		}
		
		//return $cats;
	}
	
	public function getAllCategories()
	{
		//return $this->db->get("categories order by catName".$this->lang, null, "id, questions, catName".$this->lang." as catName");
		$sql = "select id, questions, catName".$this->lang." as catName 
				from categories
				order by (case when (catNameAz like '%Digər%') then 'яяяяяя' else catName end)";
		return $this->db->rawQuery($sql);
	}
	
	public function getAllUsers()
	{
		$sql = "select id, concat(firstName,' ',lastName,'(',userName,')') user 
				from users
				where isDeleted=0";
		return $this->db->rawQuery($sql);
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
		$qry = "select id folderId, name folderName from folders where isDeleted=0 and createdById=".$this->access->userId . " order by created desc";
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
		$ret[] = array("pageUrl"=>$pageUrl,"pageStatus" => $disabled,"pageNum"=>"<<");
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
		$ret[] = array("pageUrl"=>$pageUrl,"pageStatus" => $disabled,"pageNum"=>">>");
		
		return $ret;
	}

	public function getVideoLinks($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "vadded ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (
						SELECT v.id, v.name, v.info,  v.addedByIP,v.duration,v.questions,v.expired broken,
								l.name$lang lang, v.link,v.languageId,v.added vadded,v.updatedById,v.updatedByIP,v.addedById,v.deletedById,v.deletedByIP,
								concat(u.firstName,' ',u.lastName) addedBy,
								concat(u2.firstName,' ',u2.lastName) updatedBy,
								concat(u3.firstName,' ',u3.lastName) deletedBy,
								DATE_FORMAT(v.added,'%d-%m-%Y %k:%i:%S') added,
								DATE_FORMAT(v.updated,'%d-%m-%Y %k:%i:%S') updated,
								DATE_FORMAT(v.deleted,'%d-%m-%Y %k:%i:%S') deleted,
								GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
								c.catName$lang catName,v.deleted vdeleted,v.updated vupdated,
								v.isDeleted,
								vs.reportCount,vs.views,vs.likes,vs.dislikes,vs.comments,vs.userCntCommented,vs.userReportedCnt,vs.tagCount,vs.userCntAddedToFolder,vs.addedFolderCnt,vs.allViewCount,vs.fbCount,vs.twCount
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
						where 1=1 ";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and v.id=".trim($post["id"]);
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and v.name like '%" . trim($post["name"]) . "%'";
		if(isset($post["info"]) && $post["info"] != "")
			$qry .= " and v.info like '%" . trim($post["info"]) . "%'";
		
		if(isset($post["added"]) && $post["added"] != "")
			$beginDate = $this->getDateForSelect(trim($post["added"]));
		if(isset($post["addedTill"]) && $post["addedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["addedTill"]));
		$qry .= " and vadded between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		
		$beginDate="00-00-0000"; $endDate="01-01-9999";
		if(isset($post["updated"]) && $post["updated"] != "")
			$beginDate = $this->getDateForSelect(trim($post["updated"]));
		if(isset($post["updatedTill"]) && $post["updatedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedTill"]));
		$qry .= " and vupdated between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["deleted"]) && $post["deleted"] != "")
			$beginDate = $this->getDateForSelect(trim($post["deleted"]));
		if(isset($post["deletedTill"]) && $post["deletedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedTill"]));
		$qry .= " and vdeleted between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["addedById"]) && $post["addedById"] != "")
			$qry .= " and v.addedById = " . trim($post["addedById"]);
		if(isset($post["addedByIP"]) && $post["addedByIP"] != "")
			$qry .= " and v.addedByIP like '%" . trim($post["addedByIP"]) . "%'";
		if(isset($post["updatedById"]) && $post["updatedById"] != "")
			$qry .= " and v.updatedById = " . trim($post["updatedById"]);
		if(isset($post["updatedByIP"]) && $post["updatedByIP"] != "")
			$qry .= " and v.updatedByIP like '%" . trim($post["updatedByIP"]) . "%'";
		if(isset($post["deletedById"]) && $post["deletedById"] != "")
			$qry .= " and v.deletedById = " . trim($post["deletedById"]);
		if(isset($post["deletedByIP"]) && $post["deletedByIP"] != "")
			$qry .= " and v.deletedByIP like '%" . trim($post["deletedByIP"]) . "%'";
		if(isset($post["duration"]) && $post["duration"] != "")
			$qry .= " and TIME_FORMAT(SEC_TO_TIME(v.duration),'%H:%i:%s') like '%" . trim($post["duration"]) . "%'";
		
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
	
	public function getSearches($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "s.created";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select s.*, 
				DATE_FORMAT(s.created,'%d-%m-%Y %k:%i:%S') createdDate,
				u.userName searcher
				from searches s
				left join users u on u.id=s.createdById
				where 1=1 ";
		
		if(isset($post["createdDate"]) && $post["createdDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["createdDate"]));
		if(isset($post["createdDateTill"]) && $post["createdDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdDateTill"]));
		$qry .= " and s.created between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		
		if(isset($post["keyword"]) && $post["keyword"] != "")
			$qry .= " and s.keyword like '%".trim($post["keyword"])."%'";
		if(isset($post["createdById"]) && $post["createdById"] != "")
			$qry .= " and s.createdById like '%".trim($post["createdById"])."%'";
		if(isset($post["searcher"]) && $post["searcher"] != "")
			$qry .= " and u.userName like '%".trim($post["searcher"])."%'";
		if(isset($post["createdByIP"]) && $post["createdByIP"] != "")
			$qry .= " and s.createdByIP like '%".trim($post["createdByIP"])."%'";
		
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
		 
		// Redirect output to a clients web browser (Excel5) 
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
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "c.created ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (SELECT c.*,
               DATE_FORMAT(c.created,'%d-%m-%Y %k:%i:%S') createdDate,
               DATE_FORMAT(c.updated,'%d-%m-%Y %k:%i:%S') updatedDate,
               DATE_FORMAT(c.confirmed,'%d-%m-%Y %k:%i:%S') confirmedDate,
               c.confirmed confirmDate,
               if(c.createdById!='NULL',u.userName,c.email) author, 
               concat(u2.firstName,' ',u2.lastName) confirmer,
               u3.userName updatedBy,
               v.name videoName,q.question,v.link
               from comments c
               left join users u on u.id=c.createdById
               left join users u2 on u2.id=c.confirmedById
               left join users u3 on u3.id=c.updatedById
               left join videos v on v.id=c.videoId
               left join questions q on q.bitValue=v.questions
              ) c
				where 1=1  ";
				
		if(isset($post["created"]) && $post["created"] != "")
			$beginDate = $this->getDateForSelect(trim($post["created"]));
		if(isset($post["createdTill"]) && $post["createdTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and c.created between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
				
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
		if(isset($post["confirmedById"]) && $post["confirmedById"] != "")
			$qry .= " and c.confirmedById like '%" . trim($post["confirmedById"]) . "%'";
		if(isset($post["confirmedByIP"]) && $post["confirmedByIP"] != "")
			$qry .= " and c.confirmedByIP like '%" . trim($post["confirmedByIP"]) . "%'";
		
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		if(isset($post["updated"]) && $post["updated"] != "")
			$beginDate = $this->getDateForSelect(trim($post["updated"]));
		if(isset($post["updatedTill"]) && $post["updatedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedTill"]));
		$qry .= " and updated between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		if(isset($post["confirmDate"]) && $post["confirmDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["confirmDate"]));
		if(isset($post["confirmDateTill"]) && $post["confirmDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["confirmDateTill"]));
		$qry .= " and confirmed between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["videoName"]) && $post["videoName"] != "")
			$qry .= " and c.videoName like '%" . trim($post["videoName"]) . "%'";
		if(isset($post["question"]) && $post["question"] != "")
			$qry .= " and c.question like '%" . trim($post["question"]) . "%'";
		if(isset($post["userIP"]) && $post["userIP"] != "")
			$qry .= " and c.userIP like '%" . trim($post["userIP"]) . "%'";
		if(isset($post["updatedById"]) && $post["updatedById"] != "")
			$qry .= " and c.updatedById = " . trim($post["updatedById"]);
		if(isset($post["updatedBy"]) && $post["updatedBy"] != "")
			$qry .= " and c.updatedBy like '%" . trim($post["updatedBy"]) . "%'";
		if(isset($post["updatedByIP"]) && $post["updatedByIP"] != "")
			$qry .= " and c.updatedByIP like '%" . trim($post["updatedByIP"]) . "%'";
		if(isset($post["link"]) && $post["link"] != "")
			$qry .= " and c.link like '%" . trim($post["link"]) . "%'";
		
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
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "f.created ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (SELECT f.*,
							DATE_FORMAT(f.created,'%d-%m-%Y %k:%i:%S') createdDate,
							DATE_FORMAT(f.updated,'%d-%m-%Y %k:%i:%S') updatedDate,
							DATE_FORMAT(f.lastVideoAdded,'%d-%m-%Y %k:%i:%S') lastVideoAddedDate,
							DATE_FORMAT(f.deleted,'%d-%m-%Y %k:%i:%S') deletedDate,
							GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
							concat(u.firstName,' ',u.lastName,'(',u.userName,')') author, 
							concat(u2.firstName,' ',u2.lastName,'(',u2.userName,')') deletedBy, 
							concat(u3.firstName,' ',u3.lastName) updatedBy,
							fs.tagCnt,fs.videoCnt
							from folders f
							left join users u on u.id=f.createdById
							left join users u2 on u2.id=f.deletedById
							left join users u3 on u3.id=f.updatedById
							left join foldertags ft on ft.folderId=f.id
							left join tags t on t.id=ft.tagId
							left join vwfolderstats fs on fs.folderId=f.id 
							group by f.id
				) f
				where 1=1 ";
				
		if(isset($post["created"]) && $post["created"] != "")
			$beginDate = $this->getDateForSelect(trim($post["created"]));
		if(isset($post["createdTill"]) && $post["createdTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and f.created between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["updated"]) && $post["updated"] != "")
			$beginDate = $this->getDateForSelect(trim($post["updated"]));
		if(isset($post["updatedTill"]) && $post["updatedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedTill"]));
		$qry .= " and f.updated between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000"; $endDate="01-01-9999";
		if(isset($post["lastVideoAdded"]) && $post["lastVideoAdded"] != "")
			$beginDate = $this->getDateForSelect(trim($post["lastVideoAdded"]));
		if(isset($post["lastVideoAddedTill"]) && $post["lastVideoAddedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["lastVideoAddedTill"]));
		$qry .= " and f.lastVideoAdded between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["deleted"]) && $post["deleted"] != "")
			$beginDate = $this->getDateForSelect(trim($post["deleted"]));
		if(isset($post["deletedTill"]) && $post["deletedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["deletedTill"]));
		$qry .= " and f.deleted between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		
			
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and f.id=".trim($post["id"]);
		if(isset($post["authorId"]) && $post["authorId"] != "")
			$qry .= " and f.createdById=".trim($post["authorId"]);
		if(isset($post["author"]) && $post["author"] != "")
			$qry .= " and f.author like '%" . trim($post["author"]) . "%'";
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and f.name like '%" . trim($post["name"]) . "%'";
		if(isset($post["tags"]) && $post["tags"] != "")
			$qry .= " and f.tags like '%" . trim($post["tags"]) . "%'";
		if(isset($post["createdByIP"]) && $post["createdByIP"] != "")
			$qry .= " and f.createdByIP like '%" . trim($post["createdByIP"]) . "%'";
		if(isset($post["deletedById"]) && $post["deletedById"] != "")
			$qry .= " and f.deletedById =" . trim($post["deletedById"]);
		if(isset($post["deletedBy"]) && $post["deletedBy"] != "")
			$qry .= " and f.deletedBy like '%" . trim($post["deletedBy"]) . "%'";
		if(isset($post["deletedByIP"]) && $post["deletedByIP"] != "")
			$qry .= " and f.deletedByIP like '%" . trim($post["deletedByIP"]) . "%'";

		
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
	
	public function getRoles($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "r.created ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "SELECT r.id, name, DATE_FORMAT(r.created,'%d-%m-%Y %k:%i:%S') createdDate,
				r.created,concat(u.firstName,' ',u.lastName) author 
						FROM roles r
						inner join users u on u.id=r.createdBy
				where 1=1 ";
				
		if(isset($post["created"]) && $post["created"] != "")
			$beginDate = $this->getDateForSelect(trim($post["created"]));
		if(isset($post["createdTill"]) && $post["createdTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and r.created between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
					
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and r.id=".trim($post["id"]);
		if(isset($post["author"]) && $post["author"] != "")
			$qry .= " and concat(u.firstName,' ',u.lastName) like '%" . trim($post["author"]) . "%'";
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and r.name like '%" . trim($post["name"]) . "%'";
				
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
			$sortBy = "created1 ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select t.*,ts.*,u1.userName createdBy,u2.userName updatedBy,
						DATE_FORMAT(t.created,'%d-%m-%Y %k:%i:%S') created,t.created created1,
						DATE_FORMAT(t.updated,'%d-%m-%Y %k:%i:%S') updated,t.created updated1,
						l.nameAz lang
				from tags t
				inner join languages l on l.id=t.langId
				left join vwtagstats ts on ts.tagId=t.id
				left join users u1 on u1.id=t.createdById
				left join users u2 on u2.id=t.updatedById
				where 1=1 ";
				
		if(isset($post["languageId"]) && is_numeric($post["languageId"]))
			$qry .= " and t.langId=".trim($post["languageId"]);
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and t.name like '%" . trim($post["name"]) . "%'";
		
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		if(isset($post["created"]) && $post["created"] != "")
			$beginDate = $this->getDateForSelect(trim($post["created"]));
		if(isset($post["createdTill"]) && $post["createdTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and t.created between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["createdBy"]) && $post["createdBy"] != "")
			$qry .= " and u1.userName like '%" . trim($post["createdBy"]) . "%'";
		if(isset($post["createdById"]) && $post["createdById"] != "")
			$qry .= " and createdById = " . trim($post["createdById"]);
		if(isset($post["createdByIP"]) && $post["createdByIP"] != "")
			$qry .= " and createdByIP like '%" . trim($post["createdByIP"]) . "%'";
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		if(isset($post["updated"]) && $post["updated"] != "")
			$beginDate = $this->getDateForSelect(trim($post["updated"]));
		if(isset($post["updatedTill"]) && $post["updatedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedTill"]));
		$qry .= " and updated between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["updatedBy"]) && $post["updatedBy"] != "")
			$qry .= " and u2.userName like '%" . trim($post["updatedBy"]) . "%'";
		if(isset($post["updatedById"]) && $post["updatedById"] != "")
			$qry .= " and updatedById = " . trim($post["updatedById"]);
		if(isset($post["updatedByIP"]) && $post["updatedByIP"] != "")
			$qry .= " and updatedByIP like '%" . trim($post["updatedByIP"]) . "%'";
		
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
	
	public function getGuests($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		$beginDate="01-01-1900";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "entryDate1 ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select se.id, 
				se.entryDate entryDate1,
				DATE_FORMAT(se.entryDate,'%d-%m-%Y %k:%i:%S') entryDate,
				se.IP,se.device,se.browser,gs.*
				from siteentry se
				left join vwgueststats gs on gs.IP=se.IP
				where se.userId=0 ";
		
		if(isset($post["entryDate"]) && $post["entryDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["entryDate"]));
		if(isset($post["entryDateTill"]) && $post["entryDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["entryDateTill"]));
		$qry .= " and entryDate between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		
		
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and se.id = " . trim($post["id"]);
		if(isset($post["IP"]) && $post["IP"] != "")
			$qry .= " and se.IP like '%" . trim($post["IP"]) . "%'";
		if(isset($post["device"]) && $post["device"] != "")
			$qry .= " and se.device like '%" . trim($post["device"]) . "%'";
		if(isset($post["browser"]) && $post["browser"] != "")
			$qry .= " and se.browser like '%" . trim($post["browser"]) . "%'";
		if(isset($post["videCntWatched"]) && $post["videCntWatched"] != "")
			$qry .= " and videCntWatched = " . trim($post["videCntWatched"]) ;
		if(isset($post["videoCntCommented"]) && $post["videoCntCommented"] != "")
			$qry .= " and videoCntCommented = " . trim($post["videoCntCommented"]) ;
		if(isset($post["commentCnt"]) && $post["commentCnt"] != "")
			$qry .= " and commentCnt = " . trim($post["commentCnt"]) ;
		
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
	
	public function getLogs($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "actionDate ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "select * from (select  l.*,
				  DATE_FORMAT(l.actionDate,'%d-%m-%Y %k:%i:%S') actionDate1,
				  l.action actionObject, u.userName createdBy, 
				la.actionName".$this->lang." actionName,la.logType actionType,
				  la.logPanel panel 
				  from logs l 
				  inner join logactions la on l.actionId=la.id 
				  inner join users u on u.id=l.createdById ) a where 1=1 ";
		
		if(isset($post["actionDate"]) && $post["actionDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["actionDate"]));
		if(isset($post["actionDateTill"]) && $post["actionDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["actionDateTill"]));
		$qry .= " and actionDate between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and id = " . trim($post["id"]);
		if(isset($post["actionName"]) && $post["actionName"] != "")
			$qry .= " and actionName like '%" . trim($post["actionName"]) . "%'";
		if(isset($post["actionType"]) && $post["actionType"] != "")
			$qry .= " and actionType like '%" . trim($post["actionType"]) . "%'";
		if(isset($post["actionObject"]) && $post["actionObject"] != "")
			$qry .= " and actionObject like '%" . trim($post["actionObject"]) . "%'";
		if(isset($post["panel"]) && $post["panel"] != "")
			$qry .= " and panel like '%" . trim($post["panel"]) . "%'";
		if(isset($post["createdById"]) && $post["createdById"] != "")
			$qry .= " and createdById = " . trim($post["createdById"]);
		if(isset($post["createdByIP"]) && $post["createdByIP"] != "")
			$qry .= " and createdByIP like '%" . trim($post["createdByIP"]) . "%'";
		if(isset($post["userName"]) && $post["userName"] != "")
			$qry .= " and createdBy like '%" . trim($post["userName"]) . "%'";

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
	
	public function getAttachments($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		if ($sortBy == "")
		{
			$sortBy = "sentDate ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "SELECT e.sentDate,
				DATE_FORMAT(e.sentDate,'%d-%m-%Y %k:%i:%S') attachDate,
				a.emailId,a.attachment fileName
				FROM attachments a
				inner join emails e on e.id=a.emailId
				where 1=1 
		";
		
		if(isset($post["attachDate"]) && $post["attachDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["attachDate"]));
		if(isset($post["attachDateTill"]) && $post["attachDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["attachDateTill"]));
		$qry .= " and sentDate between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["id"]) && $post["id"] != "" && is_numeric($post["id"]))
			$qry .= " and emailId = " . trim($post["id"]);
		if(isset($post["fileName"]) && $post["fileName"] != "")
			$qry .= " and a.attachment like '%" . trim($post["fileName"]) . "%'";

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
		//echo "<pre>";print_r($post);echo "</pre>";
		if ($sortBy == "")
		{
			$sortBy = "u.registered ";
			$sortType = "desc";
		}
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		
		$lang = $this->lang;
		$qry = "SELECT u.*,r.name roleName,l.nameAz lang,
				u.lastUpdate updated,u.phoneNumber telephone,u.notes note,l.name".$_SESSION["lang"]." language,u.getEmailOnNews getSiteNews,u.getEmailOnVideoComment getEmailOnComment,
				us.videoviews viewcount,us.videoviews videoCount,us.likes likeCount, us.dislikes dislikeCount,us.comments commentCount,
				DATE_FORMAT(u.registered,'%d-%m-%Y %k:%i:%S') createdDate,
				DATE_FORMAT(u.lastLoggedIn,'%d-%m-%Y %k:%i:%S') lastLoginDate,
				DATE_FORMAT(u.lastUpdate,'%d-%m-%Y %k:%i:%S') updatedDate,
				DATE_FORMAT(u.deleted,'%d-%m-%Y %k:%i:%S') deletedDate,
				DATE_FORMAT(u.birthDate,'%d-%m-%Y') bDate,
				concat(u.firstName,' ',u.lastName) name,us.*,
				ec.deviceCount,ec.browserCount,emc.emailCnt
				FROM users u
				left join roles r on r.id=u.roleId
				left join languages l on l.id=u.languageId
				left join vwuserstats us on us.id=u.id
				left join vwentrycounts ec on ec.userId=u.id
				left join vwuseremailcnt emc on emc.userId=u.id
				where 1=1 ";
		
		if(isset($post["created"]) && $post["created"] != "")
			$beginDate = $this->getDateForSelect(trim($post["created"]));
		if(isset($post["createdTill"]) && $post["createdTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and u.registered between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		
		if(isset($post["id"]) && is_numeric($post["id"]))
			$qry .= " and u.id=".trim($post["id"]);
		if(isset($post["userName"]) && $post["userName"] != "")
			$qry .= " and u.userName like '%" . trim($post["userName"]) . "%'";
		if(isset($post["name"]) && $post["name"] != "")
			$qry .= " and concat(u.firstName,' ',u.lastName) like '%" . trim($post["name"]) . "%'";
		if(isset($post["roleIdFlt"]) && is_numeric($post["roleIdFlt"]) && $post["roleIdFlt"]>-1)
			$qry .= " and u.roleId=".trim($post["roleIdFlt"]);
		
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		if(isset($post["updatedDate"]) && $post["updatedDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["updatedDate"]));
		if(isset($post["updatedDateTill"]) && $post["updatedDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedDateTill"]));
		$qry .= " and lastUpdate between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["deleteddate"]) && $post["deleteddate"] != "")
			$begindate = $this->getdateforselect(trim($post["deleteddate"]));
		if(isset($post["deleteddatetill"]) && $post["deleteddatetill"] != "")
			$enddate = $this->getdateforselect(trim($post["deleteddatetill"]));
		$qry .= " and u.deleted between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";
		$endDate="01-01-9999";
		
		if(isset($post["fatherName"]) && $post["fatherName"] != "")
			$qry .= " and u.fatherName like '%" . trim($post["fatherName"]) . "%'";
		if(isset($post["birthDate"]) && $post["birthDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["birthDate"]));
		if(isset($post["birthDateTill"]) && $post["birthDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["birthDateTill"]));
		$qry .= " and u.birthDate between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["email"]) && $post["email"] != "")
			$qry .= " and u.email like '%" . trim($post["email"]) . "%'";
		if(isset($post["phoneNumber"]) && $post["phoneNumber"] != "")
			$qry .= " and u.phoneNumber like '%" . trim($post["phoneNumber"]) . "%'";
		if(isset($post["notes"]) && $post["notes"] != "")
			$qry .= " and u.notes like '%" . trim($post["notes"]) . "%'";
		if(isset($post["gender"]) && $post["gender"] != "")
			$qry .= " and u.gender = '" . trim($post["gender"]) . "'";
		if(isset($post["langId"]) && is_numeric($post["langId"]))
			$qry .= " and u.languageId=".trim($post["langId"]);
		if(isset($post["profession"]) && $post["profession"] != "")
			$qry .= " and u.profession like '%" . trim($post["profession"]) . "%'";
		if(isset($post["interests"]) && $post["interests"] != "")
			$qry .= " and u.interests like '%" . trim($post["interests"]) . "%'";
		if(isset($post["registeredByIP"]) && $post["registeredByIP"] != "")
			$qry .= " and u.registeredByIP like '%" . trim($post["registeredByIP"]) . "%'";
		if(isset($post["regDevice"]) && $post["regDevice"] != "")
			$qry .= " and u.regDevice like '%" . trim($post["regDevice"]) . "%'";
		if(isset($post["regBrowser"]) && $post["regBrowser"] != "")
			$qry .= " and u.regBrowser like '%" . trim($post["regBrowser"]) . "%'";
		if(isset($post["updateUserId"]) && is_numeric($post["updateUserId"]))
			$qry .= " and u.updateUserId=".trim($post["updateUserId"]);
		if(isset($post["deletedById"]) && is_numeric($post["deletedById"]))
			$qry .= " and u.deletedById=".trim($post["deletedById"]);
		if(isset($post["getEmailOnNews"]) && is_numeric($post["getEmailOnNews"]))
			$qry .= " and u.getEmailOnNews=".trim($post["getEmailOnNews"]);
		if(isset($post["getEmailOnVideoComment"]) && is_numeric($post["getEmailOnVideoComment"]))
			$qry .= " and u.getEmailOnVideoComment=".trim($post["getEmailOnVideoComment"]);
		if(isset($post["getEmailAfterMyComment"]) && is_numeric($post["getEmailAfterMyComment"]))
			$qry .= " and u.getEmailAfterMyComment=".trim($post["getEmailAfterMyComment"]);
		
		$qry .= " order by $sortBy $sortType";
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		//echo $qry;
		$res = $this->db->rawQuery($qry);//
		return $res;
	}
	
	public function getMailInfo($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "sentDate1 ";
			$sortType = "desc";
		}
		$beginDate="01-01-0000";
		$endDate="01-01-9999";
		
		$lang = $this->lang;
		$qry = "SELECT e.*,e.to sentTo,
				DATE_FORMAT(e.sentDate,'%d-%m-%Y %k:%i:%S') sentDate,
				e.sentDate sentDate1,
				concat(u.firstName,' ',u.lastName) senderName, u.userName,a.attachCnt
				from emails e
				left join users u on u.id=e.senderId
				left join vwattachcounts a on e.id=a.emailId
				where 1=1 ";
		
		if(isset($post["sentDate"]) && $post["sentDate"] != "")
			$beginDate = $this->getDateForSelect(trim($post["sentDate"]));
		if(isset($post["sentDateTill"]) && $post["sentDateTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["sentDateTill"]));
		$qry .= " and e.sentDate between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
			
		if(isset($post["id"]) && is_numeric($post["id"]))
			$qry .= " and e.id=".trim($post["id"]);
		if(isset($post["subject"]) && $post["subject"] != "")
			$qry .= " and e.subject like '%" . trim($post["subject"]) . "%'";
		if(isset($post["body"]) && $post["body"] != "")
			$qry .= " and e.body like '%" . trim($post["body"]) . "%'";
		if(isset($post["senderId"]) && is_numeric($post["senderId"]))
			$qry .= " and e.senderId=".trim($post["senderId"]);
		if(isset($post["userName"]) && $post["userName"] != "")
			$qry .= " and u.userName like '%" . trim($post["userName"]) . "%'";
		if(isset($post["senderIP"]) && $post["senderIP"] != "")
			$qry .= " and e.senderIP like '%" . trim($post["senderIP"]) . "%'";
		if(isset($post["to"]) && $post["to"] != "")
			$qry .= " and e.to like '%" . trim($post["to"]) . "%'";
	
		
		
		$qry .= " order by $sortBy $sortType";
		if($perPage>0)
		{
			$this->db->rawQuery($qry);
			$cnt = $this->db->count;
			$qry .= " limit ". (($begin-1)*$perPage) .", $perPage";
		}
		//echo $qry;
		$res = $this->db->rawQuery($qry);//print_r($res);
		return $res;
	}
		
	function getSecretQuestions()
	{
		return $this->db->get("secretquestions");
	}
	
	public function getAdminCategories($begin,$perPage,$post,&$cnt,$sortBy,$sortType)
	{
		//$db->where("id=$id");
		if ($sortBy == "")
		{
			$sortBy = "created1 ";
			$sortType = "desc";
		}
		$lang = $this->lang;
		$qry = "SELECT catNameAz catAz,catInfoAz,catNameEn catEn,catInfoEn,catNameRu catRu,catInfoRu, c.*,
				cs.videoCntInCat,cs.userCntSubscribed,cs.clickUserCnt,cs.clickCnt,cg.catGroupName".$_SESSION["lang"]." catGroup,
				concat(u.firstName,' ',u.lastName) createdBy,
				concat(u2.firstName,' ',u2.lastName) deletedBy,
				DATE_FORMAT(c.created,'%d-%m-%Y %k:%i:%S') created,c.created created1,
				DATE_FORMAT(c.updated,'%d-%m-%Y %k:%i:%S') updated,c.updated updated1,
				DATE_FORMAT(c.lastVideoAdded,'%d-%m-%Y %k:%i:%S') lastVideoAdded,c.lastVideoAdded lastVideoAdded1,
				DATE_FORMAT(c.deleted,'%d-%m-%Y %k:%i:%S') deleted,c.deleted deleted1,
				cg.catGroupNameAz
				FROM categories c
				left join users u on u.id=c.createdById
				left join users u2 on u2.id=c.deletedById
				left join vwcatstats cs on cs.categoryId=c.id
				left join catgroups cg on cg.id=c.catGroupId
				left join questions q on q.bitValue=c.questions
				where 1=1 ";
				
		if(isset($post["catGroup"]) && $post["catGroup"] != "")
			$qry .= " and cg.catGroupNameAz like '%" . trim($post["catGroup"]) . "%'";
		if(isset($post["catAz"]) && $post["catAz"] != "")
			$qry .= " and c.catNameAz like '%" . trim($post["catAz"]) . "%'";
		if(isset($post["catInfoAz"]) && $post["catInfoAz"] != "")
			$qry .= " and c.catInfoAz like '%" . trim($post["catInfoAz"]) . "%'";
		if(isset($post["catEn"]) && $post["catEn"] != "")
			$qry .= " and c.catNameEn like '%" . trim($post["catEn"]) . "%'";
		if(isset($post["catInfoEn"]) && $post["catInfoEn"] != "")
			$qry .= " and c.catInfoEn like '%" . trim($post["catInfoEn"]) . "%'";
		if(isset($post["catRu"]) && $post["catRu"] != "")
			$qry .= " and c.catNameRu like '%" . trim($post["catRu"]) . "%'";
		if(isset($post["catInfoRu"]) && $post["catInfoRu"] != "")
			$qry .= " and c.catInfoRu like '%" . trim($post["catInfoRu"]) . "%'";
		if(isset($post["flvideoQuestion"]) && $post["flvideoQuestion"] != "")
			$qry .= " and q.question like '%" . trim($post["flvideoQuestion"]) . "%'";
		
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["created"]) && $post["created"] != "")
			$beginDate = $this->getDateForSelect(trim($post["created"]));
		if(isset($post["createdTill"]) && $post["createdTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and c.created between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["updated"]) && $post["updated"] != "")
			$beginDate = $this->getDateForSelect(trim($post["updated"]));
		if(isset($post["updatedTill"]) && $post["updatedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["updatedTill"]));
		$qry .= " and c.updated between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["lastVideoAdded"]) && $post["lastVideoAdded"] != "")
			$beginDate = $this->getDateForSelect(trim($post["lastVideoAdded"]));
		if(isset($post["lastVideoAddedTill"]) && $post["lastVideoAddedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and c.lastVideoAdded between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		$beginDate="00-00-0000";$endDate="01-01-9999";
		if(isset($post["deleted"]) && $post["deleted"] != "")
			$beginDate = $this->getDateForSelect(trim($post["deleted"]));
		if(isset($post["deletedTill"]) && $post["deletedTill"] != "")
			$endDate = $this->getDateForSelect(trim($post["createdTill"]));
		$qry .= " and c.deleted between STR_TO_DATE('" . $beginDate . "','%d-%m-%Y') and STR_TO_DATE('" . $endDate . "','%d-%m-%Y')";
		if(isset($post["id"]) && $post["id"] != "")
			$qry .= " and c.id = " . trim($post["id"]);
		if(isset($post["createdById"]) && $post["createdById"] != "")
			$qry .= " and c.createdById like '%" . trim($post["createdById"]) . "%'";
		if(isset($post["createdBy"]) && $post["createdBy"] != "")
			$qry .= " and concat(u.firstName,' ',u.lastName) like '%" . trim($post["createdBy"]) . "%'";
		if(isset($post["createdByIP"]) && $post["createdByIP"] != "")
			$qry .= " and c.createdByIP like '%" . trim($post["createdByIP"]) . "%'";
		if(isset($post["deletedById"]) && $post["deletedById"] != "")
			$qry .= " and c.deletedById like '%" . trim($post["deletedById"]) . "%'";
		if(isset($post["deletedByIP"]) && $post["deletedByIP"] != "")
			$qry .= " and c.deletedByIP like '%" . trim($post["deletedByIP"]) . "%'";
		
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
			$res[$i]["questions"] = $this->getVideoQuesArr($res[$i]["questions"]);
		return $res;
	}
	
	public function getVideoQuesArr($id)
	{
		if (($id&1) == 1) 
			$ret[] = 1;
		if (($id&2) == 2)
			$ret[] = 2;
		if (($id&4) == 4)
			$ret[] = 4;
		if (($id&8) == 8)
			$ret[] = 8;
		return $ret;
	}
	
	public function addSiteEntry()
	{
		$userId = 0;
		if($this->access->hasAccess)
			$userId=$this->access->userId;
		
		$browser=$_SERVER['HTTP_USER_AGENT'];
			if(preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i',$browser)||preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i',substr($browser,0,4)))
				$device = "Mobile device";
			else 
				$device = "Computer";
			
		$this->db->rawQuery("insert into siteentry (userId,IP,device,browser,entryDate) 
							values ($userId,'".$_SERVER['REMOTE_ADDR']."','$device','$browser',now())
							on duplicate key update
							entryDate = now()");
	}
	
	public function addClicks()
	{
		$userId = 0;
		if($this->access->hasAccess)
			$userId=$this->access->userId;
		$IP = $_SERVER['REMOTE_ADDR'];
		if(isset($_GET["tagId"]) && is_numeric($_GET["tagId"]))
			$this->db->rawQuery("insert into clicks (userId,IP,actionType,actionId,clickDate) values
								($userId,'$IP',1,$_GET[tagId],now())");
		if(isset($_GET["catId"]) && is_numeric($_GET["catId"]))
			$this->db->rawQuery("insert into clicks (userId,IP,actionType,actionId,clickDate) values
								($userId,'$IP',2,$_GET[catId],now())");
		if(isset($_GET["page"]) && $_GET["page"] == "searchRes" && isset($_POST["search"]) && strlen($_POST["search"]) > 2)
			$this->db->rawQuery("insert into searches (createdById,createdByIP,keyword,created) values
								($userId,'$IP','".$_POST["search"]."',now())");
				
	}
	
	public function getNotifications($id)
	{
		$res = $this->db->rawQuery("select * from notifications where id=$id");
		
		return $res[0];
	}
	
	public function authenticate($userName)
	{
		$_SESSION['userName'] = $userName;
		$this->access->setValues($this->db); //echo $_SESSION['userName'];exit;
		
		$upData = Array ('lastLoggedIn' => $this->db->now());
		$this->db->where("userName = '" . $userName . "'");
		$cnt = $this->db->update("users", $upData);
	}
	
	public function isSubscribed($catId)
	{
		$this->db->where("catId=$catId and userId=".$this->access->userId);
		$this->db->get("subscriptions");
		if($this->db->count>0)
			return true;
		return false;
	}
	
	public function getSubsCnt($catId)
	{
		$res = $this->db->rawQuery("select count(*) cnt from subscriptions where catId=".$catId);
		return $res[0]["cnt"];
	}
	
	public function getDetailData($qry)
	{
		return $this->db->rawQuery($qry);
	}
	
	public function getUserName($userId)
	{
		$res = $this->db->rawQuery("select concat(firstName,' ',lastName) userName from users where id=$userId");
		return $res[0]["userName"];
	}
	
	public function compressImage($source_url, $destination_url, $quality) 
	{
		$info = getimagesize($source_url); 
		if ($info['mime'] == 'image/jpeg') 
			$image = imagecreatefromjpeg($source_url); 
		elseif ($info['mime'] == 'image/gif') 
			$image = imagecreatefromgif($source_url); 
		elseif ($info['mime'] == 'image/png') 
			$image = imagecreatefrompng($source_url); 
		imagejpeg($image, $destination_url, $quality); 
		return $destination_url; 
	} 
	
	public function logAction2($actionId,$action)
	{
		$id = $this->db->insert("logs",array(
								"actionDate"=>date("Y-m-d H:i:s"),
								"actionId"=>$actionId,
								"action"=>$action,
								"createdById"=>$this->access->userId,
								"createdByIP"=>$_SERVER["REMOTE_ADDR"]								
								)); 
								//echo "id=".$id.$this->db->getLastQuery();
	}
	
	public function logAction($actionId)
	{
		$id = $this->db->insert("logs",array(
								"actionDate"=>date("Y-m-d H:i:s"),
								"actionId"=>$actionId,
								"createdById"=>$this->access->userId,
								"createdByIP"=>$_SERVER["REMOTE_ADDR"]								
								)); 
								//echo "id=".$id.$this->db->getLastQuery();
	}
}
?>