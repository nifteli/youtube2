<?php

class AllTags
{
	private $allTags;
	
	public function __construct($controller)
	{
		global $content;
		
		$this->allTags = new Smarty;
		$this->getTagsList($controller->lang,$controller->db,$tagLetters,$allTags);
		$this->allTags->assign("tagLetters",$tagLetters);
		$this->allTags->assign("allTags",$allTags);
		$this->allTags->assign("allTagsTitle",$content['ALLTAGS']);
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->allTags->display($templatePath."allTags.tpl");
	}
	
	private function getTagsList($lang,$db,&$tagLetters,&$allTags)
	{
		$j=0;
		$letter="";
		$qry = "SELECT ucase(substr(t.name,1,1)) letter,t.name, 
						vt.tagId,count(*) cnt
				FROM videotags vt
				inner join tags t on t.id=vt.tagId
				inner join languages l on l.id=t.langId
				where lower(l.abbr)='$lang'
				group by vt.tagId,t.name
				order by t.name";
		$res = $db->rawQuery($qry);
		if($db->count > 0)
		{
			for($i=0; $i<$db->count; $i++)
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
		//echo "<pre>";print_r($allTags);echo "</pre>";
	}
}

?>