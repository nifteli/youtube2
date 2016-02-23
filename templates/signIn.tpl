<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

<div style="padding-top:10px;min-height: 1000px;">
	<div class="pic-cont" style="font-weight:bold">
	
	<b> {$signInNote1} <a href="?page=rules">{$signInNote2} </a> <br><br>

	{$signInNote3} <br><br>

	{$signInNote4} <br>
	<a  href="?action=fbLogin"><img width="22" width="23" class="fbs" src="img/fb.png" /></a>
	<a  href="https://connect.mail.ru/oauth/authorize?client_id=734021&response_type=code&redirect_uri=http://pfs.az/?action=mailruLogin"><img class="odns" width="22" width="23"  src="img/mailru.png" /></a>
	<br><br>
	{$or} 
	<br><br>
	{$signInNote5} 
	<div class="logForm">
		<form name="logForm" id="logForm" action="?action=login" method="post">
			<div style="float:left;width:100%">
			<input class="u-n" type="text" name="userName" value="" placeholder="{$userName}">
			<input class="pw" type="password" name="password" value="" placeholder="{$password}">
			<!-- <input class="loginLg" type="submit" value="{$login}" name="submit">	 -->
			<input class="btnSearch" type="image" src="img/signIn_{$lang}.png" name="submit" style="height: 25;margin-left: 5;margin-top: 4;"
					onmouseover="this.src='img/signInSelected_{$lang}.png';"
					onmouseout="this.src='img/signIn_{$lang}.png';"
					onmousedown="this.src='img/signInPushed_{$lang}.png';">			
			</div>
			<div style="float:left;width:400px">
			<div style="width:189px;float: left;    padding-left: 2px;"><label><input type="checkbox" name="rememberMe">{$rememberMe}</label></div>
			<div style="width:189px;float: left;    padding-left: 4px;"><a class="forgotPass" href="?page=forgotPass">{$forgotPass}</a></div>
			</div>
		</form>
	</div>
	<br><br><br>
	{$or}
	<br><br>
	
	{$signInNote6}  <a href="?page=reg">{$signUp}</a>.
	</div>

</div>