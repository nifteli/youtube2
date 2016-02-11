<script>
$('#all').delegate("a", "click", function(e)
{
     //alert("eleee");
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
	{/section }
});


</script>
<script>
function setRoleId(id,name)
{
	showAccess(id);
	document.getElementById("roleId").value = id;
	document.getElementsByClassName("roleTitle")[0].innerHTML = name;
	//setDatePickers();
}

function showAccess(id)
{
	var xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() 
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200) 
		{
			document.getElementById("accessDiv").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","ajax/ajaxActions.php?action=getAccess&id="+id,true);
	xmlhttp.send();
	
}

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
		<h1>{$titleRoles}</h1>
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
	{include_php 'roles.php'}
	</div>
	
</div>
