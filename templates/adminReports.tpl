<div>
	<!--<input class="newRole" type="button" value="New role" name="submit">-->
	
	<div class="titles">
		<h1>{$titleReports}</h1>
	</div>	
		<div style="width:1200px; padding-left: 490px;">
			<div class="accessDiv" id="accessDiv" style="    width: 100%;">
				<table border="1" id="t01" style="width:100%">
					<tr style="background-color:#B3AC96">
						<td>{$reportReason}</td><td>{$reportNote}</td><td>{$reporter}</td><td>{$reportDate}</td>
					</tr>
					{section name=sec1 loop=$reports}
					<tr>
						<td>{$reports[sec1].reportReason}</td>
						<td>{$reports[sec1].reportNote}</td>
						<td>{$reports[sec1].reporter}</td>
						<td>{$reports[sec1].reportDate}</td>
					</tr>
					{/section}
					
				</table>
			</div>
		</div>
</div>
