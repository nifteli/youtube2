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
function setFolderName(id,folderName,tags)
{
	 $( "#folderId" ).val( id );
	 $( "#folderName" ).val( folderName );
	 $( "#tagsp" ).val( tags );
}
</script>
<div>
	<div class="actionButtons" style="margin-top:3px">
	<table border=1 cellpadding=25 cellspacing=25 align=right>
		<tr style="text-align:right">
			<td><a href="#addNewFolder">{$addFolder}</a></td>
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
		<form method="post" action="?page=adminFolders&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed; text-align: center;">
				<colgroup>
					<col style="width: 180px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 250px; overflow: hidden;"/>
					<col style="width: 250px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminFolders&sortBy=created&createdSortType={$createdSortType}')">{$lnCreated}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminFolders&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminFolders&sortBy=createdById&authorIdSortType={$authorIdSortType}')">{$lnAuthorId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminFolders&sortBy=author&authorSortType={$authorSortType}')">{$lnAuthor}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminFolders&sortBy=name&nameSortType={$nameSortType}')">{$lnName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminFolders&sortBy=name&nameSortType={$nameSortType}')">{$lnTags}</a></th>
					<th class="vertical-middle" style=" text-align:center" >{$delete}</th>
					<th class="vertical-middle" style=" text-align:center" >{$edit}</th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle">
						<input class="form-control" name="created" id="created" type="text" value="{$createdVal}" style="width:100px;display:initial" />
						<input class="form-control" name="createdTill" id="createdTill" type="text" value="{$createdTillVal}" style="width:100px;display:initial"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="authorId" id="authorId" type="text" value="{$authorIdVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="author" id="author" type="text" value="{$authorVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="name" id="name" type="text" value="{$nameVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="tags" id="tags" type="text" value="{$tagsVal}"/></td>
					<td class="vertical-middle" colspan=2>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						 <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$folders}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$folders[sec1].createdDate}">{$folders[sec1].createdDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$folders[sec1].id}">{$folders[sec1].id}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$folders[sec1].createdById}">{$folders[sec1].createdById}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$folders[sec1].author}">{$folders[sec1].author}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$folders[sec1].name}">{$folders[sec1].name}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$folders[sec1].tags}">{$folders[sec1].tags}</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						{if $hasDeleteAccess}
						<a href="?page=adminFolders&action=delete&id={$folders[sec1].id}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$confirm}">
						{if $hasEditAccess}
						<a onclick="setFolderName({$folders[sec1].id},'{$folders[sec1].name}','{$folders[sec1].tags}')" href="#editFolder"><img src="img/edit.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$folderPages}
						<li class="{$folderPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$folderPages[sec1].pageUrl}')">{$folderPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminFolders&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminFolders&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminFolders&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminFolders&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
<div id="editFolder" class="modalDialog" >
	<div style="width:290px;height:150px">
		<a href="#close" title="Close" class="close1">X</a>
		<h4 style="font-weight:bold">{$editFolder}</h4>
		<form name="frmAddNewFolder" id="frmAddNewFolder" action="?page=adminFolders&action=editFolder" method="post" style="width:250px">
			<div style="float:right;width:250px" >
				<input type="hidden" name="folderId" id="folderId">
				<input type="text" name="folderName" id="folderName" placeholder="{$folderName}" style="width: 100%; 5px;margin-bottom: 2px;">
				<input type="text" name="tagsp" id="tagsp" placeholder="{$tags}" style="width: 100%;margin-top: 5px;margin-bottom: 5px;" required> 
				<br>
				<div style="text-align:center;">
				<input type="submit" class="login39" name = "add" id="add" value="{$save}" style="margin-left:0;">
				</div>
			</div>
		</form>
	</div>
</div>

<div id="addNewFolder" class="modalDialog" >
	<div style="width:290px;height:185px">
		<a href="#close" title="Close" class="close1">X</a>
		<h4 style="font-weight:bold">{$addFolder}</h4>
		<form name="frmAddNewFolder" id="frmAddNewFolder" action="?page=adminFolders&action=addNewFolder" method="post" style="width:250px">
			<div style="float:right;width:250px" >
				<input type="hidden" name="folderId" id="folderId">
				<input type="text" name="folderName" id="folderName" placeholder="{$folderName}" style="width: 100%; 5px;margin-bottom: 2px;">
				<input type="text" name="tagsp" id="tagsp" placeholder="{$tags}" style="width: 100%;margin-top: 5px;margin-bottom: 5px;" required> 
				<select class="srcCmb" name="userId" id="userId" style="width: 100%;margin-bottom: 5px;">
						{section name=sec1 loop=$users}
							<option value="{$users[sec1].id}"> {$users[sec1].user}</option>
						{/section}
					</select> 
				<br>
				<div style="text-align:center;">
				<input type="submit" class="login39" name = "add" id="add" value="{$save}" style="margin-left:0;">
				</div>
			</div>
		</form>
	</div>
</div>
