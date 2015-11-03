<div>
	<br/>
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
	<div id="all" style="float:left; margin-left:15px; width: 800px;">
	 <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th id="select"></th>
                <th>Created Date</th>
                <th>ID</th>
                <th>Username</th>
            </tr>
        </thead>
 
        <!--<tfoot>
            <tr>
				<th>Created Date</th>
                <th>ID</th>
                <th>Username</th>
            </tr>
        </tfoot> -->
    </table>
    <script>
    $(document).ready(function() {
    	var selected = [];
    	
	    $('#example').DataTable( {
	    	"processing": true,
        	"serverSide": true,
        	"ajax": {
	            "url": "ajax/adminGrid.php?action=loadUsers",
	            "type": "POST",
	        	},
        	
        	"columns": [
        		{ "data": null },
			    { "data": "created" },
			    { "data": "id" },
			    { "data": "userName" }
			  ], 
			
			"columnDefs": [ {
	            "orderable": false,
	            "className": "select-checkbox",
	            "targets": 0,
	            "defaultContent": ""
	          } ],
	        "select": {
	            "style":    "multi",
	            "selector": "tr"
	          },
	          
	        "rowCallback": function( row, data ) {
	            if ( $.inArray(data.DT_RowId, selected) !== -1 ) {
	                $(row).addClass('selected');
	            }
        	  }
		    } );
		    
		    $('#example tbody').on('click', 'tr', function () {
		        var id = this.id;
		        var index = $.inArray(id, selected);
		 
		        if ( index === -1 ) {
		            selected.push( id );
		        } else {
		            selected.splice( index, 1 );
		        }
		 
		        $(this).toggleClass('selected');
	    	} );
	} );
</script>
    <br /><br /><br />
	</div>
	
</div>
