
<!--Videos thums Start-->			 

<div style="padding-top:10px;min-height: 1000px;">
<div class="hollywd" style="margin-top:30px;width:500px">
<h2>{$allTagsTitle}</h2>  
</div>

<div id="eerie">

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

             

