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
$( "#confirmDate" ).datepicker( 
	{
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+5"
	},
	$.datepicker.regional["{$lang}"]
);
$( "#confirmDateTill" ).datepicker( 
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
		<form method="post" action="?page=adminComments&action=filter" id="vlFilter" name="vlFilter">
		<div class="table-responsive" style="overflow-x: auto; width:2700px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 160px; overflow: hidden;"/>
					<col style="width: 160px; overflow: hidden;"/>
					<col style="width: 160px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 270px; overflow: hidden;"/>
					<col style="width: 70px; overflow: hidden;"/>
					<col style="width: 80px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 150px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 170px; overflow: hidden;"/>
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
					<th class="vertical-middle" style=" text-align:center"  title="{$deleteCommentsHint}">{$delete}</th>
					<th class="vertical-middle" style=" text-align:center" title="{$confirmCommentsHint}" >{$confirm}</th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=created&createdSortType={$createdSortType}')">{$lnCreated}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=updated&updatedSortType={$updatedSortType}')">{$lnUpdated}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$confirmDateCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=confirmDate&confirmDateSortType={$confirmDateSortType}')">{$lnConfirmDate}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$idCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=id&idSortType={$idSortType}')">{$lnId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$commentCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=comment&commentSortType={$commentSortType}')">{$lnComment}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$isConfirmedCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=isConfirmed&confirmedSortType={$confirmedSortType}')">{$lnConfirmed}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$videoIdCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=videoId&videoIdSortType={$videoIdSortType}')">{$lnVideoId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$linkCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=link&linkSortType={$linkSortType}')">{$lnLink}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$videoNameCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=videoName&videoNameSortType={$videoNameSortType}')">{$lnVideoName}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$questionCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=question&questionSortType={$questionSortType}')">{$lnQuestion}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$createdByIdCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=createdById&authorIdSortType={$authorIdSortType}')">{$lnAuthorId}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$authorCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=author&authorSortType={$authorSortType}')">{$lnAuthor}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$userIPCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=userIP&userIPSortType={$userIPSortType}')">{$lnUserIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedByIdCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=updatedById&updatedByIdSortType={$updatedByIdSortType}')">{$lnUpdatedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedByCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=updatedBy&updatedBySortType={$updatedBySortType}')">{$lnUpdatedBy}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$updatedByIPCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=updatedByIP&updatedByIPSortType={$updatedByIPSortType}')">{$lnUpdatedByIP}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$confirmedByIdCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=confirmedById&confirmedByIdSortType={$confirmedByIdSortType}')">{$lnConfirmedById}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$confirmerCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=confirmer&confirmerSortType={$confirmerSortType}')">{$lnConfirmer}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a title="{$confirmedByIPCommentsHint}" href="javascript:{}" onclick="submitForm('?page=adminComments&sortBy=confirmedByIP&confirmedByIPSortType={$confirmedByIPSortType}')">{$lnConfirmedByIP}</a></th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle" colspan=2></td>
					<td class="vertical-middle">
						<input class="form-control" name="created" id="created" type="text" value="{$createdVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="createdTill" id="createdTill" type="text" value="{$createdTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle">
						<input class="form-control" name="updated" id="updated" type="text" value="{$updatedVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="updatedTill" id="updatedTill" type="text" value="{$updatedTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle">
						<input class="form-control" name="confirmDate" id="confirmDate" type="text" value="{$confirmDateVal}" style="width:90px;display:initial"/>
						<input class="form-control" name="confirmDateTill" id="confirmDateTill" type="text" value="{$confirmDateTillVal}" style="width:90px;display:initial"/>
					</td>
					<td class="vertical-middle"><input class="form-control" name="id" id="id" type="text" value="{$idVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="comment" id="comment" type="text" value="{$commentVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="confirmed" id="confirmed" type="text" value="{$confirmedVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="videoId" id="videoId" type="text" value="{$videoIdVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="link" id="link" type="text" value="{$linkVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="videoName" id="videoName" type="text" value="{$videoNameVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="question" id="question" type="text" value="{$questionVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="authorId" id="authorId" type="text" value="{$authorIdVal}" /></td>
					<td class="vertical-middle"><input class="form-control" name="author" id="author" type="text" value="{$authorVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="userIP" id="userIP" type="text" value="{$userIPVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="updatedById" id="updatedById" type="text" value="{$updatedByIdVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="updatedBy" id="updatedBy" type="text" value="{$updatedByVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="updatedByIP" id="updatedByIP" type="text" value="{$updatedByIPVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="confirmedById" id="confirmedById" type="text" value="{$confirmedByIdVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="confirmer" id="confirmer" type="text" value="{$confirmerVal}"/></td>
					<td class="vertical-middle" style="text-align: left;">
						<button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='filter'>{$filter}</button>
						 <button class="btn btn-light-combo btn-sm" type="submit" name="action" id="action" value='export'>{$export}</button>
					</td>
				</tr>
				</thead>
				<tbody>
				{section name=sec1 loop=$comments}
				<tr>
					<!--<td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>-->
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$delete}">
						{if $hasDeleteAccess}
						<a href="?page=adminComments&action=delete&id={$comments[sec1].id}" onClick="return confirm('{$deleteConfirmation}')"><img src="img/delete.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle" style="overflow: hidden;text-align: center;" title="{$confirm}">
						{if $hasConfirmAccess && $comments[sec1].isConfirmed == 0}
						<a href="?page=adminComments&action=confirm&id={$comments[sec1].id}"><img src="img/success.png" width="15" height="15" alt=""/></a>
						{/if}
					</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].createdDate}">{$comments[sec1].createdDate}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].updatedDate}">{$comments[sec1].updatedDate}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].confirmedDate}">{$comments[sec1].confirmedDate}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].id}">{$comments[sec1].id}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].comment}">{$comments[sec1].comment}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].isConfirmed}">{$comments[sec1].isConfirmed}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].videoId}">{$comments[sec1].videoId}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].link}">{$comments[sec1].link}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].videoName}">{$comments[sec1].videoName}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].question}">{$comments[sec1].question}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].createdById}">{$comments[sec1].createdById}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].author}">{$comments[sec1].author}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].userIP}">{$comments[sec1].userIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].updatedById}">{$comments[sec1].updatedById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].updatedBy}">{$comments[sec1].updatedBy}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].updatedByIP}">{$comments[sec1].updatedByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].confirmedById}">{$comments[sec1].confirmedById}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$comments[sec1].confirmer}">{$comments[sec1].confirmer}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$comments[sec1].confirmedByIP}">{$comments[sec1].confirmedByIP}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l" >
                <div class="col-lg-6 col-lg-offset-3" style="margin-left: 0;">
                    <ul class="pagination ui-port-paginate pull-left">
                        {section name=sec1 loop=$commentPages}
						<li class="{$commentPages[sec1].pageStatus}"><a href="javascript:{}" onclick="submitForm('{$commentPages[sec1].pageUrl}')">{$commentPages[sec1].pageNum}</a></li>
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
                                    <li role="presentation"><a href="?page=adminComments&perPage=10" tabindex="-1" role="menuitem">10</a></li>
                                    <li role="presentation"><a href="?page=adminComments&perPage=25" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="?page=adminComments&perPage=50" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="?page=adminComments&perPage=100" tabindex="-1" role="menuitem">100</a></li>
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
