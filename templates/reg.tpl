<script>
$(document).ready(function() {
    var validator = $("#regForm").validate({
        rules: {
            username: "required",
			password: "required",
			name: "required",
			email: "required"
        },
        messages: {
			username:"",
			password:"",
			name: "",
			email: ""
        },
    });
});
</script>
<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

	<div style="padding-top:30px;min-height: 1000px;">
	
	<!-- Info message boxes 
	<div class="info">Info message</div>
	<div class="success">Successful operation message</div>
	<div class="warning">Warning message</div>
	<div class="error">Error message</div>
	<!-- End Info message boxes -->
	{if isset($errorMessage)}
	<div class="err">{$errorMessage}</div>
	{/if}
	{if isset($okMessage)}
	<div class="success1">{$okMessage}</div>
	{/if}
	
<form class="reg-form" name="regForm" id="regForm" action="?page=reg&action=reg" method="post"><br><br>
	<div class="topgap">
	<label>{$name}:
	<div class="gap"><input class="field" type="text" name="name" id="name" value="{if isset($nameVal)} {$nameVal} {/if}"></div></label></div><br><br>

	<div class="topgap">
	<label>{$surname}:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value="{if isset($surnameVal)} {$surnameVal} {/if}"></div></label></div><br><br>

	<div class="topgap">
	<label>{$gender}:
	<div class="gender">
		<input type="radio" name="gender" id="gender" value=1 {if isset($genderVal) && $genderVal==1} checked {/if}>{$male}
		<label><input type="radio" name="gender" id="gender" value=2 {if isset($genderVal) && $genderVal==2} checked {/if}>{$female}</label>
	</div>
	</label></div><br>


	<div class="topgap">
	<label>{$email}:
	<div class="gap"><input class="field" type="email" name="email" id="email" value="{if isset($emailVal)} {$emailVal} {/if}"></div></label></div><br><br>


	<div class="topgap">
	<label>{$phone}:
	<div class="gap"><input class="field" type="text" name="phone" id="phone" value="{if isset($phoneVal)} {$phoneVal} {/if}"></div></label></div><br><br>

	<div class="topgap">
			<label>{$language}:
	<div class="gap">
			<select class="field" name="lang" id="lang" style="width:234px; height:35px">
				   <option value="az">Azerbaijani</option>
				   <option value="en">English</option>
				   <option value="ru">Russian</option>
				  </select></div></label>
				  </div>
				  <br><br>


	<div class="topgap">
	<label>{$username}:
	<div class="gap"><input class="field" type="text" name="username" id="username" value="{if isset($usernameVal)} {$usernameVal} {/if}"></div></label></div><br><br><br>

	<div class="topgap">
	<label>{$password}:
	<div class="gap"><input class="field" type="password" name="password" id="password" ></div></label></div><br><br>
	
	<div class="topgap">
	<label>{$passwordAgain}:
	<div class="gap"><input class="field" type="password" name="passwordAgain" id="passwordAgain" ></div></label></div><br><br>

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


	<input class="cancel2" type="submit" value="{$cancel}" name="submit">

	<input class="login39" type="submit" value="{$register}" name="submit">

</form>
</div>

             

