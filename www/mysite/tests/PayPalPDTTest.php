<?php

class PayPalPDTTest extends SapphireTest {
	
	protected static $fixture_file = 'mysite/tests/PayPalPDTTest.yml';

	public function testFixtureLoaded()	{
		$invoices = Invoice::get();
		$this->assertEquals($invoices->count(), 6);
	}
	
	public function testGetInvoiceForTxMissingTx() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoiceForTx(null);
		$this->assertNull($result);
		$this->assertEquals($paypalPdt->getError(), 'No transaction id provided. Please contact support.');
	}

	public function testGetInvoiceForTxProcessingInvoice() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoiceForTx('PayPalTxProcessing');
		$this->assertNull($result);
		$this->assertEquals($paypalPdt->getError(), 'Already processing');
	}

	public function testGetInvoiceForTxPreviousSuccessfulInvoice() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoiceForTx('PayPalTxSuccess');
		$this->assertNotNull($result);
		$this->assertEquals($result->Status, Invoice::STATUS_COMPLETE);
		$error = $paypalPdt->getError();
		$this->assertNull($error);
	}

	public function testGetInvoiceForTxPreviousFailedInvoice() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoiceForTx('PayPalTxFailed');
		$this->assertNotNull($result);
		$this->assertEquals($result->Status, Invoice::STATUS_FAILED);
		$error = $paypalPdt->getError();
		$this->assertNull($error);
	}

	public function testGetInvoiceForTxPendingSuccessInvoice() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoiceForTx('PayPalTxPending');
		$error = $paypalPdt->getError();
		$this->assertNull($error);
		$this->assertNotNull($result);
		$this->assertEquals($result->Status, Invoice::STATUS_PROCESSING);
	}
	
	public function testGetResponseFromPayPalSuccess()
	{
		$paypalPdt = new PayPalPDT();
		$ipn = $this->getIpnMock(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE);
		$tx = '8BS39201865959053';
		$response = $paypalPdt->getResponseFromPayPal($ipn, $tx, false);
		$this->assertEquals(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE, $response);
	}

	public function testGetResponseFromPayPalFail()
	{
		$paypalPdt = new PayPalPDT();
		$ipn = $this->getIpnMock(PayPalPDTTest::PAYPAL_FAIL_RESPONSE);
		$tx = '8BS39201865959053';
		$response = $paypalPdt->getResponseFromPayPal($ipn, $tx, false);
		$this->assertEquals('PayPal comms failure', $paypalPdt->getError());
	}
	
	public function testGetInvoiceFromResponseSuccess()
	{
		$paypalPdt = new PayPalPDT();
		$tx = '8BS39201865959053';
		$invoice = $paypalPdt->getInvoiceFromResponse(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE, $tx);
		$this->assertNotNull($invoice);
		$this->assertNull($error);
		
		$this->assertEquals(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE_CUSTOM, $invoice->TxnId);
		$this->assertEquals($tx, $invoice->PayPalTx);
	}

	public function testGetInvoiceFromResponseSuccessInvoiceLines()
	{
		$paypalPdt = new PayPalPDT();
		$tx = '8BS39201865959053';
		$invoice = $paypalPdt->getInvoiceFromResponse(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE, $tx);
		$invoiceLines = $invoice->InvoiceLines();
		$this->assertEquals(1, count($invoiceLines));
		$invoiceLine = $invoiceLines->first();
		$item = $invoiceLine->Item();
		$this->assertEquals('ItemName1', $item->ItemName);
	}

	public function testGetInvoiceFromResponseSuccessNoPayPalTx()
	{
		$paypalPdt = new PayPalPDT();
		$tx = '654634635634';
		$invoice = $paypalPdt->getInvoiceFromResponse(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE_NOPAYPALTX, $tx);
		$this->assertNotNull($invoice);
		$this->assertNull($error);
		
		$this->assertEquals(PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE_CUSTOM_NOPAYPALTX, $invoice->TxnId);
		$this->assertEquals($tx, $invoice->PayPalTx);
		$this->assertEquals(Invoice::STATUS_COMPLETE, $invoice->Status);
	}
	
	public function testGetInvoiceFromValues()
	{
		$paypalPdt = new PayPalPDT();
		$invoice = $paypalPdt->getInvoiceFromValues($this->getIpnArray(), null);
		$this->assertNull($error);
		$this->assertNotNull($invoice);
		
		$this->assertEquals('f6fec622-798c-11e7-9c71-067c67ad2d91', $invoice->TxnId);
		$this->assertEquals($tx, $invoice->PayPalTx);
		$this->assertEquals(Invoice::STATUS_PROCESSING, $invoice->Status);
	}

	private function getIpnMock($setupResponse) {
        $ipn = $this->getMockBuilder(Ipn::class)->getMock();

        if ($setupResponse)
		{
			$ipn->expects($this->any())
				->method('processTx')
				->will($this->returnValue($setupResponse));
		}
		else
		{
			$ipn->expects($this->never())
				->method('processTx');
		}
			 
		return $ipn;
	}
	
	const PAYPAL_SUCCESS_RESPONSE_CUSTOM = '45728f41-73fa-11e7-87d7-067c67ad2d91';
	const PAYPAL_SUCCESS_RESPONSE_CUSTOM_NOPAYPALTX = '51fe8160-b49b-4958-87b0-ecad730e89f5';
	
	const PAYPAL_SUCCESS_RESPONSE = 'SUCCESS
