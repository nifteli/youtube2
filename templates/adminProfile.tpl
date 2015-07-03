<script>
$(function() {
$( "#bday" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});


</script>
<script>
$(document).ready(function() { 
    var validator = $("#profile").validate({
        rules: {
			password: "required",
        },
        messages: {
			password: "ssss",
        },
    });
});
</script>
<div>
<div style="padding-top:30px;min-height: 500px;">
	
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
	<div class="titles">
		<h1>{$titleProfile}</h1>
	</div>
	{if $result == 'error'}
	  <div class="err">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	{if $result == 'success'}
	<div class="success1">{$messages['success']}</div>
	{/if}
<form class="reg-form" name="profile" id="profile" action="?page=adminProfile&action=save" method="post" enctype='multipart/form-data'><br>
	<div class="topgap">
	<label>{$code}:
	<div class="gap"><input class="field" type="text" name="code" id="code" disabled value="{$userId}"></div></label></div><br>
	
	
	<div class="topgap">
	<label>{$name}:
	<div class="gap"><input class="field" type="text" name="name" id="name" value="{$nameVal}"></div></label></div><br>

	<div class="topgap">
	<label>{$surname}:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value="{$surnameVal}"></div></label></div><br>

	<div class="topgap">
	<label>{$fatherName}:
	<div class="gap"><input class="field" type="text" name="fatherName" id="fatherName" value="{$fatherNameVal}"></div></label></div><br>
	
	<div class="topgap">
	<label>{$birthDate}:
	<div class="gap">
	<input class="field" type="text" name="bday" id="bday" value="{$birthDateVal}">
	</div></label></div><br>

	<div class="topgap">
	<label>{$gender}:
	<div class="gender">
		<input type="radio" name="gender" id="gender" value=1 {if $genderVal==1} checked {/if}>{$male}
		<label><input type="radio" name="gender" id="gender" value=2 {if $genderVal==2} checked {/if} >{$female}</label>
	</div>
	</label></div><br>
	
	<div class="topgap">
	<label>{$position}:
	<div class="gap"><input class="field" type="text" name="position" id="position" value="{$positionVal}"></div></label></div><br>
	
	<div class="topgap">
	<label>{$interests}:
	<div class="gap"><input class="field" type="text" name="interests" id="interests" value="{$interestsVal}"></div></label></div><br>
	
	<div class="topgap">
	<label>{$picture}:
	<div class="gap"><input type="file" class="field" accept="image/*" name="pic" id="pic" /></div></label></div><br>
	
	<div class="topgap">
	<label>{$email}:
	<div class="gap"><input class="field" type="email" name="email" id="email" value="{$emailVal}"></div></label></div><br>


	<div class="topgap">
	<label>{$phone}:
	<div class="gap"><input class="field" type="text" name="phone" id="phone" value="{$phoneVal}"></div></label></div><br>

	<div class="topgap">
			<label>{$language}:
	<div class="gap">
	<select class="field" name="lang" id="lang" style="width:231px; height:25px">
		<option value="az" {if $languageVal=='az'} selected {/if}>{$azerbaijani}</option>
		<option value="en" {if $languageVal=='en'} selected {/if}>{$english}</option>
		<option value="ru" {if $languageVal=='ru'} selected {/if}>{$russian}</option>
	</select></div></label>
	</div>
	<br>
	<div class="topgap">
	<label>{$username}:
	<div class="gap"><input class="field" type="text" name="username" id="username" value="{$uName}" disabled></div></label></div><br>

	<div class="topgap">
	<label>{$password}:
	<div class="gap"><input class="field" type="password" name="password" id="password" ></div></label></div><br>
	
	<div class="topgap">
	<label>{$passwordAgain}:
	<div class="gap"><input class="field" type="password" name="passwordAgain" id="passwordAgain" ></div></label></div><br>
	
	<div class="topgap">
	<label>{$getEmailOnComment}:
	<div class="gap"><input class="emailCheck" type="checkbox" {if isset($getEmailOnCommentVal) && $getEmailOnCommentVal == 'on'} checked {/if} name="getEmailOnComment" id="getEmailOnComment" ></div></label></div><br>

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


	<input class="cancel2" type="reset"  value="{$cancel}" name="reset">

	<input class="login39" type="submit" value="{$save}" name="submit">

</form>

</div>
<div class="profilePic">
<img src="{$picturePath}" width=100 height=100>
</div>
</div>