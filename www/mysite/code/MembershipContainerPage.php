<?php
class MembershipContainerPage extends Page {
	private static $db = array ();
	private static $has_many = array(
        'Memberships' => 'Membership'
    );
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Memberships', GridField::create('Memberships', 'Memberships', $this->Memberships(), GridFieldConfig_RecordEditor::create()));
		return $fields;
	}}


class MembershipContainerPage_Controller extends Page_Controller 
{
	public function init() 
	{
		parent::init();
	}
}

