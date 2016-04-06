<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#dateOfBirth" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-80:-7"
	},
	$.datepicker.regional["{$lang}"]
);
//$( "#dateOfBirth" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});

function submitForm()
{
//alert($('input[name=gender]:checked').length);
	//document.getElementById('regForm').validate();
	var name = document.getElementById('name').value.trim();
	var surname = document.getElementById('surname').value.trim();
	var phone = document.getElementById('phone').value.trim();
	var username = document.getElementById('username').value.trim();
	var secretAnswer = document.getElementById('secretAnswer').value.trim();
	if(name == "")
	{
		alert("{$validationError1}");
		document.getElementById('name').focus();
		return false;
	}
	if(/[0-9]/.test(name))
	{
		alert("{$validationError2}");
		document.getElementById('name').focus();
		return false;
	}
	if(name.length<2)
	{
		alert("{$validationError3}");
		document.getElementById('name').focus();
		return false;
	}
	
	if(surname == "")
	{
		alert("{$validationError4}");
		document.getElementById('surname').focus();
		return false;
	}
	if(/[0-9]/.test(surname))
	{
		alert("{$validationError5}");
		document.getElementById('surname').focus();
		return false;
	}
	if(surname.length<2)
	{
		alert("{$validationError6}");
		document.getElementById('surname').focus();
		return false;
	}
	
	if(phone != "" && (!(/[0-9]/.test(phone)) || phone.length<5) )
	{
		alert("{$validationError7}");
		document.getElementById('phone').focus();
		return false;
	}
	
	if(document.getElementById('email').value.trim() == "")
	{
		alert("{$validationError8}");
		document.getElementById('email').focus();
		return false;
	}
	if(document.getElementById('dateOfBirth').value.trim() == "")
	{
		document.getElementById('dateOfBirth').focus();
		return false;
	}
	if ($('input[name=gender]:checked').length <= 0) 
	{
		alert("{$validationError9}");
		document.getElementById('gender').focus();
		return false;
	}
	if(username == "")
	{
		alert("{$validationError10}");
		document.getElementById('username').focus();
		return false;
	}
	if(username.length < 3)
	{
		alert("{$validationError11}");
		document.getElementById('username').focus();
		return false;
	}
	
	
	
	if(document.getElementById('password').value.trim() == "")
	{
		alert("{$validationError12}");
		document.getElementById('password').focus();
		return false;
	}
	if(document.getElementById('passwordAgain').value.trim() == "")
	{
		alert("{$validationError13}");
		document.getElementById('passwordAgain').focus();
		return false;
	}
	if(document.getElementById('password').value.trim() != document.getElementById('passwordAgain').value.trim())
	{
		alert( "{$passNotEqual}" );
		return false;
	}
	if(document.getElementById('password').value.trim().length < {$minPassLength})
	{
		alert("{$passTooShort} {$minPassLength}");
		document.getElementById('password').focus();
		return false;
	}
	
	if(secretAnswer !="" && secretAnswer.length < 3)
	{
		alert("{$validationError14}");
		document.getElementById('secretAnswer').focus();
		return false;
	}
	
	if($('input[name=agree]:checked').length <= 0)
	{
		alert("{$validationError15}");
		document.getElementById('agree').focus();
		return false;
	}
	
	document.getElementById('regForm').submit();
	//document.getElementById('regForm').submit();
}
</script>


<!--Videos thums Start-->			 


	{if isset($errorMessage)}
	<div class="err">{$errorMessage}</div>
	{/if}
	{if isset($okMessage)}
	<div class="success1">{$okMessage}</div>
	{/if}
	
