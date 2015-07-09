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
 				+ "&page=";
 var page = "1";
 $(function(){
   $('#loading').show();
 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:queryStr + page,
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
	   
		 //alert('scrollTop='+$(window).scrollTop()+' clientHeight='+document.body.clientHeight+' winheight='+$(window).height()+' isload='+isload);
	     if ((($(window).scrollTop()+document.body.clientHeight)==$(window).height()) && isload=='true'){
		   $('#loading').show();
	   var ajaxreq = $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:queryStr + page,
        cache: false,
        success: function(response){
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
		<img id='loading' src='img/loading.gif'>
		<div id="demoajax" cellspacing="0">
		</div>
	</div>
</div>
	<br><br><br><br>

             

