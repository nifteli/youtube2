
<div style="padding-top:10px;min-height: 1000px;">
<div class="hollywd" style="margin-top:30px">

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
				<input class="search" type="input" name="search" value="" placeholder="{$search}">
				<input class="btnSearch" type="submit" value="{$search}" name="submit">
			
			<div class="advSearch">
			|
				<select class="srcCmb" name="language" id="language">
					<option value="0" selected="selected"> Bütün dillər</option>
	              	{foreach from=$languages item=row1}
	    				{html_options values=$row1.id output=$row1.name selected=$languageVal}
	  				{/foreach}
				</select> |
			<input id="aq3" type="checkbox" value="4" onclick="controlQuestionSelection_s(this, 'a')" name="videoQuestion[]">{$vqHow}</input>
			<input id="aq4"  type="checkbox" value="8" onclick="controlQuestionSelection_s(this, 'a')" name="videoQuestion[]">{$vqWhy}</input>
			<input id="aq1"  type="radio" value="1" onclick="controlQuestionSelection_s(this, 'a')" name="videoQuestion[]">{$vqWhat}</input>
			<input id="aq2"  type="radio" value="2" onclick="controlQuestionSelection_s(this, 'a')" name="videoQuestion[]">{$vqWho}</input>
			<select class="srcCmb" name="category" id="acategory">
				<option value="0" selected="selected"> Bütün kateqoriyalar</option>
			</select> |
			<input id="atime" name="time"  type="radio" onclick="showTimeInterval('a')" value="1">saat</input>
			<input id="atime" name="time" type="radio" onclick="showTimeInterval('a')" value="2" checked="">deq</input>
			<select class="srcCmb" name="interval1" id="ainterval1" style="display: none">
				<option value="0">Hamısı</option>
				<option value="1">1-2</option>
				<option value="2">2-3</option>
				<option value="3">3-4</option>
				<option value="4">4-dən uzun</option>
			</select>
			<select class="srcCmb" name="interval2" id="ainterval2">
				<option value="0">Hamısı</option>
				<option value="1">15-dən qısa</option>
				<option value="2">15-30</option>
				<option value="3">30-45</option>
				<option value="4">45-60</option>
			</select> |
			
			<label class="srcLbl">Tarix</label>
				<input class="srcCmb" style="width:104" type="text" name="fromDate" id="dpFrom2">&nbsp;
				<input class="srcCmb" style="width:104" type="text" name="toDate" id="dpTo2">&nbsp;
				<br/><br/><br/>
				<table cellpadding=0 cellspacing=0 width="100%" >
					<tr>
						<td oolspan=3><input id="checkAll"  type="checkbox" value="0">Hamısını seç</input> <br/><br/></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o1"  type="checkbox" value="v.id" name="opt[]" >Video linkinin unikal nömrəsi</input></td>
						<td><input class="sOpt" id="o2"  type="checkbox" value="v.name" name="opt[]" >Videonun adındakı sözlər</input></td>
						<td><input class="sOpt" id="o3"  type="checkbox" value="v.info" name="opt[]" >Videonun təsvirindəki sözlər</input></td>
						<td><input class="sOpt" id="o4"  type="checkbox" value="t.name" name="opt[]" >Videodakı taqlar</input></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o5"  type="checkbox" value="f.id" name="opt[]" >Şəxsi kataloqun unikal nömrəsi</input></td>
						<td><input class="sOpt" id="o6"  type="checkbox" value="f.name" name="opt[]" >Şəxsi kataloqun adı</input></td>
						<td><input class="sOpt" id="o7"  type="checkbox" value="t.name" name="opt[]" >Şəxsi kataloqdakı taqlar</input></td>
						<td></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o8"  type="checkbox" value="ct.id" name="opt[]" >Şərhlərin unikal nömrəsi</input></td>
						<td><input class="sOpt" id="o9"  type="checkbox" value="ct.comment" name="opt[]" >Şərhlərdəki sözlər</input></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><input class="sOpt" id="o10"  type="checkbox" value="u.id" name="opt[]" >İstifadəçinin unikal nömrəsi</input></td>
						<td><input class="sOpt" id="o11"  type="checkbox" value="u.userName" name="opt[]" >İstifadəçinin loqini</input></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			
			</div>
	</form>
			
<div>