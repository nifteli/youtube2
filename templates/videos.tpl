<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
 var ajax_arry=[];
 var ajax_index =0;
 var sctp = 100;
 $(function(){
   $('#loading').show();
 $.ajax({
	     url:"scroll.php",
                  type:"POST",
                  data:"actionfunction=showData&page=1",
        cache: false,
        success: function(response){
		   $('#loading').hide();
		  $('#demoajax').html(response);
		   
		}
		
	   });
	$(window).scroll(function(){
       
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
	   
	     if ((($(window).scrollTop()+document.body.clientHeight)==$(window).height()) && isload=='true'){
		   $('#loading').show();
	   var ajaxreq = $.ajax({
	     url:"scroll.php",
                  type:"POST",
                  data:"actionfunction=showData&page="+page,
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
		{if isset($errorMessage)}
		<div class="err" style="width:680px; margin-top:40px">{$errorMessage}</div>
		{/if}
		{if isset($okMessage)}
		<div class="success1" style="width:680px; margin-top:40px">{$okMessage}</div>
		{/if}
		<!--<img id='loading' src='img/loading.gif'>-->
		<div id="demoajax" cellspacing="0">
		</div>
	</div>
</div>

             

