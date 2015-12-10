<script>
$(function() {
$( "#dpFrom" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
$( "#dpTo" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
$( "#dpFrom2" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
$( "#dpTo2" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});
</script>	
<script>
$(function() {
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

var allCategories = {$allCategories};

function controlQuestionSelection_s(el, sFlag)
{ 
	if(el.id == sFlag + "q3" || el.id == sFlag + "q4")
	{
		$("#" + sFlag + "q1").prop('checked', false);
		$("#" + sFlag + "q2").prop('checked', false);
	}
	if(el.id == sFlag + "q1" || el.id == sFlag + "q2")
	{
		$("#" + sFlag + "q3").prop('checked', false);
		$("#" + sFlag + "q4").prop('checked', false);
	}
	
	loadCategories_s(sFlag);
}
		
function loadCategories_s(sFlag)
{
	var q = $("#" + sFlag + "q1").prop('checked') ? 1 : 0;
	q += $("#" + sFlag + "q2").prop('checked') ? 2 : 0;
	q += $("#" + sFlag + "q3").prop('checked') ? 4 : 0;
	q += $("#" + sFlag + "q4").prop('checked') ? 8 : 0;
	var html = '<option value="0"> Bütün kateqoriyalar</option>';
	$.each(allCategories, function(key,value)
	{
		if(q & value.questions)
		{
			html += '<option value="' + value.id + '"' + '>' + value.catName + '</option>';
		}
	});
	
	$("#" + sFlag + "category").html(html);
}

function showTimeInterval(sFlag)
{
	if($("#" + sFlag + "time:checked").val() == 1)
	{
		$("#" + sFlag + "interval2").hide();
		$("#" + sFlag + "interval1").show();
	}
	else
	{
		$("#" + sFlag + "interval1").hide();
		$("#" + sFlag + "interval2").show();
	}
}

</script>

<body>
<div id="wrapper">
				
	<div class="banner">
		<div class="min-cont">
			<div class="headerLeft">
				<ul class="langs">
					{if $lang!='az'}<li><a href="?lang=az">AZ</a></li>{/if}
					{if $lang!='ru'}<li><a href="?lang=ru">RU</a></li>{/if}
					{if $lang!='en'}<li><a href="?lang=en">EN</a></li>{/if}
				</ul>
				<ul class="about">
					<li><a href="?page=about">{$about}</a></li>
				</ul>
				<a href="index.php"><img height="118" width="200" src="img/logo.png" ></a>
			</div>
			<div class="headerMiddle">
				<form id="searchForm" action="?page=searchRes" method="post">
					<input class="search" type="input" name="search" value="" placeholder="{$search}">
					<input class="btnSearch" type="submit" value="{$search}" name="submit">
					<a href="?page=advSearch"><input class="btnSearch" type="button" value="Advanced" name="submit"></a>
				
				<div class="simpleSearch">
				
					<select class="srcCmb" name="language" id="language">
						<option value="0" selected="selected"> {$allLangs}</option>
						{foreach from=$languages item=row1}
							{html_options values=$row1.id output=$row1.name selected=$languageVal}
						{/foreach}
					</select> 
				<input id="sq3" type="checkbox" value="4" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqHow}</input>
				<input id="sq4"  type="checkbox" value="8" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqWhy}</input>
				<input id="sq1"  type="radio" value="1" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqWhat}</input>
				<input id="sq2"  type="radio" value="2" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqWho}</input>
				<select class="srcCmb" name="category" id="scategory">
					<option value="0" selected="selected"> {$allCats}</option>
				</select> 
				<input id="stime" name="time"  type="radio" onclick="showTimeInterval('s')" value="1">{$hour}</input>
				<input id="stime" name="time" type="radio" onclick="showTimeInterval('s')" value="2" checked="">{$minute}</input>
				<select class="srcCmb" name="interval1" id="sinterval1" style="display: none">
					<option value="0">{$all}</option>
					<option value="1">1-2</option>
					<option value="2">2-3</option>
					<option value="3">3-4</option>
					<option value="4">{$moreThan4}</option>
				</select>
				<select class="srcCmb" name="interval2" id="sinterval2">
					<option value="0">{$all}</option>
					<option value="1">{$lessThan15}</option>
					<option value="2">15-30</option>
					<option value="3">30-45</option>
					<option value="4">45-60</option>
				</select> 
				
				<label class="srcLbl">{$date}</label>
				<input class="srcCmb" style="width:70" type="text" name="fromDate" id="dpFrom">&nbsp;
				<input class="srcCmb" style="width:70" type="text" name="toDate"  id="dpTo">&nbsp;
				
				</div>
				</form>
				<div class="tags">
					<ul>
						{section name=sec1 loop=$randTags}
						<li class="tag{$randTags[sec1].size}"><a href="?tagId={$randTags[sec1].tagId}">{$randTags[sec1].name}</a></li> 
						{/section}
					</ul>
				</div>
			</div>
			<div class="headerRight">
				<ul class="langs">
					{if isset($greeting)}
					<li><a>{$greeting}, {$loggedUser}</a></li> <br>
					<li><a href="admin.php">{$adminPanel}</a></li>
					{else}
					<li><a href="?page=signIn">{$signIn}</a></li>
					{/if}
					
				</ul>
				{if isset($greeting)}
					<ul class="about">
						<li><a href="?action=logout">{$logout}</a></li>
					</ul>
				{/if}
				{if !isset($greeting)}
					<ul class="about">
						<li><a href="?page=reg">{$signUp}</a></li>
					</ul>
				{/if}
				
				<div style="text-align: center"><a href="?page=addVideo"><img align="middle" height="100" width="100" src="img/AddVideo.png" align="middle"></a></div>
			
			</div>
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user" align="center"> 
			<a href="?index.php"><img class="vid" width="20" height="20" src="img/videos.png" /></a>
			<p class="counts">{$videos} ({$videoCnt})</p>
			<a href="?page=allTags"><img class="statistics2" width="30" height="20"  src="img/tags.png" /></a>
			<p class="counts">{$tags} ({$tagCnt})</p>
			<a  href="?page=users"><img class="statistics1"  width="20" height="20"  src="img/users.png" /></a>
			<p class="counts">{$users} ({$userCnt})</p>
		</div>
		 <!--Statistics Bar End-->