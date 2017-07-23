<?php
class GFSGMemberExtension extends DataExtension {

  private static $db = array(
    'TxnId' => 'Varchar(60)',
	'MembershipExpiry' => 'Date',
	'WithJournal' => 'Boolean'
  );
  
  	private static $has_one = array(
		'Membership' => 'Membership'
	);


  public function updateMemberFormFields(FieldList $fields) {
    $fields->push(new TextField('TxnId', 'TxnId'));
	$fields->push($membershipField = DropdownField::create('MembershipID', 'Please choose an Membership type', Membership::get()->map('ID', 'ItemName')));
    $fields->push(new DateField('MembershipExpiry', 'MembershipExpiry'));
    $fields->push(new CheckboxField('WithJournal', 'WithJournal'));
	
	$membershipField->setHasEmptyDefault(true);
	return $fields;
}
  
	public function getCMSFields() {
		$this->extend('updateCMSFields', $fields); 
		return $fields; 
	}
   public function updateCMSFields(FieldList $fields) {
      return $fields; 
	} 
}