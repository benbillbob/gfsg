<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>
		<% loop $Articles %>
			<h3>$Title</h3>
			$Summary
			<A href="$Link">Show</a>
		<% end_loop %>
	</article>
		$Form
		$CommentsForm
</div>