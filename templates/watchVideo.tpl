<script>
var hasAccess = "{$hasAccess}";
$(document).ready(function() {
document.title = "{$pageTitle}";
$( "#comment" ).focus();
$("meta[name='keywords']").attr('content', "{$keywords}");
    var validator = $("#frmComment").validate({
        rules: {
            comment: "required",
			email: "required",
			agree: "required"
        },
        messages: {
			comment:"",
			email:"",
			agree:""
        },
    });
	
	$('#comment').on('keyup', function(e) { 
		if (e.which == 13 && ! e.shiftKey) {
			//alert(document.getElementById("frmComm").id);
			//$('#frmComm').submit();
			commentAction({$videoId},0,2);
			document.getElementById("comment").value = "";
			return false;
		}
	});
	
});


function editComment(id,flag)
{
//alert("ss"+id);
	if(flag==1)
	{
		$( ".commentText"+id ).hide();
		$( ".commentTextEdit"+id ).show();
	}
	else
	{
		$( ".commentText"+id ).show();
		$( ".commentTextEdit"+id ).hide();
	}
}

function likeIt(videoId,flag)
{
//alert("ok"); 
	$.ajax({
     type: "GET",
     url: 'ajax/ajaxActions.php',
     data: "action=likeIt&videoId="+videoId+"&flag="+flag, 
     success: function(data) {
	 //alert("action=likeIt&videoId="+videoId+"&flag="+flag);
	 //alert(data+"=data")
		if(data=="") return;
		var res = data.split(";");
        $('#likeCnt').html(res[0]);
		$('#dislikeCnt').html(res[1]);
     }
   });
}
function addToNewFolder(videoId,folderName,tags)
{
//alert(tags);
	$.ajax({
     type: "POST",
     url: 'ajax/ajaxActions.php',
     data: "action=addToNewFolder&videoId="+videoId+"&folderName="+folderName+"&tags="+tags, 
	 //alert("action=addToNewFolder&videoId="+videoId+"&folderName='"+folderName+"'&tags='"+tags+"'");
     success: function(data) {
		if(data=="") return;
		if(data == "1")
		{
			//alert(folderId);
			//$('#addToFolder').html(data);
			$('#removeFromFolder').show();
			$('#addToFolder').hide();
			window.location.href = "#close";
			return;
		}
     }
   })
}
function addRemoveFromFolder(videoId,flag,folderId)
{
//alert(videoId);
	if(flag == 1)
	{
		if(!confirm("{$deleteConfirmation}"))
			return;
	}
	$.ajax({
     type: "GET",
     url: 'ajax/ajaxActions.php',
     data: "action=addRemove&videoId="+videoId+"&flag="+flag+"&folderId="+folderId, 
     success: function(data) {
	 //alert("action=addRemove&videoId="+videoId+"&flag="+flag+"&folderId="+folderId);
	 //alert(data)
		if(data=="") return;
		if(flag == 1 && data == "1")
		{
			$('#removeFromFolder').hide();
			$('#addToFolder').show();
		}
		if(flag == 2 && data == "1")
		{
			//alert(folderId);
			//$('#addToFolder').html(data);
			$('#removeFromFolder').show();
			$('#addToFolder').hide();
			window.location.href = "#close";
			return;
		}
     }
   });
}

{literal} 
function isEmailAddress(str) {
   var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   return pattern.test(str);  // returns a boolean 
}
{/literal} 

function orderComments(videoId,dir)
{
	
//$("#commList").val("dddddd");
	$.ajax({
     type: "GET",
     url: 'ajax/ajaxActions.php',
     data: "action=sortComm&videoId="+videoId+"&dir="+dir, 
     success: function(data) {
		if(data=="") return;
		document.getElementById("commList").innerHTML = data;
		if(dir==1)
		{
			$("#orderDesc").show();
			$("#orderAsc").hide();
		}
		if(dir==2)
		{
			$("#orderDesc").hide();
			$("#orderAsc").show();
		}
     }

   });
}

