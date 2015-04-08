<script>
$(document).ready(function() {
    var validator = $("#logForm").validate({
        rules: {
            userName: "required",
			password: "required",
        },
        messages: {
			userName:"",
			password:"",
        },
    });
});
</script>
<body>
<div id="wrapper">
				{if isset($errorMessage)}
				<div class="err">
						{$errorMessage}
				</div>
				{/if}
	<div class="banner">
		<div class="min-cont">
			<form>
				<input class="search" type="search" name="search" value="" placeholder="{$search}">
				<a href="#"><img class="s-img" src="img/search.png" /></a>
			</form>
			<div class="tags" id="tags1">
				
			</div>
			
			<div class="login">
				<ul class="lang">
					<!--<li>Lang:</li>-->
					{if isset($greeting)}
					<li><a>{$greeting}, {$loggedUser}</a></li>
					<li><a href="?admin.php">{$adminPanel}</a></li>
					<li><a href="?action=logout">{$logout}</a></li>
					{/if}
					<li><a href="?lang=az">AZ</a></li>
					<li><a href="?lang=ru">RU</a></li>
					<li><a href="?lang=en">EN</a></li>
				</ul>
				<div style="height:140px;float:left;width:130px">
					<a href="?page=addVideo"><input class="login3" type="submit" value="{$addVideo}" name="submit"></a>
				</div>
				<div style="height:140px;float:right;width:170px">
				<form name="logForm" id="logForm" action="?action=login" method="post">
					<a  href="other-user.html"><img class="fb" src="img/fb.png" /></a>
					<a  href="other-user.html"><img class="odn" width="22" width="23"  src="img/odn.png" /></a>
					<input class="u-n" type="text" name="userName" value="" placeholder="{$userName}">
					<input class="pw" type="password" name="password" value="" placeholder="{$password}">
					<input class="loginLg" type="submit" value="{$login}" name="submit">
					<input class="login33" type="submit" value="{$signUp}" name="submit">
					
				</form>
				</div>
			</div> 
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user" align="center"> 
			<a  href="other-user.html"><img class="statistics1"  src="img/1.png" /></a>
			<p class="counts">{$users} ({$userCnt})</p>
			<a href="alltags.html"><img class="statistics2" src="img/2.png" /></a>
			<p class="counts">{$tags} ({$tagCnt})</p>
			<a href="index.html"><img class="vid" src="img/3.png" /></a>
			<p class="counts">{$videos} ({$videoCnt})</p>
		</div>
		 <!--Statistics Bar End-->