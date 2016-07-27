<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#created" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#createdTill" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
//$( "#created" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
//$( "#createdTill" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});

function submitForm(action)
{
	if(action=='#') return;
	document.getElementById('vlFilter').action=action;
	document.getElementById('vlFilter').submit();
}

function copyEmails()
{
	var emails="";
	$('input[type=checkbox]').each(function () {
		if (this.checked) 
		{ 
			var hv = $('#email_' +  $(this).attr('id')).attr("value");
			if(hv != "" && typeof hv !== 'undefined')
				emails += hv + "; ";
		}
	});
   $('#to').val(emails);
	
}

function showProfile(userId)
{
	//alert(userId);
	//$('#profileDiv').html("test");
	$.ajax({
     type: "GET",
     url: 'ajax/ajaxActions.php',
     data: "action=showProfile&userId="+userId, 
     success: function(data) {
	 	//if(data=="");return;
		$('#profileDiv').html(data);
     }
   });
}
</script>
<div>

	<div class="actionButtons">
	<form method="post" action="?page=adminUsers&action=set" id="vlFilter" name="vlFilter">
	<table border=1 cellpadding=25 cellspacing=25 align=right>
		<tr style="text-align:right">
			<td>
				<a onclick="copyEmails()" href="#sendMail">
				<img src="img/sendMail.png" width="65" height="55" alt="sendMail"/>
				</a>
			</td>
			<td><button class="btn btn-light-combo btn-sm" name="action" value="saveRoles" type="submit" >{$saveRoles}</button></td>
		</tr>
	</table>
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
	<div id="all" style="float:left; margin-left:15px; overflow-x: auto;">
		
		<div class="table-responsive" style="overflow-x: auto; width:4500px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 220px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=created&createdSortType={$createdSortType}')">{$lnCreated}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$idUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$userNameUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=userName&userNameSortType={$userNameSortType}')">{$lnUserName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$nameUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=name&nameSortType={$nameSortType}')">{$lnName}</a></th>
					<th class="vertical-middle" style=" text-align:center" title="{$lnRoleUsersHint}" >{$lnRole}</th>
					<th class="vertical-middle" style=" text-align:center" title="{$viewProfileUsersHint}" >{$viewProfile}</th>
					<th class="vertical-middle" style=" text-align:center" title="{$setUserUsersHint}" >{$setUser}</th>
					<th class="vertical-middle" style=" text-align:center" title="{$deleteUsersHint}" >{$delete}</th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=updated&updatedSortType={$updatedSortType}')">{$lnUpdated}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$deletedUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=deleted&deletedSortType={$deletedSortType}')">{$lnDeleted}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$fatherNameUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=fatherName&fatherNameSortType={$fatherNameSortType}')">{$lnFatherName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$birthDateUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=birthDate&birthDateSortType={$birthDateSortType}')">{$lnBirthDate}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$adminUsersUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=email&emailSortType={$emailSortType}')">{$lnEmail}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$telephoneUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=telephone&telephoneSortType={$telephoneSortType}')">{$lnTelephone}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$noteUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=note&noteSortType={$noteSortType}')">{$lnNote}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$genderUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=gender&genderSortType={$genderSortType}')">{$lnGender}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$languageUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=language&languageSortType={$languageSortType}')">{$lnLanguage}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$professionUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=profession&professionSortType={$professionSortType}')">{$lnProfession}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$interestsUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=interests&interestsSortType={$interestsSortType}')">{$lnInterests}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$registeredByIpUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=registeredByIp&registeredByIpSortType={$registeredByIpSortType}')">{$lnRegisteredByIp}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$regDeviceUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=regDevice&regDeviceSortType={$regDeviceSortType}')">{$lnRegDevice}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$regBrowserUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=regBrowser&regBrowserSortType={$regBrowserSortType}')">{$lnRegBrowser}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updateUserIdUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=updateUserId&updateUserIdSortType={$updateUserIdSortType}')">{$lnUpdateUserId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$deletedByIdUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=deletedById&deletedByIdSortType={$deletedByIdSortType}')">{$lnDeletedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$getSiteNewsUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=getSiteNews&getSiteNewsSortType={$getSiteNewsSortType}')">{$lnGetSiteNews}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$getEmailOnCommentUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=getEmailOnComment&getEmailOnCommentSortType={$getEmailOnCommentSortType}')">{$lnGetEmailOnComment}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$getEmailAfterMyCommentUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=getEmailAfterMyComment&getEmailAfterMyCommentSortType={$getEmailAfterMyCommentSortType}')">{$lnGetEmailAfterMyComment}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$deviceCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=deviceCount&deviceCountSortType={$deviceCountSortType}')">{$lnDeviceCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$browserCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=browserCount&browserCountSortType={$browserCountSortType}')">{$lnBrowserCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$viewCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=viewCount&viewCountSortType={$viewCountSortType}')">{$lnViewCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$videoCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=videoCount&videoCountSortType={$videoCountSortType}')">{$lnVideoCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$likeCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=likeCount&likeCountSortType={$likeCountSortType}')">{$lnLikeCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$dislikeCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=dislikeCount&dislikeCountSortType={$dislikeCountSortType}')">{$lnDislikeCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$commentCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=commentCount&commentCountSortType={$commentCountSortType}')">{$lnCommentCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$reportCountUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=reportCount&reportCountSortType={$reportCountSortType}')">{$lnReportCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$videoCntInFolderUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=videoCntInFolder&videoCntInFolderSortType={$videoCntInFolderSortType}')">{$lnVideoCntInFolder}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$folderCntUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=folderCnt&folderCntSortType={$folderCntSortType}')">{$lnFolderCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$tagClickCntUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=tagClickCnt&tagClickCntSortType={$tagClickCntSortType}')">{$lnTagClickCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$tagClickedUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=tagClicked&tagClickedSortType={$tagClickedSortType}')">{$lnTagClicked}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$catClickCntUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=catClickCnt&catClickCntSortType={$catClickCntSortType}')">{$lnCatClickCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$catClickedUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=catClicked&catClickedSortType={$catClickedSortType}')">{$lnCatClicked}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$subCatCntUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=subCatCnt&subCatCntSortType={$subCatCntSortType}')">{$lnSubCatCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$searchCntUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=searchCnt&searchCntSortType={$searchCntSortType}')">{$lnSearchCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$videoCntCommentedUsersHint}" href="javascript:{}" onclick="submitForm('?page=adminUsers&sortBy=videoCntCommented&videoCntCommentedSortType={$videoCntCommentedSortType}')">{$lnVideoCntCommented}</a></th>
					
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle"></td>
					<td class="vertical-middle">
						<input class="form-control" name="created" id="created" type="text" value="{$createdVal}" style="width:100px;display:initial"/>
						<input class="form-control" name="createdTill" id="createdTill" type="text" value="{$createdTillVal}" style="width:100px;display:initial" />
					</td>
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="userName" id="userName" type="text" value="{$userNameVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="name" id="name" type="text" value="{$nameVal}" /></td>
					<td class="vertical-middle"></td>
					<td class="vertical-middle" colspan=39 style="text-align: left;">
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='exportMailInfo'>{$exportMailInfo}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$users}
				<tr>
					<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="{$users[sec1].id}" name="Test"/>
					<input type="hidden" name="email_{$users[sec1].id}" id="email_{$users[sec1].id}" value="{$users[sec1].email}">
					</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].createdDate}">{$users[sec1].createdDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$users[sec1].id}">{$users[sec1].id}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$users[sec1].userName}">{$users[sec1].userName}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$users[sec1].name}">{$users[sec1].name}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$users[sec1].author}">
						<select name="roleId[{$users[sec1].id}]" id="roleId[{$users[sec1].id}]"  class="form-control">
							<option value="0">{$lnRole}</option>
							{section name=key loop=$roles}
							<option value="{$roles[key].id}" {if $users[sec1].roleId == $roles[key].id} selected {/if}>{$roles[key].name}</option>
							{/section}
						</select>
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$viewProfile}">
						{if $hasViewProfileAccess}
						<a  onclick="showProfile({$users[sec1].id})" href="#userProfile"><img alt="{$viewProfile}" src="img/viewProfile.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$setUser}">
						{if $hasSetUserAccess}
						<a href="?page=adminUsers&action=setUser&id={$users[sec1].id}"><img alt="{$setUser}" src="img/setUser.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						{if $hasDeleteAccess}
						<a href="?page=adminUsers&action=delete&id={$users[sec1].id}" alt="{$delete}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].updatedDate}">{$users[sec1].updatedDate}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].deletedDate}">{$users[sec1].deletedDate}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].fatherName}">{$users[sec1].fatherName}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].birthDate}">{$users[sec1].birthDate}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].email}">{$users[sec1].email}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].phoneNumber}">{$users[sec1].phoneNumber}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].notes}">{$users[sec1].notes}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].gender}">{$users[sec1].gender}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].lang}">{$users[sec1].lang}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].profession}">{$users[sec1].profession}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].interests}">{$users[sec1].interests}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].registeredByIP}">{$users[sec1].registeredByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].regDevice}">{$users[sec1].regDevice}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].regBrowser}">{$users[sec1].regBrowser}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].updateUserId}">{$users[sec1].updateUserId}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].deletedById}">{$users[sec1].deletedById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].getEmailOnNews}">{$users[sec1].getEmailOnNews}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].getEmailOnVideoComment}">{$users[sec1].getEmailOnVideoComment}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].getEmailAfterMyComment}">{$users[sec1].getEmailAfterMyComment}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].deviceCount}"><a href="?page=adminDetails&s=users&q=1&userId={$users[sec1].id}&title={$lnDeviceCount}">{$users[sec1].deviceCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].browserCount}"><a href="?page=adminDetails&s=users&q=1&userId={$users[sec1].id}&title={$lnDeviceCount}">{$users[sec1].browserCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].videoviews}"><a href="?page=adminDetails&s=users&q=2&userId={$users[sec1].id}&title={$lnViewCount}">{$users[sec1].videoviews}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].videos}"><a href="?page=adminDetails&s=users&q=3&userId={$users[sec1].id}&title={$lnVideoCount}">{$users[sec1].videos}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].likes}"><a href="?page=adminDetails&s=users&q=4&userId={$users[sec1].id}&title={$lnLikeCount}">{$users[sec1].likes}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].dislikes}"><a href="?page=adminDetails&s=users&q=5&userId={$users[sec1].id}&title={$lnDislikeCount}">{$users[sec1].dislikes}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].comments}"><a href="?page=adminDetails&s=users&q=6&userId={$users[sec1].id}&title={$lnCommentCount}">{$users[sec1].comments}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].reportCount}"><a href="?page=adminDetails&s=users&q=7&userId={$users[sec1].id}&title={$lnReportCount}">{$users[sec1].reportCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].videoCntInFolder}"><a href="?page=adminDetails&s=users&q=8&userId={$users[sec1].id}&title={$lnVideoCntInFolder}">{$users[sec1].videoCntInFolder}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].folderCnt}"><a href="?page=adminDetails&s=users&q=9&userId={$users[sec1].id}&title={$lnFolderCnt}">{$users[sec1].folderCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].tagClickCnt}"><a href="?page=adminDetails&s=users&q=10&userId={$users[sec1].id}&title={$lnTagClickCnt}">{$users[sec1].tagClickCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].tagClicked}"><a href="?page=adminDetails&s=users&q=10&userId={$users[sec1].id}&title={$lnTagClicked}">{$users[sec1].tagClicked}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].catClickCnt}"><a href="?page=adminDetails&s=users&q=11&userId={$users[sec1].id}&title={$lnCatClickCnt}">{$users[sec1].catClickCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].catClicked}"><a href="?page=adminDetails&s=users&q=11&userId={$users[sec1].id}&title={$lnCatClicked}">{$users[sec1].catClicked}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].subCatCnt}"><a href="?page=adminDetails&s=users&q=12&userId={$users[sec1].id}&title={$lnSubCatCnt}">{$users[sec1].subCatCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].searchCnt}"><a href="?page=adminDetails&s=users&q=13&userId={$users[sec1].id}&title={$lnSearchCnt}">{$users[sec1].searchCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$users[sec1].videoCntCommented}"><a href="?page=adminDetails&s=users&q=6&userId={$users[sec1].id}&title={$lnVideoCntCommented}">{$users[sec1].videoCntCommented}</a></td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$userPages}
						<li class="{$userPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$userPages[sec1].pageUrl}')">{$userPages[sec1].pageNum}</a></li>
						{/section}
                    </ul>
					<ul class="list-unstyled list-inline pagination-per-page ">
                        
                        <li class="text-muted">
                            <div class="dropdown ui-dropdown-brd-list">
                                <button data-toggle="dropdown" id="dropdownMenu1" type="button" class="btn dropdown-toggle">
                                    {$perPage}
                                    <span class="caret"></span>
                                </button>
                                <ul aria-labelledby="dropdownMenu1" role="menu" class="dropdown-menu">
                                    <li role="presentation"><a href="?page=adminUsers&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminUsers&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminUsers&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminUsers&perPage=100" tabindex="-1" role="menuitem">100</a></li>
                                </ul>
                            </div>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.col-lg-9 -->
                
            </div>
		</form>
	</div>
