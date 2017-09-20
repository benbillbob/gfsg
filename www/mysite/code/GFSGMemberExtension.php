<?php
class GFSGMemberExtension extends DataExtension {

	private static $db = array(
		'TxnId' => 'Varchar(60)',
		'MembershipExpiry' => 'Date',
		'WithJournal' => 'Boolean',
		'Parent2FirstName' => 'Varchar(255)',
		'Parent2LastName' => 'Varchar(255)',
		'HomeAddress' => 'Text',
		'PostalAddress' => 'Text',
		'Parent2Email' => 'Varchar(255)',
		'HomePhone' => 'Varchar',
		'Mobile' => 'Varchar',
		'Mobile2' => 'Varchar',
		'OccupationParent1' => 'Varchar',
		'OccupationParent2' => 'Varchar',
		'Child1Name' => 'Varchar(255)',
		'Child1DOB' => 'Date',
		'Child2Name' => 'Varchar(255)',
		'Child2DOB' => 'Date',
		'Child3Name' => 'Varchar(255)',
		'Child3DOB' => 'Date',
		'Child4Name' => 'Varchar(255)',
		'Child4DOB' => 'Date',
		'Child5Name' => 'Varchar(255)',
		'Child5DOB' => 'Date'
	);
	
	/*
• Name – (with options for parent 1 and parent 2)
• Home Address
• Postal address (if different from above)
• Email address (with options for parent 1 and parent 2)
• Home Phone
• Mobile/s
• Occupations *Full and Professional memberships only
• Names of children and children’s date of birth *Full memberships only
	*/

  	private static $has_one = array(
		'Membership' => 'Membership'
	);
	
	private static $has_many = array(
		'Invoice' => 'Invoice'
	);


  public function updateMemberFormFields(FieldList $fields) {
    $fields->push(new TextField('TxnId', 'TxnId'));
	$fields->push($membershipField = DropdownField::create('MembershipID', 'Membership', Membership::get()->map('ID', 'Title')));
    $fields->push(new DateField('MembershipExpiry', 'MembershipExpiry'));
    $fields->push(new CheckboxField('WithJournal', 'WithJournal'));
    $fields->push(new TextField('Parent2FirstName', 'Parent2FirstName'));
    $fields->push(new TextField('Parent2LastName', 'Parent2LastName'));
    $fields->push(new TextAreaField('HomeAddress', 'HomeAddress'));
    $fields->push(new TextAreaField('PostalAddress', 'PostalAddress'));
	
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