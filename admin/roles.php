<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Profile</title>
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
	<link href="./css/tabcontent.css" rel="stylesheet" type="text/css">
	<script src="./js/tabcontent.js" type="text/javascript"></script>   

	<!--menu-->
	<link rel="stylesheet" href="./css/menuStyles.css">
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script src="./js/menuScript.js"></script>

	<!--jsgrid-->
	<!--<link rel="stylesheet" type="text/css" media="screen" href="./css/jquery-ui.css" />-->
    <link rel="stylesheet" type="text/css" media="screen" href="./css/trirand/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="./css/ui.multiselect.css" />
	
	<link rel="stylesheet" type="text/css" media="screen" href="./css/jquery-ui-1.11.4.custom/jquery-ui.css" />
	<!--<link rel="stylesheet" type="text/css" media="screen" href="./css/jquery-ui.css" />-->
	<style type="text">
        html, body {
        margin: 0;            /* Remove body margin/padding */
        padding: 0;
        overflow: hidden;    /* Remove scroll bars on browser window */
        font-size: 75%;
        }
    </style>
	<script src="./js/jquery.min.js" type="text/javascript"></script>
    <script src="./js/trirand/i18n/grid.locale-en.js" type="text/javascript"></script>
    <script src="./js/trirand/jquery.jqGrid.min.js" type="text/javascript"></script> 
	<script type="text/javascript">         
		$.jgrid.no_legacy_api = true;
		$.jgrid.useJSON = true;
		$.jgrid.defaults.width = "900";
    </script>
    <script src="./js/trirand/src/jquery.jqGrid.js" type="text/javascript"></script>
    <script src="./js/jquery-ui.min.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper">
	<div class="banner">
		 
		<div class="logout"><a href="#"><h3>logout</h3></a></div>
	</div>  
</div>
    
<div class="min-cont bg">

		<div style="width:250px; height: 600px auto; margin-left:21px;float:left">
			<div id='cssmenu'>
				<ul>
				   <li class='active'><a href='#'><span>Admin Panel</span></a></li>
					<li><a href='profile.php'><span>Profile</span></a></li>
					<li><a href='#'><span>Roles</span></a></li>
					<li><a href='#'><span>Users</span></a></li>
					<li><a href='#'><span>Messages</span></a></li>
				   <li><a href='#'><span>Video links</span></a>
				   <li><a href='#'><span>Comments</span></a>
				   <li><a href='#'><span>Folders</span></a>
				   <li><a href='#'><span>Tags</span></a>
				   <li class='has-sub'><a href='#'><span>Audit</span></a>
					  <ul>
						 <li><a href='#'><span>Menu 1</span></a></li>
						 <li><a href='#'><span>Menu 2</span></a></li>
						 <li class='last'><a href='#'><span>Product 3</span></a></li>
					  </ul>
				   </li>
				   <li class='has-sub'><a href='#'><span>About</span></a>
					  <ul>
						 <li><a href='#'><span>Company</span></a></li>
						 <li class='last'><a href='#'><span>Contact</span></a></li>
					  </ul>
				   </li>
				   
				</ul>
			</div>
		</div>

		<div>
		<!--<input class="newRole" type="button" value="New role" name="submit">-->
		<br/><br/><br/>
		<div style="float:right; margin-right:15px">
		  <?php include ("grid.php");?>
		</div>
		</div>

    
		<!--footer starts-->
		 <div class="footer">
			<div class="cont">
				<div class="f-details">
					<!--<h2> All Rights Reserved</h2>-->
					<ul class="d-move"> 
						<li><a href="#">Website Usage Rules</a></li>
					</ul>
				</div>
				<div class="f-details">
					<!--<h2> All Rights Reserved</h2>-->
					<ul style="text-align: left; margin-right:40%"> 
						<li><a href="#"></a></li>
					</ul>
				</div>
				<div class="f-details">
					<!--<h2> All Rights Reserved</h2>-->
					<ul style="float:left;"> 
						<li><a href="#">Other info</a></li>
					</ul>
				</div>
			</div>
		</div>
<!--footer Ends-->
</div>
</body>
</html>