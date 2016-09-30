<script>
{if (isset($rEmail) && isset($rHash))}
$(document).ready(function() {
    var validator = $("#regForm").validate({
        rules: {
            password: "required",
			passwordAgain: "required"
        },
        messages: {
			password:"",
			passwordAgain:""
        },
    });
});
{else}
$(document).ready(function() {

    var validator = $("#regForm").validate({
        rules: {
            email: "required"
        },
        messages: {
			email: ""
        },
    });
});
{/if}

function submitForm1()
{
	var email = "";
	var uname = "";
	var secretQuestionId = "";
	var secretAnswer = "";
	var password = "";
	var passwordAgain = "";
	var secret = "{$secret}";
	var rEmail = "{$rEmail}";
	var rHash = "{$rHash}";
	var frm = document.getElementById('resetPass1') || null;
	var frm2 = document.getElementById('frmSec1') || null;
	
	if (secret == "1" || (rEmail != "" && rHash != ""))
	{
		if (document.getElementById('password') != null) 
			password = document.getElementById('password').value.trim();
		if (document.getElementById('passwordAgain') != null) 
			passwordAgain = document.getElementById('passwordAgain').value.trim();
		if(password == "")
		{
			document.getElementById('password').focus();
			return false;
		}
		if(passwordAgain == "")
		{
			document.getElementById('passwordAgain').focus();
			return false;
		}
		if(passwordAgain != password)
		{
			document.getElementById('passwordAgain').focus();
			return false;
		}
		//alert(frm);
		if(frm) 
		{
			frm.action = "?page=forgotPass&action=resetPass&hash=" + rHash + "&email=" + rEmail; 
			document.getElementById('resetPass1').submit();
		}
		return false;
	}
	
	if (document.getElementById('email') != null) 
		email = document.getElementById('email').value.trim();
	if (document.getElementById('uname') != null) 
		uname = document.getElementById('uname').value.trim();
	if (document.getElementById('secretQuestionId') != null) 
		secretQuestionId = document.getElementById('secretQuestionId').value.trim();
	if (document.getElementById('secretAnswer') != null) 
		secretAnswer = document.getElementById('secretAnswer').value.trim();
	
	
	//alert("ss");
	if(email == "" && uname == "" && secretAnswer == "" && secretQuestionId == "")
	{ 
		document.getElementById('email').focus();
		return false;
	}
	if(email == "" && uname == "")
	{ 
		document.getElementById('uname').focus();
		return false;
	}
	if(email == "" && secretQuestionId == "")
	{ 
		document.getElementById('secretQuestionId').focus();
		return false;
	}
	if(email == "" && secretAnswer == "")
	{ 
		document.getElementById('secretAnswer').focus();
		return false;
	}
	
	if(uname != "" && secretQuestionId != "" && secretAnswer != "")
	{ //alert(frm2);
		if(frm) 
		{
			frm.action = "?page=forgotPass"; 
			document.getElementById('resetPass1').submit();
		} 
	}
	else
		document.getElementById('resetPass1').submit();
}
</script>

<div style="padding-top:10px;min-height: 1000px;">
	<div class="forgotPass" style="width:995px;">
		<div class="hollywd">
		<h2>{$forgotPass}</h2>  
		</div>
		{if isset($errorMessage)}
		<div class="err" style="margin-top:20px; float:left; ">{$errorMessage}</div>
		{/if}
		{if isset($okMessage)}
		<div class="success1" style="margin-top:20px; float:left; ">{$okMessage}</div>
		{/if}
		
		{if !isset($okMessage)}
		<form class="reg-form" name="resetPass1" id="resetPass1" action="?page=forgotPass&action=sendToMail&hash={$rHash}&email={$rEmail}" method="post" style="margin-top:20px">
		{if ($secret == 1 || (isset($rEmail) && isset($rHash)))}
			<input class="field" type="password" name="password" id="password" required placeholder="{$password}" style="margin-left:0"><br>
			<input class="field" type="password" name="passwordAgain" id="passwordAgain" required placeholder="{$passwordAgain}" style="margin-left:0"><br>
			<!-- <input class="login39" type="submit" value="{$save}" name="submit" style="height:30px;    margin-left: 40px;"> -->
		<!-- </form> -->
		{else}
		<!-- <form class="reg-form" name="sendToMail" id="sendToMail" action="?page=forgotPass&action=sendToMail" method="post" style="margin-top:20px"> -->
		<div class="topgap">
			<div class="gap" style="margin-left:0;    float: left;"><input class="field" type="email" name="email" id="email" placeholder="{$email}" value="{if isset($emailVal)} {$emailVal} {/if}" style="margin-left:0">
			<!-- <input class="login39" type="submit" value="{$sendToMail}" name="submit" style="height:30px;margin-left:5px;    margin-top: 2px;"> -->
			</div>
		</div>
		<div style="width:900px;float: left;">
		{$or} <br>
		{$forgotPassNote} <br>
		<!-- <form name="frmSec1" id="frmSec1" action="?page=forgotPass" method="post"> -->
			<input class="field" type="text" name="uname" id="uname" required placeholder="{$userName}">
			<select class="field" name="secretQuestionId" id="secretQuestionId" style="" required>
				<option value="">{$question}</option>
				{section name=sec1 loop=$secQuestions}
				<option value="{$secQuestions[sec1].id}">{$secQuestions[sec1].question}</option>
				{/section}
			</select>
			<input class="field" type="text" name="secretAnswer" id="secretAnswer" required placeholder="{$answer}">
			<!-- <input class="login39" type="submit" value="{$changePass}" name="submit" style="height:30px;margin-left:5px;    margin-top: 2px;"> -->
		<!-- </form> -->
		</div>
		{/if}
		<img src="img/cancel_{$lang}.png" height=30 title="{$reset}" onclick="window.history.back();"
				onmouseover="this.src='img/cancelSelected_{$lang}.png';"
				onmouseout="this.src='img/cancel_{$lang}.png';"
				onmousedown="this.src='img/cancelPushed_{$lang}.png';">
		<img src="img/confirm_{$lang}.png" height=30 title="{$confirm}" onclick="submitForm1();"
				onmouseover="this.src='img/confirmSelected_{$lang}.png';"
				onmouseout="this.src='img/confirm_{$lang}.png';"
				onmousedown="this.src='img/confirmPushed_{$lang}.png';">
		</form>
		{/if}
	</div>
 </div>


             

