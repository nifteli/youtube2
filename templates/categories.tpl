<script type="text/javascript">
	var hasAccess = "{$hasAccess}"; 
	var folderTab = "{$folderTab}"; 
	var catTab = "{$catTab}"; 
	var userId="{$userId}";
	var myUserId="{$myUserId}";
	var general="{$general}";
	var s="{$s}";
	var q={$q};
	
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
	
	function setFolderName(id,folderName,tags)
	{
		 $( "#folderId" ).val( id );
		 $( "#folderName" ).val( folderName );
		 $( "#tags" ).val( tags );
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
		if((option == 2 && comboVal == 1) || (option == 3 && comboVal == 1))
		{
			$('#viewCat').show();
			return;
		}
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
		//alert('#view'+n);
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
						window.location.assign("index.php?src=1&userId="+myUserId);
					shift(0);
					$('#tabSel').val(1);
					$("input[name=option][value=2]").prop('checked', true); 
					$('#viewCat').show();
					for(i=1; i<9; i++)
					{
						$('#view'+i).hide();
						$('#img'+i).removeClass('tabImg2');
						$('#img'+i).addClass('tabImg1');
					}
				}
				else
				{
					//$("loginHref").attr("href", "http://www.google.com/");
					$("a[href='?page=signIn']").attr('href', '?page=signIn&src=mine');
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
	
	 function orderFolders(orderBy,dir)
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
	 
	 function subscription(catId,flag)
	 {
	 //alert(orderBy);
		 $.ajax({
			 url:"ajax/ajaxActions.php",
					  type:"POST",
					  data:"action=subs&catId="+catId+"&flag="+flag,
			cache: false,
			success: function(res){ //alert(res);
			   if(res == 1 && flag == 1)
			   {
			   		jQuery("[id=subs"+catId+"]").attr("src","img/subs.png");
					jQuery("[id=subs"+catId+"]").attr("onclick","subscription("+catId+",0)");
				}
			   if(res == 1 && flag == 0)
			   {
			   		jQuery("[id=subs"+catId+"]").attr("src","img/unsubs.png");
					jQuery("[id=subs"+catId+"]").attr("onclick","subscription("+catId+",1)");
				}
			}
		});
	 }
</script>
<script type="text/javascript">	
	$(document).ready(function(){
	if(((hasAccess == "1" && general=="true") || folderTab == "1" || s == "1") && myUserId == userId)
		changeView(2);
	
	if(hasAccess == "1" && myUserId != userId)
		changeView(3);

	if(folderTab == "1")
		$('#tabSel').val(1);
	if(catTab == "1")
		$('#tabSel').val(2);
	shift(q);
		
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
	
	function addRemFromFolder(videoId,flag,folderId,folderName)
	{
	//alert(videoId+' '+flag+' '+folderId+' '+folderName);
		if(flag == 1)
		{
			if(!confirm("{$deleteConfirmation}"+folderName))
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
			{ //alert("deleted");
				document.getElementById(videoId).innerHTML = "<a href='#add2FolderModal' onClick=\"submitForm("+videoId+")\"><img src='img/add.png' width='15' height='15' title='{$addToMyFolder}'/></a>";
			}
			if(flag == 2 && data == "1")
			{ //alert("added");
				//alert(folderId);
				//$('#addToFolder').html(data);
				document.getElementById(videoId).innerHTML = "<a href='#'><img onclick='addRemFromFolder("+videoId+",1,0,\""+folderName+"\")'  src='img/remove.png' width='15' height='15' title='{$removeFromFolder}'/></a>";
				//$('#addToFolder').hide();
				window.location.href = "#close";
				return;
			}
		 }
	   });
	}
	
	function submitForm(id)
	{
		openNewFolderBox(2);
		document.getElementById('hdnVideoId').value = id;
		//document.getElementById('frmAddToFolder').action = "?page=watchVideo&id="+id+"&action=add2Folder&from=main";
		//document.getElementById('frmAAA').action = "?page=watchVideo&id="+id+"&action=addNewFolder&from=main";
		//document.getElementById('frmAddToFolder').submit();
	}
	
	function addToNewFolder2(videoId,folderName,tags)
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
				//$('#removeFromFolder').show();
				//$('#addToFolder').hide();
				document.getElementById(videoId).innerHTML = "<a href='#'><img onclick='addRemFromFolder("+videoId+",1,0,\""+folderName+"\")'  src='img/remove.png' width='15' height='15' title='{$removeFromFolder}'/></a>";
				window.location.href = "#close";
				return;
			}
		 }
	   })
	}
