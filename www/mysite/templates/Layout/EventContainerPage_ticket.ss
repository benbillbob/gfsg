<div class="content">
		<% with $Ticket %>
			<figure style="text-align: center;" class="item">
				<img src="{$Up.Link}barcode/$Barcode"></img>
				<figcaption class="caption">$Barcode</figcaption>
			</figure>
			<% loop $EventTicketLines %>
				$Quantity x $EventTicketType.ItemName
			<% end_loop %>
		<% end_with %>
</div>