<?php
class Invoice extends DataObject {
	private static $db = array (
		'TxnId' => 'Varchar',
		'PayPalTx' => 'Varchar',
		'Status' => 'Varchar'
	);
	
	private static $has_one = array(
		'Member' => 'Member',
	);
	
	private static $has_many = array(
		'InvoiceLines' => 'InvoiceLine',
	);
	
	public function getCMSFields() {
		$fields = FieldList::create(
			TextField::create('TxnId'),
			TextField::create('PayPalTx'),
			TextField::create('Status')
		);
		
		return $fields;
	}
	
	public function processPurchase()
	{
		return 'woot';
	}
	
	const STATUS_PROCESSING = 'processing';
	const STATUS_PENDING = 'pending';
	const STATUS_COMPLETE = 'complete';
	const STATUS_FAILED = 'failed';
}