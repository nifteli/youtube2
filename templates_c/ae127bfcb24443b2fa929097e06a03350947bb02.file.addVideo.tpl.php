<?php /* Smarty version Smarty-3.1.18, created on 2015-04-09 00:00:29
         compiled from "C:\wamp\www\\youtube\\templates\addVideo.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21533552579f24baa04-58881099%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ae127bfcb24443b2fa929097e06a03350947bb02' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\addVideo.tpl',
      1 => 1428519519,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21533552579f24baa04-58881099',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_552579f2575795_53604891',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_552579f2575795_53604891')) {function content_552579f2575795_53604891($_smarty_tpl) {?><script>
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

<div style="padding-top:10px;min-height: 1000px;">
	<img class="player" src="img/player2.png" width="432" height="289" alt="">
              <form style="margin-top:44px;">
             
              <label class="labelv">Video Link</label><br>
              <input class="fieldv" type="url" name="username">
              <br><br>


              <label class="labelv">Language:</label><br>

              <select class="fieldv" style="width:234px; height:45px">
               <option>English</option>
               <option>Chinese</option>
               <option>Spanish</option>
              </select>
              <br><br>


	
              <label class="labelv">Video Question:</label><br>
              <div class="checkbox">

               <input class="checkbox" type="checkbox" value="" name="checkbox">How
               <input class="checkbox" type="checkbox" value="" name="checkbox">Why<br>

               <input class="checkbox" type="checkbox" value="" name="checkbox">What
               <input class="checkbox" type="checkbox" value="" name="checkbox">Who
               </div>
               <br><br>



			<label class="labelv">Video Name:</label>
            <br>
             <input class="fieldv" type="text" name="name"> 
             <br><br>

		      <label class="labelv">Information:</label>
              <br>
				<textarea class="fieldtextv" type="text" name="interest"></textarea>
                <br><br>

				<label class="labelv">Category:</label>
                <br>

               <select class="fieldv" style="width:234px; height:45px">
               <option>Music</option>
               <option>Bollywood</option>
               <option>Blues</option>
              </select><br><br>


			   <label class="labelv">Tags:</label>
                <br>

               <input class="fieldv" type="text" name="name">
               <br>
<a href="#"> <button class="add" type="button"> 
<img src="img/folder.png" width="29" height="29" alt="">Add to My folder</button></a>
      
                <br>
				<a href="http://192.185.170.147/~screendemo/Zevideo/backup/add-video.html#"> <button class="cancel" type="button"> 
Cancel</button></a>      
             </form>
</div>

             

<?php }} ?>
