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

<div class="videos">
	<div style="padding-top:10px;min-height: 1000px;">
	{if isset($errorMessage)}
	<div class="err" style="width:680px; margin-top:40px">{$errorMessage}</div>
	{/if}
	{if isset($okMessage)}
	<div class="success1" style="width:680px; margin-top:40px">{$okMessage}</div>
	{/if}
				<div class="hollywd">
					<h2>Hollywood</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="?page=watchVideo"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="?page=watchVideo"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><a href="?page=like&type=1"><img src="img/like-01.png"/></a><p>13245</p></li>
							<li class="likes2"><a href="?page=like&type=2"><img src="img/like-02.png"/></a><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>                
				
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>  
					  
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>
		
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				   <div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
					<div class="box">
						<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
						<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
						<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
						<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
						<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
						<ul class="move">
							<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
							<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
							<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
							<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
							<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
							<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
						</ul>
					</div>
				</div>
				
				<div class="hollywd">
					<h2>Thriller</h2>  
				</div>
				<div class="box-cont">
				<div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
               <div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
               <div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
				<div class="box">
					<a href="watch-vid.html"><img src="img/player.png" width="152" height="79" alt=""/></a>
					<a href="#"><img class="ico1" src="img/add-to-f.png" width="24" height="24" alt=""/></a>
					<a href="#"><img class="ico2" src="img/edit-02.png" width="24" height="24" alt=""/></a>
					<a href="watch-vid.html"><h2>The Devil's Double</h2></a>
					<img class="shape" src="img/shape.png" width="140" height="1" alt=""/> 
					<ul class="move">
						<li><img class="details" src="img/02.png" /><span class="wood">Hollywood</span></li>
						<li><img class="details2" src="img/eye.png" /><span class="views">15,2341</span></li>
						<li><img class="details3" src="img/publish.png" /><span class="date">Nov 29,2013</span></li>
						<li><img class="details4" src="img/user1.png" /><span class="smith">Will Smith</span></li>
						<li class="likes"><img src="img/like-01.png"/><p>13245</p></li>
						<li class="likes2"><img src="img/like-02.png"/><p>3245</p></li>
					</ul>
				</div>
			</div>
			
			
			<div class="btn">
               <a href="#">  <input class="login34" type="submit" value="Load More Videos" name="submit"></a>
                
                </div>
			</div>
</div>

             

