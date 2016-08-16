<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#actionDate" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#actionDateTill" ).datepicker( 
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
		<form method="post" action="?page=adminLogs&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive" style="overflow-x: auto; width:1500px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 160px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 80px; overflow: hidden;"/>
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center" ><a title="{$actionDateLogsHint}" href="javascript:{}" onclick="submitForm('?page=adminLogs&sortBy=actionDate&actionDateSortType={$actionDateSortType}')">{$lnActionDate}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$idLogsHint}" href="javascript:{}" onclick="submitForm('?page=adminLogs&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$actionNameLogsHint}" href="javascript:{}" onclick="submitForm('?page=adminLogs&sortBy=actionName&actionNameSortType={$actionNameSortType}')">{$lnActionName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdByIdLogsHint}" href="javascript:{}" onclick="submitForm('?page=adminLogs&sortBy=createdById&createdByIdSortType={$createdByIdSortType}')">{$lnCreatedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdByLogsHint}" href="javascript:{}" onclick="submitForm('?page=adminLogs&sortBy=createdBy&createdBySortType={$createdBySortType}')">{$lnCreatedBy}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdByIPLogsHint}" href="javascript:{}" onclick="submitForm('?page=adminLogs&sortBy=createdByIP&createdByIPSortType={$createdByIPSortType}')">{$lnCreatedByIP}</a></th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle">
						<input class="form-control" name="actionDate" id="actionDate" type="text" value="{$actionDateVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="actionDateTill" id="actionDateTill" type="text" value="{$actionDateTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="actionName" id="actionName" type="text" value="{$actionNameVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="createdById" id="createdById" type="text" value="{$createdByIdVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="createdBy" id="createdBy" type="text" value="{$createdByVal}" /></td>
					<td class="vertical-middle"  style="text-align: left;">
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$logs}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$logs[sec1].actionDate}">{$logs[sec1].actionDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$logs[sec1].id}">{$logs[sec1].id}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$logs[sec1].actionName}">{$logs[sec1].actionName}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$logs[sec1].createdById}">{$logs[sec1].createdById}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$logs[sec1].createdBy}">{$logs[sec1].createdBy}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$logs[sec1].createdByIP}">{$logs[sec1].createdByIP}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$logPages}
						<li class="{$logPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$logPages[sec1].pageUrl}')">{$logPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminLogs&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminLogs&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminLogs&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminLogs&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
