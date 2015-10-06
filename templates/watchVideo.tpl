<script>
$(document).ready(function() {
    var validator = $("#frmComment").validate({
        rules: {
            comment: "required",
			email: "required"
        },
        messages: {
			comment:"",
			email:""
        },
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
//alert(videoId+" "+flag); 
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
		<div class="hollywd">
			  <h2>{$catName}</h2>  
		</div>
		<div class="player">
		<video id="vid1" src="" class="video-js vjs-default-skin" controls preload="auto" width="600" height="335" 
		  data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{$videoLink}" }'>
		  </video>
		</div>
	</div>
	<div class="wvRight">
		<div class="v-name">
			  <h2>{$videoName}</h2>  
		</div>
		<div class="wvDet1">
			<img src="img/lang.png" width="15" height="15"/><span class="wvLabel">{$language}</span>
			<img src="img/question.png" width="15" height="15"/><span class="wvLabel">{$questions}</span> <br>
			<div style="overflow:auto; width:370px"><img src="img/tags.png" width="20" height="15"/><span class="wvLabel">{$videoTags}</span></div> <br>
			<div class="vidInfo">
				{$info}
			</div>
		</div>
	</div>
	<div class="wvUnder">
		<img src="img/users.png" width="15" height="15" alt=""/>  <span class="wvLabel">{$author}</span>
		<img src="img/upload.png" width="15" height="15" alt=""/>  <span class="wvLabel">{$publishDate}</span>
		<img src="img/eye.png" width="20" height="15" alt=""/>  <span class="wvLabel">{$viewCount}</span>
        <a {if $hasAccess} href="javascript:void(0);" onclick="likeIt({$videoId},1)" {else} href="?page=signIn" {/if}><img width="15" height="15" src="img/like.png"/></a>
        <span id="likeCnt" class="wvLabel">{$likeCount}</span>
        <a {if $hasAccess} href="javascript:void(0);" onclick="likeIt({$videoId},2)" {else} href="?page=signIn" {/if}><img width="15" height="15" src="img/dislike.png"/></a>
        <span id="dislikeCnt" class="wvLabel">{$dislikeCount}</span>  
		{if $added2Folder == 0}
			<a {if $hasAccess} href="#add2FolderModal" {else} href="?page=signIn" {/if}><img src="img/add.png" width="15" height="15" alt=""/><span class="wvLabel">{$addToFolder}</span></a>	
		{else}
			<a href="?page=watchVideo&id={$videoId}&action=delFromFolder"><img src="img/remove.png" width="15" height="15" alt=""/><span class="wvLabel">{$removeFromFolder}</span></a>	
		{/if}
		<a {if $hasAccess} href="#reportVideoModal" {else} href="?page=signIn" {/if}><img src="img/report.png" width="15" height="15" alt=""/><span class="wvLabel">{$reportVideo}</span></a>
		{if $addedById == $curUserId}
			<a href="?page=addVideo&id={$videoId}"><img src="img/edit.png" width="15" height="15" alt=""/><span class="wvLabel">{$edit}</span></a>		
			<a href="?action=delete&videoId={$videoId}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/remove.png" width="15" height="15" alt=""/><span class="wvLabel">{$delete}</span></a>
		{/if}
		<a href="javascript:share('?page=watchVideo&id={$videoId}', 'Fb Share', 'Facebook share popup', 'img/fb.png', 520, 350,1)"><img width="20" height="20"  src="img/fb.png"/></a>
		<a href="javascript:share('pfs.az?page=watchVideo&id={$videoId}', 'pfs.az?page=watchVideo&id={$videoId}', 'Twitter share popup', 'img/fb.png', 520, 350,2)"><img width="20" height="20"  src="img/twitter.png"/></a>
	</div>
	{if $result == 'error'}
	  <div class="smallerr">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	{if $result == 'success' and $okMessage != ""}
		<div class="success1">{$okMessage}</div>
	{/if}
	
	<div class="comments">
		<div class="detailBox">
				<div class="cmt">
				<form name="frmComment" id="frmComment" style="float:none;" method="post" action="?page=watchVideo&action=comment&id={$videoId}">
					{if !$hasAccess}
					<div class="cmtEmail">
						<label>{$email}:</label>
						<input class="field" type="email" name="email" style="height:25px;margin-bottom:5px" id="email" value="{if isset($emailVal)} {$emailVal} {/if}">
					</div>
					{/if}
					<TEXTAREA class="cmtBox" id="comment" name="comment" COLS=20 placeholder="{$addComment}"></TEXTAREA>
					<input class="post" type="submit" value="{$post}" name="submit">
				</form>
				</div>
			<div class="actionBox">
				<ul class="commentList">
					{section name=sec1 loop=$comments}
					<li>
						<div class="commenterImage">
						  <img height=30 width=50 src="{$comments[sec1].picturePath}" />
						</div>
						<div class="commentText{$comments[sec1].commentId}">
							<p>{$comments[sec1].comment}</p> <span class="date sub-text">{$comments[sec1].author}, {$comments[sec1].created} 
							{if $comments[sec1].createdById == $curUserId }
								<a href="javascript:void(0);" onclick="editComment({$comments[sec1].commentId},1)">{$edit}</a>
								<a href="?page=watchVideo&id={$videoId}&action=delComment&commentId={$comments[sec1].commentId}">{$delete}</a>
							{/if}
							</span>
						</div>
						<div class="commentTextEdit{$comments[sec1].commentId}" style="display:none">
							<form name="frmComment" id="frmComment" style="float:none;" method="post" action="?page=watchVideo&id={$videoId}&action=editComment&commentId={$comments[sec1].commentId}">
								<input type="hidden" name="commentId" id="commentId" value="{$comments[sec1].commentId}">
								<TEXTAREA id="comment{$comments[sec1].commentId}" name="comment{$comments[sec1].commentId}" required ROWS=2 COLS=20 class="cmtBox" style="width:350px;">{$comments[sec1].comment}</TEXTAREA>
								<input class="post"  type="submit" value="{$save}" >
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

<div id="add2FolderModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$folders}</h1>
		{if count($foldersArr)>0}
		<form name="frmAddToFolder" id="frmAddToFolder" action="?page=watchVideo&id={$videoId}&action=add2Folder" method="post">
			<br>
			<label>{$folderName}:</label>
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

<div id="reportVideoModal" class="modalDialog" >
	<div style="height:200px; width:400px">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$reportVideo}</h1>
		<form name="frmAddToFolder" id="frmAddToFolder" action="?page=watchVideo&id={$videoId}&action=reportVideo" method="post">
			<br>
			<label>{$reportReason}:</label>
			<div style="float:right">
				<select class="field" name="reasonId" id="reasonId" style="width:250px; height:30px">
					{section name=sec1 loop=$reportReasons}
					<option value="{$reportReasons[sec1].id}">{$reportReasons[sec1].reason} </option>
					{/section}
				 </select>
			</div>
			<br><br>
			<label>{$reportDesc}:</label>
			<textarea type="text" name="desc" id="desc" style="float:right;width:250px;height:60;border: 1px solid #fff;"></textarea>
			<br><br><br><br>
			<div style="text-align:center;width:100%">
				<input type="submit" class="post" name = "add" id="add" value="{$reportVideo}">
			</div>
		</form>
	</div>
</div>

	
	
	
	
	

             

