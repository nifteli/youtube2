<html>
<head>
	<meta charset="utf-8">
	<title>www.howtubesmart.com</title>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="fonts/stylesheet.css"/>
	<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
	
	
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
	  <link rel="stylesheet" href="css/datePicker/jquery-ui.css">
	  <!--<script src="js/datePicker/jquery-1.10.2.js"></script>-->
	  <script src="js/datePicker/jquery-ui.js"></script>
	  <script src="js/datePicker/datepicker-az.js"></script>
	  <script src="js/datePicker/datepicker-ru.js"></script>
	<!--Back to top-->
	<script src="js/backToTop/modernizr.js"></script> <!-- Modernizr -->
	<script src="js/backToTop/main.js"></script>
	<!--validation scripts-->
	<script src="js/jquery.validate.min.js"></script>
	
	<!-- Multiselect combobox -->
	<link rel="stylesheet" href="css/jquery.multiselect.css" />
	<script src="js/jquery.multiselect.js" type="text/javascript"></script>
	
</head>
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