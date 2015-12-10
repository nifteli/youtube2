<script>
{if (isset($rEmail) && isset($rHash))}
$(document).ready(function() {
    var validator = $("#regForm").validate({
        rules: {
            password: "required",
			passwordAgain: "required"
        },
        messages: {
			password:"",
			passwordAgain:""
        },
    });
});
{else}
$(document).ready(function() {

    var validator = $("#regForm").validate({
        rules: {
            email: "required"
        },
        messages: {
			email: ""
        },
    });
});
{/if}
</script>
<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>
<div style="padding-top:10px;min-height: 1000px;">
	<div class="forgotPass">
		<div class="hollywd" style="margin-top:35px">
		<h2>{$forgotPass}</h2>  
		</div>
		{if isset($errorMessage)}
		<div class="err" style="margin-top:20px; float:left; ">{$errorMessage}</div>
		{/if}
		{if isset($okMessage)}
		<div class="success1" style="margin-top:20px; float:left; ">{$okMessage}</div>
		{/if}
		
		{if (isset($rEmail) && isset($rHash))}
		<form class="reg-form" name="regForm" id="regForm" action="?page=forgotPass&action=resetPass&hash={$rHash}&email={$rEmail}" method="post" style="margin-top:20px">
			<div class="topgap">
			<label>{$password}:</label>
				<div class="gap" style="margin-left:0"><input class="field" type="password" name="password" id="password" style="margin-left:0"></div>
			</div><br>
			<div class="topgap">
			<label>{$passwordAgain}:</label>
			<div class="gap" style="margin-left:0"><input class="field" type="password" name="passwordAgain" id="passwordAgain" style="margin-left:0"></div>
			</div>
			<input class="login39" type="submit" value="{$save}" name="submit" style="height:20px;">
		</form>
		{else}
		<form class="reg-form" name="regForm" id="regForm" action="?page=forgotPass&action=sendToMail" method="post" style="margin-top:20px">
			<div class="topgap">
			<label>{$email}:</label>
				<div class="gap" style="margin-left:0"><input class="field" type="email" name="email" id="email" value="{if isset($emailVal)} {$emailVal} {/if}" style="margin-left:0">
				<input class="login39" type="submit" value="{$sendToMail}" name="submit" style="height:20px;margin-left:5px">
				</div>
			</div>
		</form>
		{/if}

	</div>
 </div>


             

