<?php
class Item extends DataObject {
	private static $db = array (
		'ItemName' => 'Varchar',
		'ItemNumber' => 'Varchar',
		'Amount' => 'Currency',
		'Sequence' => 'Int',
		'DescriptionContent' => 'HTMLText'
	);
	
	private static $indexes = array(
        'itemNumberUnique' => 'unique("ItemNumber")'
    );
	
	public function validate() {
		$valid = parent::validate();

		$duplicate = Item::get()
				->filter(array(
					'ItemNumber' => $this->ItemNumber
				))
				->exclude('ID', $this->ID);
		if ($duplicate->exists()) {
			$valid->error('duplicate entry');
		}

		return $valid;
	}
	
	private static $has_one = array(
		'MerchandiseContainerPage' => 'MerchandiseContainerPage',
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
		return rtrim(MiniCart::get_return_page(),"/"). '/pdtReturn';
	}

	public function CancelUrl()
	{
		return rtrim(MiniCart::get_return_page(),"/"). '/pdtCancel';
	}

	public function Custom()
	{
		return Member::currentUser()->ID;
	}
	
	public function IsMerchandise()
	{
		return true;
	}
	
	public function ButtonText()
	{
		return 'Buy Now';
	}
}