mc_gross=0.01
protection_eligibility=Eligible
address_status=confirmed
payer_id=YZLLFUHMZFPUL
tax=0.00
address_street=1+Cheeseman+Ave+Brighton+East
payment_date=18%3A07%3A57+Jul+28%2C+2017+PDT
payment_status=Completed
charset=windows-1252
address_zip=3001
first_name=Cynthia
mc_fee=0.01
address_country_code=AU
address_name=Cynthia+Lousada
custom='.PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE_CUSTOM.'
payer_status=verified
business=business%40gfsg.org.au
address_country=Australia
address_city=Melbourne
quantity=1
payer_email=buyer%40gfsg.org.au
txn_id=8BS39201865959053
payment_type=instant
last_name=Lousada
address_state=Victoria
receiver_email=business%40gfsg.org.au
payment_fee=
shipping_discount=0.00
insurance_amount=0.00
receiver_id=STMNXPJQ5838C
txn_type=web_accept
item_name=ItemName1
discount=0.00
mc_currency=AUD
item_number=ItemNumber1
residence_country=AU
shipping_method=Default
handling_amount=0.00
transaction_subject=
payment_gross=
shipping=0.00';

const PAYPAL_SUCCESS_RESPONSE_NOPAYPALTX = 'SUCCESS
mc_gross=0.01
protection_eligibility=Eligible
address_status=confirmed
payer_id=YZLLFUHMZFPUL
tax=0.00
address_street=1+Cheeseman+Ave+Brighton+East
payment_date=18%3A07%3A57+Jul+28%2C+2017+PDT
payment_status=Completed
charset=windows-1252
address_zip=3001
first_name=Cynthia
mc_fee=0.01
address_country_code=AU
address_name=Cynthia+Lousada
custom='.PayPalPDTTest::PAYPAL_SUCCESS_RESPONSE_CUSTOM_NOPAYPALTX.'
payer_status=verified
business=business%40gfsg.org.au
address_country=Australia
address_city=Melbourne
quantity=1
payer_email=buyer%40gfsg.org.au
txn_id=8BS39201865959053
payment_type=instant
last_name=Lousada
address_state=Victoria
receiver_email=business%40gfsg.org.au
payment_fee=
shipping_discount=0.00
insurance_amount=0.00
receiver_id=STMNXPJQ5838C
txn_type=web_accept
item_name=ItemName1
discount=0.00
mc_currency=AUD
item_number=ItemNumber1
residence_country=AU
shipping_method=Default
handling_amount=0.00
transaction_subject=
payment_gross=
shipping=0.00';
	
	const PAYPAL_FAIL_RESPONSE = 'FAIL';

	private function getIpnArray()
	{
		return array(
			'payment_type' => 'instant',
			'payment_date' => 'Sat Aug 05 2017 14:35:32 GMT+1000 (Local Standard Time)',
			'payment_status' => 'Completed',
			'address_status' => 'confirmed',
			'payer_status' => 'verified',
			'first_name' => 'John',
			'last_name' => 'Smith',
			'payer_email' => 'buyer@paypalsandbox.com',
			'payer_id' => 'TESTBUYERID01',
			'address_name' => 'John Smith',
			'address_country' => 'United States',
			'address_country_code' => 'US',
			'address_zip' => '95131',
			'address_state' => 'CA',
			'address_city' => 'San Jose',
			'address_street' => '123 any street',
			'business' => 'seller@paypalsandbox.com',
			'receiver_email' => 'seller@paypalsandbox.com',
			'receiver_id' => 'seller@paypalsandbox.com',
			'residence_country' => 'US',
			'item_name1' => 'something',
			'item_number1' => 'FM12',
			'quantity' => '1',
			'tax' => '2.02',
			'mc_currency' => 'USD',
			'mc_fee' => '0.44',
			'mc_gross' => '12.34',
			'mc_gross_1' => '12.34',
			'mc_handling' => '2.06',
			'mc_handling1' => '1.67',
			'mc_shipping' => '3.02',
			'mc_shipping1' => '1.02',
			'txn_type' => 'cart',
			'txn_id' => '656128803',
			'notify_version' => '2.1',
			'custom' => 'f6fec622-798c-11e7-9c71-067c67ad2d91',
			'invoice' => 'abc1234',
			'test_ipn' => '1',
			'verify_sign' => 'AFcWxV21C7fd0v3bYYYRCpSSRl31Aacs.YFZhIyUYYc.2gowruX31Is0');
	}
}