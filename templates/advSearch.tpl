
<div style="padding-top:10px;min-height: 1000px;">
<div class="hollywd" style="margin-top:30px;width:900px">

<script>
	$(document).ready(function () {
	    $("#checkAll").click(function () {
	        $(".sOpt").prop('checked', $(this).prop('checked'));
		});
		$(".sOpt").click(function () {
	        $("#checkAll").prop('checked', false);
		});
});



</script>

<h2>Advanced search</h2>  
</div>
	<form id="advSearchForm" action="?page=searchRes" method="post">
		<input class="search" type="input" name="search" value="{$searchVal}" placeholder="{$search}" style="width:730px">
			<input class="btnSearch" type="image" src="img/search_{$lang}.png" name="submit" 
					onmouseover="this.src='img/searchSelected_{$lang}.png';"
					onmouseout="this.src='img/search_{$lang}.png';"
					onmousedown="this.src='img/searchPushed_{$lang}.png';"> 		
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
			<input class="srcCmb" style="width:95;    margin-left: 7;" type="text" name="fromDate" id="dpFrom2" placeholder="{$fromDate}">&nbsp;
			<input class="srcCmb" style="width:95" type="text" name="toDate"  id="dpTo2" placeholder="{$toDate}">&nbsp;
		</div>
		</div>
				<br/><br/><br/>
				<table cellpadding=0 cellspacing=0 width="100%" >
					<tr>
						<td oolspan=3><input id="checkAll"  type="checkbox" value="0">{$selectAll}</input> <br/><br/></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o1"  type="checkbox" value="v.id" name="opt[]" >{$opt1}</input></td>
						<td><input class="sOpt" id="o2"  type="checkbox" value="v.name" name="opt[]" >{$opt2}</input></td>
						<td><input class="sOpt" id="o3"  type="checkbox" value="v.info" name="opt[]" >{$opt3}</input></td>
						<td><input class="sOpt" id="o4"  type="checkbox" value="t.name" name="opt[]" >{$opt4}</input></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o5"  type="checkbox" value="f.id" name="opt[]" >{$opt5}</input></td>
						<td><input class="sOpt" id="o6"  type="checkbox" value="f.name" name="opt[]" >{$opt6}</input></td>
						<td><input class="sOpt" id="o7"  type="checkbox" value="t.name" name="opt[]" >{$opt7}</input></td>
						<td></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o8"  type="checkbox" value="ct.id" name="opt[]" >{$opt8}</input></td>
						<td><input class="sOpt" id="o9"  type="checkbox" value="ct.comment" name="opt[]" >{$opt9}</input></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o10"  type="checkbox" value="u.id" name="opt[]" >{$opt10}</input></td>
						<td><input class="sOpt" id="o11"  type="checkbox" value="u.userName" name="opt[]" >{$opt11}</input></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			
			</div>
	</form>
			
<div>