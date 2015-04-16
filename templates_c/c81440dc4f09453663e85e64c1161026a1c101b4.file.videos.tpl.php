<?php /* Smarty version Smarty-3.1.18, created on 2015-04-12 11:01:19
         compiled from "C:\wamp\www\\youtube\\templates\videos.tpl" */ ?>
<?php /*%%SmartyHeaderCode:26287552a0a2f3a7b34-08543273%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c81440dc4f09453663e85e64c1161026a1c101b4' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\videos.tpl',
      1 => 1428599263,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '26287552a0a2f3a7b34-08543273',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'errorMessage' => 0,
    'okMessage' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_552a0a2f538745_90005107',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_552a0a2f538745_90005107')) {function content_552a0a2f538745_90005107($_smarty_tpl) {?><script>
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

<div class="videos">
	<div style="padding-top:10px;min-height: 1000px;">
	<?php if (isset($_smarty_tpl->tpl_vars['errorMessage']->value)) {?>
	<div class="err" style="width:680px; margin-top:40px"><?php echo $_smarty_tpl->tpl_vars['errorMessage']->value;?>
</div>
	<?php }?>
	<?php if (isset($_smarty_tpl->tpl_vars['okMessage']->value)) {?>
	<div class="success1" style="width:680px; margin-top:40px"><?php echo $_smarty_tpl->tpl_vars['okMessage']->value;?>
</div>
	<?php }?>
				<div class="hollywd">
					<h2>Hollywood</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="?page=watchVideo"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="?page=watchVideo"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><a href="?page=like&type=1"><img src="img/like-01.png"/></a><p>13245</p></li>
							<li class="likes2"><a href="?page=like&type=2"><img src="img/like-02.png"/></a><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>                
				
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>  
					  
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>
		
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>
				
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
				<div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
               <div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
               <div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
				<div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
			</div>
			
			
			<div class="btn">
               <a href="#">  <input class="login34" type="submit" value="Load More Videos" name="submit"></a>
                
                </div>
			</div>
</div>

             

<?php }} ?>
