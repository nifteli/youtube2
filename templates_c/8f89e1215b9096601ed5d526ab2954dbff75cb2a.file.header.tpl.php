<?php /* Smarty version Smarty-3.1.18, created on 2015-04-03 00:55:18
         compiled from "C:\wamp\www\\youtube\\templates\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:248785519b7100ecfe7-48706409%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8f89e1215b9096601ed5d526ab2954dbff75cb2a' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\header.tpl',
      1 => 1428004515,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '248785519b7100ecfe7-48706409',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5519b7101bbf00_90221521',
  'variables' => 
  array (
    'errorMessage' => 0,
    'search' => 0,
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
<?php if ($_valid && !is_callable('content_5519b7101bbf00_90221521')) {function content_5519b7101bbf00_90221521($_smarty_tpl) {?><div id="wrapper">
				<?php if (isset($_smarty_tpl->tpl_vars['errorMessage']->value)) {?>
				<div class="err">
						<?php echo $_smarty_tpl->tpl_vars['errorMessage']->value;?>

				</div>
				<?php }?>
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
					<li><a>Salam User</a></li>
					<li><a>Admin Panel</a></li>
					<li><a href="?lang=az">AZ</a></li>
					<li><a href="?lang=ru">RU</a></li>
					<li><a href="?lang=en">EN</a></li>
				</ul>
				<div style="height:140px;float:left;width:130px">
					<a href="add-video.html"><h5><?php echo $_smarty_tpl->tpl_vars['addVideo']->value;?>
</h5></a>
				</div>
				<div style="height:140px;float:right;width:170px">
				<form action="?action=login" method="post">
					<a  href="other-user.html"><img class="fb" style="margin-left:7px;" src="img/fb.png" /></a>
					<a  href="other-user.html"><img class="odn" width="22" width="23"  src="img/odn.png" /></a>
					<input class="u-n" type="text" name="userName" value="" placeholder="<?php echo $_smarty_tpl->tpl_vars['userName']->value;?>
">
					<input class="pw" type="text" name="password" value="" placeholder="<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
">
					<a href="#" onclick="$(this).closest('form').submit()"><h3><?php echo $_smarty_tpl->tpl_vars['login']->value;?>
</h3></a>
					<a href="#" onclick="$(this).closest('form').submit()"><h3 style="margin-top: -31px;width: 83px; margin-left: 100px;"><?php echo $_smarty_tpl->tpl_vars['signUp']->value;?>
</h3></a>
				</form>
				</div>
			</div> 
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user"> 
			<a  href="other-user.html"><img class="statistics1"  src="img/1.png" /></a>
			<p class="counts"><?php echo $_smarty_tpl->tpl_vars['users']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['userCnt']->value;?>
)</p>
			<a href="alltags.html"><img class="statistics2" src="img/2.png" /></a>
			<p class="counts"><?php echo $_smarty_tpl->tpl_vars['tags']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['tagCnt']->value;?>
)</p>
			<a href="index.html"><img class="vid" src="img/3.png" /></a>
			<p class="counts"><?php echo $_smarty_tpl->tpl_vars['videos']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['videoCnt']->value;?>
)</p>
		</div>
		 <!--Statistics Bar End--><?php }} ?>
