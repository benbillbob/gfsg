<?php
class Item extends DataObject {
	private static $db = array (
		'ItemName' => 'Varchar',
		'ItemNumber' => 'Varchar',
		'Amount' => 'Currency',
		'Sequence' => 'Int',
		'DescriptionContent' => 'HTMLText'
	);
	
	private static $has_one = array(
		'ParentItem' => 'Item'
	);

	private static $has_many = array(
		'ChildItems' => 'Item'
	);

	public function getCMSFields() {
		$fields = FieldList::create(
			TextField::create('ItemName'),
			TextField::create('ItemNumber'),
			CurrencyField::create('Amount'),
			NumericField::create('Sequence'),
			$parentField = DropdownField::create('ParentItemID', 'Please choose an parent item', Item::get()->filter(array('ParentItemID' => 0))->map('ID', 'ItemName', 'Please Select')),
		    HTMLEditorField::create('DescriptionContent')
		);
		
		$parentField->setHasEmptyDefault(true);

		return $fields;
	}
	
	private static $summary_fields =array(
		'ItemName' => 'Item Name',
		'ItemNumber' => 'Item Number'
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