function commentAction(videoId,commentId,flag)
{ 
	//alert(videoId+" "+commentId);
	var action="";
	var email = $("#email").val(); 
	if(email == 'undefined')
		email = "";
	
	var comment = $("#comment").val();
	
	if(flag == 1)
	{
		if(!confirm("{$deleteConfirmation}"))
			return;
		action = "delComment";
	}
	if(flag == 2)
	{
		action = "comment";
		if(hasAccess == "")
		{
			//re =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{ 2,3 })+$/;
			if(email == "" || !isEmailAddress(email))
			{
				alert("Please enter email correctly");
				$( "#email" ).focus();
				return;
			}
			if(!$('#agree').is(":checked"))
			{
				alert("Please agree with rules");
				$( "#agree" ).focus();
				return;
			}
		}
	}
	if(flag == 3)
	{
		action = "editComment";
		comment = $("#comment"+commentId).val();
	}
	$.ajax({
		 type: "POST",
		 url: 'ajax/ajaxActions.php',
		 data: "action="+action+"&videoId="+videoId+"&commentId="+commentId+"&email="+email+"&comment="+comment, 
		 success: function(data) {
		 //alert("action="+action+"&videoId="+videoId+"&commentId="+commentId+"&email="+email+"&comment="+comment);
		 //alert(data)
			if(data=="") return;
			if(flag == 1 && data == "1")
			{
				element = document.getElementById("li"+commentId);
				element.parentNode.removeChild(element);
			}
			if(flag == 2)
			{
				$("#commList").append(data);
			}
			if(flag == 3)
			{
				editComment(commentId,2)
				$('#cmt'+commentId).html('<p>'+comment+'</p>');
			}
		 }
	});
}

