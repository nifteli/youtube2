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
<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

	<div style="padding-top:30px;min-height: 1000px;">

<form class="reg-form"><br>
<br>
<div class="topgap">
<label>Name:
<div class="gap"><input class="field" type="text" name="name"></div></label></div><br><br>


<div class="topgap">
<label>Surname:
<div class="gap"><input class="field" type="text" name="surname"></div></label></div><br><br>

<div class="topgap">
<label>Gender:
<div class="gender">
<input type="radio" name="sex" value="male">Male
<label><input type="radio" name="sex" value="female">Female</label>
</div>
</label></div><br><br>


<div class="topgap">
<label>Email:
<div class="gap"><input class="field" type="email" name="email" required=""></div></label></div><br><br>


<div class="topgap">
<label>Phone:
<div class="gap"><input class="field" type="number" name="phone" required=""></div></label></div><br><br>

<div class="topgap">
        <label>Language:
<div class="gap">
        <select class="field" style="width:234px; height:45px">
               <option>English</option>
               <option>Chinese</option>
               <option>Spanish</option>
              </select></div></label>
              </div>
              <br><br>


<div class="topgap">
<label>User Name:
<div class="gap"><input class="field" type="text" name="username"></div></label></div><br><br>

<div class="topgap">
<label>Password:
<div class="gap"><input class="field" type="password" name="password" required=""></div></label></div><br><br>


<div class="topgap">
<label>Captcha: 
<div class="gap"><img width="132" height="44" alt="" src="./Registration_files/captcha.png"></div></label></div>
<div class="topgap">
<label>
<div class="gap">
<input class="field" type="text" name="username"></div></label></div>
<br>
<br>
<br>
<br>

<div class="topgap" style="padding-top:8px;">
<label>Roles:
<div class="gap"><input class="field" type="text" name="username"></div></label></div><br><br>


<input class="cancel2" type="submit" value="Cancel" name="submit">

<input class="login39" type="submit" value="Register" name="submit">

</form>
</div>

             

