<script>
 //var allCategories = {$allCategories};
 var ajax_arry=[];
 var ajax_index =0;
 var sctp = 100;
 var queryStr = "actionfunction=showSearchResults"
 				+ "&lang={$lang}"
 				+ "&search={$search}"
				+ "&language={$language}"
				+ "&videoQuestion={$videoQuestion}"
				+ "&category={$category}"
				+ "&time={$time}"
				+ "&interval={$interval}"
				+ "&fromDate={$fromDate}"
				+ "&toDate={$toDate}"
				+ "&options={$options}"
 				//+ "&page=";
 var page = "1";

 function changeOrderBy(orderBy,dir)
 {
 //alert(orderBy);
	$('#loading').show();
	//queryStr = queryStr + "1"+"&orderBy="+orderBy;
	 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:queryStr + "&page=1"+"&orderBy="+orderBy+"&direction="+dir,
        cache: false,
        success: function(response){ //alert(queryStr);
		   $('#loading').hide();
		  $('#demoajax').html(response);
		   //return;
		}
		
	   });
 }
 $(function(){
   $('#loading').show();
 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:queryStr + "&page=" + page,
        cache: false,
        success: function(response){ 
		   $('#loading').hide();
		  $('#demoajax').html(response);
		   
		}
		
	   });
	$(window).scroll(function(){
       //alert("hi");
	   var height = $('#demoajax').height();
	   var scroll_top = $(this).scrollTop();
	   if(ajax_arry.length>0){
	   $('#loading').hide();
	   for(var i=0;i<ajax_arry.length;i++){
	     ajax_arry[i].abort();
	   }
	}
	   var page = $('#demoajax').find('.nextpage').val();
	   var isload = $('#demoajax').find('.isload').val();
	   var orderBy = $('#demoajax').find('.orderBy').val();
	   
		 //alert('scrollTop='+$(window).scrollTop()+' clientHeight='+document.body.clientHeight+' winheight='+$(window).height()+' isload='+isload);
	     if ((($(window).scrollTop()+document.body.clientHeight)==$(window).height()) && isload=='true'){
		   $('#loading').show();
	   var ajaxreq = $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:queryStr + "&page=" + page + "&orderBy="+orderBy,
        cache: false,
        success: function(response){ //alert(queryStr + "&page=" + page + "&orderBy="+orderBy);
		   $('#demoajax').find('.nextpage').remove();
		   $('#demoajax').find('.isload').remove();
		   $('#loading').hide();
		   
		  $('#demoajax').append(response);
		 
		}
		
	   });
	   ajax_arry[ajax_index++]= ajaxreq;
	   
	   }
	return false;
	
 if($(window).scrollTop() == $(window).height()) {
       alert("bottom!");
   }
	});

});
</script>


<script>
	$(document).ready(function () {
	    $("#checkAll").click(function () {
	        $(".sOpt").prop('checked', $(this).prop('checked'));
		});
		$(".sOpt").click(function () {
	        $("#checkAll").prop('checked', false);
		});
		 loadCategories_s('s_')();
});

