<?php

class AdminReports
{
	private $adminReports;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		
		$this->adminReports = new SmartyBC;
		if(isset($_GET["id"]) && is_numeric($_GET["id"]))
		{
			$videoId = $_GET["id"];
			
			$info = $this->getReports($controller,$videoId);
			$this->adminReports->assign("reports", $info);
			$this->adminReports->assign("titleReports", $videoId." ".$info[0]["name"]);
			
			$this->adminReports->assign("reportReason", $content['REPORTREASON']);
			$this->adminReports->assign("reportNote", $content['REPORTNOTE']);
			$this->adminReports->assign("reportDate", $content['REPORTDATE']);
			$this->adminReports->assign("reporter", $content['REPORTER']);
			
			$this->adminReports->assign("save", $content['SAVE']);
			$this->adminReports->assign("lang", $controller->lang);	
		}
	}
	
	public function Show()
	{
		global $templatePath;
		
		$this->adminReports->display($templatePath."adminReports.tpl");
	}
	
	private function getReports($controller,$videoId)
	{
		//$db->where("id=$id");
		$res = $controller->db->rawQuery("select v.name, rs.reason".$controller->lang." reportReason, r.desc reportNote, r.reportDate, concat(u.firstName,' ',u.lastName) reporter
											from videoreports r
											left join reportreasons rs on rs.id=r.reasonId
											left join users u on u.id=r.reporterId
											inner join videos v on v.id=r.videoId
											where r.videoId=".$videoId);
		return $res;
	}
	
	
}

?>