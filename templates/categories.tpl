 <script type="text/javascript">
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
</script>
 <!--Category Panel Starts-->
<div class="category">
	<!--<h2>Categories</h2>-->
	<div style="width:220px; margin: 0 auto; padding: 15px 0 40px;">
		{if $hasAccess}
		<div id="navigation">
			<ul>
				<li><a href="javascript:void(0);" id="1">{$catalogues}</a></li>
				<li><a href="javascript:void(0);" id="2">{$added}</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		{/if}
		<ul id="tabs" class="tabs" data-persist="true">
			<li><a href="#view1" style="background:#dccb8f">{$how}</a></li>
			<li><a href="#view2" style="background:#edd991">{$why}</a></li>
			<li><a href="#view3" style="background:#d4bd69">{$what}</a></li>
			<li><a href="#view4" style="background:#edd684">{$who}</a></li>
		</ul>
		
		<div class="tabcontents">
			{if $hasAccess}
			<div id="viewCat" style="display:none">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$myFolders}
						<li><a href="?folderId={$myFolders[sec1].folderId}">{$myFolders[sec1].folderName} ({$myFolders[sec1].videoCount}) </a></li>
						{/section}					
					</ul>
				</div>
			</div>
			<div id="viewAdd" style="display:none">
				<div class="c-name">
					{if count($myVideosHow)>0}
					<h1 class="catTitle"> {$how} </h1>
					<ul>
						{section name=sec1 loop=$myVideosHow}
						<li><a href="?catId={$myVideosHow[sec1].id}&userId={$userId}">{$myVideosHow[sec1].catName} ({$myVideosHow[sec1].count}) </a></li>
						{/section}
					</ul>
					{/if}
					{if count($myVideosWhy)>0}
					<h1 class="catTitle"> {$why} </h1>
					<ul>
						{section name=sec1 loop=$myVideosWhy}
						<li><a href="?catId={$myVideosWhy[sec1].id}&userId={$userId}">{$myVideosWhy[sec1].catName} ({$myVideosWhy[sec1].count}) </a></li>
						{/section}
					</ul>
					{/if}
					{if count($myVideosWhy)>0}
					<h1 class="catTitle"> {$what} </h1>
					<ul>
						{section name=sec1 loop=$myVideosWhat}
						<li><a href="?catId={$myVideosWhat[sec1].id}&userId={$userId}">{$myVideosWhat[sec1].catName} ({$myVideosWhat[sec1].count}) </a></li>
						{/section}
					</ul>
					{/if}
					{if count($myVideosWho)>0}
					<h1 class="catTitle"> {$who} </h1>
					<ul>
						{section name=sec1 loop=$myVideosWho}
						<li><a href="?catId={$myVideosWho[sec1].id}&userId={$userId}">{$myVideosWho[sec1].catName} ({$myVideosWho[sec1].count}) </a></li>
						{/section}
					</ul>
					{/if}
				</div>
			</div>
			{/if}
			<div id="view1">
			   <div class="c-name">
					<ul>
						{section name=sec1 loop=$catsHow}
						<li title="{$catsHow[sec1].catInfo}"><a href="?catId={$catsHow[sec1].id}">{$catsHow[sec1].catName} ({$catsHow[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view2">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWhy}
						<li title="{$catsWhy[sec1].catInfo}"><a href="?catId={$catsWhy[sec1].id}">{$catsWhy[sec1].catName} ({$catsWhy[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view3">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWhat}
						<li title="{$catsWhat[sec1].catInfo}"><a href="?catId={$catsWhat[sec1].id}">{$catsWhat[sec1].catName} ({$catsWhat[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view4">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWho}
						<li title="{$catsWho[sec1].catInfo}"><a href="?catId={$catsWho[sec1].id}">{$catsWho[sec1].catName} ({$catsWho[sec1].count}) </a></li>
						{/section}
					</ul>
				</div>
			</div>
			
			
		</div>
	</div>
</div>
<!--Category Panel End-->
		