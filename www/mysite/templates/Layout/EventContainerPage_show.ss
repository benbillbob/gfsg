<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<% with $Event %>
		<h1>$Title</h1>
		<div class="content">$ParsedContent</div>
		<% loop $EventTicketTypes().Sort('Sequence', ASC) %>
			$ItemName
			<h4>$Amount.Nice</h4>
				<form action="$FormAction" method="post"><!-- SiteConfig -->
					<fieldset>
						<input type="hidden" name="cmd" value="_xclick">
						<input type="hidden" name="business" value="$Business()" /><!-- SiteConfig -->
						<input type="hidden" name="item_name" value="$ItemName" /><!-- Shortcode -->
						<input type="hidden" name="item_number" value="$ItemNumber"><!-- Shortcode -->
						<input type="hidden" name="amount" value="$Amount" /><!-- Shortcode -->
						<input id="Custom" type="hidden" name="custom" /><!-- Runtime -->
						<input type="hidden" name="currency_code" value="$CurrencyCode()" /><!-- SiteConfig -->
						<input type="hidden" name="return" value="$ReturnUrl()" /><!-- SiteConfig -->
						<input type="hidden" name="cancel_return" value="$CancelUrl()" /><!-- SiteConfig -->
						<input type="submit" name="submitButton" value="$ButtonText" class="button" /><!-- Shortcode -->
					</fieldset>
				</form>			
		<% end_loop %>
		<% end_with %>
	</article>
		$Form
		$CommentsForm
</div>