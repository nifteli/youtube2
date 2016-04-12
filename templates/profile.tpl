<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#bday" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-80:-7"
	},
	$.datepicker.regional["{$lang}"]
);
});
</script>
<script>
function submitForm()
{
//alert($('input[name=gender]:checked').length);
	//document.getElementById('regForm').validate();
	var name = document.getElementById('name').value.trim();
	var surname = document.getElementById('surname').value.trim();
	var phone = document.getElementById('phone').value.trim();
	//var username = document.getElementById('username').value.trim();
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
	if(document.getElementById('bday').value.trim() == "")
	{
		document.getElementById('bday').focus();
		return false;
	}
	if ($('input[name=gender]:checked').length <= 0) 
	{
		alert("{$validationError9}");
		document.getElementById('gender').focus();
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
	
	
	
	document.getElementById('profile').submit();
	//document.getElementById('regForm').submit();
}

</script>

<!--Videos thums Start-->			 

<div style="padding-top:10px;min-height: 1000px;">
	<div class="titles">
		<h1>{$titleProfile}</h1>
	</div>
	{if $result == 'error'}
	  <div class="err" style="width:900px">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	{if $result == 'success'}
	<div class="success1" style="width:900px">{$messages['success']}</div>
	{/if}
	<form name="profile" id="profile" action="?page=profile&action=save" method="post" enctype='multipart/form-data'>
		<p class="regTitles">{$mandatory} :</p>
		<input class="field" type="text" name="code" id="code" value="{$userId}" disabled>
		<input class="field" type="text" name="name" id="name" value="{if isset($nameVal)}{$nameVal}{/if}" placeholder="{$name}*" required>
		<input class="field" type="text" name="surname" id="surname" value="{if isset($surnameVal)}{$surnameVal}{/if}" placeholder="{$surname}*" required><br>
		<input class="field" type="email" name="email" id="email" value="{if isset($emailVal)}{$emailVal}{/if}" placeholder="{$email}*" required> 
		<input class="field" type="text" name="bday" id="bday" value="{if isset($birthDateVal)}{$birthDateVal}{/if}" placeholder="{$birthDate}*" required>
		
		<input type="radio" name="gender" id="gender" value=1 {if isset($genderVal) && $genderVal==1} checked {/if}>{$male}
		<input type="radio" name="gender" id="gender" value=2 {if isset($genderVal) && $genderVal==2} checked {/if}>{$female}
		<p class="regTitles">{$optional} :</p>
		<input class="field" type="text" name="fatherName" id="fatherName" value="{if isset($fatherNameVal)}{$fatherNameVal}{/if}" placeholder="{$fatherName}" required>
		<input class="field" type="text" name="phone" id="phone" value="{if isset($phoneVal)}{$phoneVal}{/if}" placeholder="{$phone}">
		<select class="field" name="langId" id="langId" style="">
			{foreach from=$languages item=row1}
			{html_options values=$row1.id output=$row1.name selected=$langIdVal}
			{/foreach}
		</select><br>
		<input class="field" type="text" name="position" id="position" value="{if isset($positionVal)}{$positionVal}{/if}" placeholder="{$position}">
		<input class="field" type="text" name="interests" id="interests" value="{if isset($interestsVal)}{$interestsVal}{/if}" placeholder="{$interests}"> 
		<input class="field" type="file" class="field" accept="image/*" name="pic" id="pic" />

		<p class="regTitles">{$userPassword}:</p>
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
		<!-- <label><input type="checkbox" name="agree" id="agree"> {$agreeNot} <a href="?page=rules">{$rules}</a></label><br> -->
		<a href="?action=delProfile" onClick="return confirm('{$deleteConfirmation}')">{$deleteProfile}</a>
		<div style="text-align:left">
		
		<!-- <a href="javascript:{}" onclick="submitForm();"><img src="./img/signUp.png" width="50" height="50"></a> -->
		<input class="btnSearch" onclick="return submitForm();" type="image" src="img/register_{$lang}.png" name="submit" style="margin-top: 5;"
							onmouseover="this.src='img/registerSelected_{$lang}.png';"
							onmouseout="this.src='img/register_{$lang}.png';"
							onmousedown="this.src='img/registerPushed_{$lang}.png';"> 
		</div>
	</form>
<div class="profilePic">
<img src="{$picturePath}" width=100 height=100>
</div>
</div>

             

