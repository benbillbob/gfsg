<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<h1>$Title</h1>
		<div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 600px; height: 300px;">
			<div u="slides" style="cursor: move; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 600px; height: 300px;">
				<% loop $Images %>
				<div><img u="image" src="$AbsoluteURL" /></div>
				<% end_loop %>
			</div>
		</div>
		<div class="content">$Content</div>
	</article>
		$Form
		$CommentsForm
</div>