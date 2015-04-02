 <!--Category Panel Starts-->
<div class="category">
	<!--<h2>Categories</h2>-->
	<div style="width:220px; margin: 0 auto; padding: 15px 0 40px;">
		<ul class="tabs" data-persist="true">
			<li><a href="#view1" style="background:#dccb8f">{$how}</a></li>
			<li><a href="#view2" style="background:#edd991">{$why}</a></li>
			<li><a href="#view3" style="background:#d4bd69">{$what}</a></li>
			<li><a href="#view4" style="background:#edd684">{$who}</a></li>
		</ul>
		<div class="tabcontents">
			<div id="view1">
			   <div class="c-name">
					<ul>
						{section name=sec1 loop=$catsHow}
						<li><a href="{$catsHow[sec1].url}">{$catsHow[sec1].catName} ({$catsHow[sec1].count}) (<a href="{$catsHow[sec1].subscribe}">Subscribe</a>)</a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view2">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWhy}
						<li><a href="{$catsWhy[sec1].url}">{$catsWhy[sec1].catName} ({$catsWhy[sec1].count}) (<a href="{$catsWhy[sec1].subscribe}">Subscribe</a>)</a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view3">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWhat}
						<li><a href="{$catsWhat[sec1].url}">{$catsWhat[sec1].catName} ({$catsWhat[sec1].count}) (<a href="{$catsWhat[sec1].subscribe}">Subscribe</a>)</a></li>
						{/section}
					</ul>
				</div>
			</div>
			<div id="view4">
				<div class="c-name">
					<ul>
						{section name=sec1 loop=$catsWho}
						<li><a href="{$catsWho[sec1].url}">{$catsWho[sec1].catName} ({$catsWho[sec1].count}) (<a href="{$catsWho[sec1].subscribe}">Subscribe</a>)</a></li>
						{/section}
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Category Panel End-->
		