<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#createdDate" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#createdDateTill" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
//$( "#entryDate" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
//$( "#entryDateTill" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});

function submitForm(action)
{
	if(action=='#') return;
	document.getElementById('vlFilter').action=action;
	document.getElementById('vlFilter').submit();
}
</script>
<div>
	
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
		<form method="post" action="?page=adminSearches&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive" style="overflow-x: auto; width:1200px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 160px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 70px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdDateSearchesHint}" href="javascript:{}" onclick="submitForm('?page=adminSearches&sortBy=created&createdDateSortType={$createdDateSortType}')">{$lnCreatedDate}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$keywordSearchesHint}" href="javascript:{}" onclick="submitForm('?page=adminSearches&sortBy=keyword&keywordSortType={$keywordSortType}')">{$lnKeyword}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdByIdSearchesHint}" href="javascript:{}" onclick="submitForm('?page=adminSearches&sortBy=createdById&createdByIdSortType={$createdByIdSortType}')">{$lnCreatedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$searcherSearchesHint}" href="javascript:{}" onclick="submitForm('?page=adminSearches&sortBy=searcher&searcherSortType={$searcherSortType}')">{$lnSearcher}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdByIPSearcesHint}" href="javascript:{}" onclick="submitForm('?page=adminSearches&sortBy=createdByIP&createdByIPSortType={$createdByIPSortType}')">{$lnCreatedByIP}</a></th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle">
						<input class="form-control" name="createdDate" id="createdDate" type="text" value="{$createdDateVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="createdDateTill" id="createdDateTill" type="text" value="{$createdDateTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="keyword" id="keyword" type="text" value="{$keywordVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="createdById" id="createdById" type="text" value="{$createdByIdVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="searcher" id="searcher" type="text" value="{$searcherVal}" /></td>
					<td class="vertical-middle"  style="text-align: left;">
						<input  name="createdByIP" id="createdByIP" type="text" value="{$createdByIPVal}" style="width:50%" />
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$searches}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$searches[sec1].createdDate}">{$searches[sec1].createdDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$searches[sec1].keyword}">{$searches[sec1].keyword}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$searches[sec1].createdById}">{$searches[sec1].createdById}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$searches[sec1].searcher}">{$searches[sec1].searcher}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$searches[sec1].createdByIP}">{$searches[sec1].createdByIP}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$searchPages}
						<li class="{$searchPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$searchPages[sec1].pageUrl}')">{$searchPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminSearches&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminSearches&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminSearches&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminSearches&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
