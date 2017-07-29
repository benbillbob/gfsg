<?php
class Membership extends Item {
	private static $db = array (
		'MembershipMonths' => 'Varchar'
	);
	
	private static $has_one = array(
		'MembershipContainerPage' => 'MembershipContainerPage',
		'Group' => 'Group'
	);
	
	private static $has_many = array(
		'Members' => 'Member',
	);
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->push(TextField::create('MembershipMonths'));

		$groupField = DropdownField::create('GroupID', 'Please choose an Membership', Group::get()->filter(array('IsPaidMembership' => true))->map('ID', 'Title', 'Please Select'));
		$groupField->setHasEmptyDefault(true);

		$fields->push($groupField);
		
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