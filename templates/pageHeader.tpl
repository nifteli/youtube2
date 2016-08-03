<html>
<head>
	<meta charset="utf-8">
	<title>www.howtubesmart.com</title>
	<meta name="keywords" content="youtube,links,what,who,how,why">
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="fonts/stylesheet.css"/>
	<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
	
	
	<script src="js/tabcontent.js" type="text/javascript"></script>
	<!--tag scripts-->
	<link rel="stylesheet" href="css/jqcloud.min.css">
	<script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/jqcloud.min.js"></script>
	<script src="js/youtube.js"></script>
	<!--VideoJS -->
	<link type="text/css" rel="stylesheet" href="css/video-js.css" />
	<script src="js/videoJs/video.js"></script>
	<script src="js/videoJs/youtube.js"></script>
	<!--Dateapicker-->
	  <!-- <link rel="stylesheet" href="css/datePicker/jquery-ui.css"> -->
	  <link rel="stylesheet" type="text/css" media="screen" href="./css/admin/jquery-ui-1.11.4.custom/jquery-ui.css" />
	  <!--<script src="js/datePicker/jquery-1.10.2.js"></script>-->
	  <script src="js/jquery.min.js"></script> 
	  <script src="js/datePicker/jquery-ui.js"></script>
	  <script src="js/datePicker/datepicker-az.js"></script>
	  <script src="js/datePicker/datepicker-ru.js"></script>
	<!--Back to top-->
	<script src="js/backToTop/modernizr.js"></script> <!-- Modernizr -->
	<script src="js/backToTop/main.js"></script>
	<!--validation scripts-->
	<script src="js/jquery.validate.min.js"></script>
	
	<!-- Multiselect combobox -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>  -->
	<link rel="stylesheet" href="css/jquery.multiselect.css" />
	<script src="js/jquery.multiselect.js" type="text/javascript"></script>
	
	<!--AwesomeCloud-->
	<script src="js/jquery.awesomeCloud.min.js"></script>
	<link href="css/jquerysctipttop.css" rel="stylesheet" type="text/css"> 
	<style type="text/css">
	.wordcloud {
	height: 70px;
	margin: 0in auto;
	padding: 0;
	page-break-after: always;
	page-break-inside: avoid;
	width: 840px;
	float: left;
	display:none;
	}
	</style> 
	
</head>
<script type="text/javascript">
	var hasAccess = "{$hasAccess}"; 
	var folderTab = "{$folderTab}"; 
	var catTab = "{$catTab}"; 
	var userId="{$userId}";
	var myUserId="{$myUserId}";
	var general="{$general}";
	
	$(document).ready(function(){
	/////tag cloud
	$("#wordcloud1" ).show();
	$("#wordcloud1").awesomeCloud({
		"size" : {
			"grid" : 1,
			"factor" : 10,
			"normalize" : false						
		},
		"options" : {
			"color" : "random-dark",
			"rotationRatio" : 0,
			"printMultiplier" : 1,
			"sort" : "random"
		},
		"font" : "'Times New Roman', Times, serif",
		"shape" : "square"
	});
	////
	
	
	if(hasAccess == "1" && myUserId == userId && general=="true")	
		changeView(2);
	
	if(hasAccess == "1" && myUserId != userId)
		changeView(3);
	if(folderTab == "1")
		$('#tabSel').val(1);
	if(catTab == "1")
		$('#tabSel').val(2);
		
		//
	$('#navigation ul a').click(function(){
		$('#navigation ul a').removeClass('selected');
		$(this).addClass('selected');
		//$('#content_changer').html('You have selected '+ $(this).html());
		if($(this).attr("id") == 1)
		{
			showCatalogues();
		}
		else if($(this).attr("id") == 2)
		{
			showAdded();
		}
		else	
		{	
			$('#viewCat').hide();
			$('#viewAdd').hide();
		}
	});
	$('#tabs li a').click(function(){	
		$('#navigation ul a').removeClass('selected');
		$('#viewCat').hide();
		$('#viewAdd').hide();
	});
});
	
</script>
 
<script>
$(document).on("click", '.subscription', function eventHandler(e) {
    //alert(e.target.id);
	var res = e.target.id.split(":");
  //alert ("id="+res[0]+"flag="+res[1]);return;
	action="unSubscribe";
	if(res[1] == 1)
		action="subscribe";
	$.ajax({
     type: "GET",
     url: 'ajax/ajaxActions.php',
     data: "action="+action+"&catId="+res[0], 
     success: function(data) {
	 //alert("action=likeIt&videoId="+videoId+"&flag="+flag);
	 //alert(data+"=data");
		if(data=="") return;
        $('[id=subs'+res[0]+']').html(data);
		
     }
   });
});
</script>