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
		<h1>Profil melumatlari</h1>
	</div>
<form class="reg-form" name="regForm" id="regForm" action="?page=reg&action=reg" method="post"><br>
	<div class="topgap">
	<label>Name:
	<div class="gap"><input class="field" type="text" name="name" id="name" value=""></div></label></div><br>

	<div class="topgap">
	<label>Surname:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value=""></div></label></div><br>

	<div class="topgap">
	<label>Father Name:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value=""></div></label></div><br>

	<div class="topgap">
	<label>Gender:
	<div class="gender">
		<input type="radio" name="gender" id="gender" value=1 >male
		<label><input type="radio" name="gender" id="gender" value=2 >female</label>
	</div>
	</label></div><br>


	<div class="topgap">
	<label>Email:
	<div class="gap"><input class="field" type="email" name="email" id="email" value=""></div></label></div><br>


	<div class="topgap">
	<label>Phone:
	<div class="gap"><input class="field" type="text" name="phone" id="phone" value=""></div></label></div><br>

	<div class="topgap">
			<label>Language:
	<div class="gap">
			<select class="field" name="lang" id="lang" style="width:231px; height:25px">
				   <option value="az">Azerbaijani</option>
				   <option value="en">English</option>
				   <option value="ru">Russian</option>
				  </select></div></label>
				  </div>
				  <br>


	<div class="topgap">
	<label>Username:
	<div class="gap"><input class="field" type="text" name="username" id="username" value="user1" disabled></div></label></div><br>

	<div class="topgap">
	<label>Password:
	<div class="gap"><input class="field" type="password" name="password" id="password" ></div></label></div><br>
	
	<div class="topgap">
	<label>PasswordAgain:
	<div class="gap"><input class="field" type="password" name="passwordAgain" id="passwordAgain" ></div></label></div><br>

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


	<input class="cancel2" type="submit" value="Cancel" name="submit">

	<input class="login39" type="submit" value="Save" name="submit">

</form>
</div
</div>

</div>