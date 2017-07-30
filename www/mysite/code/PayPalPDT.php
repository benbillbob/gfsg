<?php

class PayPalItem {
	public $itemName;
	public $itemNumber;
	public $itemQuantity;
	public $itemAmount;
}

class PayPalPDT {
	
	private $tx;
	private $ipn;
	private $invoice;
	private $error;

	public function getError()
	{
		return $this->error;
	}
	
	public function getInvoice($ipnIn, $txIn)
	{
		$this->tx = $txIn;
		$this->ipn = $ipnIn;
		if (!isset($this->tx))
		{
			Debug::message("No TX Provided");
			$this->error = "No transaction id provided. Please contact support.";
			return null;
		}

		Debug::Show($this->tx);
		
		$invoice = Invoice::get()->filter('PayPalTx', $this->tx)->first();
		if ($invoice)
		{
			if ($invoice->Status == Invoice::STATUS_COMPLETE || $invoice->Status == Invoice::STATUS_FAILED)
			{
				Debug::Message('invoice status - '. $invoice->Status);
				return $invoice;
			}
			else if ($invoice->Status == Invoice::STATUS_PROCESSING)
			{
				Debug::Message('Already processing');
				$this->error = 'Already processing';
				return null;
			}

			Debug::Message('Found Invoice for PayPalTX - ' . $this->tx);
			$invoice->Status = Invoice::STATUS_PROCESSING;
			$invoice->write();
		}
		else
		{
			Debug::Message('invoice not found for paypal tx - '. $this->tx);
		}
		
		$response = $this->getDetailsFromPayPal();
		
		if (!$this->validateResponse($response))
		{
			$this->error = 'PayPal comms failure';
			return null;
		}
		
		$values = $this->getValues($response);

		if ($values['payment_status'] != "Completed")
		{
			$this->error = 'PayPal payment still processing, refresh page';
			return null;
		}

		$txnId = $values['custom'];
		
		Debug::Message('TxnId - ' . $txnId);
		if (!$txnId)
		{
			Debug::message('TxnId not found - ' . $txnId);
			$this->error = 'No TxnId found. Please contact support.';
			return null;
		}
		
		if (!$invoice)
		{
			$invoice = Invoice::get()->filter('TxnId', $txnId)->first();
			if (!$invoice)
			{
				Debug::message('Invoice not found - ' . $txnId);
				$this->error = 'No invoice found. Please contact support.';
				return null;
			}
			if ($invoice->Status == Invoice::STATUS_COMPLETE || $invoice->Status == Invoice::STATUS_FAILED)
			{
				Debug::Message('invoice status - '. $invoice->Status);
				return $invoice;
			}
			else if ($invoice->Status == Invoice::STATUS_PROCESSING)
			{
				$this->error = 'Already processing';
				return null;
			}

			$invoice->Status = Invoice::STATUS_PROCESSING;
			$invoice->TxnId = $txnId;
			$invoice->write();		
		}
		
		$items = $this->getItemsFromPayPal($values);
		Debug::Show($items);
		
		$invoiceLines = $invoice->InvoiceLines();
		
		if (count($items) != $invoiceLines->count())
		{
			$this->error = 'Txn Details do not match. Please contact support.';
			return null;
		}
		
		$invoiceLines->each(function($invoiceLine) use ($items)
		{
			$item = $this->objArraySearch($items, 'itemNumber', $invoiceLine->Item()->ItemNumber);
			if (!$item)
			{
				$this->error = 'Txn Details do not match items. Please contact support.';
				return null;
			}
			
			// TODO - Check line details here
		});
		
		return $invoice;
	}
	
	private function objArraySearch($array, $index, $value)
    {
        foreach($array as $arrayInf) {
            if($arrayInf->{$index} == $value) {
                return $arrayInf;
            }
        }
        return null;
    }

	private function getItemsFromPayPal($values)
	{
		$itemName = 'item_name';
		$itemNumber = 'item_number';
		$itemQuantity = 'quantity';
		$itemAmount = 'mc_gross';
		
		$items = array();
		if (isset($values[$itemName]))
		{
			$item = new PayPalItem();
			$item->itemName = $values[$itemName];
			$item->itemNumber = $values[$itemNumber];
			$item->itemQuantity = $values[$itemQuantity];
			$item->itemAmount = $values[$itemAmount];
			
			$items[] = $item;
		}
		else
		{
			$i = 1;
			while(isset($values[$itemName.$i]))
			{
				$item = new PayPalItem();
				$item->itemName = $values[$itemName.$i];
				$item->itemNumber = $values[$itemNumber.$i];
				$item->itemQuantity = $values[$itemQuantity.$i];
				$item->itemAmount = $values[$itemAmount.$i];
				
				$items[] = $item;
				$i++;
			}
		}
		
		return $items;
	}

	private function getValues($data)
	{
		$lines = explode("\n", trim($data));
		$keyarray = array();
		for ($i = 1; $i < count($lines); $i++) {
			$temp = explode("=", $lines[$i],2);
			if (count($temp) > 1)
			{
				$keyarray[urldecode($temp[0])] = urldecode($temp[1]);
			}
			else
			{
				$keyarray[urldecode($temp[0])] = '';
			}
		}
		
		return $keyarray;
	}
	
	private function validateResponse($response)
	{
		if (strpos($response, "SUCCESS") !== false) {
            return true;
		}
		
		return false;
	}
	
	private function getDetailsFromPayPal()
	{
		$use_sandbox = (bool)SiteConfig::current_site_config()->MiniCartTestMode;
		$authToken = SiteConfig::current_site_config()->MiniCartPDTAuthCode;
		Debug::message('Comms with Paypal - ' . $authToken . ' - ' . $use_sandbox);
		$response = $this->ipn->processTx($this->tx, $authToken, $use_sandbox);
		Debug::Show($response);
		return $response;
	}
}
