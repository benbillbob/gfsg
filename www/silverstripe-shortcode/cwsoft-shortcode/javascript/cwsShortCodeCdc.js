/**
 * Module: cwsoft-shortcode
 * Provides some handy shortcode methods ready to use from your CMS SilverStripe WYSIWYG editor.
 *
 * This file includes the Javascript string manipulation function
 *
 * LICENSE: GNU General Public License 3.0
 * 
 * @platform    CMS SilverStripe 3
 * @package     cwsoft-shortcode
 * @author      cwsoft (http://cwsoft.de)
 * @copyright   cwsoft
 * @license     http://www.gnu.org/licenses/gpl-3.0.html
*/

function cdc(a, b) {
	var c = (b[b.length - 1]).charCodeAt(0) - 64;
	var d = 'abcdefghijklmnopqrstuvwxyz@.-_:';
	var e = d.length - 1;
	var f = 0; var x = ''; 
	
	for (var g = 0; g < a.length; g++) {
		f = (d.indexOf(a[g]) - c) % e;
		var h = (f < 0) ? f + e + 1 : f;
		x+= d[h];
	}
	
	location.href = x + '?subject=' + escape(b.substr(0, b.length - 1));
}