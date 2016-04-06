
<script>
$(function() {
	$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
	{section name=sec1 loop=$accessTypes}
	$( "#from{$accessTypes[sec1].id}" ).datepicker( 
		{
			changeMonth: true,
			changeYear: true,
			yearRange: "-100:+5"
		},
		$.datepicker.regional["{$lang}"]
	);
	$( "#to{$accessTypes[sec1].id}" ).datepicker( 
		{
			changeMonth: true,
			changeYear: true,
			yearRange: "-100:+5"
		},
		$.datepicker.regional["{$lang}"]
	);
	//$( "#from{$accessTypes[sec1].id}" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
	//$( "#to{$accessTypes[sec1].id}" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
	{/section}
});
</script>	


<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	
	<div class="titles">
		<h1>{$titleRole}</h1>
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
	
		<div style="width:1200px; padding-left: 490px;">
			<form name="frmRole" id="frmRole" action="?page=editRole&action=save" method="post">
			<input type="hidden" name="roleId" id="roleId" value="{$roleId}">
			<div class="accessDiv" id="accessDiv" onclick="setDatePickers()">
				<table border="1" id="t01" style="width:100%">
					<tr style="background-color:#B3AC96">
						<td>{$actionName}</td><td>{$dateRange}</td><td>{$hasAccess}</td>
					</tr>
					{section name=sec1 loop=$accessTypes}
					<tr>
						<td>{$accessTypes[sec1].name}</td>
						<td>
							<input class=field style='width:110px' type=text name=from[{$accessTypes[sec1].id}] id=from{$accessTypes[sec1].id} value='{if in_array({$accessTypes[sec1].id}, $setAccessesArr)}{$fromArr[$accessTypes[sec1].id]}{/if}'>
							<input class=field style='width:110px' type=text name=to[{$accessTypes[sec1].id}] id=to{$accessTypes[sec1].id} value='{if in_array({$accessTypes[sec1].id}, $setAccessesArr)}{$toArr[$accessTypes[sec1].id]}{/if}'>
						</td>
						<td><input  type="checkbox" name="hasAccess[]" value='{$accessTypes[sec1].id}' {if in_array({$accessTypes[sec1].id}, $setAccessesArr)} checked {/if} id="hasAccess[]" ></td>
					</tr>
					{/section}
					<tr>	
						<td colspan=3><br><input class="roleSave" class="login39" type="submit" value="{$save}" name="submit"></td>
					</tr>
				</table>
			</div>
			</form>
		</div>

</div>
