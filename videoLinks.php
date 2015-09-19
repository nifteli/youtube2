<?php
session_start();
$sessionId = session_id();

include("./configs/paths.php");
$lang = $_SESSION["lang"];
include($langsPath."content_".$lang.".php");

require_once 'configs/conf.php';
// include the jqGrid Class
require_once ABSPATH."classes/php/PHPSuito/jqGrid.php";
// include the driver class
require_once ABSPATH."classes/php/PHPSuito/DBdrivers/jqGridPdo.php";
// Connection to the server
$conn = new PDO(DB_DSN,DB_USER,DB_PASSWORD);
// Tell the db that we use utf-8
$conn->query("SET NAMES utf8");

// Create the jqGrid instance
$grid = new jqGridRender($conn);
//$grid->debug = true;
// Write the SQL Query

$grid->SelectCommand = "SELECT v.id, v.name, v.info, v.added, 
								l.name$lang, v.link,
								concat(u.firstName,' ',u.lastName) addedBy,
								GROUP_CONCAT(DISTINCT t.name ORDER BY t.name asc) tags,
								c.catName$lang
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
						";

$grid->table = 'videos'; 
//$grid->setPrimaryKeyId('id'); 
$grid->serialKey = false; 

// set the ouput format to json
$grid->dataType = 'json';
// Let the grid create the model
$grid->setColModel();
// Set the url from where we obtain the data
$grid->setUrl('videoLinks.php');
$_POST["added"] =  date("m/d/Y");//date("m/d/Y", strtotime($_POST["added"]));
	//echo $_POST["added"];
// Set some grid options
$grid->setGridOptions(array(
	"rowNum"=>100,
	//"sortname"=>"id",
	"height"=>1000,
	"caption"=>"videoLinks"));
	
// Change some property of the field(s)
$grid->setColProperty("id", array("label"=>"No","width"=>"30","editable"=>false,"editoptions"=>array("readonly"=>true)));
$grid->setColProperty("name", array("label"=>"Adı","width"=>"30"));
$grid->setColProperty("info", array("label"=>"Məlumat","width"=>"50"));
$grid->setColProperty("added", array("label"=>"Tarix","width"=>"30","formatter"=>"date","formatoptions"=>array("srcformat"=>"Y-m-d H:i:s","newformat"=>"d-m-Y")));
$grid->setColProperty("name$lang", array("label"=>"Dil","width"=>"30",));
$grid->setColProperty("link", array("label"=>"Link","width"=>"30"));
$grid->setColProperty("addedBy", array("label"=>"Daxil edən","width"=>"30"));
$grid->setColProperty("tags", array("label"=>"Taqlar","width"=>"30"));
$grid->setColProperty("catName$lang", array("label"=>"Kateqoriya","width"=>"30"));
//$grid->setColProperty('name', array("label"=>$content['ROLENAME'],"editrules"=>array("required"=>true),"editoptions"=>array("required"=>true),
//		"formatter"=>"showlink", "formatoptions"=>array("baseLinkUrl"=>'admin.php', "addParam"=>"&page=editRole"))); 
//$grid->setColProperty("created", array("editable"=>false,"label"=>$content["ROLECREATED"],"formatter"=>"date","formatoptions"=>array("srcformat"=>"Y-m-d H:i:s","newformat"=>"d-m-Y")));
//$grid->setColProperty("createdBy", array("label"=>$content["ROLECREATEDBY"],"editable"=>false,"editrules"=>array("edithidden"=>false, "required"=>true),"editoptions"=>array("defaultValue"=>"1"),"hidden"=>false));

/*$myevent = <<<ONSELECT
function(rowid, selected)
{
   if (rowid) alert("Row is selected");
}
ONSELECT;
$grid->setGridEvent('onSelectRow',$myevent);*/


//$grid->setColProperty("ShipName",array("classes"=>"ui-ellipsis"));
// Enable toolbar searching
$grid->toolbarfilter = true;
$grid->setFilterOptions(array("stringResult"=>true));

// Enable navigator
$grid->navigator = true;
// Enable excel export
$grid->setNavOptions('navigator', array("excel"=>true,"add"=>true,"edit"=>true,"del"=>true,"view"=>true));

// Set different Excel options (all available)
// a PHP excel lib should be preset 
$grid->setExcelOptions(array(
    "file_type"=>"Excel2007", //Excel2007,Excel5,xml
    "file"=>"report.xlsx",
    "start_cell" => "A1",
    "creator"=>"jqGrid",
    "author"=>"jqGrid",
    "title"=>"jqGrid Excel",
    "subject"=>"Office 2007 XLSX Document",
    "description"=>"Document created with Guriddo",
    "keywords"=>"Guriddo, jqGrid, Excel",
    "font"=>"Arial",
    "font_size"=>11,
    "header_title"=>"Video links",
    "protect" => false,
    "password"=>"Guriddo",
    "path_to_phpexcel_class"=>"External/phpexcel/PHPExcel.php"
));
$grid->exportfile = 'VideoLinks.xlsx';

$grid->setNavOptions('edit',array("recreateForm"=>true, "width"=>400,"height"=>'auto',"dataheight"=>'auto', "closeAfterEdit"=>true,"editCaption"=>"Update category","bSubmit"=>"Update"));
$grid->setNavOptions('add',array("recreateForm"=>true, "width"=>400,"height"=>'auto',"dataheight"=>'auto',"closeAfterAdd"=>true));
$grid->setNavOptions('view',array("recreateForm"=>true, "width"=>600,"height"=>'auto',"dataheight"=>'auto',"closeAfterAdd"=>true));

// Enjoy
$grid->renderGrid('#grid','#pager',true, null, null, true,true);