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

<!--Videos thums Start-->			 
<div class="hollywd" style="margin-top:30px">
<h2>{$forgotPass}</h2>  
</div><br><br><br>

	<div style="padding-top:30px;min-height: 1000px;">
	
	<!-- Info message boxes 
	<div class="info">Info message</div>
	<div class="success">Successful operation message</div>
	<div class="warning">Warning message</div>
	<div class="error">Error message</div>
	<!-- End Info message boxes -->
	{if isset($errorMessage)}
	<div class="err">{$errorMessage}</div>
	{/if}
	{if isset($okMessage)}
	<div class="success1">{$okMessage}</div>
	{/if}
	
{if !isset($errorMessage) && !isset($okMessage)}
	{if (isset($rEmail) && isset($rHash))}
	<form class="reg-form" name="regForm" id="regForm" action="?page=forgotPass&action=resetPass&hash={$rHash}&email={$rEmail}" method="post"><br><br>
		
		<div class="topgap">
		<label>{$password}:
		<div class="gap"><input class="field" type="password" name="password" id="password" ></div></label></div><br><br>
		
		<div class="topgap">
		<label>{$passwordAgain}:
		<div class="gap"><input class="field" type="password" name="passwordAgain" id="passwordAgain" ></div></label></div><br><br><br>

		<input class="login39" type="submit" value="{$save}" name="submit">

	</form>
	{else}
	<form class="reg-form" name="regForm" id="regForm" action="?page=forgotPass&action=sendToMail" method="post"><br><br>
		<div class="topgap">
		<label>{$email}:
		<div class="gap"><input class="field" type="email" name="email" id="email" value="{if isset($emailVal)} {$emailVal} {/if}"></div></label></div><br><br>

		<input class="login39" type="submit" value="{$sendToMail}" name="submit">
	</form>

	{/if}
{/if}
</div>

             

