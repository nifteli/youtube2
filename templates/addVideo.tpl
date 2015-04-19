<script>
$(document).ready(function() {
    var validator = $("#addVideoForm").validate({
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

<!--Videos thums Start-->			 
<div style="padding-top:10px;min-height: 1000px;">
	<img class="player" src="img/player2.png" width="432" height="289" alt="">
	{if $result != 'success'}
			{if $result == 'error'}
			  <div class="smallerr">
			  	{foreach from=$messages item=message}
			  		{$message} <br>
			  	{/foreach}
			  </div>
			{/if}
              <form style="margin-top:44px;" id="addVideoForm" action="?page=addVideo&action=add" method="post">
             
              <label class="labelv">{$videoLink}:</label><br>
              <input class="fieldv" type="url" name="videoLink" value="{if isset($videoLinkVal)}{$videoLinkVal}{/if}">
              <br><br>


              <label class="labelv">{$language}:</label><br>

              <select class="fieldv" name="language" style="width:234px; height:45px">
              	<option value="0" selected="selected"> </option>
              	{foreach from=$languages item=row1}
    				{html_options values=$row1.id output=$row1.name selected=$languageVal}
  				{/foreach}
              </select>
              <br><br>


	
              <label class="labelv">{$videoQuestion}:</label><br>
              
              <div class="checkbox">
				<table>
					<tr>
						<td><input id="q3" class="checkbox" type="checkbox" value="4" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("4", $videoQuestionVal)} checked {/if}>{$vqHow}</input></td>
						<td><input id="q4" class="checkbox" type="checkbox" value="8" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("8", $videoQuestionVal)} checked {/if}>{$vqWhy}</input></td>
					</tr>
					<tr>
						<td><input id="q1" class="checkbox" type="radio" value="1" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("1", $videoQuestionVal)} checked {/if}>{$vqWhat}</input></td>
						<td><input id="q2" class="checkbox" type="radio" value="2" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("2", $videoQuestionVal)} checked {/if}>{$vqWho}</input></td>
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

               <select class="fieldv" style="width:234px; height:45px" name="category[]" id="category1">
               </select><br><br>

               <select class="fieldv" style="width:234px; height:45px" name="category[]" id="category2">
               </select><br><br>
              
               <select class="fieldv" style="width:234px; height:45px" name="category[]" id="category3">
               </select><br><br>

			   <label class="labelv">{$tags}:</label>
                <br>

               <input class="fieldv" type="text" name="tags" value="{if isset($tagsVal)}{$tagsVal}{/if}">
               <br>
				<a href="javascript: submitForm()"> <button class="add" type="button"> 
				<img src="img/folder.png" width="29" height="29" alt="">&nbsp;{$addToMyFolder}</button></a>
      
                <br>
				<a href="javascript: resetForm()"> <button class="cancel" type="button">{$cancel}</button></a>
             </form>
	<script type="text/javascript">
		var allCategories = {$allCategories};
		
		loadCategories();
	
		function submitForm()
		{
			$("#addVideoForm").submit();
		}
		
		function resetForm()
		{
			$("#addVideoForm")[0].reset();
		}
		
		function controlQuestionSelection(el)
		{
			if(el.id == "q3" || el.id == "q4")
			{
				$("#q1").prop('checked', false);
				$("#q2").prop('checked', false);
			}
			if(el.id == "q1" || el.id == "q2")
			{
				$("#q3").prop('checked', false);
				$("#q4").prop('checked', false);
			}
			
			loadCategories();
		}
		
		function loadCategories()
		{
			var q = $("#q1").prop('checked') ? 1 : 0;
			q += $("#q2").prop('checked') ? 2 : 0;
			q += $("#q3").prop('checked') ? 4 : 0;
			q += $("#q4").prop('checked') ? 8 : 0;
			
		 	for(var i=1; i<=3; i++)
		 	{
				var html = '<option value="0"> </option>';
				$.each(allCategories, function(key,value)
				{
					if(q & value.questions)
					{
						var selected = (value.id == {$categoryVal}[i-1]) ? ' selected' : '';
						html += '<option value="' + value.id + '"' + selected + '>' + value.catName + '</option>';
					}
				});
				$("#category" + i).html(html);
			}
			
			//alert(html);
		}
		
	</script>
	{else}
	<div class="success1">{$messages['success']}</div>
	{/if}
</div>
             

