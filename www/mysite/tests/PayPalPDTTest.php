<?php

class PayPalPDTTest extends SapphireTest {
	
	protected static $fixture_file = 'mysite/tests/PayPalPDTTest.yml';

	public function testMissingTx() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoice(null, null);
		$this->assertNull($result);
	}

	public function testPreviousSuccessfulInvoice() {
		$paypalPdt = new PayPalPDT();
		$result = $paypalPdt->getInvoice(null, 'PayPalTxSuccess1');
		$this->assertNotNull($result);
	}

	public function testPreviousFailedInvoice() {
		$paypalPdt = new PayPalPDT();
		$ipn = $this->getIpnMock();
		$result = $paypalPdt->getInvoice(null, PayPalTxFail2);
		$this->assertNull($result);
		$error = $paypalPdt->getError();
		$this->assertNotNull($error);
	}

	private function getIpnMock() {
        $ipn = $this->getMockBuilder(Ipn::class)->getMock();

        $ipn->expects($this->once())
			->method('processTx')
			->will($this->returnValue(PayPalPDTTest::PAYPAL_RESPONSE));
			 
		return $ipn;
	}
	
	const PAYPAL_RESPONSE = 'SUCCESS
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
custom=45728f41-73fa-11e7-87d7-067c67ad2d91
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
item_name=p
discount=0.00
mc_currency=AUD
item_number=p
residence_country=AU
shipping_method=Default
handling_amount=0.00
transaction_subject=
payment_gross=
shipping=0.00';
}