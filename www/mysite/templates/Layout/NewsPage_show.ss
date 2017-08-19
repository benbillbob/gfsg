<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<% with $Article %>
		<h1>$Title</h1>
		<div class="content">$Content</div>
		<% end_with %>
	</article>
		$Form
		$CommentsForm
</div>