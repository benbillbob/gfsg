<?php
class BannerPage extends Page {
	private static $db = array ();
	
	static $many_many = array(
        'Images' => 'Image'
    );
	
	function getCMSFields() {
        $fields = parent::getCMSFields();

        $f = new SortableGalleryField('Images', 'My Images');
        $fields->addFieldToTab('Root.Images', $f);

        return $fields;
    }
}

class BannerPage_Controller extends Page_Controller 
{
	public function init() 
	{
		Requirements::set_force_js_to_bottom(true);
		Requirements::javascript(THIRDPARTY_DIR."/jquery/jquery.js");
		Requirements::javascript("mysite/js/jssor.js");
		Requirements::customScript('
			jssor_slider1_init = function (containerId) {
				var options = { $AutoPlay: 1 };
				var jssor_slider1 = new  $JssorSlider$(containerId, options);
			};
			jssor_slider1_init("slider1_container");
		');
		parent::init();
	}
}

