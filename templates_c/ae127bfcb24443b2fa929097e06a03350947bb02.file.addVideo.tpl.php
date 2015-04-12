<?php /* Smarty version Smarty-3.1.18, created on 2015-04-11 22:44:19
         compiled from "C:\wamp\www\\youtube\\templates\addVideo.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21533552579f24baa04-58881099%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ae127bfcb24443b2fa929097e06a03350947bb02' => 
    array (
      0 => 'C:\\wamp\\www\\\\youtube\\\\templates\\addVideo.tpl',
      1 => 1428785056,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21533552579f24baa04-58881099',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_552579f2575795_53604891',
  'variables' => 
  array (
    'videoLink' => 0,
    'videoLinkVal' => 0,
    'language' => 0,
    'languageVal' => 0,
    'langAz' => 0,
    'langEn' => 0,
    'langRu' => 0,
    'videoQuestion' => 0,
    'videoQuestionVal' => 0,
    'vqHow' => 0,
    'vqWhy' => 0,
    'vqWhat' => 0,
    'vqWho' => 0,
    'videoName' => 0,
    'videoNameVal' => 0,
    'information' => 0,
    'informationVal' => 0,
    'category' => 0,
    'tags' => 0,
    'tagsVal' => 0,
    'addToMyFolder' => 0,
    'cancel' => 0,
  ),
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
              <form style="margin-top:44px;" name="addVideoForm" action="?page=addVideo&action=add" method="post">
             
              <label class="labelv"><?php echo $_smarty_tpl->tpl_vars['videoLink']->value;?>
:</label><br>
              <input class="fieldv" type="url" name="videoLink" value="<?php if (isset($_smarty_tpl->tpl_vars['videoLinkVal']->value)) {?><?php echo $_smarty_tpl->tpl_vars['videoLinkVal']->value;?>
<?php }?>">
              <br><br>


              <label class="labelv"><?php echo $_smarty_tpl->tpl_vars['language']->value;?>
:</label><br>

              <select class="fieldv" name="language" style="width:234px; height:45px">
               	<option value="az" <?php if (isset($_smarty_tpl->tpl_vars['languageVal']->value)&&$_smarty_tpl->tpl_vars['languageVal']->value=='az') {?> selected <?php }?>><?php echo $_smarty_tpl->tpl_vars['langAz']->value;?>
</option>
				<option value="en" <?php if (isset($_smarty_tpl->tpl_vars['languageVal']->value)&&$_smarty_tpl->tpl_vars['languageVal']->value=='en') {?> selected <?php }?>><?php echo $_smarty_tpl->tpl_vars['langEn']->value;?>
</option>
				<option value="ru" <?php if (isset($_smarty_tpl->tpl_vars['languageVal']->value)&&$_smarty_tpl->tpl_vars['languageVal']->value=='ru') {?> selected <?php }?>><?php echo $_smarty_tpl->tpl_vars['langRu']->value;?>
</option>
              </select>
              <br><br>


	
              <label class="labelv"><?php echo $_smarty_tpl->tpl_vars['videoQuestion']->value;?>
:</label><br>
              
              <div class="checkbox">
				<table>
					<tr>
						<td><input class="checkbox" type="checkbox" value="3" name="videoQuestion[]" <?php if (isset($_smarty_tpl->tpl_vars['videoQuestionVal']->value)&&in_array("3",$_smarty_tpl->tpl_vars['videoQuestionVal']->value)) {?> checked <?php }?>><?php echo $_smarty_tpl->tpl_vars['vqHow']->value;?>
</input></td>
						<td><input class="checkbox" type="checkbox" value="4" name="videoQuestion[]" <?php if (isset($_smarty_tpl->tpl_vars['videoQuestionVal']->value)&&in_array("4",$_smarty_tpl->tpl_vars['videoQuestionVal']->value)) {?> checked <?php }?>><?php echo $_smarty_tpl->tpl_vars['vqWhy']->value;?>
</input></td>
					</tr>
					<tr>
						<td><input class="checkbox" type="checkbox" value="1" name="videoQuestion[]" <?php if (isset($_smarty_tpl->tpl_vars['videoQuestionVal']->value)&&in_array("1",$_smarty_tpl->tpl_vars['videoQuestionVal']->value)) {?> checked <?php }?>><?php echo $_smarty_tpl->tpl_vars['vqWhat']->value;?>
</input></td>
						<td><input class="checkbox" type="checkbox" value="2" name="videoQuestion[]" <?php if (isset($_smarty_tpl->tpl_vars['videoQuestionVal']->value)&&in_array("2",$_smarty_tpl->tpl_vars['videoQuestionVal']->value)) {?> checked <?php }?>><?php echo $_smarty_tpl->tpl_vars['vqWho']->value;?>
</input></td>
					</tr>
				</table>
               </div>
               <br><br>



			<label class="labelv"><?php echo $_smarty_tpl->tpl_vars['videoName']->value;?>
:</label>
            <br>
             <input class="fieldv" type="text" name="videoName" value="<?php if (isset($_smarty_tpl->tpl_vars['videoNameVal']->value)) {?><?php echo $_smarty_tpl->tpl_vars['videoNameVal']->value;?>
<?php }?>"> 
             <br><br>

		      <label class="labelv"><?php echo $_smarty_tpl->tpl_vars['information']->value;?>
:</label>
              <br>
				<textarea class="fieldtextv" type="text" name="information"><?php if (isset($_smarty_tpl->tpl_vars['informationVal']->value)) {?><?php echo $_smarty_tpl->tpl_vars['informationVal']->value;?>
<?php }?></textarea>
                <br><br>

				<label class="labelv"><?php echo $_smarty_tpl->tpl_vars['category']->value;?>
:</label>
                <br>

               <select class="fieldv" style="width:234px; height:45px" name="category">
               <option>Music</option>
               <option>Bollywood</option>
               <option>Blues</option>
              </select><br><br>


			   <label class="labelv"><?php echo $_smarty_tpl->tpl_vars['tags']->value;?>
:</label>
                <br>

               <input class="fieldv" type="text" name="tags" value="<?php if (isset($_smarty_tpl->tpl_vars['tagsVal']->value)) {?><?php echo $_smarty_tpl->tpl_vars['tagsVal']->value;?>
<?php }?>">
               <br>
				<a href="javascript: submitform()"> <button class="add" type="button"> 
				<img src="img/folder.png" width="29" height="29" alt="">&nbsp;<?php echo $_smarty_tpl->tpl_vars['addToMyFolder']->value;?>
</button></a>
      
                <br>
				<a href="#"> <button class="cancel" type="button"><?php echo $_smarty_tpl->tpl_vars['cancel']->value;?>
</button></a>
             </form>
	<script type="text/javascript">
		function submitform()
		{
			document.addVideoForm.submit();
		}
	</script>
</div>

             

<?php }} ?>
