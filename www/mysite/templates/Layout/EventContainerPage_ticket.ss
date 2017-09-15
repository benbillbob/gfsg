<div class="content">
		<% with $Ticket %>
			<figure style="text-align: center;" class="item">
				<img src="{$Up.Link}barcode/$Barcode"></img>
				<figcaption class="caption">$Barcode</figcaption>
			</figure>
			<ul>
			<% loop $EventTicketLines %>
				<li>$Quantity x $EventTicketType.ItemName</li>
			<% end_loop %>
			</ul>
		<% end_with %>
</div>