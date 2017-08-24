<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<% with $Event %>
		<h1>$Title</h1>
		<div class="content">$Content</div>
		<p>Starts: $EventStartDate.Nice<% if $EventStartTime %> - $EventStartTime.Nice<% end_if %></p>
		<p>Ends: $EventEndDate.Nice<% if $EventEndTime %> - $EventEndTime.Nice<% end_if %></p>
		<% if $OnSaleNow %>On Sale
		<% else_if $OnSaleStartDate %>
		<p>On Sale: $OnSaleStartDate.Nice<% if $OnSaleStartTime %> - $OnSaleStartTime.Nice<% end_if %></p>
		<% end_if %>
		<% end_with %>
	</article>
		$Form
		$CommentsForm
</div>