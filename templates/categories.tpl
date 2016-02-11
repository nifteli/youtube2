 <script type="text/javascript">
	var hasAccess = "{$hasAccess}"; 
	var folderTab = "{$folderTab}"; 
	var catTab = "{$catTab}"; 
	var userId="{$userId}";
	var myUserId="{$myUserId}";
	
	$(document).ready(function(){
		if(hasAccess == "1" && myUserId == userId)	
			changeView(2);
		
		if(hasAccess == "1" && myUserId != userId)
			changeView(3);
		if(folderTab == "1")
			$('#tabSel').val(1);
		if(catTab == "1")
			$('#tabSel').val(2);
		
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
		var comboVal = document.getElementById("tabSel").value;
		if((option == 2 && comboVal == 2) || option ==3 && comboVal == 2)
			n = n+4;  //alert(n);
		if(option==2)
		{
			$("input[name=option][value=1]").prop('checked', false); 
			$("input[name=option][value=2]").prop('checked', true);
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
		
		if(n > 0 && n < 5)
		{
			$("input[name=option][value=1]").prop('checked', true); 
			document.getElementById("tabSel").disabled = true;
		}
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
				$('#tabSel').val(1);
				document.getElementById("tabSel").disabled = true;
				break;
			case 2:
				document.getElementById("tabSel").disabled = false;
				if(hasAccess == "1")
				{
					if(userId != myUserId)
						window.location.assign("index.php");
					shift(0);
					$('#tabSel').val(1);
					$("input[name=option][value=2]").prop('checked', true); 
					$('#viewCat').show();
				}
				else
				{
					document.getElementById("regPop").click();
					$("input[name=option][value=1]").prop('checked', true); 
					//return false;
				}
				break;
			case 3:
				shift(0);
				$("input[name=option][value=3]").prop('checked', true); 
				document.getElementById("tabSel").disabled = false;
				$('#viewCat').show();
				
				if(catTab == "1")
				{
					shift(5);
					$('#viewCat').hide();
					$("#img1").attr("src","./img/how_sel_{$lang}.png");
					$('#img1').removeClass('tabImg1');
					$('#img1').addClass('tabImg2');
					$('#view5').show();
				}
				break;
			
		}
	}
	
	function showData(val)
	{
		if(val == 1)
		{
			shift(0);
			$('#viewCat').show();
		}
		else
		{
			shift(1);
			$('#viewCat').hide();
		}
	}
</script>
 <!--Category Panel Starts-->
<div class="category">
	<!--<h2>Categories</h2>-->
	<div style="width:220px; margin: 0 auto;">
	<div style="width:220px; height:80px">
		<div id="navigation" style="line-height: 0;">
			<label><input id="option" name="option"  type="radio" checked onclick="changeView(1)" value=1>{$general}</input></label><br>
			<label><input id="option" name="option"  type="radio" onclick="changeView(2)" value=2>{$myVideos}</input></label><br>
			<label><input id="option" name="option"  type="radio" value=3 onclick = "document.location.href='?page=users'">{$otherUsers}</input></label>
			<select class="srcCmb" name="tabSel" id="tabSel" style="margin-left: 4;width:95px" disabled onchange="showData(this.value)" >
				<option value="1" selected="selected"> {$favorite}</option>
				<option value="2"> {$added}</option>
			</select> 
			
		</div>
		<div class="questions">
			<a href="#" onClick="shift(4)" onmouseover="shift(4)"><img class="tabImg1" id="img4" src="./img/who_{$lang}.png" /></a>
			<a href="#" onClick="shift(3)" onmouseover="shift(3)"><img class="tabImg1" id="img3" src="./img/what_{$lang}.png" /></a>
			<a href="#" onClick="shift(2)" onmouseover="shift(2)"><img class="tabImg1" id="img2" src="./img/why_{$lang}.png" /></a>
			<a href="#" onClick="shift(1)" onmouseover="shift(1)"><img class="tabImg2" id="img1" src="./img/how_sel_{$lang}.png" /></a>
		</div>
	</div>
	<div style="float:left;    margin-top: -5px;">
		<img style="float: right;" src="./img/underLine.png" width=220 height=20/>
	</div>
		<div class="tabcontents">
			{if $hasAccess}
			<div id="viewCat" style="display:none">
				<div class='hollywd' >
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
				{if ($myUserId == $userId)}
				<a href="#addNewFolder"><img src="./img/add.png" height="15" width="15">&nbsp {$addNewFolder}</a><br><br>
				{/if}
					<ul>
						{section name=sec1 loop=$myFolders}
						<li>
							<a href="?folderId={$myFolders[sec1].folderId}&userId={$userId}">{$myFolders[sec1].folderName} ({$myFolders[sec1].videoCount}) </a> 
							{if ($myUserId == $userId)}
							<a href="?action=deleteFolder&id={$myFolders[sec1].folderId}" onClick="return confirm('{$deleteConfirmation}')"><img src="./img/delete.png" height="10" width="10" ></a>
							<a onclick="setFolderName({$myFolders[sec1].folderId},'{$myFolders[sec1].folderName}')" href="#editFolder"><img src="./img/edit.png" height="10" width="10"></a>
							{/if}
						</li>
						{/section}					
					</ul>
				</div>
			</div>
			
			{/if}
			<div id="view1" style="display:block">
			   <div class="c-name">
				{foreach from=$catGroupsHow key=k item=v}
					<h2>{$catGroupsHow[$k]["name"]}</h2>
					<ul>
						{foreach from=$catsHow[$k] key=k2 item=cat}
						<li style="background: url('{$cat['img']}');" class="liimg" 
						title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
						{/foreach}
					</ul>
				{/foreach}
				</div>
			</div>
			<div id="view2" style="display:none">
				<div class="c-name">
				{foreach from=$catGroupsWhy key=k item=v}
					<h2>{$catGroupsWhy[$k]["name"]}</h2>
					<ul>
						{foreach from=$catsWhy[$k] key=k2 item=cat}
						<li style="background: url('{$cat['img']}');" class="liimg" 
						title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
						{/foreach}
					</ul>
				{/foreach}
				</div>
			</div>
			<div id="view3" style="display:none">
				<div class="c-name">
				{foreach from=$catGroupsWhat key=k item=v}
					<h2>{$catGroupsWhat[$k]["name"]}</h2>
					<ul>
						{foreach from=$catsWhat[$k] key=k2 item=cat}
						<li style="background: url('{$cat['img']}');" class="liimg" 
						title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
						{/foreach}
					</ul>
				{/foreach}
				</div>
			</div>
			<div id="view4" style="display:none">
				<div class="c-name">
					{foreach from=$catGroupsWho key=k item=v}
						<h2>{$catGroupsWho[$k]["name"]}</h2>
						<ul>
							{foreach from=$catsWho[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" 
							title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<!-- -------------------------- -->
			<div id="view5" style="display:none">
				<div class='hollywd' >
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
			   <div class="c-name">
					{foreach from=$myCatGroupsHow key=k item=v}
						<h2>{$myCatGroupsHow[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsHow[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" 
							title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<div id="view6" style="display:none">
				<div class='hollywd' >
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
					{foreach from=$myCatGroupsWhy key=k item=v}
						<h2>{$myCatGroupsWhy[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsWhy[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" 
							title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<div id="view7" style="display:none">
				<div class='hollywd' >
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
					{foreach from=$myCatGroupsWhat key=k item=v}
						<h2>{$myCatGroupsWhat[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsWhat[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" 
							title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<div id="view8" style="display:none">
				<div class='hollywd' >
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
					{foreach from=$myCatGroupsWho key=k item=v}
						<h2>{$myCatGroupsWho[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsWho[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" 
							title="{$cat['catInfo']}"><a href="?catId={$cat['id']}">{$cat["catName"]} ({$cat["count"]}) </a></li>
							{/foreach}
						</ul>
					{/foreach}
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
			<label>{$tags}:</label>
			<div style="float:right;margin-top:3px">
				<input type="text" name="tags" id="tags">
			</div>
		<br><br>
		<div style="text-align:center;width:100%">
			<input type="submit" class="post" name = "add" id="add" value="{$save}">
		</div>
		</form>
	</div>
</div>


<!--Category Panel End-->
		