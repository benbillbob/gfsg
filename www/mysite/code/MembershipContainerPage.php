<?php
class MembershipContainerPage extends InvoicePage{
	private static $db = array ();
	private static $has_many = array(
        'Memberships' => 'Membership'
    );
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Memberships', GridField::create('Memberships', 'Memberships', $this->Memberships(), GridFieldConfig_RecordEditor::create()));
		return $fields;
	}}


class MembershipContainerPage_Controller extends InvoicePage_Controller 
{
	public function init() 
	{
		parent::init();
	}
	
	private static $allowed_actions = array(
	);
	
	// public function createInvoice(SS_HTTPRequest $request) {
        // $postVars = $request->postVars();

		// $item = Item::get()->filter('ItemNumber', $postVars['item_number'])->first();
		
		// if (!$item)
		// {
			// throw new Exception('Item - ' . $postVars['item_number'] . ' not found.');
		// }
		
		// $id = $this->createTxnId();
		// $invoice = Invoice::create();
		// $invoice->TxnId = $id;
		// $invoice->Status = Invoice::STATUS_PENDING;
		// $invoice->Processed = false;
		// $invoice->MemberID = Member::currentUser()->ID;
		// $invoice->write();
		
		// $invoiceLine = InvoiceLine::create();
		// $invoiceLine->InvoiceID = $invoice->ID;
		// $invoiceLine->ItemID = $item->ID;
		// $invoiceLine->Amount = $postVars['amount'];
		// $invoiceLine->write();
		
		// return $id;
    // }
	
	// private function createTxnId()
	// {
		// return DB::query('SELECT uuid()')->value();
	// }
	
	public function visibleMemberships()
	{
		if(Member::currentUser() && Member::currentUser()->inGroup('committee-member'))
		{		
			return $this->Memberships()->filter(array(
				'ParentItemId' => '0'
			));
		}

		return $this->Memberships()->filter(array(
			'ParentItemId' => '0',
			'ItemNumber:StartsWith:not' => 'CT'
		));
	}
}

