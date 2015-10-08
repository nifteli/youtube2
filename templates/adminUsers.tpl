<link href="css/admin/grid/design.css" rel="stylesheet">

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/admin/grid/libs/jquery-1.11.0.min.js"><\/script>')</script>
<script src="js/admin/grid/libs/jquery-ui-1.10.4.custom.min.js"></script>-->
<script src="js/admin/grid/bootstrap.min.js"></script>
<script src="js/admin/grid/libs/checkable/prettyCheckable.min.js"></script>
<script src="js/admin/grid/libs/selectbox/selectBoxIt.1.11.0.min.js"></script>
<script defer="defer" src="js/admin/grid/script.js"></script>
<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	<br/><br/><br/>
	<div class="titles">
		<h1>{$titleUsers}</h1>
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
	<div class="table-responsive">
                <table id="product-table" class="table table-condensed table-zebr table-hover">
                    <colgroup>
                        <col style="width: 30px;"/>
                        <col style="width: 80px;"/>
                        <col style="width: 50px"/>
                        <col/>
                        
                        <col/>
                        <col/>
                        <col/>
                        <col/>
                        <col style="width: 110px;"/>
                    </colgroup>
                    <thead>
                    <tr style="background-color:rgb(219, 203, 129);">
                        <th class="vertical-middle no-sort">
                            <input type="checkbox" class="ui-port-checkable select-all-checkbox" value="1" id="Test-0" name="Test"/>
                        </th>
                        <th class="vertical-middle no-sort">Şəkil</th>
                        <th class="vertical-middle">ID</th>
                        <th class="vertical-middle">İstifadəçi adı</th>
                        <th class="vertical-middle">Qeydiyyat tarixi</th>
                        <th class="vertical-middle">Son giriş</th>
                        <th class="vertical-middle">Balansı</th>
                        <th class="vertical-middle">Alıb</th>
                        
                        <th class="vertical-middle">Düzəlt</th>
                    </tr>
                    </thead>
                    <thead class="head-transparent">
                    <tr class="filter-row" style="background-color:rgb(219, 203, 129);">
                        <td colspan="2"></td>
                        <td class="vertical-middle"><input class="form-control" type="text"/></td>
                        <td class="vertical-middle"><input class="form-control" type="text"/></td>
                        <td class="vertical-middle"><input class="form-control" type="text"/></td>
                        <td class="vertical-middle"><input class="form-control" type="text"/></td>
                        <td class="vertical-middle"><input class="form-control" type="text"/></td>
                        
                        <td class="vertical-middle"><input class="form-control" type="text"/></td>
                        <td class="vertical-middle">
                            <button class="btn btn-light-combo btn-sm">Filter</button>
							 <button class="btn btn-light-combo btn-sm">XLS</button>
                        </td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
					<tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
					<tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
					<tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
					<tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
					<tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
                     <tr>
                        <td class="vertical-middle"><input type="checkbox" class="ui-port-checkable" value="1" id="Test-1" name="Test"/></td>
                        <td class="vertical-middle">
                            <img class="prodct-thmb" src="./uploads/userPictures/1.jpeg" height=30 width=30 alt="Product name"/>
                        </td>
                        <td class="vertical-middle">123</td>
                        <td class="vertical-middle">Satan arkadaş</td>
                        <td class="vertical-middle">12.03.2014</td>
                        <td class="vertical-middle">12.03.2014</td>
                        
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">0</td>
                        <td class="vertical-middle">
                            <a class="link-underlined" href="#">Təsdiq gözləyir</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
            <div class="row pagination-zone np-l">
                <div class="col-lg-6 col-lg-offset-3">
                    <ul class="pagination ui-port-paginate pull-left">
                        <li><a href="#">«</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li class="disabled"><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">»</a></li>
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
                                    <li role="presentation"><a href="#" tabindex="-1" role="menuitem">25</a></li>
                                    <li role="presentation"><a href="#" tabindex="-1" role="menuitem">50</a></li>
                                    <li role="presentation"><a href="#" tabindex="-1" role="menuitem">100</a></li>
                                </ul>
                            </div>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.col-lg-3 -->
            </div>
	</div>
	
	
</div>
