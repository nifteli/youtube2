<script>
function submitForm(action)
{
	if(action=='#') return;
	document.getElementById('vlFilter').action=action;
	document.getElementById('vlFilter').submit();
}

function controlQuestionSelection(el,id)
{
	var q1 = "q1["+id+"]";
	var q2 = "q2["+id+"]";
	var q3 = "q3["+id+"]";
	var q4 = "q4["+id+"]";

	if(el.id == q3 || el.id == q4)
	{
		document.getElementById(q1).checked = false;
		document.getElementById(q2).checked = false;
	}
	if(el.id == q1 || el.id == q2)
	{ 
		//alert(q3);
		document.getElementById(q3).checked = false;
		document.getElementById(q4).checked = false;
	}
}
</script>
<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	<br/><br/><br/>
	<div class="titles">
		<h1>{$titleCategories}</h1>
	</div>
	<div class="actionButtons" >
	
	<form method="post" action="?page=adminCategories&action=filter" id="vlFilter" name="vlFilter" enctype='multipart/form-data'>
	<table border=1 cellpadding=25 cellspacing=25 align=right>
		<tr style="text-align:right">
			<td><button class="btn btn-light-combo btn-sm" name="action" value="edit" type="submit" >{$edit}</button></td>
			<td><a href="#addCat">{$addCategory}</a></td>
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
		<div class="table-responsive" style="overflow-x: auto; width:3400px">
			<table id="product-table" class="table table-condensed table-zebr table-hover" style="table-layout: fixed;text-align: center;">
				<colgroup>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 140px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 100px; overflow: hidden;"/>
					<col style="width: 30px; overflow: hidden;"/>
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
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catAz&catAzSortType={$catAzSortType}')">{$lnCatAz}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catInfoAz&catInfoAzSortType={$catInfoAzSortType}')">{$lnCatAzInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catEn&catEnSortType={$catEnSortType}')">{$lnCatEn}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catInfoEn&catInfoEnSortType={$catInfoEnSortType}')">{$lnCatEnInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catRu&catRuSortType={$catRuSortType}')">{$lnCatRu}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=catInfoRu&catInfoRuSortType={$catInfoRuSortType}')">{$lnCatRuInfo}</a></th>
					<th class="vertical-middle" style=" text-align:center" ><a href="javascript:{}" onclick="submitForm('?page=adminCategories&sortBy=questions&videoQuestionSortType={$videoQuestionSortType}')">{$lnQuestion}</a></th>
					<th class="vertical-middle" style=" text-align:center" >{$pic}</th>
					<th class="vertical-middle" style=" text-align:center" >{$pic}</th>
					<th class="vertical-middle" style=" text-align:center" >{$delete}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCreated}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnUpdated}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnlastVideoAdded}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnDeleted}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnId}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCreatedById}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCreatedBy}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnCreatedByIP}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnDeletedById}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnDeletedBy}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnDeletedByIP}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnVideoCntInCat}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnUserCntSubscribed}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnClickUserCnt}</th>
					<th class="vertical-middle" style=" text-align:center" >{$lnClickCnt}</th>
				</tr>
				</thead>
				<thead class="head-transparent">
				<tr class="filter-row" style="background-color:rgb(219, 203, 129);">
					<td class="vertical-middle"><input class="form-control"  name="catAz" id="catAz" type="text" value="{$catAzVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catInfoAz" id="catInfoAz" type="text" value="{$catInfoAzVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catEn" id="catEn" type="text" value="{$catEnVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catInfoEn" id="catInfoEn" type="text" value="{$catInfoEnVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catRu" id="catRu" type="text" value="{$catRuVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="catInfoRu" id="catInfoRu" type="text" value="{$catInfoRuVal}" /></td>
					<td class="vertical-middle"><input class="form-control"  name="flvideoQuestion" id="flvideoQuestion" type="text" value="{$flvideoQuestionVal}" /></td>
					<td class="vertical-middle" colspan=18 style="text-align: left;">
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
						<table style="float:right; margin-left: 0; margin-right: 0;font-weight: bold;">
							<tr>
								<td><input id="q3[{$categories[sec1].id}]" class="checkbox" type="checkbox" value="4" onclick="controlQuestionSelection(this,{$categories[sec1].id})" name="videoQuestion[{$categories[sec1].id}][]" {if in_array("4", $categories[sec1].questions)} checked {/if}>{$vqHow}</input></td>
								<td><input id="q4[{$categories[sec1].id}]" class="checkbox" type="checkbox" value="8" onclick="controlQuestionSelection(this,{$categories[sec1].id})" name="videoQuestion[{$categories[sec1].id}][]" {if in_array("8", $categories[sec1].questions)} checked {/if}>{$vqWhy}</input></td>
								<td><input id="q1[{$categories[sec1].id}]" class="checkbox" type="radio" value="1" onclick="controlQuestionSelection(this,{$categories[sec1].id})" name="videoQuestion[{$categories[sec1].id}][]" {if in_array("1", $categories[sec1].questions)} checked {/if}>{$vqWhat}</input></td>
								<td><input id="q2[{$categories[sec1].id}]" class="checkbox" type="radio" value="2" onclick="controlQuestionSelection(this,{$categories[sec1].id})" name="videoQuestion[{$categories[sec1].id}][]" {if in_array("2", $categories[sec1].questions)} checked {/if}>{$vqWho}</input></td>
							</tr>
						</table>
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
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].created}">{$categories[sec1].created}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].updated}">{$categories[sec1].updated}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].lastVideoAdded}">{$categories[sec1].lastVideoAdded}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].deleted}">{$categories[sec1].deleted}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].id}">{$categories[sec1].id}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].createdById}">{$categories[sec1].createdById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].createdBy}">{$categories[sec1].createdBy}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].createdByIP}">{$categories[sec1].createdByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].deletedById}">{$categories[sec1].deletedById}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].deletedBy}">{$categories[sec1].deletedBy}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].deletedByIP}">{$categories[sec1].deletedByIP}</td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].videoCntInCat}"><a href="?page=adminDetails&s=cats&q=1&catId={$categories[sec1].id}&title={$lnVideoCntInCat}">{$categories[sec1].videoCntInCat}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].userCntSubscribed}"><a href="?page=adminDetails&s=cats&q=2&catId={$categories[sec1].id}&title={$lnUserCntSubscribed}">{$categories[sec1].userCntSubscribed}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].clickUserCnt}"><a href="?page=adminDetails&s=cats&q=3&catId={$categories[sec1].id}&title={$lnClickUserCnt}">{$categories[sec1].clickUserCnt}</a></td>
					<td class="vertical-middle"  style="overflow: hidden;" title="{$categories[sec1].clickCnt}"><a href="?page=adminDetails&s=cats&q=3&catId={$categories[sec1].id}&title={$lnClickCnt}">{$categories[sec1].clickCnt}</a></td>
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
<div id="addCat" class="modalDialog" >
	<div style="width:800px;height:350px">
	<h4 style="font-weight:bold">{$sendMail}</h4>
		<a href="#close" title="Close" class="close1">X</a>
		<form action="?page=adminCategories&action=addCat" method="post" enctype="multipart/form-data" style="width: 100%;">
			<div class="topgap" style="margin-left:0px">
				<label>{$lnCatAz}:</label>
				<div class="gap" style="margin-left:0px">
					<input required class="field" style="width:600px" type="text" name="catAz1" id="catAz1">
				</div>
			</div>
			<div class="topgap">
				<label>{$lnCatAzInfo}:</label>
				<div class="gap" style="margin-left:0px">
					<input  class="field" style="width:600px" type="text" name="catInfoAz1" id="catInfoAz1">
				</div>
			</div>
			<div class="topgap" style="margin-left:0px">
				<label>{$lnCatEn}:</label>
				<div class="gap" style="margin-left:0px">
					<input required class="field" style="width:600px" type="text" name="catEn1" id="catEn1">
				</div>
			</div>
			<div class="topgap">
				<label>{$lnCatEnInfo}:</label>
				<div class="gap" style="margin-left:0px">
					<input  class="field" style="width:600px" type="text" name="catInfoEn1" id="catInfoEn1">
				</div>
			</div>
			<div class="topgap" style="margin-left:0px">
				<label>{$lnCatRu}:</label>
				<div class="gap" style="margin-left:0px">
					<input required class="field" style="width:600px" type="text" name="catRu1" id="catRu1">
				</div>
			</div>
			<div class="topgap">
				<label>{$lnCatRuInfo}:</label>
				<div class="gap" style="margin-left:0px">
					<input  class="field" style="width:600px" type="text" name="catInfoRu1" id="catInfoRu1">
				</div>
			</div>
			<div class="topgap">
				<label>{$lnQuestion}:</label>
				<div class="gap" style="margin-left:0px">
					<table style="float:right; margin-left: 0; margin-right: 0;font-weight: bold; height:30px" border=0 cellpadding=0 cellspacing=0>
						<tr >
							<td style="border:none !important;padding:0px !important"><input id="q3[0]" class="checkbox" type="checkbox" value="4" onclick="controlQuestionSelection(this,0)" name="videoQuestion[0][]">{$vqHow}</input></td>
							<td style="border:none !important;padding:0px !important"><input id="q4[0]" class="checkbox" type="checkbox" value="8" onclick="controlQuestionSelection(this,0)" name="videoQuestion[0][]">{$vqWhy}</input></td>
							<td style="border:none !important;padding:0px !important"><input id="q1[0]" class="checkbox" type="radio" value="1" onclick="controlQuestionSelection(this,0)" name="videoQuestion[0][]">{$vqWhat}</input></td>
							<td style="border:none !important;padding:0px !important"><input id="q2[0]" class="checkbox" type="radio" value="2" onclick="controlQuestionSelection(this,0)" checked name="videoQuestion[0][]">{$vqWho}</input></td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="topgap">
				<label>{$pic}:</label>
				<div class="gap" style="margin-left:10px">
					<input type="file" class="field" style="width:600px" name="img" id="img" />
				</div>
			</div>	
			
			<div style="text-align:center;">
			<input class="login39" type="submit" value="{$save}" name="submit" style="margin-left:0px;margin-top:10px">
			</div>
		</form>
	</div>
</div>
