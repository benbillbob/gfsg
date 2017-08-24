<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<% with $Event %>
		<h1>$Title</h1>
		<div class="content">$ParsedContent</div>
		<% loop $EventTicketTypes().Sort('Sequence', ASC) %>
			$ItemName
		<% end_loop %>
		<% end_with %>
	</article>
		$Form
		$CommentsForm
</div>