<?php
/**
 * Module: cwsoft-shortcode
 * Provides some handy shortcode methods ready to use from your CMS SilverStripe WYSIWYG editor.
 *
 * This file contains global settings for the SilverStripe CMS shortcode module.
 *
 * LICENSE: GNU General Public License 3.0
 * 
 * @platform    CMS SilverStripe 3
 * @package     cwsoft-shortcode
 * @version     2.2.4
 * @author      cwsoft (http://cwsoft.de)
 * @copyright   cwsoft
 * @license     http://www.gnu.org/licenses/gpl-3.0.html
*/

// ensure module is stored in folder "cwsoft-shortcode"
$moduleName = 'cwsoft-shortcode';
$folderName = basename(dirname(__FILE__));

if ($folderName != $moduleName) {
	user_error(
		_t(
			'_config.WRONG_MODULE_FOLDER', 
			'Please rename the folder "{folderName}" into "{moduleName}" to get the {moduleName} module working properly.',
			array('moduleName' => $moduleName, 'folderName' => $folderName)
		),
		E_USER_ERROR
	);
}

// include external files into head section
Requirements::set_write_js_to_body(false);

// register short code tags accessible from pages of type cwsCodePage
ShortcodeParser::get()->register('cwsHideMailto', array('cwsShortCodeHideMailto', 'cwsShortCodeHideMailtoHandler'));
ShortcodeParser::get()->register('cwsRandomImage', array('cwsShortCodeRandomImage', 'cwsShortCodeRandomImageHandler'));
ShortcodeParser::get()->register('cwsRandomQuote', array('cwsShortCodeRandomQuote', 'cwsShortCodeRandomQuoteHandler'));

// increase quality of created thumbnails
if (class_exists('GDBackend')) {
	// SilverStripe >= 3.1.0
	GDBackend::set_default_quality(95);
} else {
	// SilverStripe 3.0.x
	GD::set_default_quality(95);
}

// Note: If you see unparsed placeholders like "{#shortcode.dlg_description}" when using the TinyMCE cwsoft-shortcode plugin,
// you need to add a plugin language file for your locale to the folder "./plugins/shortcode/langs". Supported locales: EN, DE.
HtmlEditorConfig::get('cms')->enablePlugins(array('shortcode' => '../../../cwsoft-shortcode/plugins/shortcode/editor_plugin_src.js'));
HtmlEditorConfig::get('cms')->addButtonsToLine(1, 'shortcode'); 