<?php

class InvoicePageTest extends FunctionalTest {

    protected static $fixture_file = 'mysite/tests/InvoicePageTest.yml';
	
	static $use_draft_site = true;
    
	public function setUp()
	{
		parent::setUp();
		$this->page = $this->objFromFixture(InvoicePage::class, 'TestPage');
	}
	
	public function testCreateInvoice(){

        $me = Member::get()->first();

        $this->logInAs($me);

		$postVars = array(
			array(
				'cmd' => '_xclick',
				'business' => 'treasurer@gfsg.org.au',
				'item_name' => 'ItemName1',
				'item_number' => 'ItemNumber1',
				'amount' => '0.01',
				'custom' => '',
				'currency_code' => 'AUD',
				'return' => 'http://gfsg.benbillbob.com/new-pay-pal-return-page/',
				'cancel_return' => 'http://gfsg.benbillbob.com/new-pay-pal-return-page/'
			)
		);

		Debug::Show($this->page->AbsoluteLink());
		$response = $this->post($this->page->AbsoluteLink() . 'createInvoice', $postVars);
        $this->assertEquals(200, $response->getStatusCode());
        $invoiceNumber = $response->getBody();
		$this->assertEquals(36, strlen($invoiceNumber));
		
		$invoice = Invoice::get()->filter('TxnId', $invoiceNumber)->first();
		$this->assertNotNull($invoice);
		$this->assertEquals($invoiceNumber, $invoice->TxnId);
	}
}