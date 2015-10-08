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

<link rel="stylesheet" href="./css/menuStyles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="./js/menuScript.js"></script>
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
					<li><a href='#'><span>Profile</span></a></li>
					<li><a href='roles.php'><span>Roles</span></a></li>
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
<div style="padding-top:30px;min-height: 1000px;">
	
	<!-- Info message boxes 
	<div class="info">Info message</div>
	<div class="success">Successful operation message</div>
	<div class="warning">Warning message</div>
	<div class="error">Error message</div>
	<!-- End Info message boxes 
	{if isset($errorMessage)}
	<div class="err">{$errorMessage}</div>
	{/if}
	{if isset($okMessage)}
	<div class="success1">{$okMessage}</div>
	{/if}-->
	
<form class="reg-form" name="regForm" id="regForm" action="?page=reg&action=reg" method="post"><br>
	<div class="topgap">
	<label>Name:
	<div class="gap"><input class="field" type="text" name="name" id="name" value=""></div></label></div><br>

	<div class="topgap">
	<label>Surname:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value=""></div></label></div><br>

	<div class="topgap">
	<label>Father Name:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value=""></div></label></div><br>

	<div class="topgap">
	<label>Gender:
	<div class="gender">
		<input type="radio" name="gender" id="gender" value=1 >male
		<label><input type="radio" name="gender" id="gender" value=2 >female</label>
	</div>
	</label></div><br>


	<div class="topgap">
	<label>Email:
	<div class="gap"><input class="field" type="email" name="email" id="email" value=""></div></label></div><br>


	<div class="topgap">
	<label>Phone:
	<div class="gap"><input class="field" type="text" name="phone" id="phone" value=""></div></label></div><br>

	<div class="topgap">
			<label>Language:
	<div class="gap">
			<select class="field" name="lang" id="lang" style="width:231px; height:25px">
				   <option value="az">Azerbaijani</option>
				   <option value="en">English</option>
				   <option value="ru">Russian</option>
				  </select></div></label>
				  </div>
				  <br>


	<div class="topgap">
	<label>Username:
	<div class="gap"><input class="field" type="text" name="username" id="username" value="user1" disabled></div></label></div><br>

	<div class="topgap">
	<label>Password:
	<div class="gap"><input class="field" type="password" name="password" id="password" ></div></label></div><br>
	
	<div class="topgap">
	<label>PasswordAgain:
	<div class="gap"><input class="field" type="password" name="passwordAgain" id="passwordAgain" ></div></label></div><br>

	<!--<div class="topgap">
	<label>{$captcha}: 
	<div class="gap"><img width="132" height="44" alt="" src="./Registration_files/captcha.png"></div></label></div>
	<div class="topgap">
	<label>
	<div class="gap">
	<input class="field" type="text" name="captcha" id="captcha"></div></label></div>-->
	
	<!--
	<div class="topgap" style="padding-top:8px;">
	<label>Roles:
	<div class="gap"><input class="field" type="text" name="username"></div></label></div>
	--><br><br>


	<input class="cancel2" type="submit" value="Cancel" name="submit">

	<input class="login39" type="submit" value="Save" name="submit">

</form>
</div
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
</body>
</html>