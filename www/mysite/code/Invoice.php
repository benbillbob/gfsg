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
		$error = null;
		$invoiceLines = $this->InvoiceLines();
		foreach($invoiceLines as $line) {
			$error = $line->process($this->Member());
			if ($error)
			{
				break;
			}
		}
		
		if ($error)
		{
			Debug::show($error);
			$this->Status = Invoice::STATUS_PENDING;
		}
		else
		{
			$this->Status = Invoice::STATUS_COMPLETE;
		}
		
		$this->write();
		
		return $error;
	}
	
	const STATUS_PROCESSING = 'processing';
	const STATUS_PENDING = 'pending';
	const STATUS_COMPLETE = 'complete';
	const STATUS_FAILED = 'failed';
}