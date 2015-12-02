<script>
 var ajax_arry=[];
 var ajax_index =0;
 var sctp = 100;
 $(function(){
   $('#loading').show();
 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:"actionfunction=showData&page=1&lang={$lang}&catId={$catId}&userId={$userId}&tagId={$tagId}&folderId={$folderId}",
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
	   
		 //alert('scrollTop='+$(window).scrollTop()+' clientHeight='+document.body.clientHeight+' winheight='+$(document).height()+' total='+($(window).scrollTop()+document.body.clientHeight)+'isload='+isload);
	     if ((($(window).scrollTop()+document.body.clientHeight)==$(document).height()) && isload=='true'){
		   $('#loading').show();
	   var ajaxreq = $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:"actionfunction=showData&lang={$lang}&catId={$catId}&userId={$userId}&tagId={$tagId}&folderId={$folderId}&page="+page,
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


function submitForm(action)
{
	document.getElementById('frmAddToFolder').action=action;
	//document.getElementById('frmAddToFolder').submit();
}
</script>
	

<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

<div class="videos">
	<div style="padding-top:10px;min-height: 1000px;">
		{if $folderName != "()"}
			<div class='hollywd'>
				<h2>{$folderName}</h2>  
			</div>
		{/if}
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

<div id="add2FolderModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$folders}</h1>
		{if count($foldersArr)>0}
		<form name="frmAddToFolder" id="frmAddToFolder" action="" method="post">
			<br>
			<label>{$folderName2}:</label>
			<div style="float:right">
				<select class="field" name="folderId" id="folderId" style="width:250px; height:30px">
					{section name=sec1 loop=$foldersArr}
					<option value="{$foldersArr[sec1].folderId}">{$foldersArr[sec1].folderName} </option>
					{/section}
				 </select>
			</div>
		<br><br>
		<div style="text-align:center;width:100%">
			<input type="submit" class="post" name = "add" id="add" value="{$addToFolder}">
		</div>
		</form>
		{else}
		{$noFolderNotf}
		{/if}
	</div>
</div>
	<br><br><br><br>

             

