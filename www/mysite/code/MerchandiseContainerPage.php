<?php
class MerchandiseContainerPage extends Page {
	private static $db = array ();
	private static $has_many = array(
        'Items' => 'Item'
    );
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Merchandise', GridField::create('Items', 'Items', $this->Items(), GridFieldConfig_RecordEditor::create()));
		return $fields;
	}}


class MerchandiseContainerPage_Controller extends Page_Controller 
{
	public function init() 
	{
		Requirements::set_force_js_to_bottom(true);
		Requirements::javascript(THIRDPARTY_DIR."/jquery/jquery.js");
		Requirements::javascript("mysite/code/CreateInvoice.js");
		parent::init();
	}
	
	private static $allowed_actions = array(
        'createInvoice'
	);
	
	public function createInvoice(SS_HTTPRequest $request) {
        $postVars = $request->postVars();

		$item = Item::get()->filter('ItemNumber', $postVars['item_number'])->first();
		
		if (!$item)
		{
			throw new Exception('Item - ' . $postVars['item_number'] . ' not found.');
		}
		
		$id = $this->createTxnId();
		$invoice = Invoice::create();
		$invoice->TxnId = $id;
		$invoice->Status = Invoice::STATUS_PENDING;
		$invoice->Processed = false;
		$invoice->MemberID = Member::currentUser()->ID;
		$invoice->write();
		
		$invoiceLine = InvoiceLine::create();
		$invoiceLine->InvoiceID = $invoice->ID;
		$invoiceLine->ItemID = $item->ID;
		$invoiceLine->Quantity = $postVars['quantity'];
		$invoiceLine->Amount = $postVars['amount'];
		$invoiceLine->write();
		
		return $id;
    }
	
	private function createTxnId()
	{
		return DB::query('SELECT uuid()')->value();
	}
}

