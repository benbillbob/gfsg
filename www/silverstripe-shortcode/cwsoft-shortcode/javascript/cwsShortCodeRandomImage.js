/**
 * Module: cwsoft-shortcode
 * Provides some handy shortcode methods ready to use from your CMS SilverStripe WYSIWYG editor.
 *
 * This file contains the configuration settings for the jQuery colorbox plugin.
 *
 * LICENSE: GNU General Public License 3.0
 * 
 * @platform    CMS SilverStripe 3
 * @package     cwsoft-shortcode
 * @author      cwsoft (http://cwsoft.de)
 * @copyright   cwsoft
 * @license     http://www.gnu.org/licenses/gpl-3.0.html
*/

$(document).ready(function(){
	$("a[rel='colorbox']").colorbox({
		transition: 'fade', 	// fade, ellastic, none
		speed: 300, 
		maxWidth: '800px', 
		maxHeight: '800px',
		current: '{current}/{total}',
		arrowKey: true,
		escKey: true
	});
});