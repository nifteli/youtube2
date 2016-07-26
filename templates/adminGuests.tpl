<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#entryDate" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#entryDateTill" ).datepicker( 
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
		<form method="post" action="?page=adminGuests&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive" style="overflow-x: auto; width:1800px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 160px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 300px; overflow: hidden;"/>
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
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=entryDate&entryDateSortType={$entryDateSortType}')">{$lnEntryDate}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=IP&IPSortType={$IPSortType}')">{$lnIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=device&deviceSortType={$deviceSortType}')">{$lnDevice}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=browser&browserSortType={$browserSortType}')">{$lnBrowser}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=videCntWatched&videCntWatchedSortType={$videCntWatchedSortType}')">{$lnVideCntWatched}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=videoCntCommented&videoCntCommentedSortType={$videoCntCommentedSortType}')">{$lnVideoCntCommented}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=commentCnt&commentCntSortType={$commentCntSortType}')">{$lnCommentCnt}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminGuests&sortBy=searchCnt&searchCntSortType={$searchCntSortType}')">{$lnSearchCnt}</a></th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle">
						<input class="form-control" name="entryDate" id="entryDate" type="text" value="{$entryDateVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="entryDateTill" id="entryDateTill" type="text" value="{$entryDateTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="IP" id="IP" type="text" value="{$IPVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="device" id="device" type="text" value="{$deviceVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="browser" id="browser" type="text" value="{$browserVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="videCntWatched" id="videCntWatched" type="text" value="{$videCntWatchedVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="videoCntCommented" id="videoCntCommented" type="text" value="{$videoCntCommentedVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="commentCnt" id="commentCnt" type="text" value="{$commentCntVal}"/></td>
					<td class="vertical-middle"  style="text-align: left;">
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$guests}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$guests[sec1].entryDate}">{$guests[sec1].entryDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].IP}">{$guests[sec1].IP}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].device}">{$guests[sec1].device}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].browser}">{$guests[sec1].browser}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].videCntWatched}"><a href="?page=adminDetails&s=guests&q=1&ip={$guests[sec1].IP}&title={$lnVideCntWatched}">{$guests[sec1].videCntWatched}</a></td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].videoCntCommented}"><a href="?page=adminDetails&s=guests&q=2&ip={$guests[sec1].IP}&title={$lnVideoCntCommented}">{$guests[sec1].videoCntCommented}</a></td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].commentCnt}"><a href="?page=adminDetails&s=guests&q=2&ip={$guests[sec1].IP}&title={$lnCommentCnt}">{$guests[sec1].commentCnt}</a></td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$guests[sec1].searchCnt}"><a href="?page=adminDetails&s=guests&q=3&ip={$guests[sec1].IP}&title={$lnSearchCnt}">{$guests[sec1].searchCnt}</a></td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$guestPages}
						<li class="{$guestPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$guestPages[sec1].pageUrl}')">{$guestPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminGuests&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminGuests&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminGuests&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminGuests&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
