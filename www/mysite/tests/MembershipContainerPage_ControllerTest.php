<?php

class MembershipContainerPage_ControllerTest extends FunctionalTest {

	protected static $fixture_file = 'mysite/tests/MembershipContainerPage_ControllerTest.yml';
	
	static $use_draft_site = true;

	public function setUp()
	{
		parent::setUp();
		$this->page = $this->objFromFixture(MembershipContainerPage::class, 'TestPage');
	}

	public function testCreateInvoice(){

        $me = Member::get()->first();

        $this->logInAs($me);

		$postVars = array(
			'cmd' => '_xclick',
			'business' => 'treasurer@gfsg.org.au',
			'item_name' => 'TestItemName',
			'item_number' => 'TestItemNumber',
			'amount' => '0.01',
			'custom' => '',
			'currency_code' => 'AUD',
			'return' => 'http://gfsg.benbillbob.com/new-pay-pal-return-page/',
			'cancel_return' => 'http://gfsg.benbillbob.com/new-pay-pal-return-page/'
		);

		$response = $this->post($this->page->AbsoluteLink() . 'createInvoice', $postVars);
        $this->assertEquals(200, $response->getStatusCode());
        $invoiceNumber = $response->getBody();
		$this->assertEquals(36, strlen($invoiceNumber));
		
		$invoice = Invoice::get()->filter('TxnId', $invoiceNumber)->first();
		$this->assertNotNull($invoice);
		$this->assertEquals($invoiceNumber, $invoice->TxnId);
	}
}
