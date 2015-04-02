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
					<li><a>Salam User</a></li>
					<li><a>Admin Panel</a></li>
					<li><a href="?lang=az">AZ</a></li>
					<li><a href="?lang=ru">RU</a></li>
					<li><a href="?lang=en">EN</a></li>
				</ul>
				<div style="height:140px;float:left;width:130px">
					<a href="add-video.html"><h5>{$addVideo}</h5></a>
				</div>
				<div style="height:140px;float:right;width:170px">
				<form action="?action=login" method="post">
					<a  href="other-user.html"><img class="fb" style="margin-left:7px;" src="img/fb.png" /></a>
					<a  href="other-user.html"><img class="odn" width="22" width="23"  src="img/odn.png" /></a>
					<input class="u-n" type="text" name="userName" value="" placeholder="{$userName}">
					<input class="pw" type="text" name="password" value="" placeholder="{$password}">
					<a href="#" onclick="$(this).closest('form').submit()"><h3>{$login}</h3></a>
					<a href="#" onclick="$(this).closest('form').submit()"><h3 style="margin-top: -31px;width: 83px; margin-left: 100px;">{$signUp}</h3></a>
				</form>
				</div>
			</div> 
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user"> 
			<a  href="other-user.html"><img class="statistics1"  src="img/1.png" /></a>
			<p class="counts">{$users} ({$userCnt})</p>
			<a href="alltags.html"><img class="statistics2" src="img/2.png" /></a>
			<p class="counts">{$tags} ({$tagCnt})</p>
			<a href="index.html"><img class="vid" src="img/3.png" /></a>
			<p class="counts">{$videos} ({$videoCnt})</p>
		</div>
		 <!--Statistics Bar End-->