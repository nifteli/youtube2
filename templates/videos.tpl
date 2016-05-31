<script>
 var ajax_arry=[];
 var ajax_index =0;
 var sctp = 100;
 $(function(){
   $('#loading').show();
 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:"actionfunction={$dataFunction}&page=1&lang={$lang}&catId={$catId}&q={$q}&userId={$userId}&tagId={$tagId}&folderId={$folderId}",
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
	   
		 //alert('scrollTop='+Math.ceil($(window).scrollTop())+1+' clientHeight='+document.body.clientHeight+' winheight='+$(document).height()+' total='+Math.ceil(($(window).scrollTop()+1+document.body.clientHeight))+"getDocHeight()="+getDocHeight());
	     //if ((Math.ceil(($(window).scrollTop() +1 +document.body.clientHeight))>=$(document).height()) && isload=='true'){
		 if($(window).scrollTop() + $(window).height() >= getDocHeight() && isload=='true') {
		   $('#loading').show();
	   var ajaxreq = $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:"actionfunction={$dataFunction}&lang={$lang}&catId={$catId}&q={$q}&userId={$userId}&tagId={$tagId}&folderId={$folderId}&page="+page,
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

function getDocHeight() {
    var D = document;
    return Math.max(
        D.body.scrollHeight, D.documentElement.scrollHeight,
        D.body.offsetHeight, D.documentElement.offsetHeight,
        D.body.clientHeight, D.documentElement.clientHeight
    );
}

function submitForm(id)
{
	openNewFolderBox(2);
	document.getElementById('frmAddToFolder').action = "?page=watchVideo&id="+id+"&action=add2Folder&from=main";
	document.getElementById('frmAAA').action = "?page=watchVideo&id="+id+"&action=addNewFolder&from=main";
	//document.getElementById('frmAddToFolder').submit();
}

function changeOrderBy(orderBy,dir)
 {
 //alert(orderBy);
	$('#loading').show();
	//queryStr = queryStr + "1"+"&orderBy="+orderBy;
	 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:"actionfunction=showAllData&lang={$lang}&page=1"+"&orderBy="+orderBy+"&direction="+dir+"&catId={$catIdVal}&q={$q}&userId={$userIdVal}&tagId={$tagIdVal}&folderId={$folderIdVal}",
        cache: false,
        success: function(response){ //alert(queryStr);
		   $('#loading').hide();
		  $('#demoajax').html(response);
		   //return;
		}
		
	   });
 }
 function openNewFolderBox(n)
{
	if(n ==1)
	{
		$("#existingFolder").hide();
		$("#newFolder").show();
	}
	else
	{
		$("#existingFolder").show();
		$("#newFolder").hide();
	}
	return false;
}
</script>
	

<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"> {$news2}</div>
</div>
</div>

<!--Videos thums Start-->			 

<div class="videos">
	<div style="padding-top:10px;min-height: 1000px;">
		{if $folderName != "()" && $folderName != ""}
			<div class='hollywd' style="    height: 50px;">
				<h2>{$folderName}</h2>  
			</div>
		{/if}
		{if $errorMessage != ''}
		<div class="err" style="width:680px; margin-top:40px">{$errorMessage}</div>
		{/if}
		{if $okMessage != ''}
		<div class="success1" style="width:680px; margin-top:40px">{$okMessage}</div>
		{/if}
		{if $news1 != ''}
		<div class="news1">{$news1}</div>
		{/if}
		{if $dataFunction != 'showData'}
		<div class="orderByDiv">
			<select name="reorder" id="reorder" onchange="changeOrderBy(this.value,2)">
				<!-- <option value="">{$sortBy}</option> -->
				<option value="1" selected>{$sbDate}</option>
				<option value="2">{$sbName}</option>
				<option value="3">{$sbLang}</option>
				<option value="4">{$sbQuestion}</option>
				<option value="5">{$sbCategory}</option>
				<option value="6">{$sbDuration}</option>
				<option value="7">{$sbWatches}</option>
				<option value="8">{$sbComments}</option>
			</select>
			<label><input onclick="changeOrderBy(document.getElementById('reorder').value,1)" type="radio" name="direction" id="direction" value=1 {if isset($directionVal) && $directionVal==1 } checked {/if}>{$asc}</label>
			<label><input onclick="changeOrderBy(document.getElementById('reorder').value,2)" type="radio" name="direction" id="direction" value=2 {if (isset($directionVal) && $directionVal==2) || !isset($directionVal)} checked {/if}>{$desc}</label>
		</div>
		{/if}
		<img id='loading' src='img/loading.gif'>
		<div id="demoajax" cellspacing="0">
		</div>
	</div>
</div>

<!-- <div id="add2FolderModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$folders}</h1>
		{if count($foldersArr)>0}
		<form name="frmAddToFolder" id="frmAddToFolder" action="" method="post">
			<br>
			<label>{$folderName2}:</label>
			<div style="float:right">
				<select class="field" name="folderId" id="folderId" style="width:250px;">
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
</div> -->
<div id="add2FolderModal" name="add2FolderModal"  class="modalDialog">
	<div style="width:250px">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$folders}</h1>
		<div id="existingFolder">
		{if count($foldersArr)>0}
		<form name="frmAddToFolder" id="frmAddToFolder" action="" method="post">
			<br>
			<label>{$folderName2}:</label>
			<div style="float:right">
				<select class="field" name="folderId" id="fldId" style="width:180px;">
					{section name=sec1 loop=$foldersArr}
					<option value="{$foldersArr[sec1].folderId}">{$foldersArr[sec1].folderName} </option>
					{/section}
				</select>
			</div>
			<br>
			<div style="float:right"><a href="#" id="newFolderLink" onclick="return openNewFolderBox(1)">{$addToNewFolder}</a></div>
			<div style="text-align:center;width:100%">
				<input type="submit" class="post" name = "add" id="add"  value="{$addToFolder}">
			</div>
		</form>
		{else}
		{$noFolderNotf}
		<div style="float:right"><a href="#" id="newFolderLink" onclick="return openNewFolderBox(1)">{$addToNewFolder}</a></div>
		{/if}
		</div>
		<div id="newFolder" style="display:none">
			<form name="frmAAA" id="frmAAA" action="1" method="post">
				<br>
				<div style="float:right;width:100%">
					<input type="text" name="folderName" id="fldName" placeholder="{$folderNm}" style="width:100%" required>
					<input type="text" name="tags" id="tgs" placeholder="{$tags}" style="width:100%;margin-bottom:5px;margin-top:5px" required>
				</div>
				<br><br>
				<div style="text-align:center;width:100%">
					<input type="submit" class="post" name = "add" id="add" value="{$save}">
				</div>
			</form>
		</div>
	</div>
</div>
	<br><br><br><br>

             

