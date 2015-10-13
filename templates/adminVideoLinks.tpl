<script>
$(function() {
$( "#added" ).datepicker( $.datepicker.regional[ "{$lang}" ] );
});

function submitForm(action)
{
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
	<div id="all" style="float:left; margin-left:15px; width: 900px;">
		<form method="post" action="?page=adminVideoLinks" id="vlFilter" name="vlFilter">
		<div class="table-responsive">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;">
				<colgroup>
					<col style="width: 50px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 150px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 80px; overflow: hidden;"/>
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
					<th class="vertical-middle" style=" text-align:center" >{$lnId}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnName}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnInfo}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnAdded}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnLang}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnLink}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnAddedBy}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnTags}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCategory}</th>
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
					<td class="vertical-middle"><input class="form-control" name="addedBy" id="addedBy" type="text" value="{$addedByVal}"/></td>
					<td class="vertical-middle"><input class="form-control" name="tags" id="tags" type="text" value="{$tagsVal}"/></td>
					<td class="vertical-middle">
						<button class="btn btn-light-combo btn-sm" type="submit" name="filter" id="filter">Filter</button>
						 <button class="btn btn-light-combo btn-sm" type="submit" name="export" id="export">XLS</button>
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
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].addedBy}">{$videoLinks[sec1].addedBy}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].tags}">{$videoLinks[sec1].tags}</td>
					<td class="vertical-middle" style="overflow: hidden;" title="{$videoLinks[sec1].catName}">{$videoLinks[sec1].catName}</td>
				</tr>
				{/section}
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
		<div class="row pagination-zone np-l">
                <div class="col-lg-6 col-lg-offset-3">
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
                                    25
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
