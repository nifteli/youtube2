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
		<h1>{$titleCategories}</h1>
	</div>
	<div class="actionButtons" >
	
	<form method="post" action="?page=adminCategories&action=filter" id="vlFilter" name="vlFilter">
	<table border=1 cellpadding=25 cellspacing=25 align=right>
		<tr style="text-align:right">
			<td><button class="btn btn-light-combo btn-sm" name="action" value="edit" type="submit" >{$edit}</button></td>
			<td><button class="btn btn-light-combo btn-sm" name="action" value="add" type="submit" >{$addCategory}</button></td>
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
	<div id="all" style="float:left; margin-left:15px; width: 1200px;">
		<div class="table-responsive">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;">
				<colgroup>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catAz&catAzSortType={$catAzSortType}')">{$lnCatAz}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catInfoAz&catInfoAzSortType={$catInfoAzSortType}')">{$lnCatAzInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catEn&catEnSortType={$catEnSortType}')">{$lnCatEn}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catInfoEn&catInfoEnSortType={$catInfoEnSortType}')">{$lnCatEnInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catRu&catRuSortType={$catRuSortType}')">{$lnCatRu}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catInfoRu&catInfoRuSortType={$catInfoRuSortType}')">{$lnCatRuInfo}</a></th>
					
					<th class="vertical-middle" style=" text-align:center" >{$pic}</th>
					<th class="vertical-middle" style=" text-align:center" >{$pic}</th>
					<th class="vertical-middle" style=" text-align:center" >{$delete}</th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle"><input class="form-control"  name="catAz" id="catAz" type="text" value="{$catAzVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catAzInfo" id="catAzInfo" type="text" value="{$catAzInfoVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catEn" id="catEn" type="text" value="{$catEnVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catInfoEn" id="catInfoEn" type="text" value="{$catInfoEnVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catRu" id="catRu" type="text" value="{$catRuVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catInfoRu" id="catInfoRu" type="text" value="{$catInfoRuVal}" /></td>
					<td class="vertical-middle" colspan=3>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						 <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$categories}
				<tr>
					<!-- <input type="hidden" name="catId[{$categories[sec1].id}]" id="catId[{$categories[sec1].id}]" value="{$categories[sec1].id}"> -->
					<td class="vertical-middle" style="overflow: hidden;">
						<input style="width:100%" name="catAzArr[{$categories[sec1].id}]" id="catAzArr{$categories[sec1].id}" type="text" value="{$categories[sec1].catAz}">
					</td>
					<td class="vertical-middle" style="overflow: hidden;">
						<textarea style="width:100%" name="catInfoAzArr[{$categories[sec1].id}]" id="catInfoAzArr{$categories[sec1].id}"> {$categories[sec1].catInfoAz} </textarea>
					</td>
					<td class="vertical-middle" style="overflow: hidden;">
						<input style="width:100%" name="catEnArr[{$categories[sec1].id}]" id="catEnArr{$categories[sec1].id}" type="text" value="{$categories[sec1].catEn}">
					</td>
					<td class="vertical-middle" style="overflow: hidden;">
						<textarea style="width:100%" name="catInfoEnArr[{$categories[sec1].id}]" id="catInfoEnArr{$categories[sec1].id}"> {$categories[sec1].catInfoEn} </textarea>
					</td>
					<td class="vertical-middle" style="overflow: hidden;">
						<input style="width:100%" name="catRuArr[{$categories[sec1].id}]" id="catRuArr{$categories[sec1].id}" type="text" value="{$categories[sec1].catRu}">
					</td>
					<td class="vertical-middle" style="overflow: hidden;">
						<textarea style="width:100%" name="catInfoRuArr[{$categories[sec1].id}]" id="catInfoRuArr{$categories[sec1].id}"> {$categories[sec1].catInfoRu}</textarea>
					</td>
					<td class="vertical-middle" style="overflow: hidden;">
						<input style="width:100%" name="catImgArr[{$categories[sec1].id}]" id="catImgArr{$categories[sec1].id}" type="file">
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						<img src="{$categories[sec1].img}" width="15" height="15" alt=""/>
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						{if $hasDeleteAccess}
						<a href="?page=adminCategories&action=delete&id={$categories[sec1].id}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
						{/if}
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
                        {section name=sec1 loop=$catPages}
						<li class="{$catPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$catPages[sec1].pageUrl}')">{$catPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminCategories&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminCategories&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminCategories&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
