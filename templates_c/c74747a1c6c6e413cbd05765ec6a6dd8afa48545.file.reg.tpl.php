<?php /* Smarty version Smarty-3.1.18, created on 2015-04-08 23:36:19
         compiled from "C:\wamp\www\\youtube\\templates\reg.tpl" */ ?>
<?php /*%%SmartyHeaderCode:112225520d07ec719a3-99654063%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c74747a1c6c6e413cbd05765ec6a6dd8afa48545' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\reg.tpl',
      1 => 1428518176,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '112225520d07ec719a3-99654063',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5520d07edc1b19_19500318',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5520d07edc1b19_19500318')) {function content_5520d07edc1b19_19500318($_smarty_tpl) {?><script>
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

             

<?php }} ?>