</script>
<div style="padding-top:10px;min-height: 1000px;">
	<div class="hollywd" style="width:900px">
	<h2>{$advancedTitle}</h2>  
	</div>
	<form id="advSearchForm" action="?page=advSearch" method="post">
		<input class="search" type="input" name="search"  placeholder="{$searchph}" value="{$search}" style="width:730px" value="{$sVal}">
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
				<label><input id="s_q3" type="checkbox" value="4" onclick="controlQuestionSelection_s(this, 's_')" {if $videoQuestion == 4 || $videoQuestion == 12 } checked {/if} name="videoQuestion[]">{$vqHow}</input></label>
				<label><input id="s_q4"  type="checkbox" value="8" onclick="controlQuestionSelection_s(this, 's_')" {if $videoQuestion== 8 || $videoQuestion == 12} checked {/if} name="videoQuestion[]">{$vqWhy}</input></label>
				<label><input id="s_q1"  type="radio" value="1" onclick="controlQuestionSelection_s(this, 's_')" {if $videoQuestion == 1} checked {/if} name="videoQuestion[]">{$vqWhat}</input></label>
				<label><input id="s_q2"  type="radio" value="2" onclick="controlQuestionSelection_s(this, 's_')" {if $videoQuestion == 2} checked {/if} name="videoQuestion[]">{$vqWho}</input></label>
			<div style="float:right">
			<select class="srcCmb" name="category" id="s_category">
				<option value="0" selected="selected"> {$allCats}</option>
			</select> 
			<!-- <input id="stime" name="time"  type="radio" onclick="showTimeInterval('s')" value="1">{$hour}</input>
			<input id="stime" name="time" type="radio" onclick="showTimeInterval('s')" value="2" checked="">{$minute}</input> -->
			<select class="srcCmb" name="interval" id="sinterval1">
				<option value="0">{$all}</option>
				<option value="1" {if $interval==1} selected {/if}>{$lessThan15}</option>
				<option value="2" {if $interval==2} selected {/if}>15-30 {$minute}</option>
				<option value="3" {if $interval==3} selected {/if}>30-45 {$minute}</option>
				<option value="4" {if $interval==4} selected {/if}>45-60 {$minute}</option>
				<option value="5" {if $interval==5} selected {/if}>1-2 {$hour}</option>
				<option value="6" {if $interval==6} selected {/if}>2-3 {$hour}</option>
				<option value="7" {if $interval==7} selected {/if}>3-4 {$hour}</option>
				<option value="8" {if $interval==8} selected {/if}>{$moreThan4}</option>
			</select>
			</div>
		</div>
		<div style="float:left;width:208px;    height: 26px;">
			<input class="srcCmb" style="width:95;    margin-left: 7;    height: 19px !important;" type="text" name="fromDate" id="dpFrom2" placeholder="{$fromDateph}" value="{$fromDate}">&nbsp;
			<input class="srcCmb" style="width:95;    height: 19px !important;" type="text" name="toDate"  id="dpTo2" placeholder="{$toDateph}" value="{$toDate}">&nbsp;
		</div>
		</div>
				<br/>
				<table cellpadding=0 cellspacing=0 width="100%" >
					<tr>
						<td oolspan=3><label><input id="checkAll" value=1 name="selAll" {if $selAll==1} checked {/if} type="checkbox">{$selectAll}</input></label> <br/><br/></td>
					</tr>
					<tr>
						<td><label><input class="sOpt" id="o1" {if strpos($options, 'id') == true} checked {/if} type="checkbox" value="a.id" name="opt[]">{$opt1}</input></label></td>
						<td><label><input class="sOpt" id="o2"  {if strpos($options, 'name') == true} checked {/if} type="checkbox" value="a.name" name="opt[]" >{$opt2}</input></label></td>
						<td><label><input class="sOpt" id="o3"  {if strpos($options, 'info') == true} checked {/if} type="checkbox" value="a.info" name="opt[]" >{$opt3}</input></label></td>
						<td><label><input class="sOpt" id="o4"  {if strpos($options, 'tags') == true} checked {/if} type="checkbox" value="a.tags" name="opt[]" >{$opt4}</input></label></td>
					</tr>
					<tr>
						<td><label><input class="sOpt" id="o5"  {if strpos($options, 'folderId') == true} checked {/if} type="checkbox" value="a.folderId" name="opt[]" >{$opt5}</input></label></td>
						<td><label><input class="sOpt" id="o6"  {if strpos($options, 'folderName') == true} checked {/if} type="checkbox" value="a.folderName" name="opt[]" >{$opt6}</input></label></td>
						<td><label><input class="sOpt" id="o7"  {if strpos($options, 'tags') == true} checked {/if} type="checkbox" value="a.tags" name="opt[]" >{$opt7}</input></label></td>
						<td></td>
					</tr>
					<tr>
						<td><label><input class="sOpt" id="o8"  {if strpos($options, 'commentId') == true} checked {/if} type="checkbox" value="a.commentId" name="opt[]" >{$opt8}</input></label></td>
						<td><label><input class="sOpt" id="o9"  {if strpos($options, 'comment') == true} checked {/if} type="checkbox" value="a.comment" name="opt[]" >{$opt9}</input></label></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label><input class="sOpt" id="o10"  {if strpos($options, 'userId') == true} checked {/if} type="checkbox" value="a.userId" name="opt[]" >{$opt10}</input></label></td>
						<td><label><input class="sOpt" id="o11"  {if strpos($options, 'addedBy') == true} checked {/if} type="checkbox" value="a.addedBy" name="opt[]" >{$opt11}</input></label></td>
						<td></td>
						<td></td>
					</tr>
				</table>
	</form>
	
	<div class="orderByDiv" style="margin-top:10px">
		<select name="reorder" id="reorder" onchange="changeOrderBy(this.value,2)">
			<!-- <option value="">{$sortBy}</option> -->
			<option value="1">{$sbDate}</option>
			<option value="2">{$sbName}</option>
			<option value="3">{$sbLang}</option>
			<option value="4">{$sbQuestion}</option>
			<option value="5">{$sbCategory}</option>
			<option value="6">{$sbDuration}</option>
			<option value="7">{$sbWatches}</option>
			<option value="8">{$sbComments}</option>
		</select>
		<label><input onclick="changeOrderBy(document.getElementById('reorder').value,1)" type="radio" name="direction" id="direction" value=1 {if (isset($directionVal) && $directionVal==1)} checked {/if}>{$asc}</label>
		<label><input onclick="changeOrderBy(document.getElementById('reorder').value,2)" type="radio" name="direction" id="direction" value=2 {if isset($directionVal) && $directionVal==2|| !isset($directionVal)} checked {/if}>{$desc}</label>
	</div>
	<div style="width:900px;float:left">
	<img id='loading' src='img/loading.gif'>
	<div id="demoajax" cellspacing="0">
	</div>
	</div	>
</div>