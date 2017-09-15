<?php
class MerchandiseContainerPage extends InvoicePage {
	private static $db = array ();
	private static $has_many = array(
        'Items' => 'Item'
    );
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Merchandise', GridField::create('Items', 'Items', $this->Items(), GridFieldConfig_RecordEditor::create()));
		return $fields;
	}}


class MerchandiseContainerPage_Controller extends InvoicePage_Controller 
{
}

