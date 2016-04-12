<div style="padding-top:10px;min-height: 1000px;">
	<div class="hollywd" style="width:500px;">
	<h2>
	{$titleUsers}
	</h2>  
	</div>
	<div class="pic-cont">
		{if $others == 'others'}
			<br><h2>{$usersNote}</h2>
		{/if}
		{section name=sec1 loop=$users}
		<div class="pic1">
			<a href="{$users[sec1].url}"> 
				<img width=100 height= 100 src="{$users[sec1].picPath}"/> 
				<h2>{$users[sec1].user} ({$users[sec1].videoCount})</h2>
			</a>
		</div>
		{/section}
	</div>
 </div>