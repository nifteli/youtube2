<div>
<div style="float: right;height:1 width:220px; margin: 0 auto; padding: 15px 0 40px;">
	<div class="tabcontents2"></div>
</div>
</div>

<!--Videos thums Start-->			 

	<div style="padding-top:10px;min-height: 1000px;">
<div class="hollywd">
                  <h2>{$catName}</h2>  
			</div>
			<div class="player">
			<video id="vid1" src="" class="video-js vjs-default-skin" controls preload="auto" width="460" height="275" 
			  data-setup='{ "language":["tr"],"ytcontrols":["true"], "techOrder": ["youtube"], "src": "{$videoLink}" }'>
			  </video>
			</div>
    		
            <img class="usr" src="img/usr.png" width="25" height="25" alt=""/>
			<p class="cmnt"><span class="para">“Lorem ipsum dolor sit amet, in
			dicant appareat usu, mea errem accumsan et.”ffendit philosophia “ </span>	</p>
			<a class="post" href="#">Post Comment</a>		
			<img class="cmnt-p" src="img/cmnt.png" width="216" height="63" alt=""/> 
        
             <div class="line">
             <a href="#"><img src="img/fb.png"/></a>
             <a class="tw" href="#"><img src="img/twitter.png"/></a>
             </div>
             
        <div class="v-name">
             <h2>{$videoName}</h2>
          <div class="line2"></div>
         </div>
         
         <div class="fb-l">
        <img src="img/like-1.png"/>
        <p>{$likeCount}</p>
        </div>
        <div class="fb-l2">
        <img src="img/like-2.png"/> 
        <p>{$dislikeCount}</p> 
             </div>
             
             
            <div class="v-details">
            <img src="img/usr-2.png" width="32" height="32" alt=""/> 
             <h2>{$author}</h2>
             <h3>{$views}:&nbsp;&nbsp;&nbsp;{$viewCount}</h3>
             <h4><b>{$tags}:</b>&nbsp;&nbsp; {$videoTags}</h4>
             <h5><b>{$published}:</b>&nbsp;&nbsp; {$publishDate}</h5> 
        </div> 
             <div class="strip">
         <img src="img/flag.png" width="24" height="28" alt=""/><a class="flag" href="#">{$reportVideo}</a>
         <img class="foldr" src="img/foldr.png" width="38" height="37" alt=""/> 
         <a class="flag" href="#">{$addToFolder}</a>
         </div>
	</div>

             

