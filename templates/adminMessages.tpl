<script>
$(function() {
$.datepicker.setDefaults( $.datepicker.regional[ "{$lang}" ] );
$( "#sentDate" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#sentDateTill" ).datepicker( 
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
		<form method="post" action="?page=adminMessages&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive" style="overflow-x: auto; width:1800px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 40px; overflow: hidden;"/>
					<col style="width: 120px; overflow: hidden;"/>
					<col style="width: 300px; overflow: hidden;"/>
					<col style="width: 70px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 80px; overflow: hidden;"/>
					<col style="width: 200px; overflow: hidden;"/>
					<col style="width: 200px; overflow: hidden;"/>
					
				</colgroup>
				<thead>
				<tr style="background-color:rgb(219, 203, 129);">
					<!--<th class="vertical-middle">
						<input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
					</th>-->
					<th class="vertical-middle" style=" text-align:center" ><a title="{$sentDateMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=sentDate&sentDateSortType={$sentDateSortType}')">{$lnSentDate}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$idMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$subjectMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=subject&subjectSortType={$subjectSortType}')">{$lnSubject}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$bodyMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=body&bodySortType={$bodySortType}')">{$lnBody}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$senderIdMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=senderId&senderIdSortType={$senderIdSortType}')">{$lnSenderId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$userNameMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=userName&userNameSortType={$userNameSortType}')">{$lnUserName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$senderIPMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=senderIP&senderIPSortType={$senderIPSortType}')">{$lnSenderIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$toMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=sentTo&toSortType={$toSortType}')">{$lnTo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$attachmentMessagesHint}" href="javascript:{}" onclick="submitForm('?page=adminMessages&sortBy=attachment&attachmentSortType={$attachmentSortType}')">{$lnAttachment}</a></th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle">
						<input class="form-control" name="sentDate" id="sentDate" type="text" value="{$sentDateVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="sentDateTill" id="sentDateTill" type="text" value="{$sentDateTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="subject" id="subject" type="text" value="{$subjectVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="body" id="body" type="text" value="{$bodyVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="senderId" id="senderId" type="text" value="{$senderIdVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="userName" id="userName" type="text" value="{$userNameVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="senderIP" id="senderIP" type="text" value="{$senderIPVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="to" id="to" type="text" value="{$toVal}"/></td>
					<td class="vertical-middle"  style="text-align: left;">
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$messages2}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle"  style="overflow: hidden;" title="{$messages2[sec1].sentDate}">{$messages2[sec1].sentDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].id}">{$messages2[sec1].id}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].subject}">{$messages2[sec1].subject}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].body}">{$messages2[sec1].body}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].senderId}">{$messages2[sec1].senderId}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].userName}">{$messages2[sec1].userName}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].senderIP}">{$messages2[sec1].senderIP}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].to}">{$messages2[sec1].to}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$messages2[sec1].attachment}">{$messages2[sec1].attachment}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$messagePages}
						<li class="{$messagePages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$messagePages[sec1].pageUrl}')">{$messagePages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminMessages&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminMessages&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminMessages&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminMessages&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
