<nav class="primary">
	<span class="nav-open-button">²</span>
	<ul>
		<% loop $Menu(1) %>
			<li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
		<% end_loop %>
		<% if CurrentMember %> 
			<li class="$LinkingMode"><a href="/Security/logout">Logout</a></li>
		<% else %> 
			<li class="$LinkingMode"><a href="/Security/login">Login</a></li>
		<% end_if %>
	</ul>
</nav>
