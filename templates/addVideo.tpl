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

<div style="padding-top:10px;min-height: 1000px;">
	<img class="player" src="img/player2.png" width="432" height="289" alt="">
              <form style="margin-top:44px;" name="addVideoForm" action="?page=addVideo&action=add" method="post">
             
              <label class="labelv">{$videoLink}:</label><br>
              <input class="fieldv" type="url" name="videoLink" value="{if isset($videoLinkVal)}{$videoLinkVal}{/if}">
              <br><br>


              <label class="labelv">{$language}:</label><br>

              <select class="fieldv" name="language" style="width:234px; height:45px">
               	<option value="az" {if isset($languageVal) &&  $languageVal=='az'} selected {/if}>{$langAz}</option>
				<option value="en" {if isset($languageVal) &&  $languageVal=='en'} selected {/if}>{$langEn}</option>
				<option value="ru" {if isset($languageVal) &&  $languageVal=='ru'} selected {/if}>{$langRu}</option>
              </select>
              <br><br>


	
              <label class="labelv">{$videoQuestion}:</label><br>
              
              <div class="checkbox">
				<table>
					<tr>
						<td><input class="checkbox" type="checkbox" value="3" name="videoQuestion[]" {if isset($videoQuestionVal) && in_array("3", $videoQuestionVal)} checked {/if}>{$vqHow}</input></td>
						<td><input class="checkbox" type="checkbox" value="4" name="videoQuestion[]" {if isset($videoQuestionVal) && in_array("4", $videoQuestionVal)} checked {/if}>{$vqWhy}</input></td>
					</tr>
					<tr>
						<td><input class="checkbox" type="checkbox" value="1" name="videoQuestion[]" {if isset($videoQuestionVal) && in_array("1", $videoQuestionVal)} checked {/if}>{$vqWhat}</input></td>
						<td><input class="checkbox" type="checkbox" value="2" name="videoQuestion[]" {if isset($videoQuestionVal) && in_array("2", $videoQuestionVal)} checked {/if}>{$vqWho}</input></td>
					</tr>
				</table>
               </div>
               <br><br>



			<label class="labelv">{$videoName}:</label>
            <br>
             <input class="fieldv" type="text" name="videoName" value="{if isset($videoNameVal)}{$videoNameVal}{/if}"> 
             <br><br>

		      <label class="labelv">{$information}:</label>
              <br>
				<textarea class="fieldtextv" type="text" name="information">{if isset($informationVal)}{$informationVal}{/if}</textarea>
                <br><br>

				<label class="labelv">{$category}:</label>
                <br>

               <select class="fieldv" style="width:234px; height:45px" name="category">
               <option>Music</option>
               <option>Bollywood</option>
               <option>Blues</option>
              </select><br><br>


			   <label class="labelv">{$tags}:</label>
                <br>

               <input class="fieldv" type="text" name="tags" value="{if isset($tagsVal)}{$tagsVal}{/if}">
               <br>
				<a href="javascript: submitform()"> <button class="add" type="button"> 
				<img src="img/folder.png" width="29" height="29" alt="">&nbsp;{$addToMyFolder}</button></a>
      
                <br>
				<a href="#"> <button class="cancel" type="button">{$cancel}</button></a>
             </form>
	<script type="text/javascript">
		function submitform()
		{
			document.addVideoForm.submit();
		}
	</script>
</div>

             

