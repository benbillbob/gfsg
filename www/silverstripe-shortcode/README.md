# cwsoft-shortcode module for CMS SilverStripe 3.x
This module provides some handy shortcode methods ready to use from your [SilverStripe CMS](http://silverstripe.org) WYSIWYG editor.

The `cwsoft-shortcode` module builds up on the shortcode function first introduced with SilverStripe 2.4. Shortcodes can best be thought of a kind of placeholders entered in the WYSIWYG editor, which gets replaced with PHP output just before beeing displayed on the screen. This allows to add dynamic content to a specific position inside a WYSIWYG page. The available cwsoft-shortcode methods can easily be selected from the WYSIWYG editor.

----------------------------------------
***cwsoft-shortcode methods provided:***

- [cwsHideMailto](https://github.com/cwsoft/silverstripe-cwsoft-shortcode#shortcode-cwshidemailto): obfuscates the mailto part of mailto links
- [cwsRandomQuote](https://github.com/cwsoft/silverstripe-cwsoft-shortcode#shortcode-cwsrandomquote): displays a random quote from a text file
- [cwsRandomImage](https://github.com/cwsoft/silverstripe-cwsoft-shortcode#shortcode-cwsrandomimage): displays a random image from your assets folder

## Download
You can download an archive of the latest development branch of the `cwsoft-foldergallery` module using GitHubs [ZIP button](https://github.com/cwsoft/silverstripe-cwsoft-shortcode/archive/master.zip). The archives of previous module releases can be found in GitHubs [Tags section](https://github.com/cwsoft/silverstripe-cwsoft-shortcode/tags). The development history is tracked via [GitHub](https://github.com/cwsoft/silverstripe-cwsoft-shortcode/commits/master).

Note: An older, but unsupported version for SilverStripe 2.4.x can be found and downloaded in the [2.4.x branch](https://github.com/cwsoft/silverstripe-cwsoft-shortcode/tree/2.4.x) at GitHub.

## License
The cwsoft-shortcode module is licensed under the [GNU General Public License (GPL) v3.0](http://www.gnu.org/licenses/gpl-3.0.html).

## Requirements
The minimum requirements to get the cwsoft-shortcode module running on your SilverStripe installation are as follows:

- SilverStripe ***3.0.x*** or higher (recommended last stable 3.x version)
- PHP ***5.3*** or higher (recommended last stable PHP 5.4.x version)

## Installation
1. download latest [module archive](https://github.com/cwsoft/silverstripe-cwsoft-shortcode/archive/master.zip) from GitHub
2. unpack the archive on your local computer
3. upload the entire ***cwsoft-shortcode*** subfolder to your SilverStripe root folder using your preferred FTP program
4. update your SilverStripe database via `http://yourdomain.com/dev/build?flush=all`

## Usage
To use the shortcode methods provided by the `cwsoft-shortcode` module, just follow the three steps shown in the sketch below.

![](docs/cwsoft-shortcode-backend.png) 

1. position the text cursor to the location you want insert the shortcode and press the Plugin icon (coffee cup)
2. select the shortcode you want to use and press the insert button
3. update the shortcode skeleton code with your data (e.g. image path, image orientation, mail address ...)

### Shortcode: [cwsHideMailto]
This shortcode allows you to obfuscate a mail address or a mailto link from beeing harvested by spam bots. This is done by replacing the characters "@" and "." of mail addresses with "(at)" and "(dot)". In addition the mailto link part will be encrypted with a simple Javascript Caeser cipher and automatically decrypted into human readable format when openend in an E-Mail program. This shortcode can be used in two different ways.

	[cwsHideMailto email='yourmail@domain.com' subject='optional_mail_subject']mail_link_text[/cwsHideMailto]
	[cwsHideMailto email='yourmail@domain.com' subject='optional_mail_subject']

### Shortcode: [cwsRandomQuote]
This shortcode allows you to displays a random quote from a textfile located in a subfolder in ***/assets***.

	[cwsRandomQuote csv_file="subfolder_in_assets/quotes.csv"]

The textfile containing the quotes must follow the conventions below (***ensure*** that the first line of your CSV file exactly matches the example below, including upper/lower case):

	"Quote"|"Author"
	"your first quote goes here"|"author name"
	"next quote goes here"|"autor of this quote"
	
**Tip:** You can adjust the output to your needs via the template file *cwsoft-shortcode/templates/Include/RandomQuote.ss* and the CSS file *cwsoft-shortcode/css/cwsShortCodeRandomQuote.css*.

### Shortcode: [cwsRandomImage]
This shortcode allows you to display a random image with a jQuery ColorBox effect from a subfolder in ***/assets***.

	[cwsRandomImage folder="subfolder_in_assets" align="left|right"]

**Tip:** You can adjust the output to your needs via the template file *cwsoft-shortcode/templates/Include/RandomImage.ss* and the CSS file *cwsoft-shortcode/css/cwsShortCodeRandomImage.css*.

A screenshot with the frontend output of the three shortcode methods is shown below:
![](docs/cwsoft-shortcode-frontend.png) 

## Known Issues
Known issues can be tracked and reported via GitHubs [issue tracking service](https://github.com/cwsoft/silverstripe-cwsoft-shortcode/issues). If you run into any issues with the cwsoft-shortcode module, visit the issue tracker and check if a similar issue was already reported. If not, just add a new topic descriping your issue.

## Questions
If you have questions or issues with cwsoft-shortcode, please visit the [SilverStripe](http://www.silverstripe.org/all-other-modules/show/20737) forum thread and ask for feedback.

***Always provide the following information with your support request:***

 - detailed error description (what happens, what have you already tried ...)
 - the cwsoft-shortcode version used
 - your PHP and SilverStripe version used
 - information about your operating system (e.g. Windows, Mac, Linux) incl. version
 - information of your browser and browser version used
