<% require css(cwsoft-shortcode/thirdparty/colorbox/colorbox.css) %>
<% require css(cwsoft-shortcode/css/cwsShortCodeRandomImage.css) %>
<% require javascript(cwsoft-shortcode/thirdparty/jquery/jquery.min.js) %>
<% require javascript(cwsoft-shortcode/thirdparty/colorbox/jquery.colorbox-min.js) %>
<% require javascript(cwsoft-shortcode/javascript/cwsShortCodeRandomImage.js) %>

</p>
<div class="cwsShortCodeRandomImage $Alignment">
	<% with $RandomImage %>
		<a href="$URL" title="$Caption" rel="colorbox">
			<% if $Orientation == 2 %>
				$SetRatioSize(240,180)
			<% else %>
				$CroppedImage(240,180)
			<% end_if %>
		</a>
	<% end_with %>
</div>
<p>