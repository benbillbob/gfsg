<?php

class InvoiceTest extends SapphireTest {

    protected static $fixture_file = 'mysite/tests/InvoiceTest.yml';

    public function testFixtureLoadedToDb() {
		$item = Item::get()->first();
		$this->assertEquals($item->ItemName, 'MembershipItem1');
	}

	public function testSucceedsForItem(){
		$invoice = Invoice::get()->filter('TxnId', 'NonMembershipInvoice')->first();
		$this->assertNotNull($invoice);
		$result = $invoice->processPurchase();
		$this->assertNull($result);
		$this->assertEquals($invoice->Status, Invoice::STATUS_COMPLETE);
	}

	public function testSucceedsForMembershipItem(){
		$invoice = Invoice::get()->filter('TxnId', 'MembershipInvoice')->first();
		$member = $invoice->Member();
		$this->assertEquals($member->MembershipExpiry, '2017-07-28');
		$result = $invoice->processPurchase();
		$this->assertNull($result);
		$member = $invoice->Member();
		
		$expected = new DateTime('NOW');
		$expected = DateHelper::addMonths($expected, 12);
		
		$this->assertEquals($member->MembershipExpiry, $expected->format('Y-m-d'));
		
		$expectedGroup = $invoice->InvoiceLines()->first()->Item()->Group();
		
		$groups = $member->Groups();
		$this->assertEquals(1, $groups->count());

		$group = $groups->first();

		$this->assertEquals($expectedGroup->Code, $group->Code);
	}
}