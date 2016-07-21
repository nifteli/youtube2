<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	
	<div class="titles">
		<h1>{$titleNotifications}</h1>
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
	<div id="all" style="float:left; margin-left:15px; width: 1200px;">
		<form method="post" action="?page=adminNotifications&action=save" id="vlFilter" name="vlFilter" style="width:100%;">
			<h3>{$middleNote}</h3>
			<textarea name="middleNote" id="middleNote" style="width: 100%;background-color: white  !important;" cols="20">{$middleNoteVal}</textarea>
			<h3>{$rightNote}</h3>
			<textarea name="rightNote" id="rightNote" style="width: 50%;background-color: white  !important; height: 150px;" cols="50">{$rightNoteVal}</textarea>
			<h3>{$siteRules}</h3>
			<textarea name="siteRules" id="siteRules" style="width: 100%;background-color: white  !important; height: 200px;" cols="20">{$siteRulesVal}</textarea>
			<h3>{$aboutUs}</h3>
			<textarea name="aboutUs" id="aboutUs" style="width: 100%;background-color: white  !important;height: 200px;" cols="20">{$aboutUsVal}</textarea>
			<h3>{$other}</h3>
			<textarea name="other" id="other" style="width: 100%;background-color: white  !important;height: 200px;" cols="20">{$otherVal}</textarea>
			<h3>Page1</h3>
			<textarea name="page1" id="page1" style="width: 100%;background-color: white  !important;height: 200px;" cols="20">{$page1Val}</textarea>
			<h3>Page2</h3>
			<textarea name="page2" id="page2" style="width: 100%;background-color: white  !important;height: 200px;" cols="20">{$page2Val}</textarea>
			<div style="text-align:center;">
			<input class="login39" type="submit" value="{$save}" name="submit" style="margin-left:0px;margin-top:10px">
			</div>
		</form>
	</div>
</div>
