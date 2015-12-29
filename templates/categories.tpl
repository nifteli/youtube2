 <script type="text/javascript">
	var hasAccess = "{$hasAccess}"; 
	
	$(document).ready(function(){
		//
		$('#navigation ul a').click(function(){
			$('#navigation ul a').removeClass('selected');
			$(this).addClass('selected');
			//$('#content_changer').html('You have selected '+ $(this).html());
			if($(this).attr("id") == 1)
			{
				showCatalogues();
			}
			else if($(this).attr("id") == 2)
			{
				showAdded();
			}
			else	
			{	
				$('#viewCat').hide();
				$('#viewAdd').hide();
			}
		});
		$('#tabs li a').click(function(){	
			$('#navigation ul a').removeClass('selected');
			$('#viewCat').hide();
			$('#viewAdd').hide();
		});
	});
	function showCatalogues()
	{
		$('#viewCat').show();
		$('#viewAdd').hide();
		$('#view1').hide();
		$('#view2').hide();
		$('#view3').hide();
		$('#view4').hide();
	}
	
	function showAdded()
	{
		$('#viewCat').hide();
		$('#viewAdd').show();
		$('#view1').hide();
		$('#view2').hide();
		$('#view3').hide();
		$('#view4').hide();
	}
	
	function setFolderName(id,folderName)
	{
		 $( "#folderId" ).val( id );
		 $( "#folderName" ).val( folderName );
	}
	
	function shift(n)
	{
		var option = $('input:radio[name=option]:checked').val(); 
		if(option == 3)
			n = n+4;
		if(option==2)
		{
			$("input[name=option][value=1]").prop('checked', true); 
			$("input[name=option][value=2]").prop('checked', false);
			$("input[name=option][value=3]").prop('checked', false);
		}
		//alert(option);
		for(i=1; i<9; i++)
		{
			$('#view'+i).hide();
			$('#viewCat').hide();
			$('#img'+i).removeClass('tabImg2');
			$('#img'+i).addClass('tabImg1');
		}
		$("#img1").attr("src","./img/how_{$lang}.png");
		$("#img2").attr("src","./img/why_{$lang}.png");
		$("#img3").attr("src","./img/what_{$lang}.png");
		$("#img4").attr("src","./img/who_{$lang}.png");
		
		switch(n)
		{
			case 1:
				$("#img1").attr("src","./img/how_sel_{$lang}.png");
				$('#img1').removeClass('tabImg1');
				$('#img1').addClass('tabImg2');
				break;
			case 5:
				$("#img1").attr("src","./img/how_sel_{$lang}.png");
				$('#img1').removeClass('tabImg1');
				$('#img1').addClass('tabImg2');
				break;
			case 2:
				$("#img2").attr("src","./img/why_sel_{$lang}.png");
				$('#img2').removeClass('tabImg1');
				$('#img2').addClass('tabImg2');
				break;
			case 6:
				$("#img2").attr("src","./img/why_sel_{$lang}.png");
				$('#img2').removeClass('tabImg1');
				$('#img2').addClass('tabImg2');
				break;
			case 3:
				$("#img3").attr("src","./img/what_sel_{$lang}.png");
				$('#img3').removeClass('tabImg1');
				$('#img3').addClass('tabImg2');
				break;
			case 7:
				$("#img3").attr("src","./img/what_sel_{$lang}.png");
				$('#img3').removeClass('tabImg1');
				$('#img3').addClass('tabImg2');
				break;
			case 4:
				$("#img4").attr("src","./img/who_sel_{$lang}.png");
				$('#img4').removeClass('tabImg1');
				$('#img4').addClass('tabImg2');
				break;
			case 8:
				$("#img4").attr("src","./img/who_sel_{$lang}.png");
				$('#img4').removeClass('tabImg1');
				$('#img4').addClass('tabImg2');
				break;	
		}
		$('#view'+n).show();
		
		//alert("done");
	}
	
	function changeView(n)
	{
		switch(n)
		{
			case 1:
				shift(1);
				break;
			case 2:
				if(hasAccess == "1")
				{
					shift(0);
					$("input[name=option][value=2]").prop('checked', true); 
					
					$('#viewCat').show();
				}
				else
					window.location.assign("?page=reg");
				break;
			case 3:
				if(hasAccess == "1")
				{
					shift(1);
					$('#viewCat').hide();
				}
				else
					window.location.assign("?page=reg");
				break;
				break;
		}
	}
</script>
 <!--Category Panel Starts-->