<form class="reg-form" name="regForm" id="regForm" action="?page=reg&action=reg" method="post" enctype='multipart/form-data'>
	<p class="regTitles">{$mandatory} :</p>
	<input class="field" type="text" name="name" id="name" value="{if isset($nameVal)}{$nameVal}{/if}" placeholder="{$name}*" required>
	<input class="field" type="text" name="surname" id="surname" value="{if isset($surnameVal)}{$surnameVal}{/if}" placeholder="{$surname}*" required>
	<input class="field" type="email" name="email" id="email" value="{if isset($emailVal)}{$emailVal}{/if}" placeholder="{$email}*" required>
	<input class="field" type="text" name="dateOfBirth" id="dateOfBirth" value="{if isset($dateOfBirthVal)}{$dateOfBirthVal}{/if}" placeholder="{$dateOfBirth}*" required>
	<br>
	<input type="radio" name="gender" id="gender" value=1 {if isset($genderVal) && $genderVal==1} checked {/if}>{$male}
	<input type="radio" name="gender" id="gender" value=2 {if isset($genderVal) && $genderVal==2} checked {/if}>{$female}
	<p class="regTitles">{$optional} :</p>
	<input class="field" type="text" name="phone" id="phone" value="{if isset($phoneVal)}{$phoneVal}{/if}" placeholder="{$phone}">
	<select class="field" name="langId" id="langId" style="">
		<!-- <option value="">{$language}</option> -->
		{foreach from=$languages item=row1}
		{html_options values=$row1.id output=$row1.name selected=$langIdVal}
		{/foreach}
		<!-- <option value="az" {if {$langIdVal} == "az"} selected {/if}>Azərbaycan dili</option>
		<option value="en" {if {$langIdVal} == "en"} selected {/if}>English</option>
		<option value="ru" {if {$langIdVal} == "ru"} selected {/if}>Русский</option> -->
	</select>
	<input class="field" type="text" name="profession" id="profession" value="{if isset($professionVal)}{$professionVal}{/if}" placeholder="{$profession}">
	<input class="field" type="text" name="interests" id="interests" value="{if isset($interestsVal)}{$interestsVal}{/if}" placeholder="{$interests}"> <br>
	<input class="field" type="file" class="field" accept="image/*" name="pic" id="pic" />

	<p class="regTitles">{$userPassword}:</p>
	<input class="field" type="text" name="username" id="username" value="{if isset($usernameVal)}{$usernameVal}{/if}" placeholder="{$username}">
	<input class="field" type="password" name="password" id="password" placeholder="{$password}">
	<input class="field" type="password" name="passwordAgain" id="passwordAgain" placeholder="{$passwordAgain}">
	
	<p class="regTitles">{$secQuestionNot} :</p>
	<select class="field" name="secretQuestionId" id="secretQuestionId" style="">
		<option value="">{$question}</option>
		{section name=sec1 loop=$secQuestions}
		<option value="{$secQuestions[sec1].id}" {if $secretQuestionIdVal == $secQuestions[sec1].id} selected {/if}>{$secQuestions[sec1].question}</option>
		{/section}
	</select>
	<input class="field" type="text" name="secretAnswer" id="secretAnswer" value="{if isset($secretAnswerVal)}{$secretAnswerVal}{/if}" placeholder="{$answer}">
	
	<p  class="regTitles">{$receiveNot}:<p>
	<label><input type="checkbox" checked name="onNews" id="onNews" {if isset($onNewsVal)} checked {/if}> {$onNewsNot} </label><br>
	<label><input type="checkbox" checked name="onComment" id="onComment" {if $onCommentVal} checked {/if}> {$onCommentNot}</label><br>
	<label><input type="checkbox" checked name="onVideoComment" id="onVideoComment" {if $onVideoCommentVal} checked {/if}> {$onVideoCommentNot}</label><br>
	<label><input type="checkbox" name="agree" id="agree"> {$agreeNot} <a href="?page=rules">{$rules}</a></label><br>
	<div style="text-align:left">
	
	<!-- <a href="javascript:{}" onclick="submitForm();"><img src="./img/signUp.png" width="50" height="50"></a> -->
	<input class="btnSearch" onclick="return submitForm();" type="image" src="img/register_{$lang}.png" name="submit" style="margin-top: 5;"
						onmouseover="this.src='img/registerSelected_{$lang}.png';"
						onmouseout="this.src='img/register_{$lang}.png';"
						onmousedown="this.src='img/registerPushed_{$lang}.png';"> 
	</div>
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
	-->

</form>


             

