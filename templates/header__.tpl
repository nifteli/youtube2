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
			<form id="searchForm" action="?page=searchRes" method="post">
				<input class="search" type="input" name="search" value="" placeholder="{$search}">
				<a href="#" onclick="$('#searchForm').submit()"><img class="s-img" src="img/search.png" /></a>
			
			<div class="simpleSearch">
			|
				<select class="srcCmb" name="language" id="language">
					<option value="0" selected="selected"> Bütün dillər</option>
	              	{foreach from=$languages item=row1}
	    				{html_options values=$row1.id output=$row1.name selected=$languageVal}
	  				{/foreach}
				</select> |
			<input id="sq3" type="checkbox" value="4" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqHow}</input>
			<input id="sq4"  type="checkbox" value="8" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqWhy}</input>
			<input id="sq1"  type="radio" value="1" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqWhat}</input>
			<input id="sq2"  type="radio" value="2" onclick="controlQuestionSelection_s(this, 's')" name="videoQuestion[]">{$vqWho}</input>
			<select class="srcCmb" name="category" id="scategory">
				<option value="0" selected="selected"> Bütün kateqoriyalar</option>
			</select> |
			<input id="stime" name="time"  type="radio" onclick="showTimeInterval('s')" value="1">saat</input>
			<input id="stime" name="time" type="radio" onclick="showTimeInterval('s')" value="2" checked="">deq</input>
			<select class="srcCmb" name="interval1" id="sinterval1" style="display: none">
				<option value="0">Hamısı</option>
				<option value="1">1-2</option>
				<option value="2">2-3</option>
				<option value="3">3-4</option>
				<option value="4">4-dən uzun</option>
			</select>
			<select class="srcCmb" name="interval2" id="sinterval2">
				<option value="0">Hamısı</option>
				<option value="1">15-dən qısa</option>
				<option value="2">15-30</option>
				<option value="3">30-45</option>
				<option value="4">45-60</option>
			</select> |
			
			<label class="srcLbl">Tarix</label>
			<input class="srcCmb" style="width:70" type="text" name="fromDate" id="dpFrom">&nbsp;
			<input class="srcCmb" style="width:70" type="text" name="toDate"  id="dpTo">&nbsp;
			<a href="?page=advSearch" class="forgotPass">Ətrafli</a>
			</div>
			</form>
			
			<div class="tags">
			
			<ul>
				{section name=sec1 loop=$randTags}
				<li class="tag{$randTags[sec1].size}"><a href="?tagId={$randTags[sec1].tagId}">{$randTags[sec1].name}</a></li> 
				{/section}
			</ul>
			</div>
		
			
			<div class="login">
				<ul class="lang">
					<!--<li>Lang:</li>-->
					{if isset($greeting)}
					<li><a>{$greeting}, {$loggedUser}</a></li>
					<li><a href="admin.php">{$adminPanel}</a></li>
					<li><a href="?action=logout">{$logout}</a></li>
					{/if}
					<li><a href="?lang=az">AZ</a></li>
					<li><a href="?lang=ru">RU</a></li>
					<li><a href="?lang=en">EN</a></li>
				</ul>
				<div style="height:140px;float:left;width:130px">
					<a href="?page=addVideo"><input class="login3" type="submit" value="{$addVideo}" name="submit"></a>
				</div>
				<div style="height:140px;float:right;width:170px">
				<form name="logForm" id="logForm" action="?action=login" method="post">
					<div class="sosialBtn">
					{if !isset($greeting)}
					<a  href="?action=fbLogin"><img class="fb" src="img/fb.png" /></a>
					<a  href="https://connect.mail.ru/oauth/authorize?client_id=734021&response_type=code&redirect_uri=http://pfs.az/?action=mailruLogin"><img class="odn" width="22" width="23"  src="img/mailru.png" /></a>
					{/if}
					</div>
					<input class="u-n" type="text" name="userName" value="" placeholder="{$userName}">
					<input class="pw" type="password" name="password" value="" placeholder="{$password}">
					<a class="forgotPass" href="?page=forgotPass">{$forgotPass}</a>
					<input class="loginLg" type="submit" value="{$login}" name="submit">
					<a href="?page=reg"><input class="login33" type="button" value="{$signUp}" name="submit"></a>
					
				</form>
				</div>
			</div> 
		</div>  
	</div>
	<div class="min-cont bg">
		<!--Statistics Bar Start-->
		<div class="user" align="center"> 
			<a  href="?page=users"><img class="statistics1"  src="img/1.png" /></a>
			<p class="counts">{$users} ({$userCnt})</p>
			<a href="?page=allTags"><img class="statistics2" src="img/2.png" /></a>
			<p class="counts">{$tags} ({$tagCnt})</p>
			<a href="?index.php"><img class="vid" src="img/3.png" /></a>
			<p class="counts">{$videos} ({$videoCnt})</p>
		</div>
		 <!--Statistics Bar End-->