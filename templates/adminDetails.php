<?php

class AdminDetails
{
	private $adminDetails;
	
	public function __construct($controller)
	{
		global $content;
		global $result;
		global $messages;
		global $query;
		global $id;
		global $condName;
		
		$this->adminDetails = new SmartyBC;
		$this->adminDetails->assign("condName", $condName);
		$this->adminDetails->assign("id", $id);
		$this->adminDetails->assign("lang", $controller->lang);
		$this->adminDetails->assign("result", $result);
		$this->adminDetails->assign("messages", $messages);
		$this->adminDetails->assign("export", $content['EXPORT']);
		
		$this->adminDetails->assign("titleDetails", $_GET["title"]);
		$this->adminDetails->assign("s", $_GET["s"]);
		$this->adminDetails->assign("q", $_GET["q"]);
		
		if(isset($query[$_GET["s"]][$_GET["q"]]))
		{
			$data = $controller->getDetailData($query[$_GET["s"]][$_GET["q"]]);
			if(count($data) >0)
			{
				$this->adminDetails->assign("rowCnt", count($data));
				$this->adminDetails->assign("columnCnt", count($data[0]));
				$this->adminDetails->assign("data",$data);
				foreach($data[0] as $key=>$value)
				{
					$colNames[] = $key;
				}
				$this->adminDetails->assign("colNames", $colNames);
			}
		}
	}
		
	public function Show()
	{
		global $templatePath;
		
		$this->adminDetails->display($templatePath."adminDetails.tpl");
	}
	
}

?>