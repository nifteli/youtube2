<script>
function submitForm(action)
{
	if(action=='#') return;
	document.getElementById('vlFilter').action=action;
	document.getElementById('vlFilter').submit();
}
</script>
<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	<br/><br/><br/>
	<div class="titles">
		<h1>{$titleTags}</h1>
	</div>
	<div class="actionButtons" >
	
	<form method="post" action="?page=adminTags&action=filter" id="vlFilter" name="vlFilter">
	<table border=1 cellpadding=25 cellspacing=25 align=right>
		<tr style="text-align:right">
			<td><button class="btn btn-light-combo btn-sm" name="action" value="substitute" type="submit" >{$substitute}</button></td>
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
	<div id="all" style="float:left; margin-left:15px; width: 1200px;overflow-x: auto;">
		<div class="table-responsive" style="overflow-x: auto; width:2500px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 150px; overflow: hidden;"/>
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
					
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminTags&sortBy=lang&langSortType={$langSortType}')">{$lnLang}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminTags&sortBy=name&nameSortType={$nameSortType}')">{$lnName}</a></th>
					<th class="vertical-middle" style=" text-align:center" >{$lnNewTag}</th>
					<th class="vertical-middle" style=" text-align:center" >{$delete}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCreated}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCreatedBy}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnUpdated}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnUpdatedBy}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnVideoCntTagged}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnUserCntClicked}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnClickCnt}</th>
					
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle">
						<select name="languageId" id="languageId"  class="form-control">
							<option value="">{$lnLang}</option>
							<option value="5" {if $languageIdVal == 5} selected {/if}>AZ</option>
							<option value="19" {if $languageIdVal == 19} selected {/if}>EN</option>
							<option value="67" {if $languageIdVal == 67} selected {/if}>RU</option>
						</select>
					</td>
					<td class="vertical-middle"><input class="form-control"  name="name" id="name" type="text" value="{$nameVal}" /></td>
					<td class="vertical-middle"></td>
					<td class="vertical-middle" style="text-align: left;" colspan=8>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$tags}
				<tr>
					<input type="hidden" name="langId[{$tags[sec1].id}]" id="langId[{$tags[sec1].id}]" value="{$tags[sec1].langId}">
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].lang}">{$tags[sec1].lang}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$tags[sec1].name}">{$tags[sec1].name}</td>
					<td class="vertical-middle" style="overflow: hidden;"><input style="width:100%" name="newTag[{$tags[sec1].id}]" id="newTag{$tags[sec1].id}" type="text"></td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						{if $hasDeleteAccess}
						<a href="?page=adminTags&action=delete&id={$tags[sec1].id}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].created}">{$tags[sec1].created}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].createdBy}">{$tags[sec1].createdBy}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].updated}">{$tags[sec1].updated}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].updatedBy}">{$tags[sec1].updatedBy}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].videoCntTagged}">{$tags[sec1].videoCntTagged}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].userCntClicked}">{$tags[sec1].userCntClicked}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$tags[sec1].clickCnt}">{$tags[sec1].clickCnt}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="text-align: center">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$tagPages}
						<li class="{$tagPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$tagPages[sec1].pageUrl}')">{$tagPages[sec1].pageNum}</a></li>
						{/section}
                    </ul>
                </div>
                <!-- /.col-lg-9 -->
                <div class="col-lg-3">
                    <ul class="list-unstyled list-inline pagination-per-page pull-right">
                        
                        <li class="text-muted">
                            <div class="dropdown ui-dropdown-brd-list">
                                <button data-toggle="dropdown" id="dropdownMenu1" type="button" class="btn dropdown-toggle">
                                    {$perPage}
                                    <span class="caret"></span>
                                </button>
                                <ul aria-labelledby="dropdownMenu1" role="menu" class="dropdown-menu">
                                    <li role="presentation"><a href="?page=adminTags&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminTags&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminTags&perPage=100" tabindex="-1" role="menuitem">100</a></li>
                                </ul>
                            </div>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.col-lg-3 -->
            </div>
		</form>
	</div>
</div>
