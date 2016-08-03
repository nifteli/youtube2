<style>
body { margin:0; }

#wrapper ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333 !important;
    position: fixed;
    top: 0;
    width: 100%;
}

#wrapper li {
    float: left;
}

#wrapper li a {
    display: block;
    color: white !important;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

#wrapper li a:hover:not(.active) {
    background-color: #111 !important;
}

#wrapper .active {
    background-color: #4CAF50 !important;
}

#wrapper li span{
	color: white !important;
}
</style>

<body>



</body>
</html>

<div id="wrapper">
	<ul>
		<li><a {if $page=="adminProfile" } class='active' {/if} href='?page=adminProfile'><span>{$mnProfile}</span></a></li>
		<li><a {if $page=="adminRoles" } class='active' {/if} href='?page=adminRoles'><span>{$mnRoles}</span></a></li>
		<li><a {if $page=="adminUsers" } class='active' {/if} href='?page=adminUsers'><span>{$mnUsers}</span></a></li>
		<li><a {if $page=="adminVideoLinks" } class='active' {/if} href='?page=adminVideoLinks'><span>{$mnVideoLinks}</span></a>
		<li><a {if $page=="adminComments" } class='active' {/if} href='?page=adminComments'><span>{$mnComments}</span></a>
		<li><a {if $page=="adminFolders" } class='active' {/if} href='?page=adminFolders'><span>{$mnFolders}</span></a>
		<li><a {if $page=="adminTags" } class='active' {/if} href='?page=adminTags'><span>{$mnTags}</span></a>
		<li><a {if $page=="adminGuests" } class='active' {/if} href='?page=adminGuests'><span>{$mnGuests}</span></a>
		<li><a {if $page=="adminCategories" } class='active' {/if} href='?page=adminCategories'><span>{$mnCategories}</span></a></li>
		<li><a {if $page=="adminNotifications" } class='active' {/if} href='?page=adminNotifications'><span>{$mnNotifications}</span></a></li>
		<li><a {if $page=="adminSearches" } class='active' {/if} href='?page=adminSearches'><span>{$mnSearches}</span></a></li>
		<li><a {if $page=="adminMessages" } class='active' {/if} href='?page=adminMessages'><span>{$mnMessages}</span></a></li>
		<li><a {if $page=="adminLogs" } class='active' {/if} href='?page=adminLogs'><span>{$mnLogs}</span></a></li>
		<li><a href="index.php?action=logout">{$logout}</a></li>
	</ul>
</div>
<div class="min-cont bg">
