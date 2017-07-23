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
 * Class: cwsShortCodeHideMailTo
 * Implements shortcode [cwsHideMailto] to obfuscate email adresses from beeing fetched by spam bots.
 * To obfuscate the email address, @ is replaced by (at) and . by (dot).
 * Mailto links are encrypted with a simple Caeser chiffre and decrypted via JavaScript on mouse click.
 * 
 * USAGE INSIDE WYSIWYG EDITOR:
 *	[cwsHideMailto email='yourmail@domain.com' subject='optional_mail_subject']mail_link_text[/cwsHideMailto]
 *	[cwsHideMailto email='yourmail@domain.com' subject='optional_mail_subject']
*/
class cwsShortCodeHideMailto {
	/**
	 * Implements the mailto handler to protect email addresses defined via [cwsHideMailto email='xxx']
	 * Uses template "cwsoft-shortcode/templates/Includes/HideMailto.ss" for output
	 * 
	 * @param mixed $arguments (email='yourmail@domain.com' subject='mail subject')
	 * @param $content = null
	 * @param $parser = null
	 * @return processed template HideMailto.ss
	 */
	public static function cwsShortCodeHideMailtoHandler($arguments, $content = null, $parser = null) {
		// only proceed if a valid email was defined
		$email = isset($arguments['email']) ? Convert::raw2xml(trim($arguments['email'])) : '';
		if ($email == '') return;
		
		// make sure we have a mailto link description (replace @ by (at) and . by (dot))
		$description = (trim($content) == '') ? $email : Convert::raw2xml($content);
		$description = str_replace(array('@', '.'), array('(at)', '(dot)'), $description);

		// get optional mail subject and mail link description
		$subject = isset($arguments['subject']) ? Convert::raw2xml(trim($arguments['subject'])) : '';
		if ($subject == '') $subject = _t('cwsShortCodeHideMailto.SUBJECT','Subject');
		
		// create a random key for the caesar cipher
		$key = mt_rand(1, 30);

		// prepare data for output
		$data = array(
			'CryptedMailto' => self::caesar_cipher('mailto:' . $email, $key),
			'Subject' => rawurldecode($subject . chr(64 + $key)),
			'LinkText' => $description
		);
		
		// load template and process data
		$template = new SSViewer('HideMailto');
		return $template->process(new ArrayData($data));
	}

	/**
	 * Simple Caesar chiffre to encrypt/decrypt a text string
	 * 
	 * @param string $text: text to encrypt/decrypt
	 * @param integer $shift: number of characters to shift
	 * @return encrypted/decrypted string
	 */
	private static function caesar_cipher($text, $shift) {
		// string with allowed characters
		$allowedCharacters = 'abcdefghijklmnopqrstuvwxyz@.-_:';
		$numberAllowedCharacters = strlen($allowedCharacters);
		
		// convert text and check user inputs
		$text = strtolower(trim($text));
		if ($text == '' || abs($shift) > $numberAllowedCharacters - 1) return $text;  
		
		// encrypt/decrypt email string
		$cipher = '';
		for ($i = 0; $i < strlen($text); $i++) {
			// get position of actual character in allowed characters
			$index = strpos($allowedCharacters, $text[$i]);
			// get position of encrypted character, ensure position is valid  
			$index = ($index + $shift) % $numberAllowedCharacters;
			if ($index < 0) $index = $index + $numberAllowedCharacters; 
			// build cipher
			$cipher .= $allowedCharacters[$index];
		}
		
		return $cipher;		
	} 
}