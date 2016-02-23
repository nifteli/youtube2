<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#dpFrom" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#dpTo" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},$.datepicker.regional[ "{$lang}" ] );
$( "#dpFrom2" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	}, $.datepicker.regional[ "{$lang}" ] );
$( "#dpTo2" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	}, $.datepicker.regional[ "{$lang}" ] );
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

function checkAccess()
{ 
	var hasAccess = "{$hasAccess}";
	if(hasAccess == 1)
		return true;
	//alert("no reg");
	else
	{
		document.getElementById("regPop").click();
	}
	return false;
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
				
					<input class="search" type="input" name="search" value="{$searchVal}" placeholder="{$search}">
					<input class="btnSearch" type="image" src="img/search_{$lang}.png" name="submit" 
					onmouseover="this.src='img/searchSelected_{$lang}.png';"
					onmouseout="this.src='img/search_{$lang}.png';"
					onmousedown="this.src='img/searchPushed_{$lang}.png';"> 
					<div class="advSrc">
					<a href="?page=advSearch">{$advanced}</a>
					</div>
				<div class="simpleSearch">
				<div style="float:left; width:630px">
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
				
					<div style="float:right">
					<select class="srcCmb" name="category" id="scategory">
						<option value="0" selected="selected"> {$allCats}</option>
					</select> 
					<!-- <input id="stime" name="time"  type="radio" onclick="showTimeInterval('s')" value="1">{$hour}</input>
					<input id="stime" name="time" type="radio" onclick="showTimeInterval('s')" value="2" checked="">{$minute}</input> -->
					<select class="srcCmb" name="interval" id="sinterval1">
						<option value="0">{$all}</option>
						<option value="1">{$lessThan15}</option>
						<option value="2">15-30 {$minute}</option>
						<option value="3">30-45 {$minute}</option>
						<option value="4">45-60 {$minute}</option>
						<option value="5">1-2 {$hour}</option>
						<option value="6">2-3 {$hour}</option>
						<option value="7">3-4 {$hour}</option>
						<option value="8">{$moreThan4}</option>
					</select>
					</div>
				</div>
				<div style="float:left;width:208px;    height: 26px;">
					<input class="srcCmb" style="width:95;height: 19px !important;margin-left: 4;" type="text" name="fromDate" id="dpFrom" placeholder="{$fromDate}">&nbsp;
					<input class="srcCmb" style="width:95;height: 19px !important;" type="text" name="toDate"  id="dpTo" placeholder="{$toDate}">&nbsp;
				</div>
				</div>
				</form>
				<div class="tags">
					<ul>
						{section name=sec1 loop=$randTags}
						<li class="tag{$randTags[sec1].size}" style="line-height: 0.5;"><a href="?tagId={$randTags[sec1].tagId}">{$randTags[sec1].name}</a></li> 
						{/section}
					</ul>
				</div>
			</div>
			<div class="headerRight">
			<div style="overflow-wrap: normal;width: 110px;">
				<ul class="langs">
					{if isset($greeting)}
					<li><a href="?page=profile">{$greeting}, {$loggedUser}</a></li> <br>
					
					{else}
					<li><a href="?page=signIn">{$signIn}</a></li>
					{/if}
			</div>		
				</ul>
				{if isset($greeting)}
					<ul class="about">
						<li><a href="?action=logout">{$logout}</a></li>
					</ul>
				{/if}
				{if !isset($greeting)}
					<ul class="about">
						<li><a href="?page=reg">{$signUp}</a></li>
						<!-- <li><a href="?page=reg">
						<input class="btnSearch" type="image" src="img/register_{$lang}.png" name="submit" style="width:75;height:20;margin-top: 6;"
						onmouseover="this.src='img/registerSelected_{$lang}.png';"
						onmouseout="this.src='img/register_{$lang}.png';"
						onmousedown="this.src='img/registerPushed_{$lang}.png';"> 
						</a></li> -->
					</ul>
				{/if}
				
				<div style="text-align: center;margin-top: 20;" >
				<a href="?page=addVideo" id="addVideo" onclick="return checkAccess();" >
				<img align="middle" height="100" width="100" src="img/addVideo_{$lang}.png" align="middle" 
				class="addVideoImg1" id="addVideoImg1"
				onmouseover="this.src='img/addVideoSelected_{$lang}.png';"
				onmouseout="this.src='img/addVideo_{$lang}.png';"
				onmousedown="this.src='img/addVideoPushed_{$lang}.png';">
				 </a>
				</div>
			
			</div>
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user" align="center"> 
			<a href="?index.php"><img class="vid" width="20" height="20" src="img/videos.png" />
			<p class="counts">{$videos} ({$videoCnt})</p></a>
			<a href="?page=allTags"><img class="statistics2" width="24" height="22"  src="img/tags.png" />
			<p class="counts">{$tags} ({$tagCnt})</p></a>
			<a  href="?page=users"><img class="statistics1"  width="20" height="20"  src="img/users.png" />
			<p class="counts">{$users} ({$userCnt})</p></a>
		</div>
		 <!--Statistics Bar End-->
<a href="#regOrEnter" id="regPop"></a>
<div id="regOrEnter" class="modalDialog" >
	<div style="width:250px;height:60px;padding-top: 25;">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$regOrEnterNote1} <a href="?page=signIn">{$enterLink}</a> {$regOrEnterNote2} <a href="?page=reg">{$regLink}</a></h1>
		
	</div>
</div>