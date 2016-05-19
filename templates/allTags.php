<?php

class AllTags
{
	private $allTags;
	
	public function __construct($controller)
	{
		global $content;
		$allLetters = array();
		
		$this->allTags = new Smarty;
		$this->getTagsList($controller->lang,$controller->db,$tagLetters,$allTags,$allLetters,$_GET["l"]);
		$this->allTags->assign("tagLetters",$tagLetters);
		$this->allTags->assign("allTags",$allTags);
		$this->allTags->assign("allLetters",$allLetters);
		$this->allTags->assign("allTagsTitle",$content['ALLTAGS']);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->allTags->display($templatePath."allTags.tpl");
	}
	
	private function getTagsList($lang,$db,&$tagLetters,&$allTags,&$allLetters,$cond)
	{
		$j=0;
		$letter="";
		$allLetters[] = "#";
		
		$qry = "SELECT ucase(substr(t.name,1,1)) letter,t.name,t.id tagId,
				count(vc.categoryId) cnt
				FROM tags t
				left join videotags vt on vt.tagId=t.id
				left join videocats vc on vc.videoId=vt.videoId
				group by 
				ucase(substr(t.name,1,1)),t.name,t.id
				ORDER BY t.name";
		$res = $db->rawQuery($qry);
		if($db->count > 0)
		{
			for($i=0; $i<$db->count; $i++)
			{
				if(!in_array($res[$i]["letter"],$allLetters) && !is_numeric($res[$i]["letter"]))
					$allLetters[] = $res[$i]["letter"];
				if(trim($cond) == "")
				{
					if($j == 4) $j = 0;
					if($letter != $res[$i]["letter"])
					{
						$tagLetters[$j][] = $res[$i]["letter"];
						$letter = $res[$i]["letter"];
						$j++;
					}
					$allTags[$letter][] = array("tagId"=>$res[$i]["tagId"],"tagName"=>$res[$i]["name"],"cnt"=>$res[$i]["cnt"]);
				}
			}
		}
		
		if(trim($cond) != "")
		{ 
			if($cond == "0")
				$cond = " REGEXP '^-?[0-9]+$' ";
			else
				$cond = " ='$cond' ";
			$qry = "SELECT ucase(substr(t.name,1,1)) letter,t.name,t.id tagId,
				count(vc.categoryId) cnt
				FROM tags t
				left join videotags vt on vt.tagId=t.id
				left join videocats vc on vc.videoId=vt.videoId
				where ucase(substr(t.name,1,1)) ".$cond."
				group by 
				ucase(substr(t.name,1,1)),t.name,t.id";
			$res = $db->rawQuery($qry); //echo $qry;
			if($db->count > 0)
			{
				for($i=0; $i<$db->count; $i++)
				{
					if(!in_array($res[$i]["letter"],$allLetters) && !is_numeric($res[$i]["letter"]))
					$allLetters[] = $res[$i]["letter"];
					if($j == 4) $j = 0;
					if($letter != $res[$i]["letter"])
					{
						$tagLetters[$j][] = $res[$i]["letter"];
						$letter = $res[$i]["letter"];
						$j++;
					}
					$allTags[$letter][] = array("tagId"=>$res[$i]["tagId"],"tagName"=>$res[$i]["name"],"cnt"=>$res[$i]["cnt"]);
				}
			}
		}
		//echo "<pre>";print_r($allTags);echo "</pre>";
	}
}

?>