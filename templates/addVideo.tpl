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
	<div class="player" style="margin-left: 5px;">
	<video id="vid1" src="" class="video-js vjs-default-skin" controls preload="auto" width="460" height="275" 
	  data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{if $result=="success"}{$videoLinkVal}{/if}" }'>
	  </video>
	</div>
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
              <input class="fieldv" type="url" name="videoLink" id="videoLink" value="{$videoLinkVal}"><br>
              <label class="labelv" style="color: red" id="linkerror" {if $validVideoVal == "true"}hidden{/if}>{$addVideoError9}</label>
              <br><br>


              <label class="labelv">{$language}:</label><br>

              <select class="fieldv" name="language" id="language" style="width:234px; height:45px">
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
             <input class="fieldv" type="text" name="videoName" id="videoName" value="{$videoNameVal}"> 
             <br><br>

		      <label class="labelv">{$information}:</label>
              <br>
				<textarea class="fieldtextv" type="text" name="information" id="information">{$informationVal}</textarea>
                <br><br>
                <input type="hidden" name="duration" id="duration" value="{$durationVal}"/>
                <input type="hidden" name="validVideo" id="validVideo" value="{$validVideoVal}"/>

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

               <input class="fieldv" type="text" name="tags" id="tags" value="{$tagsVal}">
               <br>
				<a href="javascript: submitForm()"> <button class="add" type="button"> 
				<img src="img/folder.png" width="29" height="29" alt="">&nbsp;{$addToMyFolder}</button></a>
      
                <br>
				<a href="javascript: resetForm()"> <button class="cancel" type="button">{$cancel}</button></a>
             </form>
	<script type="text/javascript">
		var allCategories = {$allCategories};
		var oldLink = '';
		
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
			var q = $( "#q1" ).prop('checked') ? 1 : 0;
			q += $( "#q2" ).prop('checked') ? 2 : 0;
			q += $( "#q3" ).prop('checked') ? 4 : 0;
			q += $( "#q4" ).prop('checked') ? 8 : 0;
			//alert($( "#q1" ).prop('checked'));
			var html = '<option value="0"> </option>';
			$.each(allCategories, function(key,value)
			{
				if(q & value.questions)
				{
					html += '<option value="' + value.id + '"' + '>' + value.catName + '</option>';
				}
			});
			
		 	for(var i=1; i<=3; i++)
		 	{
				$("#category" + i).html(html);
				$("#category" + i).val({$categoryVal}[i-1]);
			}
		}
		
		$("#videoLink").blur(function() 
			{
					loadVideoData(this.value);
			}
		)
			
		function loadVideoData(link)
		{
			if(link.indexOf("https://www.youtube.com/watch?") == 0)
			{
				if(link != oldLink)
				{
					var urlObj = parseURL(link);
					var apiUrl = 'https://www.googleapis.com/youtube/v3/videos?';
					var parts = 'id,snippet,contentDetails,player,statistics,status';
					
					$.getJSON(apiUrl + 'id=' + urlObj.searchObject.v + '&part=' + parts + '&key=' + API_KEY + '&callback=?',function(data)
						{
							if (typeof(data.items[0]) != "undefined") 
							{
								$("#videoName").val(data.items[0].snippet.title);
								$("#information").val(data.items[0].snippet.description);
								$("#duration").val(ISO8601toSeconds(data.items[0].contentDetails.duration));
								$("#validVideo").val("true");
								$("#linkerror").hide();
							} 
							else 
							{
								$("#validVideo").val("false");
								$("#linkerror").show();
							}   
						}
					);
					oldLink = link;
				}
			}
			else
			{
				if(link != "")
				{
					$("#validVideo").val("false");
					$("#linkerror").show();
				}
				else
				{
					$("#validVideo").val("true");
					$("#linkerror").hide();
				}
			}
		}
		
	</script>
	{else}
	<div class="success1">{$messages['success']}</div>
	{/if}
</div>
             

