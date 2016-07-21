<!--Videos thums Start-->			 
<div style="padding-top:5px;min-height: 1000px;">

<div id="eerie">
<div style="text-align:center;font-weight: bold;font-size: 20px;width: 950px;position:fixed;background:white;">
{section name=record loop=$allLetters}
	<a href="?page=allTags&l={if {$allLetters[record]} == '#'}0{else}{$allLetters[record]}{/if}">{$allLetters[record]}</a>
{/section}
</div>
<div style="text-align:center;font-weight: bold;font-size: 20px;width: 950px;">
{section name=record loop=$allLetters}
	<a href="?page=allTags&l={if {$allLetters[record]} == '#'}0{else}{$allLetters[record]}{/if}">{$allLetters[record]}</a>
{/section}
</div>
<table border=0>
<tr>
	{for $i=0 to 3}
	<td valign="top">
	{section name=record loop=$tagLetters[$i]}
		<div class="phantom">{$tagLetters[$i][record]}</div>
		<div class="corpulent">
			<div class="desc">
			{for $entry=0 to $allTags[{$tagLetters[$i][record]}]|@count-1}
			<a class="insidious" href="?tagId={$allTags[{$tagLetters[$i][record]}][$entry].tagId}">{$allTags[{$tagLetters[$i][record]}][$entry].tagName} ({$allTags[{$tagLetters[$i][record]}][$entry].cnt})</a>
			{/for}
			</div>
		</div>
	{/section}
	</td>
	{/for}
</tr>
</table>
</div>	 
</div>