</script>

 <!--Category Panel Starts-->
<div class="category">
	<!--<h2>Categories</h2>-->
	<div style="width:200px;">
		<div class="tabcontents">
			{if $hasAccess}
			<div id="viewCat" style="display:none">
				<div class='hollywd' style="text-align:center;padding-top:2px">
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name" style="padding-left:5px">
				{if ($myUserId == $userId)}
				<a href="#addNewFolder"><img src="./img/add.png" height="15" width="15">&nbsp {$addNewFolder}</a>
				{/if}
				<div class="orderByDiv">
					<select name="fldOrder" id="fldOrder" 
					onchange="self.location='?userId={$userId}&by='+this.value+'&dir={$dirVal}'"
					style="width: 185;height: 23px !important;">
						<option value="1" {if $by == 1 || !isset($by) } selected {/if} >{$sbAlph}</option>
						<option value="2" {if $by == 2 } selected {/if} >{$sbVideoCnt}</option>
						<option value="3" {if $by == 3 } selected {/if} >{$sbDate}</option>
					</select>
					<br>
					<label>
					<input onclick="self.location='?userId={$userId}&by='+document.getElementById('fldOrder').value+'&dir=1'" 
					type="radio" name="dir" id="dir" value=1 {if (isset($dirVal) && $dirVal==1) || !isset($dirVal)} checked {/if} style="margin-left: 2px;">{$asc}
					</label>
					<label>
					<input onclick="self.location='?userId={$userId}&by='+document.getElementById('fldOrder').value+'&dir=2'"  
					type="radio" name="dir" id="dir" value=2 {if isset($dirVal) && $dirVal==2} checked {/if}>{$desc}
					</label>
				</div>
					<ul>
						{section name=sec1 loop=$myFolders}
						<li>
							{if $folderId == {$myFolders[sec1].folderId}}
							<font color="red">{$myFolders[sec1].folderName} ({$myFolders[sec1].videoCount}) </font>
							{else}
							<a href="?folderId={$myFolders[sec1].folderId}&userId={$userId}&by={$by}&dir={$dirVal}">{$myFolders[sec1].folderName} ({$myFolders[sec1].videoCount}) </a> 
							{/if}
							{if ($myUserId == $userId)}
							<a href="?action=deleteFolder&id={$myFolders[sec1].folderId}" onClick="return confirm('{$deleteConfirmation}')"><img src="./img/delete.png" height="10" width="10" ></a>
							<a onclick="setFolderName({$myFolders[sec1].folderId},'{$myFolders[sec1].folderName}','{$myFolders[sec1].tags}')" href="#editFolder"><img src="./img/edit.png" height="10" width="10"></a>
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
						<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
						{if $hasAccess}
						{if {$cat['userId']} != ''}
						<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
						{else}
						<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
						{/if}
						{/if}
						{if $currCatId == {$cat['id']} && $qs == 4}
						<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
						{else}
						<a href="?df=1&catId={$cat['id']}&q=4">{$cat["catName"]} ({$cat["count"]}) </a>
						{/if}
						</li>
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
						<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
						{if $hasAccess}
						{if {$cat['userId']} != ''}
						<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
						{else}
						<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
						{/if}
						{/if}
						{if $currCatId == {$cat['id']} && $qs == '8'}
						<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
						{else}
						<a href="?df=1&catId={$cat['id']}&q=8">{$cat["catName"]} ({$cat["count"]}) </a>
						{/if}
						</li>
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
						<li style="background: url('{$cat['img']}');" class="liimg"	title="{$cat['catInfo']}">
						{if $hasAccess}
						{if {$cat['userId']} != ''}
						<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
						{else}
						<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
						{/if}
						{/if}
						{if $currCatId != {$cat['id']}}
						<a href="?df=1&catId={$cat['id']}&q=1">{$cat["catName"]} ({$cat["count"]}) </a>
						{else}
						<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
						{/if}
						</li>
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
							<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
							{if $hasAccess}
							{if {$cat['userId']} != ''}
							<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
							{else}
							<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
							{/if}
							{/if}
							{if $currCatId != {$cat['id']}}
							<a href="?df=1&catId={$cat['id']}&q=2">{$cat["catName"]} ({$cat["count"]}) </a>
							{else}
							<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
							{/if}
							</li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<!-- -------------------------- -->
			<div id="view5" style="display:none">
				<div class='hollywd' style="text-align:center;padding-top:2px">
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
			   <div class="c-name">
					{foreach from=$myCatGroupsHow key=k item=v}
						<h2>{$myCatGroupsHow[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsHow[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
							{if $hasAccess}
							{if {$cat['userId']} != ''}
							<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
							{else}
							<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
							{/if}
							{/if}
							{if $currCatId == {$cat['id']} && $qs == 4}
							<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
							{else}
							<a href="?s=1&df=1&userId={$userId}&catId={$cat['id']}&q=4">{$cat["catName"]} ({$cat["count"]}) </a>
							{/if}
							</li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<div id="view6" style="display:none">
				<div class='hollywd' style="text-align:center;padding-top:2px">
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
					{foreach from=$myCatGroupsWhy key=k item=v}
						<h2>{$myCatGroupsWhy[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsWhy[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
							{if $hasAccess}
							{if {$cat['userId']} != ''}
							<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
							{else}
							<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
							{/if}
							{/if}
							{if $currCatId == {$cat['id']} && $qs == 8}
							<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
							{else}
							<a href="?s=1&df=1&userId={$userId}&catId={$cat['id']}&q=8">{$cat["catName"]} ({$cat["count"]}) </a>
							{/if}
							</li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<div id="view7" style="display:none">
				<div class='hollywd' style="text-align:center;padding-top:2px">
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
					{foreach from=$myCatGroupsWhat key=k item=v}
						<h2>{$myCatGroupsWhat[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsWhat[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
							{if $hasAccess}
							{if {$cat['userId']} != ''}
							<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
							{else}
							<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
							{/if}
							{/if}
							{if $currCatId != {$cat['id']}}
							<a href="?s=1&df=1&userId={$userId}&catId={$cat['id']}&q=1">{$cat["catName"]} ({$cat["count"]}) </a>
							{else}
							<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
							{/if}
							</li>
							{/foreach}
						</ul>
					{/foreach}
				</div>
			</div>
			<div id="view8" style="display:none">
				<div class='hollywd' style="text-align:center;padding-top:2px">
					<h2 style="background:white;margin-top:0;width: 100%;line-height: 1;height: 30;overflow: auto;">{$userName}</h2>  
				</div>
				<div class="c-name">
					{foreach from=$myCatGroupsWho key=k item=v}
						<h2>{$myCatGroupsWho[$k]["name"]}</h2>
						<ul>
							{foreach from=$myCatsWho[$k] key=k2 item=cat}
							<li style="background: url('{$cat['img']}');" class="liimg" title="{$cat['catInfo']}">
							{if $hasAccess}
							{if {$cat['userId']} != ''}
							<a href="#"><img title="{$unsubscribe}" onclick="subscription({$cat['id']},0)" id="subs{$cat['id']}" src="img/subs.png" height=15 width=15></a>
							{else}
							<a href="#"><img title="{$subscribe}" onclick="subscription({$cat['id']},1)" id="subs{$cat['id']}" src="img/unsubs.png" height=15 width=15></a>
							{/if}
							{/if}
							{if $currCatId != {$cat['id']}}
							<a href="?s=1&df=1&userId={$userId}&catId={$cat['id']}&q=2">{$cat["catName"]} ({$cat["count"]}) </a>
							{else}
							<font color="red">{$cat["catName"]} ({$cat["count"]})</font>
							{/if}
							</li>
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
		<form name="frmEditFolder" id="frmEditFolder" action="?action=editFolder" method="post">
			<br>
			<div style="float:right;width: 100%;">
				<input type="hidden" name="folderId" id="folderId" >
				<input type="text" name="folderName" id="folderName" placeholder="{$folderName}" style="width: 100%;" required>
				<input type="text" name="tags" id="tags" placeholder="{$tags}" style="width: 100%;margin-top: 5px;margin-bottom: 5px;" required> 
			</div>
		<br><br>
		<div style="text-align:center;width:100%">
			<!-- <input type="submit" class="post" name = "add" id="add" value="{$save}"> -->
			<img src="img/confirm_{$lang}.png" height=30 title="{$save}" onclick="frmEditFolder.submit();"
				onmouseover="this.src='img/confirmSelected_{$lang}.png';"
				onmouseout="this.src='img/confirm_{$lang}.png';"
				onmousedown="this.src='img/confirmPushed_{$lang}.png';">
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
			<div style="float:right;width: 100%;">
				<input type="text" name="folderName" id="folderName" placeholder="{$folderName}" style="width: 100%;" required>
				<input type="text" name="tags" id="tags" placeholder="{$tags}" style="width: 100%;margin-top: 5px;margin-bottom: 5px;" required> 
			</div>
		<br><br>
		<div style="text-align:center;width:100%">
			<!-- <input type="submit" class="post" name = "add" id="add" value="{$save}"> -->
			<img src="img/confirm_{$lang}.png" height=30 title="{$save}" onclick="frmAddNewFolder.submit();"
				onmouseover="this.src='img/confirmSelected_{$lang}.png';"
				onmouseout="this.src='img/confirm_{$lang}.png';"
				onmousedown="this.src='img/confirmPushed_{$lang}.png';">
		</div>
		</form>
	</div>
</div>

<div id="add2FolderModal" name="add2FolderModal"  class="modalDialog">
	<div style="width:260px">
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
			<input type="hidden" value="" name="hdnVideoId" id="hdnVideoId">
			<div style="text-align:center;width:100%;float:left">
				<!-- <input type="submit" class="post" name = "add" id="add"  value="{$addToFolder}"> -->
				<img src="img/confirm_{$lang}.png" height=30 title="{$addToFolder}" onclick="addRemFromFolder(document.getElementById('hdnVideoId').value,2,document.getElementById('fldId').value,fldId.options[fldId.selectedIndex].text)" href="#close"
				onmouseover="this.src='img/confirmSelected_{$lang}.png';"
				onmouseout="this.src='img/confirm_{$lang}.png';"
				onmousedown="this.src='img/confirmPushed_{$lang}.png';">
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
				<div style="text-align:center;width:100%;float:left">
					<!-- <input type="submit" class="post" name = "add" id="add" value="{$save}"> -->
					<img src="img/confirm_{$lang}.png" height=30 title="{$save}" onclick="addToNewFolder2(document.getElementById('hdnVideoId').value,
																						document.getElementById('fldName').value,
																						document.getElementById('tgs').value)"  
				onmouseover="this.src='img/confirmSelected_{$lang}.png';"
				onmouseout="this.src='img/confirm_{$lang}.png';"
				onmousedown="this.src='img/confirmPushed_{$lang}.png';">
				</div>
			</form>
		</div>
	</div>
</div>


<!--Category Panel End-->
		