function saveComment(id)
{
//alert(id);return;
   $.ajax({
     type: "POST",
     url: './actions/saveComment.php',
     data: "id="+id, 
     success: function(data) {
           // data is ur summary
          //$('#summary').html(data);
		  $( ".commentText"+id ).show();
		  $( ".commentTextEdit"+id ).hide();
     }

   });
}
function share(url, title, descr, image, winWidth, winHeight,flag) 
{
	var winTop = (screen.height / 2) - (winHeight / 2);
	var winLeft = (screen.width / 2) - (winWidth / 2);
	if(flag==1)
	{
		window.open('http://www.facebook.com/sharer.php?s=100&p[title]=' + title + '&p[summary]=' + descr + '&p[url]=' + url + '&p[images][0]=' + image, 'sharer', 'top=' + winTop + ',left=' + winLeft + ',toolbar=0,status=0,width='+winWidth+',height='+winHeight);
	}
	if(flag==2)
	{
		window.open('http://twitter.com/share?text=' + title + '&related=' + descr + '&url=' + url + '&via=www.howtubesmart.com', 'sharer', 'top=' + winTop + ',left=' + winLeft + ',toolbar=0,status=0,width='+winWidth+',height='+winHeight);
	}
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

function hint(elem) {
  elem.parentNode.firstElementChild.style.display = 'block';
}
function unhint(elem) {
  elem.parentNode.firstElementChild.style.display = 'none';
}
</script>
<script>
 var ajax_arry=[];
 var ajax_index =0;
 var sctp = 100;
 $(function(){
   $('#loading').show();
 $.ajax({
	     url:"ajax/scroll.php",
                  type:"POST",
                  data:"actionfunction=showRecommended&videoId={$videoId}&page=1&lang={$lang}&catId={$catId}&tags={$videoTags}",
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
                  data:"actionfunction=showRecommended&videoId={$videoId}&lang={$lang}&catId={$catId}&tags={$videoTags}&page="+page,
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

<!--Videos thums Start-->			 
<div style="padding-top:10px;min-height: 650px;">
	<div class="wvLeft">
		<div class="hollywd" style="margin-top:10px">
			 <h2 title="{$fullVideoName}">{$videoName}</h2>  
		</div>
		<div class="player">
		<video id="vid1" src="" class="video-js vjs-default-skin" controls preload="auto" width="600" height="335" 
		  data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{$videoLink}" }'>
		  </video>
		</div>
	</div>
	<div class="wvRight">
		<div class="v-name">
			  
			  <h2>{$catName}
				{if $hasAccess}
					{if {$isSubscribed}}
						<span id='subs{$categoryId}'><a class='subscription'  id='{$categoryId}:0'> [{$unsubscribe}]</a> ({$subsCnt})</span>
					{else}
						<span id='subs{$categoryId}'><a class='subscription'  id='{$categoryId}:1'> [{$subscribe}]</a> ({$subsCnt})</span>
					{/if}
				{/if}
			  </h2>  
		</div>
		<div class="wvDet1">
			<img src="img/lang.png" width="15" height="15"/><span class="wvLabel">{$language}</span>
			<img src="img/question.png" width="15" height="15"/><span class="wvLabel">{$questions}</span> <br>
			<div style="height: 20;overflow:auto; width:370px"><img src="img/tags2.png" width="20" height="15"/><span class="wvLabel">{$videoTags}</span></div>
			<div class="vidInfo">
				{$info}
			</div>
		</div>
		<div class="actIcons">
			<span class="wvLabel" id="addToFolder" name="addToFolder" {if $added2Folder != 0} style="display:none" {/if}>
			<a {if $hasAccess} onclick="openNewFolderBox(2)" href="#add2FolderModal" {else} href="?page=signIn" onclick="return checkAccess();" {/if}>
			<img src="img/add.png" width="15" height="15" title="{$addToFolderTitle}"/>{$addToFolder}</a>
			</span>	
			
			<span onclick="addRemoveFromFolder({$videoId},1,0)" class="wvLabel" id="removeFromFolder" name="removeFromFolder" {if $added2Folder == 0} style="display:none" {/if}>
			<img src="img/remove.png" width="15" height="15" title="{$removeFromFolderTitle}" />{$removeFromFolder}
			</span>
			
			<a {if $hasAccess} href="#reportVideoModal" {else} href="?page=signIn" onclick="return checkAccess();"{/if}><img src="img/report.png" width="15" height="15" title="{$reportVideoTitle}"/><span class="wvLabel">{$reportVideo}</span></a>
			{if $addedById == $curUserId}
				<a href="?page=addVideo&id={$videoId}"><img src="img/edit.png" width="15" height="15" title="{$editTitle}"/><span class="wvLabel">{$edit}</span></a>		
				<a href="?action=delete&videoId={$videoId}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" title="{$deleteTitle}"/><span class="wvLabel">{$delete}</span></a>
			{/if}
			<br>
			<img src="img/share.png" width="15" height="15"/> : 
			<a href="javascript:share('?page=watchVideo&id={$videoId}', 'Fb Share', 'Facebook share popup', 'img/fb.png', 520, 350,1)"><img width="20" height="20"  src="img/fb.png" title="{$fbTitle}"/></a>
			<a href="javascript:share('pfs.az?page=watchVideo&id={$videoId}', 'pfs.az?page=watchVideo&id={$videoId}', 'Twitter share popup', 'img/fb.png', 520, 350,2)"><img width="20" height="20"  src="img/twitter.png" title="{$twtTitle}"/></a>
		</div>
	</div>
	<div class="wvUnder">
		<img src="img/users.png" width="15" height="15" title="{$authorTitle}"/>  <span class="wvLabel"><a href="?userId={$addedById}">{$author}</a></span>
		<img src="img/upload.png" width="15" height="15" title="{$publishDateTitle}"/>  <span class="wvLabel">{$publishDate}</span>
		<img src="img/eye.png" width="20" height="15" title="{$viewCountTitle}"/>  <span class="wvLabel">{$viewCount}</span>
		<img src="img/comments.png" width="20" height="15" title="{$commentCountTitle}"/>  <span class="wvLabel">{$commentCount}</span>
        <div style="float:right">
		<a {if $hasAccess} href="javascript:void(0);" onclick="likeIt({$videoId},1)" {else} href="?page=signIn" onclick="return checkAccess();" {/if}><img width="15" height="15" src="img/like.png" title="{$likeCountTitle}"/></a>
        <span id="likeCnt" class="wvLabel">{$likeCount}</span>
        <a {if $hasAccess} href="javascript:void(0);" onclick="likeIt({$videoId},2)" {else} href="?page=signIn" onclick="return checkAccess();" {/if}><img width="15" height="15" src="img/dislike.png" title="{$dislikeCountTitle}"/></a>
        <span id="dislikeCnt" class="wvLabel">{$dislikeCount}</span>  
		</div>
		
	</div>
	{if $result == 'error'}
	  <div class="smallerr"  style="margin-top:0;width: 890;">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	{if $result == 'success' and $okMessage != ""}
		<div class="success1" style="margin-top:0">{$okMessage}</div>
	{/if}
	
	<div class="comments">
		<div class="detailBox">
				<div class="cmt">
				<form name="frmComment" id="frmComm" style="float:none;" method="post" action="?page=watchVideo&action=comment&id={$videoId}">
					{if $hasAccess}
						<div class=textfield style="float:left">
						<div class=hint>{$commentHint}</div>
						<TEXTAREA onfocus="hint(this)" onblur="unhint(this)"  class="cmtBox" id="comment" name="comment" COLS=20 placeholder="{$addComment}" style="width: 833px;max-width: 835px;    margin-right: 5;"></TEXTAREA>
						</div>
						<input class="post" type="button" value="{$post}" name="sub" onclick="commentAction({$videoId},0,2)">
					{else}
						<div style="float:left;width:841px">
							<div class=textfield style="float:left">
								<div class=hint>{$commentHint}</div>
								<TEXTAREA onfocus="hint(this)" onblur="unhint(this)" class="cmtBox" id="comment" name="comment" COLS=20 placeholder="{$addComment}" style="max-width: 835px;"></TEXTAREA>
							</div>
							<div class=textfield>
								<div class=hint>{$emailHint}.</div>
								<input onfocus="hint(this)" onblur="unhint(this)" class="field" type="email" name="email" style="height:22px;margin-bottom:5px;width:150px;vertical-align: middle;" id="email" value="{if isset($emailVal)} {$emailVal} {/if}" placeholder="{$email}">
								<label><input type="checkbox" name="agree" id="agree"> {$agreeWithRules} <a href='?page=siteRules'>{$rules}</a></label>
							</div>
						</div>
						<div style="float:right">
							<input class="post" type="button" value="{$post}" name="sub" onclick="commentAction({$videoId},0,2)">
						</div>
					{/if}
					
				</form>
				</div>
			<div class="actionBox">
		
			<div id="orderDesc" style="display:none;cursor:pointer">
				<a onclick="orderComments({$videoId},2)"><img width="25" height="25" src="img/sortDesc.png" title="Order comments"></a>
			</div>
			<div id="orderAsc" style="display:block;cursor:pointer">
				<a onclick="orderComments({$videoId},1)"><img width="25" height="25" src="img/sortAsc.png" title="Order comments"></a>
			</div>
			
				<ul class="commentList" id="commList">
					{section name=sec1 loop=$comments}
					<li id="li{$comments[sec1].commentId}">
						<div class="commenterImage">
						  <img height=30 width=50 src="{$comments[sec1].picturePath}" />
						</div>
						<div class="commentText{$comments[sec1].commentId}">
							<span id='cmt{$comments[sec1].commentId}'><p>{$comments[sec1].comment}</p></span>
							<span class="date sub-text">
							{if $comments[sec1].createdById != ""}
								<a href="index.php?userId={$comments[sec1].createdById}">
							{/if}
							{$comments[sec1].author}</a>, {$comments[sec1].created} 
							{if $comments[sec1].createdById == $curUserId }
								<a href="javascript:void(0);" onclick="editComment({$comments[sec1].commentId},1)">{$edit}</a>
								<a onclick="commentAction({$videoId},{$comments[sec1].commentId},1)" href="#">{$delete}</a>
							{/if}
							</span>
						</div>
						<div class="commentTextEdit{$comments[sec1].commentId}" style="display:none">
							<form name="frmComment" id="frmComment" style="float:none;" method="post" action="?page=watchVideo&id={$videoId}&action=editComment&commentId={$comments[sec1].commentId}">
								<input type="hidden" name="commentId" id="commentId" value="{$comments[sec1].commentId}">
								<TEXTAREA id="comment{$comments[sec1].commentId}" name="comment{$comments[sec1].commentId}" required ROWS=2 COLS=20 class="cmtBox" style="width:640px;">{$comments[sec1].comment}</TEXTAREA>
								<input class="post"  type="button" onclick="commentAction({$videoId},{$comments[sec1].commentId},3)" value="{$save}" >
								<input class="post"  type="button" value="{$cancel}" onclick="editComment({$comments[sec1].commentId},2)">
							</form>
						</div>
					</li>
					{/section}
				</ul>
			</div>
		</div>
		<div class="hollywd">
			  <h2>{$recommended}</h2>  
		</div>
		<img id='loading' src='img/loading.gif'>
		<div id="demoajax" cellspacing="0">
		</div>
	</div>
</div>

<div id="add2FolderModal" name="add2FolderModal"  class="modalDialog">
	<div style="width:250px">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$folders}</h1>
		<div id="existingFolder">
		{if count($foldersArr)>0}
		<form name="frmAddToFolder" id="frmAddToFolder" action="?page=watchVideo&id={$videoId}&action=add2Folder" method="post">
			<br>
			<label>{$folderName}:</label>
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
				<input type="button" class="post" name = "add" id="add" onclick="addRemoveFromFolder({$videoId},2,document.getElementById('fldId').value)" href="#close"  value="{$addToFolder}">
			</div>
		</form>
		{else}
		{$noFolderNotf}
		<div style="float:right"><a href="#" id="newFolderLink" onclick="return openNewFolderBox(1)">{$addToNewFolder}</a></div>
		{/if}
		</div>
		<div id="newFolder" style="display:none">
			<form name="frmAddNewFolder" id="frmAddNewFolder" action="?page=watchVideo&id={$videoId}&action=addNewFolder" method="post">
				<br>
				<div style="float:right;width:100%">
					<input type="text" name="folderName" id="fldName" placeholder="{$folderName}" style="width:100%" required>
					<input type="text" name="tags" id="tgs" placeholder="{$tags}" style="width:100%;margin-bottom:5px;margin-top:5px" required>
				</div>
				<br><br>
				<div style="text-align:center;width:100%">
					<input type="button" class="post" onclick="addToNewFolder({$videoId},document.getElementById('fldName').value,document.getElementById('tgs').value)" name = "add" id="add" value="{$save}">
				</div>
			</form>
		</div>
	</div>
</div>

<div id="reportVideoModal" class="modalDialog" >
	<div style="height:160px; width:400px">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$reportVideo}</h1>
		<form name="frmAddToFolder" id="frmAddToFolder" action="?page=watchVideo&id={$videoId}&action=reportVideo" method="post" style="width:100%">
			<br>
			<label>{$reportReason}:</label>
			<div style="float:right">
				<select class="field" name="reasonId" id="reasonId" style="width:250px;">
					{section name=sec1 loop=$reportReasons}
					<option value="{$reportReasons[sec1].id}">{$reportReasons[sec1].reason} </option>
					{/section}
				 </select>
			</div>
			<br><br>
			<label>{$reportDesc}:</label>
			<textarea type="text" name="desc" id="desc" style="float:right;width:250px;height:60;border: 1px solid #fff;"></textarea>
			
			<div style="text-align:center;width:100%;margin-top: 48;">
				<input type="submit" class="post" name = "add" id="add" value="{$reportVideo}">
				<input type="reset" class="post" name = "add" id="add" onClick="window.location.href = '#close'" value="{$cancel}">
			</div>
		</form>
	</div>
</div>

	
	
	
	
	

             

