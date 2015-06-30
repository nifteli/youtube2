<?php
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
// Write the SQL Query
$grid->SelectCommand = 'SELECT id,catNameAz,catInfoAz,catNameEn,catInfoEn,catNameRu,catInfoRu FROM categories';
// set the ouput format to json
$grid->dataType = 'json';
// Let the grid create the model
$grid->setColModel();
// Set the url from where we obtain the data
$grid->setUrl('grid.php');
// Set some grid options
$grid->setGridOptions(array(
	"rowNum"=>100,
	"sortname"=>"id",
	"height"=>400,
	"caption"=>"Categories"));
// Change some property of the field(s)
$grid->setColProperty("id", array("label"=>"ID","width"=>"30"));
$grid->setColProperty("catNameAz", array("label"=>"Kateqoriya adi"));
$grid->setColProperty("catNameEn", array("label"=>"Kateqoriya adi"));
$grid->setColProperty("catNameRu", array("label"=>"Kateqoriya adi"));
$grid->setColProperty("catInfoAz", array("label"=>"Info az"));
$grid->setColProperty("catInfoEn", array("label"=>"Info en"));
$grid->setColProperty("catInfoRu", array("label"=>"Info ru"));
$grid->setColProperty('id', array("editoptions"=>array("readonly"=>true)));
$grid->setColProperty('catNameAz', array("editoptions"=>array("required"=>"required")));
$grid->setColProperty('catNameEn', array("editoptions"=>array("required"=>"required")));
$grid->setColProperty('catNameRu', array("editoptions"=>array("required"=>"required")));
/*$grid->setColProperty("OrderDate", array(
    "formatter"=>"date",
    "formatoptions"=>array("srcformat"=>"Y-m-d H:i:s","newformat"=>"m/d/Y"),
    "search"=>false
    )
);*/
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
    "header_title"=>"Melumat",
    "protect" => false,
    "password"=>"Guriddo",
    "path_to_phpexcel_class"=>"External/phpexcel/PHPExcel.php"
));
$grid->exportfile = 'Report.xlsx';

$grid->setNavOptions('edit',array("recreateForm"=>true, "width"=>400,"height"=>'auto',"dataheight"=>'auto', "closeAfterEdit"=>true,"editCaption"=>"Update category","bSubmit"=>"Update"));
$grid->setNavOptions('add',array("recreateForm"=>true, "width"=>400,"height"=>'auto',"dataheight"=>'auto',"closeAfterAdd"=>true));
$grid->setNavOptions('view',array("recreateForm"=>true, "width"=>600,"height"=>'auto',"dataheight"=>'auto',"closeAfterAdd"=>true));



// Enjoy
$grid->renderGrid('#grid','#pager',true, null, null, true,true);