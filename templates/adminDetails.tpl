<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	
	<div >
		<b>{$titleDetails}</b>
	</div>	
		<div style="width:1200px; padding-left: 10px;">
		
			<div class="accessDiv" id="accessDiv" style="    width: 100%;">
			<form method="post" action="?page=adminDetails&s={$s}&q={$q}&title={$titleDetails}&{$condName}={$id}" id="vlFilter" name="vlFilter">
				<button class="btn btn-light-combo btn-sm" name="action" id="action" value='export'>{$export}</button><br>
				
			</form>
				<table id="t01" class="tbl" style="width:100%;text-align:center;border: 1px solid black;">
					<tr style="background-color:#B3AC96"  style="border: 1px solid black;">
						{for $colNms=0 to count($colNames)-1}
							<td style="border: 1px solid black;">{$colNames[$colNms]}</td>
						{/for}
					</tr>
					{for $row=0 to $rowCnt-1}
						<tr>
							{for $col=0 to $columnCnt-1}
								<td style="border: 1px solid black;">{$data[$row][$colNames[$col]]}</td>
							{/for}
						</tr>
					{/for}
				</table>
			</div>
		</div>
</div>
