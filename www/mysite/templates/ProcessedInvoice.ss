<h4>Thank you for your purchase.</h4>

Your membership has been updated to
<ul>
    <% loop $InvoiceLines.Limit(1) %>
        <li>$Item.ItemName</li>
    <% end_loop %>
</ul>