</div>

<div id="sendMail" class="modalDialog" >
	<div style="width:800px;height:350px">
	<h4 style="font-weight:bold">{$sendMail}</h4>
		<a href="#close" title="Close" class="close1">X</a>
		<form action="?page=adminUsers&action=sendMail" method="post" enctype="multipart/form-data" style="width: 100%;">
			<div class="topgap">
				<label>{$to}:</label>
				<div class="gap">
					<input required class="field" type="text" name="to" id="to" value="{$userId}">
				</div>
			</div>
			<div class="topgap">
				<label>{$cc}:</label>
				<div class="gap">
					<input class="field" type="text" name="cc" id="cc" value="{$userId}">
				</div>
			</div>
			<div class="topgap">
				<label>{$file}:</label>
				<div class="gap">
					<input type="file" class="field"  name="attachment" id="attachment" />
				</div>
			</div>	
			<div class="topgap">
				<label>{$subject}:</label>
				<div class="gap">
					<input class="field" type="text" name="subject" id="subject" value="{$userId}">
				</div>
			</div>
			<div class="topgap">
				<label>{$body}:</label>
				<div class="gap">
					<textarea class="field" type="text" name="body" id="body" value="{$userId}" style="height:100px"></textarea>
				</div>
			</div>
			<div style="text-align:center;">
			<input class="login39" type="submit" value="{$send}" name="submit" style="margin-left:0px;margin-top:10px">
			</div>
		</form>
	</div>
</div>

{if $hasViewProfileAccess}
<div id="userProfile" class="modalDialog" >
	<div style="width:700px;height:480px">
		<h4 style="font-weight:bold">{$userProfile}</h4>
		<a href="#close" title="Close" class="close1">X</a>
		<div id="profileDiv" >
		</div>
	</div>
</div>
{/if}
