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
	
	$("#category").multiSelect({ oneOrMoreSelected: '*',
								  noneSelected: '{$category}'
								});
	$("#category option:selected").removeAttr("selected");
	loadCategories();
});
</script>

<!--Videos thums Start-->			 
<div style="padding-top:10px;min-height: 1000px;">
	{if $result == 'error'}
	  <div class="smallerr" style="width: 895;">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	{if $result == 'success'}
	<div class="success1">{$messages['success']}</div>
	{/if}

	<p style="font-weight:bold; margin-top: 40px;">{$addVideoNote1}</p>
	<div style="float:left;width:900px;text-align:center"><label class="labelv" style="color: red !important" id="linkerror" {if $validVideoVal == "true"}hidden{/if}>{$addVideoError9}</label></div>
	<form  id="addVideoForm" action="?page=addVideo&action=add{if isset($videoId)}&videoId={$videoId}{/if}" method="post">
		<div class="player" style="margin-left: 5px;">
			<input class="fieldv" type="url" name="videoLink" id="videoLink" value="{$videoLinkVal}" placeholder="{$videoLink}" onblur="blured()">
			<input class="fieldv" type="text" name="videoName" id="videoName" value="{$videoNameVal}" placeholder="{$videoName}"> 
			<video id="vid1" src="" class="video-js vjs-default-skin" controls preload="auto" width="550" height="300" 
			  data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{$videoLinkVal}" }'>
			</video>
		</div>
		<div class="addVidRight">
			<select class="fieldv" name="language" id="language" style="width:120px" cellpadding=0 cellspacing=0>
				<option value="0" selected="selected">{$language}</option>
				{foreach from=$languages item=row1}
				{html_options values=$row1.id output=$row1.name selected=$languageVal}
				{/foreach}
			</select>
			<table style="float:right; margin-left: 0; margin-right: 0;font-weight: bold;">
				<tr>
					<td><input id="q3" class="checkbox" type="checkbox" value="4" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("4", $videoQuestionVal)} checked {/if} style="margin-left: 0;">{$vqHow}</input></td>
					<td><input id="q4" class="checkbox" type="checkbox" value="8" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("8", $videoQuestionVal)} checked {/if}>{$vqWhy}</input></td>
					<td><input id="q1" class="checkbox" type="radio" value="1" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("1", $videoQuestionVal)} checked {/if}>{$vqWhat}</input></td>
					<td><input id="q2" class="checkbox" type="radio" value="2" onclick="controlQuestionSelection(this)" name="videoQuestion[]" {if in_array("2", $videoQuestionVal)} checked {/if}>{$vqWho}</input></td>
				</tr>
			</table>
			<!-- <select class="fieldv" name="category[]" id="category1">
				<option value=0>{$category}<option>
			</select> -->
			<select id="category" name="category[]" multiple="multiple" class="fieldv" style="width:377px">
			</select>
			<input class="fieldv" type="text" name="tags" id="tags" value="{$tagsVal}" placeholder="{$tags}" style="width: 100%;">
			<textarea class="fieldtextv" type="text" name="information" id="information" placeholder="{$information}" style="width: 100%;height:237px !important">{$informationVal}</textarea>
			<input type="hidden" name="duration" id="duration" value="{$durationVal}"/>
			<input type="hidden" name="validVideo" id="validVideo" value="{$validVideoVal}"/>
		</div>
		<div style="text-align:center">
		<a href="javascript: submitForm()"> 
			<img src="img/AddVideo.png" width="100" height="100" alt="">
		</a>
		</div>
	

     <!--          <label class="labelv">{$videoQuestion}:</label><br> -->
              
			<!-- <select class="fieldv" style="width:234px; height:45px" name="category[]" id="category2">
               </select><br><br>
              
               <select class="fieldv" style="width:234px; height:45px" name="category[]" id="category3">
               </select><br><br> -->


		</form>
	<script type="text/javascript">
		var allCategories = {$allCategories};
		var selectedCats = {$categoryVal};
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
			var checked = "";
			var q = $( "#q1" ).prop('checked') ? 1 : 0;
			q += $( "#q2" ).prop('checked') ? 2 : 0;
			q += $( "#q3" ).prop('checked') ? 4 : 0;
			q += $( "#q4" ).prop('checked') ? 8 : 0;
			//alert($( "#q1" ).prop('checked'));
			//var html = '<option value="0" selected>{$category}</option>';
			var html = '';
			$.each(allCategories, function(key,value)
			{
			//alert(value.id);
				if(q & value.questions)
				{
					$.each(selectedCats, function(keyCat,valueCat)
					{
						if(valueCat == value.id)
							checked = "checked";
					})
											
					html += "<label class=''><input type='checkbox' name='category[]'" + checked + " value='" + value.id + "'>" + value.catName + "</label>";
					checked = "";
				}
			});
			var x = document.getElementsByClassName("multiSelectOptions");
			//alert({$categoryVal});
			x[0].innerHTML = html;
			//$("multiSelectOptions").html(html);
		 	//for(var i=1; i<=3; i++)
		 	//{
				//$("#category" + i).html(html);
				//$("#category" + i).val({$categoryVal}[i-1]);
			//}
		}
		
		function blured() 
		{
		//alert(document.getElementById("videoLink").value );
			loadVideoData(document.getElementById("videoLink").value);
		}
	
		function capitalize(s)
		{
			return s && s[0].toUpperCase() + s.slice(1);
		}
		
		function loadVideoData(link)
		{
			//alert(link);
			var regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
			var match = link.match(regExp);
			
			//if(link.indexOf("https://www.youtube.com/watch?") == 0 || link.indexOf("https://youtu.be/") == 0)
			if (match && match[2].length == 11)
			{
				if(link != oldLink)
				{
					//var urlObj = parseURL(link);
					var v = match[2];
					var apiUrl = 'https://www.googleapis.com/youtube/v3/videos?';
					var parts = 'id,snippet,contentDetails,player,statistics,status';
					
					$.getJSON(apiUrl + 'id=' + v + '&part=' + parts + '&key=' + API_KEY + '&callback=?',function(data)
						{
							if (typeof(data.items[0]) != "undefined") 
							{
								$("#videoName").val(capitalize(data.items[0].snippet.title));
								$("#information").val(capitalize(data.items[0].snippet.description));
								$("#duration").val(ISO8601toSeconds(data.items[0].contentDetails.duration));
								$("#validVideo").val("true");
								//var video = document.getElementById('vid1');
								//video.setAttribute("data-setup", "{ \"language\":[\"tr\"],\"ytcontrols\":[\"true\"], \"techOrder\": [\"youtube\"], \"src\": \"https://www.youtube.com/watch?v=wVGbY4RHheY\" }");
								//document.getElementById("vid1").className = "video-js vjs-default-skin vjs-paused vjs-youtube vjs-controls-disabled vjs-user-active";
								//video.load();
								//data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{$videoLinkVal}" }'
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
	
</div>
             

