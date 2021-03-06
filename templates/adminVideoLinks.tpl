<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#added" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#addedTill" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#updated" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#updatedTill" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#deleted" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#deletedTill" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
//$( "#added" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
//$( "#addedTill" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});

function submitForm(action)
{
	if(action=='#') return;
	document.getElementById('vlFilter').action=action;
	document.getElementById('vlFilter').submit();
}
</script>

<div>

	<div class="actionButtons">
	<form action="?page=adminVideoLinks&action=load" method="post" enctype='multipart/form-data'>
	<table border=1 cellpadding=25 cellspacing=25 align=left>
		<tr>
			<td rowspan=3><button class="btn btn-light-combo btn-sm" type="button" name="action" id="action" value='filter' onClick="document.getElementById('vlFilter').submit();">{$filter}</button></td>
			<td colspan=3><input type="file" class="field"  name="data" id="data" style="width:245px"/></td>
			<td rowspan=3><button class="btn btn-light-combo btn-sm" type="button" name="action" id="action" value='export' onClick="sbtFrm('vlFilter','action','export')">{$export}</button></td>
		</tr>
		<tr>
			<td><button class="btn btn-light-combo btn-sm" name="action" value="addMany" type="submit">{$addMany}</button></td>
			<td><button class="btn btn-light-combo btn-sm" name="action" value="editMany" type="submit">{$editMany}</button></td>
			<td><button class="btn btn-light-combo btn-sm" name="action" value="deleteMany" type="submit">{$deleteMany}</button></td>
		</tr>
		<tr align=center>
			<td><a href='uploadTemplates/AddBulkVideo.xlsx'>{$template}</a></td>
			<td><a href='uploadTemplates/EditBulkVideo.xlsx'>{$template}</a></td>
			<td><a href='uploadTemplates/DeleteBulkVideo.xls'>{$template}</a></td>
			
		</tr>
	</table>
	</form>
			<!-- <button class="btn btn-light-combo btn-sm" name="action" onclick="window.location.href='index.php?page=addVideo'" style="height:55px">{$addVideo}</button> -->
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
	<div id="all" style="float:left; margin-left:5px; overflow-x: auto;">
		<form method="post" action="?page=adminVideoLinks&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive" style="overflow-x: auto; width:4000px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed; text-align: center;">
				<colgroup>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 40px; overflow: hidden;"/>
					<col style="width: 150px; overflow: hidden;"/>
					<col style="width: 80px; overflow: hidden;"/>
					<col style="width: 70px; overflow: hidden;"/>
					<col style="width: 90px; overflow: hidden;"/>
					<col style="width: 200px; overflow: hidden;"/>
					<col style="width: 500px; overflow: hidden;"/>
					<col style="width: 90px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
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
					<col style="width: 130px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center"  title="{$deleteVidLinksHint}">{$delete}</th>
					<th class="vertical-middle" style=" text-align:center"  title="{$editVidLinksHint}">{$edit}</th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$vaddedVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=vadded&addedSortType={$addedSortType}')">{$lnAdded}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=vupdated&updatedSortType={$updatedSortType}')">{$lnUpdated}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$deletedVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=vdeleted&deletedSortType={$deletedSortType}')">{$lnDeleted}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$idVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$linkVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=link&linkSortType={$linkSortType}')">{$lnLink}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$langVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=lang&langSortType={$langSortType}')">{$lnLang}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$questionsVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=questions&questionsSortType={$questionsSortType}')">{$videoQuestion}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$catNameVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=catName&catNameSortType={$catNameSortType}')">{$lnCategory}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$nameVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=name&nameSortType={$nameSortType}')">{$lnName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$infoVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=info&infoSortType={$infoSortType}')">{$lnInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$tagsVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=tags&tagsSortType={$tagsSortType}')">{$lnTags}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$addedByIdVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=addedById&addedByIdSortType={$addedByIdSortType}')">{$lnAddedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$addedByIPVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=addedByIP&addedByIPSortType={$addedByIPSortType}')">{$lnAddedByIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedByIdVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=updatedById&updatedByIdSortType={$updatedByIdSortType}')">{$lnUpdatedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedByIPVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=updatedByIP&updatedByIPSortType={$updatedByIPSortType}')">{$lnUpdatedByIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$deletedByIdVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=deletedById&deletedByIdSortType={$deletedByIdSortType}')">{$lnDeletedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$deletedByIPVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=deletedByIP&deletedByIPSortType={$deletedByIPSortType}')">{$lnDeletedByIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$durationVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=duration&durationSortType={$durationSortType}')">{$lnDuration}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$viewsVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=views&viewsSortType={$viewsSortType}')">{$lnViews}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$allViewCountVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=allViewCount&allViewCountSortType={$allViewCountSortType}')">{$lnAllViewCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$fbCountVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=fbCount&fbCountSortType={$fbCountSortType}')">{$lnFbCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$twCountVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=twCount&twCountSortType={$twCountSortType}')">{$lnTwCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$userCntCommentedVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=userCntCommented&userCntCommentedSortType={$userCntCommentedSortType}')">{$lnUserCntCommented}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$commentsVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=comments&commentsSortType={$commentsSortType}')">{$lnComments}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$tagCountVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=tagCount&tagCountSortType={$tagCountSortType}')">{$lnTagCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$likesVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=likes&likesSortType={$likesSortType}')">{$lnLikes}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$dislikesVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=dislikes&dislikesSortType={$dislikesSortType}')">{$lnDislikes}</a></th>
					<!-- <th class="vertical-middle" style=" text-align:center" ><a title="{$userReportedCntVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=userReportedCnt&userReportedCntSortType={$userReportedCntSortType}')">{$lnUserReportedCnt}</a></th> -->
					<th class="vertical-middle" style=" text-align:center" ><a title="{$reportCountVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=reportCount&reportCountSortType={$reportCountSortType}')">{$reportCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$userCntAddedToFolderVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=userCntAddedToFolder&userCntAddedToFolderSortType={$userCntAddedToFolderSortType}')">{$lnUserCntAddedToFolder}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$addedFolderCntVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=addedFolderCnt&addedFolderCntSortType={$addedFolderCntSortType}')">{$lnAddedFolderCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$brokenVidLinksHint}" href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=broken&brokenSortType={$brokenSortType}')">{$lnBroken}</a></th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle"></td>
					<td class="vertical-middle"></td>
					<td class="vertical-middle">
						<input class="form-control" name="added" id="added" type="text" value="{$addedVal}" style="width:70px;display:initial;padding-left: 0;padding-right: 0;"/>
						<input class="form-control" name="addedTill" id="addedTill" type="text" value="{$addedTillVal}" style="width:70px;display:initial;padding-left: 0;padding-right: 0;"/>
					</td>
					<td class="vertical-middle">
						<input class="form-control" name="updated" id="updated" type="text" value="{$updatedVal}" style="width:70px;display:initial;padding-left: 0;padding-right: 0;"/>
						<input class="form-control" name="updatedTill" id="updatedTill" type="text" value="{$updatedTillVal}" style="width:70px;display:initial;padding-left: 0;padding-right: 0;"/>
					</td>
					<td class="vertical-middle">
						<input class="form-control" name="deleted" id="deleted" type="text" value="{$deletedVal}" style="width:70px;display:initial;padding-left: 0;padding-right: 0;"/>
						<input class="form-control" name="deletedTill" id="deletedTill" type="text" value="{$deletedTillVal}" style="width:70px;display:initial;padding-left: 0;padding-right: 0;"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="link" id="link" type="text" value="{$linkVal}"/></td>
					<td class="vertical-middle">
						<select name="languageId" id="languageId"  class="form-control">
							<option value="">{$lnLang}</option>
							{foreach from=$languages item=row1}
							{html_options values=$row1.id output=$row1.name selected=$languageIdVal}
							{/foreach}
							<!-- <option value="5" {if $languageIdVal == 5} selected {/if}>AZ</option>
							<option value="19" {if $languageIdVal == 19} selected {/if}>EN</option>
							<option value="67" {if $languageIdVal == 67} selected {/if}>RU</option> -->
						</select>
					</td>
					<td class="vertical-middle">
						<select name="questions" id="questions"  class="form-control">
							<option value="">{$videoQuestion}</option>
							<option value="1" {if $questionsVal == 1} selected {/if}>{$what}</option>
							<option value="2" {if $questionsVal == 2} selected {/if}>{$who}</option>
							<option value="4" {if $questionsVal == 4} selected {/if}>{$how}</option>
							<option value="8" {if $questionsVal == 8} selected {/if}>{$why}</option>
						</select>
					</td>
					<td class="vertical-middle"><input class="form-control" name="category" id="category" type="text" value="{$categoryVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="name" id="name" type="text" value="{$nameVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="info" id="info" type="text" value="{$infoVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="tags" id="tags" type="text" value="{$tagsVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="addedById" id="addedById" type="text" value="{$addedByIdVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="addedByIP" id="addedByIP" type="text" value="{$addedByIPVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="updatedById" id="updatedById" type="text" value="{$updatedByIdVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="updatedByIP" id="updatedByIP" type="text" value="{$updatedByIPVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="deletedById" id="deletedById" type="text" value="{$deletedByIdVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="deletedByIP" id="deletedByIP" type="text" value="{$deletedByIPVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="duration" id="duration" type="text" value="{$durationVal}"/></td>
					<td class="vertical-middle" colspan=13 style="text-align: left;">
						<!-- <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						 <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button> -->
						 <!-- <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='exportSearches'>{$exportSearches}</button> -->
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$videoLinks}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						{if $videoLinks[sec1].isDeleted == 1}
						<a href="?page=adminVideoLinks&action=delete&videoId={$videoLinks[sec1].id}&flag=1" onClick="return confirm('{$undeleteConfirmation}')"><img src="img/success.png" width="15" height="15" alt=""/></a>
						{else}
						<a href="?page=adminVideoLinks&action=delete&videoId={$videoLinks[sec1].id}&flag=0" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$edit}">
						{if $hasEditAccess && $videoLinks[sec1].isDeleted == 0}
						<a href="index.php?page=addVideo&id={$videoLinks[sec1].id}"><img src="img/edit.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].added}">{$videoLinks[sec1].added}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].updated}">{$videoLinks[sec1].updated}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].deleted}">{$videoLinks[sec1].deleted}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].id}"><a href="index.php?page=watchVideo&id={$videoLinks[sec1].id}">{$videoLinks[sec1].id}</a></td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].link}">{$videoLinks[sec1].link}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].lang}">{$videoLinks[sec1].lang}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].questions}">{$videoLinks[sec1].questions}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].catName}">{$videoLinks[sec1].catName}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].name}"><a href="index.php?page=watchVideo&id={$videoLinks[sec1].id}">{$videoLinks[sec1].name}</a></td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].info}">{$videoLinks[sec1].info}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].tags}">{$videoLinks[sec1].tags}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].addedById}">{$videoLinks[sec1].addedById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].addedByIP}">{$videoLinks[sec1].addedByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].updatedById}">{$videoLinks[sec1].updatedById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].updatedByIP}">{$videoLinks[sec1].updatedByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].deletedById}">{$videoLinks[sec1].deletedById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].deletedByIP}">{$videoLinks[sec1].deletedByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].duration}">{$videoLinks[sec1].duration}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].views}"><a href="?page=adminDetails&s=videos&q=1&videoId={$videoLinks[sec1].id}&title={$lnViews}">{$videoLinks[sec1].views}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].allViewCount}"><a href="?page=adminDetails&s=videos&q=1&videoId={$videoLinks[sec1].id}&title={$lnAllViewCount}">{$videoLinks[sec1].allViewCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].fbCount}"><a href="?page=adminDetails&s=videos&q=1&videoId={$videoLinks[sec1].id}&title={$lnFbCount}">{$videoLinks[sec1].fbCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].twCount}"><a href="?page=adminDetails&s=videos&q=1&videoId={$videoLinks[sec1].id}&title={$lnTwCount}">{$videoLinks[sec1].twCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].userCntCommented}"><a href="?page=adminDetails&s=videos&q=2&videoId={$videoLinks[sec1].id}&title={$lnUserCntCommented}">{$videoLinks[sec1].userCntCommented}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].comments}"><a href="?page=adminDetails&s=videos&q=2&videoId={$videoLinks[sec1].id}&title={$lnComments}">{$videoLinks[sec1].comments}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].tagCount}"><a href="?page=adminDetails&s=videos&q=3&videoId={$videoLinks[sec1].id}&title={$lnTagCount}">{$videoLinks[sec1].tagCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].likes}"><a href="?page=adminDetails&s=videos&q=4&videoId={$videoLinks[sec1].id}&title={$lnLikes}">{$videoLinks[sec1].likes}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].dislikes}"><a href="?page=adminDetails&s=videos&q=5&videoId={$videoLinks[sec1].id}&title={$lnDislikes}">{$videoLinks[sec1].dislikes}</a></td>
					<!-- <td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].userReportedCnt}"><a href="?page=adminDetails&s=videos&q=6&videoId={$videoLinks[sec1].id}&title={$lnUserReportedCnt}">{$videoLinks[sec1].userReportedCnt}</a></td> -->
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].reportCount}"><a href="?page=adminReports&id={$videoLinks[sec1].id}">{$videoLinks[sec1].reportCount}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].userCntAddedToFolder}"><a href="?page=adminDetails&s=videos&q=7&videoId={$videoLinks[sec1].id}&title={$lnUserCntAddedToFolder}">{$videoLinks[sec1].userCntAddedToFolder}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].addedFolderCnt}"><a href="?page=adminDetails&s=videos&q=7&videoId={$videoLinks[sec1].id}&title={$lnAddedFolderCnt}">{$videoLinks[sec1].addedFolderCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].broken}">{$videoLinks[sec1].broken}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$videoLinkPages}
						<li class="{$videoLinkPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$videoLinkPages[sec1].pageUrl}')">{$videoLinkPages[sec1].pageNum}</a></li>
						{/section}
                    </ul>
					<ul class="list-unstyled list-inline pagination-per-page">
                        
                        <li class="text-muted">
                            <div class="dropdown ui-dropdown-brd-list">
                                <button data-toggle="dropdown" id="dropdownMenu1" type="button" class="btn dropdown-toggle">
                                    {$perPage}
                                    <span class="caret"></span>
                                </button>
                                <ul aria-labelledby="dropdownMenu1" role="menu" class="dropdown-menu">
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
