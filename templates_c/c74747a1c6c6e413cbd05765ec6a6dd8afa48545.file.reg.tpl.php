<?php /* Smarty version Smarty-3.1.18, created on 2015-04-09 23:12:02
         compiled from "C:\wamp\www\\youtube\\templates\reg.tpl" */ ?>
<?php /*%%SmartyHeaderCode:112225520d07ec719a3-99654063%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c74747a1c6c6e413cbd05765ec6a6dd8afa48545' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\reg.tpl',
      1 => 1428602950,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '112225520d07ec719a3-99654063',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5520d07edc1b19_19500318',
  'variables' => 
  array (
    'errorMessage' => 0,
    'okMessage' => 0,
    'name' => 0,
    'nameVal' => 0,
    'surname' => 0,
    'surnameVal' => 0,
    'gender' => 0,
    'genderVal' => 0,
    'male' => 0,
    'female' => 0,
    'email' => 0,
    'emailVal' => 0,
    'phone' => 0,
    'phoneVal' => 0,
    'language' => 0,
    'username' => 0,
    'usernameVal' => 0,
    'password' => 0,
    'passwordAgain' => 0,
    'captcha' => 0,
    'cancel' => 0,
    'register' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5520d07edc1b19_19500318')) {function content_5520d07edc1b19_19500318($_smarty_tpl) {?><script>
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
	<?php if (isset($_smarty_tpl->tpl_vars['errorMessage']->value)) {?>
	<div class="err"><?php echo $_smarty_tpl->tpl_vars['errorMessage']->value;?>
</div>
	<?php }?>
	<?php if (isset($_smarty_tpl->tpl_vars['okMessage']->value)) {?>
	<div class="success1"><?php echo $_smarty_tpl->tpl_vars['okMessage']->value;?>
</div>
	<?php }?>
	
<form class="reg-form" name="regForm" id="regForm" action="?page=reg&action=reg" method="post"><br><br>
	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['name']->value;?>
:
	<div class="gap"><input class="field" type="text" name="name" id="name" value="<?php if (isset($_smarty_tpl->tpl_vars['nameVal']->value)) {?> <?php echo $_smarty_tpl->tpl_vars['nameVal']->value;?>
 <?php }?>"></div></label></div><br><br>

	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['surname']->value;?>
:
	<div class="gap"><input class="field" type="text" name="surname" id="surname" value="<?php if (isset($_smarty_tpl->tpl_vars['nameVal']->value)) {?> <?php echo $_smarty_tpl->tpl_vars['surnameVal']->value;?>
 <?php }?>"></div></label></div><br><br>

	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['gender']->value;?>
:
	<div class="gender">
		<input type="radio" name="gender" id="gender" value=1 <?php if (isset($_smarty_tpl->tpl_vars['genderVal']->value)&&$_smarty_tpl->tpl_vars['genderVal']->value==1) {?> checked <?php }?>><?php echo $_smarty_tpl->tpl_vars['male']->value;?>

		<label><input type="radio" name="gender" id="gender" value=2 <?php if (isset($_smarty_tpl->tpl_vars['genderVal']->value)&&$_smarty_tpl->tpl_vars['genderVal']->value==2) {?> checked <?php }?>><?php echo $_smarty_tpl->tpl_vars['female']->value;?>
</label>
	</div>
	</label></div><br>


	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['email']->value;?>
:
	<div class="gap"><input class="field" type="email" name="email" id="email" value="<?php if (isset($_smarty_tpl->tpl_vars['emailVal']->value)) {?> <?php echo $_smarty_tpl->tpl_vars['emailVal']->value;?>
 <?php }?>"></div></label></div><br><br>


	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['phone']->value;?>
:
	<div class="gap"><input class="field" type="text" name="phone" id="phone" value="<?php if (isset($_smarty_tpl->tpl_vars['phoneVal']->value)) {?> <?php echo $_smarty_tpl->tpl_vars['phoneVal']->value;?>
 <?php }?>"></div></label></div><br><br>

	<div class="topgap">
			<label><?php echo $_smarty_tpl->tpl_vars['language']->value;?>
:
	<div class="gap">
			<select class="field" name="lang" id="lang" style="width:234px; height:35px">
				   <option value="az">Azerbaijani</option>
				   <option value="en">English</option>
				   <option value="ru">Russian</option>
				  </select></div></label>
				  </div>
				  <br><br>


	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
:
	<div class="gap"><input class="field" type="text" name="username" id="username" value="<?php if (isset($_smarty_tpl->tpl_vars['usernameVal']->value)) {?> <?php echo $_smarty_tpl->tpl_vars['usernameVal']->value;?>
 <?php }?>"></div></label></div><br><br><br>

	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['password']->value;?>
:
	<div class="gap"><input class="field" type="password" name="password" id="password" ></div></label></div><br><br>
	
	<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['passwordAgain']->value;?>
:
	<div class="gap"><input class="field" type="password" name="passwordAgain" id="passwordAgain" ></div></label></div><br><br>

	<!--<div class="topgap">
	<label><?php echo $_smarty_tpl->tpl_vars['captcha']->value;?>
: 
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


	<input class="cancel2" type="submit" value="<?php echo $_smarty_tpl->tpl_vars['cancel']->value;?>
" name="submit">

	<input class="login39" type="submit" value="<?php echo $_smarty_tpl->tpl_vars['register']->value;?>
" name="submit">

</form>
</div>

             

<?php }} ?>
