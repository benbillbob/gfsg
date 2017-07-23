<?php
class Membership extends DataObject {
	private static $db = array (
		'ItemName' => 'Varchar',
		'ItemNumber' => 'Varchar',
		'Amount' => 'Currency',
		'ItemNumberWithJournal' => 'Varchar',
		'AmountWithJournal' => 'Currency',
		'MembershipMonths' => 'Varchar',
		'DescriptionContent' => 'HTMLText'
	);
	
	private static $has_one = array(
		'MembershipContainerPage' => 'MembershipContainerPage',
		'Group' => 'Group'
	);
	
	private static $has_many = array(
		'Members' => 'Member',
	);
	
	public function getCMSFields() {
		$fields = FieldList::create(
			TextField::create('ItemName'),
			TextField::create('ItemNumber'),
			CurrencyField::create('Amount'),
			TextField::create('ItemNumberWithJournal'),
			CurrencyField::create('AmountWithJournal'),
			TextField::create('MembershipMonths'),
			$groupField = DropdownField::create('GroupID', 'Please choose an Membership', Group::get()->filter(array('IsPaidMembership' => true))->map('ID', 'Title', 'Please Select')),
		    HTMLEditorField::create('DescriptionContent')
		);
		
		$groupField->setHasEmptyDefault(true);

		return $fields;
	}
	
	private static $summary_fields =array(
		'ItemName' => 'Membership Type',
		'ItemNumber' => 'Membership Code'
	);
	
	public function FormAction()
	{
		return MiniCart::get_form_action();
	}

	public function Business()
	{
		return MiniCart::get_business_email();
	}

	public function CurrencyCode()
	{
		return MiniCart::get_currency_code();
	}
	
	public function ReturnUrl()
	{
		return MiniCart::get_return_page();
	}

	public function CancelUrl()
	{
		return MiniCart::get_cancel_page();
	}

	public function Custom()
	{
		return Member::currentUser()->ID;
	}
}