<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<% with $Article %>
		<h1>$Title</h1>
		<A href="$NewsPage.Link">Back</a>
		<div class="content">$Image $Content</div>
		<% end_with %>
	</article>
		$Form
		$CommentsForm
</div>