<aside class="sidebar unit size1of4">
	<% if $Menu(2) %>
		<nav class="secondary">
			<% with $Level(1) %>
				<ul>
					<% include SidebarMenu %>
				</ul>
			<% end_with %>
		</nav>
	<% end_if %>
</aside>
