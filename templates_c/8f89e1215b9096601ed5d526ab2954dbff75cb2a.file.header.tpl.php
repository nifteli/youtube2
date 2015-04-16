<?php /* Smarty version Smarty-3.1.18, created on 2015-04-16 16:46:32
         compiled from "C:\wamp\www\\youtube\\templates\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:22677552a09a664c687-58917446%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8f89e1215b9096601ed5d526ab2954dbff75cb2a' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\header.tpl',
      1 => 1429184312,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '22677552a09a664c687-58917446',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_552a09a6e2ac67_44930712',
  'variables' => 
  array (
    'search' => 0,
    'greeting' => 0,
    'loggedUser' => 0,
    'adminPanel' => 0,
    'logout' => 0,
    'addVideo' => 0,
    'userName' => 0,
    'password' => 0,
    'login' => 0,
    'signUp' => 0,
    'users' => 0,
    'userCnt' => 0,
    'tags' => 0,
    'tagCnt' => 0,
    'videos' => 0,
    'videoCnt' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_552a09a6e2ac67_44930712')) {function content_552a09a6e2ac67_44930712($_smarty_tpl) {?><script>
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
<body>
<div id="wrapper">
				
	<div class="banner">
		<div class="min-cont">
			<form>
				<input class="search" type="search" name="search" value="" placeholder="<?php echo $_smarty_tpl->tpl_vars['search']->value;?>
">
				<a href="#"><img class="s-img" src="img/search.png" /></a>
			</form>
			<div class="tags" id="tags1">
				
			</div>
			
			<div class="login">
				<ul class="lang">
					<!--<li>Lang:</li>-->
					<?php if (isset($_smarty_tpl->tpl_vars['greeting']->value)) {?>
					<li><a><?php echo $_smarty_tpl->tpl_vars['greeting']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['loggedUser']->value;?>
</a></li>
					<li><a href="?admin.php"><?php echo $_smarty_tpl->tpl_vars['adminPanel']->value;?>
</a></li>
					<li><a href="?action=logout"><?php echo $_smarty_tpl->tpl_vars['logout']->value;?>
</a></li>
					<?php }?>
					<li><a href="?lang=az">AZ</a></li>
					<li><a href="?lang=ru">RU</a></li>
					<li><a href="?lang=en">EN</a></li>
				</ul>
				<div style="height:140px;float:left;width:130px">
					<a href="?page=addVideo"><input class="login3" type="submit" value="<?php echo $_smarty_tpl->tpl_vars['addVideo']->value;?>
" name="submit"></a>
				</div>
				<div style="height:140px;float:right;width:170px">
				<form name="logForm" id="logForm" action="?action=login" method="post">
					<div class="sosialBtn">
					<?php if (!isset($_smarty_tpl->tpl_vars['greeting']->value)) {?>
					<a  href="?action=fbLogin"><img class="fb" src="img/fb.png" /></a>
					<a  href="?action=okLogin"><img class="odn" width="22" width="23"  src="img/odn.png" /></a>
					<?php }?>
					</div>
					<input class="u-n" type="text" name="userName" value="" placeholder="<?php echo $_smarty_tpl->tpl_vars['userName']->value;?>
">
					<input class="pw" type="password" name="password" value="" placeholder="<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
">
					<input class="loginLg" type="submit" value="<?php echo $_smarty_tpl->tpl_vars['login']->value;?>
" name="submit">
					<a href="?page=reg"><input class="login33" type="button" value="<?php echo $_smarty_tpl->tpl_vars['signUp']->value;?>
" name="submit"></a>
					
				</form>
				</div>
			</div> 
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user" align="center"> 
			<a  href="?page=users"><img class="statistics1"  src="img/1.png" /></a>
			<p class="counts"><?php echo $_smarty_tpl->tpl_vars['users']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['userCnt']->value;?>
)</p>
			<a href="?page=allTags"><img class="statistics2" src="img/2.png" /></a>
			<p class="counts"><?php echo $_smarty_tpl->tpl_vars['tags']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['tagCnt']->value;?>
)</p>
			<a href="?index.php"><img class="vid" src="img/3.png" /></a>
			<p class="counts"><?php echo $_smarty_tpl->tpl_vars['videos']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['videoCnt']->value;?>
)</p>
		</div>
		 <!--Statistics Bar End--><?php }} ?>
