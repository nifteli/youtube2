<script>
$(document).ready(function() {
    var validator = $("#logForm").validate({
        rules: {
            userName: "required",
			password: "required",
        },
        messages: {
			userName:"",
			password:"",
        },
    });
});
</script>
<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

	<div style="padding-top:10px;min-height: 1000px;">
<div class="pic-cont">
					
					{section name=sec1 loop=$users}
					<div class="pic1">
						<a href="{$users[sec1].url}"> 
							<img src="{$users[sec1].picPath}"/> 
							<h2>{$users[sec1].user} ({$users[sec1].videoCount})</h2>
						</a>
					</div>
					{/section}
					
                </div>
 
	</div>

             

