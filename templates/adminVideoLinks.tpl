<script>
function setDatePickers() 
{ //alert("setting");
	{section name=sec1 loop=$accessTypes}
	$( "#from{$accessTypes[sec1].id}" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
	$( "#to{$accessTypes[sec1].id}" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
	{/section}
}
</script>
<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	<br/><br/><br/>
	<div class="titles">
		<h1>{$titleVideoLinks}</h1>
	</div>
	{if $result == 'error'}
	  <div class="err">
		{foreach from=$messages item=message}
			{$message} <br>
		{/foreach}
	  </div>
	{/if}
	{if $result == 'success'}
	<div class="success1">{$messages['success']}</div>
	{/if}
	<div id="all" style="float:right; margin-right:15px">
	{include_php 'videoLinks.php'}
	</div>
</div>
