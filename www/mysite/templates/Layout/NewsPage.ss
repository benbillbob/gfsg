<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>
		<table>
		<% loop $Articles.Sort(Created, DESC) %>
			<th colspan="2">
				<h3>$Title</h3>
			</th>
			<tr>
				<td>
					$Image.CMSThumbnail
				</td>
				<td>
					$Summary
					<a href="$Link">Show</a>
				</td>
			</tr>
		<% end_loop %>
		</table>
	</article>
		$Form
		$CommentsForm
</div>