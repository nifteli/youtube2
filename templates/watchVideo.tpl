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
     url: './ajaxActions.php',
     data: "action=likeIt&videoId="+videoId+"&flag="+flag, 
     success: function(data) {
	 //alert(data);
		if(data=="") return;
		var res = data.split(";");
        $('#likeCnt').html("<p>"+res[0]+"</p>");
		$('#dislikeCnt').html("<p>"+res[1]+"</p>");
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
<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 
	<div style="padding-top:10px;min-height: 650px;">
		<div class="hollywd">
			  <h2>{$catName}</h2>  
		</div>
		<div class="player">
		<video id="vid1" src="" class="video-js vjs-default-skin" controls preload="auto" width="660" height="335" 
		  data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{$videoLink}" }'>
		  </video>
		</div>
        <div class="v-name">
             <h2>{$videoName}</h2>
          <div class="line2"></div>
         </div>
         
         <div class="fb-l">
        <a href="javascript:void(0);" onclick="likeIt({$videoId},1)"><img src="img/like-1.png"/></a>
        <div id="likeCnt"><p>{$likeCount}</p></div>
        </div>
        <div class="fb-l2">
        <a href="javascript:void(0);" onclick="likeIt({$videoId},2)"><img src="img/like-2.png"/> </a>
        <div id="dislikeCnt"><p>{$dislikeCount}</p></div>
        </div>
		<div class="v-details">
			<img src="img/usr-2.png" width="32" height="32" alt=""/> 
			<h2>{$author}</h2>
			<h3>{$views}:&nbsp;&nbsp;&nbsp;{$viewCount}</h3>
			<h4><b>{$tags}:</b>&nbsp;&nbsp; {$videoTags}</h4>
			<h5><b>{$published}:</b>&nbsp;&nbsp; {$publishDate}</h5> 
		</div> 
		<div class="strip">
			<img src="img/flag.png" width="24" height="28" alt=""/><a class="flag" href="#">{$reportVideo}</a>
			<img class="foldr" src="img/foldr.png" width="38" height="37" alt=""/> 
			<a class="flag" href="#">{$addToFolder}</a>
			<a href="javascript:share('?page=watchVideo&id={$videoId}', 'Fb Share', 'Facebook share popup', 'img/fb.png', 520, 350,1)" class="tw" style="margin-left:10px"><img src="img/fb.png"/></a>
			<a class="tw" href="javascript:share('pfs.az?page=watchVideo&id={$videoId}', 'pfs.az?page=watchVideo&id={$videoId}', 'Twitter share popup', 'img/fb.png', 520, 350,2)"><img src="img/twitter.png"/></a>
		</div>
	{if $result == 'error'}
	  <div class="smallerr">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	</div>
	
	<div class="comments">
		<div class="detailBox">
				{if !$hasAccess}
				<div class="cmtEmail">
					<label>{$email}:
					<div class="gap"><input class="field" type="email" name="email" id="email" value="{if isset($emailVal)} {$emailVal} {/if}"></div></label>
				</div>
				{/if}
				<div class="cmt">
				<form name="frmComment" id="frmComment" style="float:none;" method="post" action="?page=watchVideo&action=comment&id={$videoId}">
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
								<input class="post" style="margin-left:360px;" type="submit" value="{$save}" >
							</form>
							<input class="post" style="margin-left:510px" type="button" value="{$cancel}" onclick="editComment({$comments[sec1].commentId},2)">
						</div>
					</li>
					{/section}
				</ul>
			</div>
		</div>
	</div>

             

