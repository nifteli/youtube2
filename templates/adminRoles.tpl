<script>
$('#all').delegate("a", "click", function(e)
{
     //alert("eleee");
	{section name=sec1 loop=$accessTypes}
	$( "#from{$accessTypes[sec1].id}" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
	$( "#to{$accessTypes[sec1].id}" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
	{/section}
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
	<div id="openModal" class="modalDialog">
		<div>
			<a href="#close" title="Close" class="close">X</a>
			
			<h1><span class="roleTitle">Modal Box</span></h1></br>
			<form name="frmRole" id="frmRole" style="width:100%" action="?page=adminRoles&action=save" method="post">
			<input type="hidden" name="roleId" id="roleId" value="">
			<div class="accessDiv" id="accessDiv" onclick="setDatePickers()">
				<table border="1" id="t01" style="width:100%">
					<tr style="background-color:#B3AC96">
						<td>{$actionName}</td><td>{$dateRange}</td><td>{$hasAccess}</td>
					</tr>
					{section name=sec1 loop=$accessTypes}
					<tr>
						<td>{$accessTypes[sec1].name}</td>
						<td>
							<input type="hidden" name="accessId[]" id="accessId[]" value="{$accessTypes[sec1].id}">
							<input class=field style='width:80px' type=text name=from[] id=from{$accessTypes[sec1].id} value=''>
							<input class=field style='width:80px' type=text name=to[] id=to{$accessTypes[sec1].id} value=''>
						</td>
						<td><input  type="checkbox" name="hasAccess[]" id="hasAccess[]" ></td>
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
</div>
