<?php
class PayPalReturnPage extends Page {
}

include('ipn.php');
include('PayPalPDT.php');

class PayPalReturnPage_Controller extends Page_Controller 
{
	public function init() 
	{
		$this->Content = $this->getInvoice();

		parent::init();
	}
	
	private function getInvoice()
	{
		$member = Member::currentUser();
		if (!$member)
		{
			Debug::message("Not logged in");
			return "Not logged in.";
		}
		
		$tx = $this->getRequest()->getVar('tx');
		
		$ipn = new Ipn();
		$paypalPDT = new PayPalPDT();

		$invoice = $paypalPDT->getInvoice($ipn, $tx);

		if (!$invoice)
        {
            return $paypalPDT->getError();
        }
		
		if ($invoice->Status == Invoice::STATUS_FAILED)
		{
			Debug::message("Invoice Payment Failed");
			return "Invoice Payment Failed";
		}

		if ($member->ID != $invoice->MemberID)
		{
			Debug::message("Incorrect member processing. Please contact support.");
			return "Incorrect member processing. Please contact support.";
		}
		
		$error = $invoice->processPurchase();
		
		if ($error)
		{
			return $error;
		}
		
		return $invoice->renderWith('ProcessedInvoice');
	}
}

