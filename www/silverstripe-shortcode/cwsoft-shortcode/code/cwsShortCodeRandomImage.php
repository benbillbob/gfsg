<?php
/**
 * Module: cwsoft-shortcode
 * Provides some handy shortcode methods ready to use from your CMS SilverStripe WYSIWYG editor.
 *
 * LICENSE: GNU General Public License 3.0
 * 
 * @platform    CMS SilverStripe 3
 * @package     cwsoft-shortcode
 * @author      cwsoft (http://cwsoft.de)
 * @copyright   cwsoft
 * @license     http://www.gnu.org/licenses/gpl-3.0.html
*/


/**
 * Class: cwsShortCodeRandomImage
 * Implements shortcode [cwsRandomImage] to display a random image from a subfolder in assets/.
 * Automatic thumbnail creation implemented. A larger image scale appears on mouse click via jQuery Colorbox effect.
 * 
 * USAGE INSIDE WYSIWYG EDITOR:
 * 	[cwsRandomImage folder="subfolder_in_assets" align="left|right"]
*/
class cwsShortCodeRandomImage {
	/**
	 * Displays a random image with colorbox effect from a given assets subfolder
	 * Uses template "csoft-shortcode/templates/Includes/RandomImage.ss" for output 
	 * 
	 * @param mixed $arguments (folder='subfolder_in_assets' align='left|right')
	 * @param $content = null
	 * @param $parser = null
	 * @return processed template RandomImage.ss
	 */
	public static function cwsShortCodeRandomImageHandler($arguments, $content = null, $parser = null) {
		// only proceed if subfolder was defined
		if (! isset($arguments['folder'])) return;
		
		// sanitize user inputs
		$folder = Convert::raw2sql($arguments['folder']);
		$align = isset($arguments['align']) ? strtolower(Convert::raw2xml($arguments['align'])) : '';
		
		// fetch all images in random order from the user defined folder
		$folder = Folder::get()->filter('Filename', "assets/$folder/")->First();
		$randomImage = ($folder) ? Image::get()->filter('ParentID', $folder->ID)->sort('RAND()') : false;
		
		// exit if user defined folder does not contain any image
		if (! $randomImage) return;
		
		// extract image caption from image filename
		$caption = $randomImage->Title;
		if (preg_match('#(\d*-)?(.+)\.(jpg|gif|png)#i', $caption, $matches)) {
			$caption = ucfirst(str_replace('-', ' ', $matches[2]));
		}
		
		// prepare data for output
		$data = array(
			'RandomImage' => $randomImage->First(),
			'Alignment' => $align,
			'Caption' => $caption
		);
				  
		// load template and process data
		$template = new SSViewer('RandomImage');
		return $template->process(new ArrayData($data));
	}
}