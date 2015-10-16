<script>
$(function() {
$( "#added" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});

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
	<div id="all" style="float:left; margin-left:15px; width: 1200px;">
		<form method="post" action="?page=adminVideoLinks&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;">
				<colgroup>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 200px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 80px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=name&nameSortType={$nameSortType}')">{$lnName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=info&infoSortType={$infoSortType}')">{$lnInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=added&addedSortType={$addedSortType}')">{$lnAdded}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=lang&langSortType={$langSortType}')">{$lnLang}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=link&linkSortType={$linkSortType}')">{$lnLink}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=catName&catNameSortType={$catNameSortType}')">{$lnCategory}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=tags&tagsSortType={$tagsSortType}')">{$lnTags}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=questions&questionsSortType={$questionsSortType}')">{$videoQuestion}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminVideoLinks&sortBy=reportCount&reportCountSortType={$reportCountSortType}')">{$reportCount}</a></th>
					<th class="vertical-middle" style=" text-align:center" >{$delete}</th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="name" id="name" type="text" value="{$nameVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="info" id="info" type="text" value="{$infoVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="added" id="added" type="text" value="{$addedVal}" /></td>
					<td class="vertical-middle">
						<select name="languageId" id="languageId"  class="form-control">
							<option value="">{$lnLang}</option>
							<option value="5" {if $languageIdVal == 5} selected {/if}>AZ</option>
							<option value="19" {if $languageIdVal == 19} selected {/if}>EN</option>
							<option value="67" {if $languageIdVal == 67} selected {/if}>RU</option>
						</select>
					</td>
					<td class="vertical-middle"><input class="form-control" name="link" id="link" type="text" value="{$linkVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="category" id="category" type="text" value="{$categoryVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="tags" id="tags" type="text" value="{$tagsVal}"/></td>
					<td class="vertical-middle">
						<select name="questions" id="questions"  class="form-control">
							<option value="">{$videoQuestion}</option>
							<option value="1" {if $questionsVal == 1} selected {/if}>{$what}</option>
							<option value="2" {if $questionsVal == 2} selected {/if}>{$who}</option>
							<option value="4" {if $questionsVal == 4} selected {/if}>{$how}</option>
							<option value="8" {if $questionsVal == 8} selected {/if}>{$why}</option>
						</select>
					</td>
					<td class="vertical-middle" colspan=2>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						 <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$videoLinks}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$videoLinks[sec1].id}">{$videoLinks[sec1].id}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].name}">{$videoLinks[sec1].name}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].info}">{$videoLinks[sec1].info}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].added}">{$videoLinks[sec1].added}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].lang}">{$videoLinks[sec1].lang}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].link}">{$videoLinks[sec1].link}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].catName}">{$videoLinks[sec1].catName}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].tags}">{$videoLinks[sec1].tags}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].addedBy}">{$videoLinks[sec1].questions}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].addedBy}">{$videoLinks[sec1].reportCount}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$delete}">
						<a href="?page=adminVideoLinks&action=delete&videoId={$videoLinks[sec1].id}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
					</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="text-align: center">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$videoLinkPages}
						<li class="{$videoLinkPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$videoLinkPages[sec1].pageUrl}')">{$videoLinkPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminVideoLinks&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
