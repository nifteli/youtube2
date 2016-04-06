<script>
$(function() {
$( "#userName" ).focus();
});

</script>	

<!--Videos thums Start-->			 

<div style="padding-top:10px;min-height: 1000px;">
	{if $errorMessage != ''}
	<div class="err" style="width:911px; margin-top:40px">{$errorMessage}</div>
	{/if}
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
		<form name="logForm" id="logForm" action="?page=signIn&action=login" method="post">
			<div style="float:left;width:100%">
			<input class="u-n" type="text" name="userName" id="userName" value="" placeholder="{$userName}">
			<input class="pw" type="password" name="password" value="" placeholder="{$password}">
			<input type="hidden" name="src" value="{$src}">
			<!-- <input class="loginLg" type="submit" value="{$login}" name="submit">	 -->
			<input class="btnSearch" type="image" src="img/signIn_{$lang}.png" name="submit" style="height: 25;margin-left: 5;margin-top: 4;"
					onmouseover="this.src='img/signInSelected_{$lang}.png';"
					onmouseout="this.src='img/signIn_{$lang}.png';"
					onmousedown="this.src='img/signInPushed_{$lang}.png';">			
			</div>
			<div style="float:left;width:400px">
			<div style="width:189px;float: left;    padding-left: 2px;"><label><input type="checkbox" checked name="rememberMe">{$rememberMe}</label></div>
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