/**
 * Module: cwsoft-shortcode
 * Provides some handy shortcode methods ready to use from your CMS SilverStripe WYSIWYG editor.
 *
 * This file contains the Javascript code for the TinyMCE Plugin.
 *
 * LICENSE: GNU General Public License 3.0
 * 
 * @platform    CMS SilverStripe 3
 * @package     cwsoft-shortcode
 * @version     2.1.0
 * @author      cwsoft (http://cwsoft.de)
 * @copyright   cwsoft
 * @license     http://www.gnu.org/licenses/gpl-3.0.html
*/

(function() {
	// TinyMCE will stop loading if it encounters non-existent external script file
	// when included through tiny_mce_gzip.php. Only load the external lang package if it is available.
	var availableLangs = ['en', 'de'];
	if(jQuery.inArray(tinymce.settings.language, availableLangs) != -1) {
		tinymce.PluginManager.requireLangPack('shortcode');
	}
	
	tinymce.create('tinymce.plugins.ShortcodePlugin', {
		/**
		 * Initializes the plugin, this will be executed after the plugin has been created.
		 * This call is done before the editor instance has finished it's initialization so use the onInit event
		 * of the editor instance to intercept that event.
		 *
		 * @param {tinymce.Editor} ed Editor instance that the plugin is initialized in.
		 * @param {string} url Absolute URL to where the plugin is located.
		 */
		init : function(ed, url) {
			// Register the command so that it can be invoked by using tinyMCE.activeEditor.execCommand('mceShortcode');
			ed.addCommand('mceShortcode', function() {
				ed.windowManager.open({
					file : url + '/dialog.htm',
					width : 400 + parseInt(ed.getLang('shortcode.dlg_delta_width', 0)),
					height : 230 + parseInt(ed.getLang('shortcode.dlg_delta_height', 0)),
					inline : 1
				}, {
					plugin_url : url, // Plugin absolute URL
					some_custom_arg : 'custom arg' // Custom argument
				});
			});

			// Register shortcode button
			ed.addButton('shortcode', {
				title : 'shortcode.desc',
				cmd : 'mceShortcode',
				image : url + '/img/icon.gif'
			});

			// Add a node change handler, selects the button in the UI when a image is selected
			ed.onNodeChange.add(function(ed, cm, n) {
				cm.setActive('shortcode', n.nodeName == 'IMG');
			});
		},

		/**
		 * Creates control instances based in the incomming name. This method is normally not
		 * needed since the addButton method of the tinymce.Editor class is a more easy way of adding buttons
		 * but you sometimes need to create more complex controls like listboxes, split buttons etc then this
		 * method can be used to create those.
		 *
		 * @param {String} n Name of the control to create.
		 * @param {tinymce.ControlManager} cm Control manager to use inorder to create new control.
		 * @return {tinymce.ui.Control} New control instance or null if no control was created.
		 */
		createControl : function(n, cm) {
			return null;
		},

		/**
		 * Returns information about the plugin as a name/value array.
		 * The current keys are longname, author, authorurl, infourl and version.
		 *
		 * @return {Object} Name/value array containing information about the plugin.
		 */
		getInfo : function() {
			return {
				longname : 'cwsoft-shortcode Plugin',
				author : 'cwsoft',
				authorurl : 'http://cwsoft.de',
				infourl : 'http://cwsoft.de',
				version : "1.0"
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('shortcode', tinymce.plugins.ShortcodePlugin);
})();