<div class="category">
	<!--<h2>Categories</h2>-->
	<div style="width:220px; margin: 0 auto;">
	<div style="width:220px; height:80px">
		<div id="navigation" >
			<input id="option" name="option"  type="radio" checked onclick="changeView(1)" value=1>{$general}</input><br>
			<input id="option" name="option"  type="radio" onclick="changeView(2)" value=2>{$favorite}</input><br>
			<input id="option" name="option"  type="radio" onclick="changeView(3)" value=3>{$added}</input>
		</div>
		<div class="questions">
			<a href="#" onClick="shift(4)"><img class="tabImg1" id="img4" src="./img/who_{$lang}.png" /></a>
			<a href="#" onClick="shift(3)"><img class="tabImg1" id="img3" src="./img/what_{$lang}.png" /></a>
			<a href="#" onClick="shift(2)"><img class="tabImg1" id="img2" src="./img/why_{$lang}.png" /></a>
			<a href="#" onClick="shift(1)"><img class="tabImg2" id="img1" src="./img/how_sel_{$lang}.png" /></a>
		</div>
	</div>
	<div style="float:left;    margin-top: -5px;">
		<img style="float: right;" src="./img/underLine.png" width=220 height=20/>
	</div>
		<div class="tabcontents">
			{if $hasAccess}
			<div id="viewCat" style="display:none">
				<div class="c-name">
				<a href="#addNewFolder"><img src="./img/add.png" height="15" width="15">&nbsp {$addNewFolder}</a><br><br>
					<ul>
						{section name=sec1 loop=$myFolders}
						<li>
							<a href="?folderId={$myFolders[sec1].folderId}">{$myFolders[sec1].folderName} ({$myFolders[sec1].videoCount}) </a> 
							<a href="?action=deleteFolder&id={$myFolders[sec1].folderId}" onClick="return confirm('{$deleteConfirmation}')"><img src="./img/delete.png" height="10" width="10" ></a>
							<a onclick="setFolderName({$myFolders[sec1].folderId},'{$myFolders[sec1].folderName}')" href="#editFolder"><img src="./img/edit.png" height="10" width="10"></a>
						</li>
						{/section}					
					</ul>
				</div>
			</div>
			
			{/if}
			<div id="view1" style="display:block">
			   <div class="c-name">
					<ul>
						{section name=sec1 loop=$catsHow}
						<li style="background: url('{$catsHow[sec1].img}');" class="liImg" 
						title="{$catsHow[sec1].catInfo}"><a href="?catId={$catsHow[sec1].id}">{$catsHow[sec1].catName} ({$catsHow[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view2" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWhy}
						<li style="background: url('{$catsWhy[sec1].img}');" class="liImg" 
						 title="{$catsWhy[sec1].catInfo}"><a href="?catId={$catsWhy[sec1].id}">{$catsWhy[sec1].catName} ({$catsWhy[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view3" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWhat}
						<li style="background: url('{$catsWhat[sec1].img}');" class="liImg" 
						 title="{$catsWhat[sec1].catInfo}"><a href="?catId={$catsWhat[sec1].id}">{$catsWhat[sec1].catName} ({$catsWhat[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view4" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWho}
						<li style="background: url('{$catsWho[sec1].img}');" class="liImg" 
						 title="{$catsWho[sec1].catInfo}"><a href="?catId={$catsWho[sec1].id}">{$catsWho[sec1].catName} ({$catsWho[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<!-- -------------------------- -->
			<div id="view5" style="display:none">
			   <div class="c-name">
					<ul>
						{section name=sec1 loop=$myVideosHow}
						<li style="background: url('{$myVideosHow[sec1].img}');" class="liImg" 
						 title="{$myVideosHow[sec1].catInfo}"><a href="?catId={$myVideosHow[sec1].id}&userId={$userId}">{$myVideosHow[sec1].catName} ({$myVideosHow[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view6" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$myVideosWhy}
						<li style="background: url('{$myVideosWhy[sec1].img}');" class="liImg" 
						 title="{$myVideosWhy[sec1].catInfo}"><a href="?catId={$myVideosWhy[sec1].id}&userId={$userId}">{$myVideosWhy[sec1].catName} ({$myVideosWhy[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view7" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$myVideosWhat}
						<li style="background: url('{$myVideosWhat[sec1].img}');" class="liImg" 
						 title="{$myVideosWhat[sec1].catInfo}"><a href="?catId={$myVideosWhat[sec1].id}&userId={$userId}">{$myVideosWhat[sec1].catName} ({$myVideosWhat[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view8" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$myVideosWho}
						<li style="background: url('{$myVideosWho[sec1].img}');" class="liImg" 
						 title="{$myVideosWho[sec1].catInfo}"><a href="?catId={$myVideosWho[sec1].id}&userId={$userId}">{$myVideosWho[sec1].catName} ({$myVideosWho[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<!-- ----------------------------- -->
		</div>
	</div>
</div>
<div id="editFolder" class="modalDialog" >
	<div style="width:250px">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$editFolder}</h1>
		<form name="frmAddNewFolder" id="frmAddNewFolder" action="?action=editFolder" method="post">
			<br>
			<label>{$folderName}:</label>
			<div style="float:right">
				<input type="hidden" name="folderId" id="folderId">
				<input type="text" name="folderName" id="folderName">
			</div>
		<br><br>
		<div style="text-align:center;width:100%">
			<input type="submit" class="post" name = "add" id="add" value="{$save}">
		</div>
		</form>
	</div>
</div>
<div id="addNewFolder" class="modalDialog" >
	<div style="width:250px">
		<a href="#close" title="Close" class="close">X</a>
		<h1 style="font-weight:bold">{$newFolder}</h1>
		<form name="frmAddNewFolder" id="frmAddNewFolder" action="?action=addNewFolder" method="post">
			<br>
			<label>{$folderName}:</label>
			<div style="float:right">
				<input type="text" name="folderName" id="folderName">
			</div>
		<br><br>
		<div style="text-align:center;width:100%">
			<input type="submit" class="post" name = "add" id="add" value="{$save}">
		</div>
		</form>
	</div>
</div>
<!--Category Panel End-->
		