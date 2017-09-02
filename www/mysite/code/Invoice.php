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
			TextField::create('Status'),
			GridField::create('Lines', 'Lines', $this->InvoiceLines(), GridFieldConfig_RecordEditor::create())
		);
		
		return $fields;
	}
	
	public function processPurchase()
	{
		$error = null;
		$invoiceLines = $this->InvoiceLines()->toArray();
		
		$ticketLines = array();
		
		foreach($invoiceLines as $line) {
			$error = $line->process($this->Member());
			if ($error){
				break;
			}
			
			if ($line->Item() instanceof EventTicketType) {
				$ticketLines[] = $line;
			}
		}
		
		if (!$error){
			$this->processTicketLines($ticketLines);
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
	
	function processTicketLines($ticketLines){
		if (!$ticketLines){
			return;
		}
		
		$ticket = EventTicket::create();
		$eventID;
		
		foreach($ticketLines as $line){
			$ticketLine = EventTicketLine::create();
			$ticketLine->Quantity = $line->Quantity;
			$ticketLine->EventTicketTypeID = $line->Item()->ID;
			$eventID = $line->Item()->EventID;
			$ticket->EventTicketLines()->add($ticketLine);
		}
		
		$ticket->EventID = $eventID;
		$ticket->Barcode = $this->makeBarcode();
		$ticket->write();
	}
	
	private function makeBarcode(){
		$existing = true;
		$str;
		while($existing){
			$bytes = random_bytes(8);
			$str = bin2hex($bytes);
			$existing = EventTicket::get()->filter(array('Barcode' => $str))->first();
		}
		
		return $str;
	}
	
	const STATUS_PROCESSING = 'processing';
	const STATUS_PENDING = 'pending';
	const STATUS_COMPLETE = 'complete';
	const STATUS_FAILED = 'failed';
}