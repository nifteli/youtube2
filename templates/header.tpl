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
					<div class="sosialBtn">
					{if !isset($greeting)}
					<a  href="?action=fbLogin"><img class="fb" src="img/fb.png" /></a>
					<a  href="https://connect.mail.ru/oauth/authorize?client_id=734021&response_type=code&redirect_uri=http://pfs.az/?action=mailruLogin"><img class="odn" width="22" width="23"  src="img/mailru.png" /></a>
					{/if}
					</div>
					<input class="u-n" type="text" name="userName" value="" placeholder="{$userName}">
					<input class="pw" type="password" name="password" value="" placeholder="{$password}">
					<a class="forgotPass" href="?page=forgotPass">{$forgotPass}</a>
					<input class="loginLg" type="submit" value="{$login}" name="submit">
					<a href="?page=reg"><input class="login33" type="button" value="{$signUp}" name="submit"></a>
					
				</form>
				</div>
			</div> 
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user" align="center"> 
			<a  href="?page=users"><img class="statistics1"  src="img/1.png" /></a>
			<p class="counts">{$users} ({$userCnt})</p>
			<a href="?page=allTags"><img class="statistics2" src="img/2.png" /></a>
			<p class="counts">{$tags} ({$tagCnt})</p>
			<a href="?index.php"><img class="vid" src="img/3.png" /></a>
			<p class="counts">{$videos} ({$videoCnt})</p>
		</div>
		 <!--Statistics Bar End-->