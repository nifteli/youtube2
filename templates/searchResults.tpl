<script>
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


<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

<div class="videos">
	<div style="padding-top:10px;min-height: 1000px;">
		{if $errorMessage != ''}
		<div class="err" style="width:680px; margin-top:40px">{$errorMessage}</div>
		{/if}
		{if $okMessage != ''}
		<div class="success1" style="width:680px; margin-top:40px">{$okMessage}</div>
		{/if}
		<div class="orderByDiv">
			<select name="reorder" id="reorder" onchange="changeOrderBy(this.value,2)">
				<option value="">{$sortBy}</option>
				<option value="1">{$sbDate}</option>
				<option value="2">{$sbName}</option>
				<option value="3">{$sbLang}</option>
				<option value="4">{$sbQuestion}</option>
				<option value="5">{$sbCategory}</option>
				<option value="6">{$sbDuration}</option>
				<option value="7">{$sbWatches}</option>
				<option value="8">{$sbComments}</option>
			</select>
			<label><input onclick="changeOrderBy(document.getElementById('reorder').value,1)" type="radio" name="direction" id="direction" value=1 {if (isset($directionVal) && $directionVal==1) || !isset($directionVal)} checked {/if}>{$asc}</label>
			<label><input onclick="changeOrderBy(document.getElementById('reorder').value,2)" type="radio" name="direction" id="direction" value=2 {if isset($directionVal) && $directionVal==2} checked {/if}>{$desc}</label>
		</div>
		<img id='loading' src='img/loading.gif'>
		<div id="demoajax" cellspacing="0">
		</div>
	</div>
</div>
	<br><br><br><br>

             

