<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>
		<table>
		<% loop $Memberships %>
			<tr>
				<td>
					<h2>$ItemName</h2>
					<h3>$Amount.Nice</h3>
					<div>$DescriptionContent</div>
				</td>
				<td>
					<form action="$FormAction" method="post"><!-- SiteConfig -->
						<fieldset>
							<input type="hidden" name="cmd" value="_cart" />
							<input type="hidden" name="add" value="1" />
							<input type="hidden" name="business" value="$Business()" /><!-- SiteConfig -->
							<input type="hidden" name="item_name" value="$ItemName" /><!-- Shortcode -->
							<input type="hidden" name="item_number" value="$ItemNumber"><!-- Shortcode -->
							<input type="hidden" name="amount" value="$Amount" /><!-- Shortcode -->
							<input type="hidden" name="custom" value="$Custom" /><!-- Shortcode -->
							<input type="hidden" name="currency_code" value="$CurrencyCode()" /><!-- SiteConfig -->
							<input type="hidden" name="return" value="$ReturnUrl()" /><!-- SiteConfig -->
							<input type="hidden" name="cancel_return" value="$CancelUrl()" /><!-- SiteConfig -->
							<input type="submit" name="submit" value="Buy Now" class="button" /><!-- Shortcode -->
						</fieldset>
						<h4>$Amount.Nice</h4>
					</form>
					<form action="$FormAction" method="post"><!-- SiteConfig -->
						<fieldset>
							<input type="hidden" name="cmd" value="_cart" />
							<input type="hidden" name="add" value="1" />
							<input type="hidden" name="business" value="$Business()" /><!-- SiteConfig -->
							<input type="hidden" name="item_name" value="$ItemName" /><!-- Shortcode -->
							<input type="hidden" name="item_number" value="$ItemNumberWithJournal"><!-- Shortcode -->
							<input type="hidden" name="amount" value="$AmountWithJournal" /><!-- Shortcode -->
							<input type="hidden" name="custom" value="$Custom" /><!-- Shortcode -->
							<input type="hidden" name="currency_code" value="$CurrencyCode()" /><!-- SiteConfig -->
							<input type="hidden" name="return" value="$ReturnUrl()" /><!-- SiteConfig -->
							<input type="hidden" name="cancel_return" value="$CancelUrl()" /><!-- SiteConfig -->
							<input type="submit" name="submit" value="Buy Now with Journal" class="button" /><!-- Shortcode -->
						</fieldset>
						<h4>$AmountWithJournal.Nice</h4>
					</form>
				</td>
			</tr>
		<% end_loop %>
		</table>
	</article>
		$Form
		$CommentsForm
</div>