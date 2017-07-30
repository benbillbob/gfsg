<?php

class InvoiceTest extends SapphireTest {

    protected static $fixture_file = 'mysite/tests/InvoiceTest.yml';

    public function testFixtureLoadedToDb() {
		$item = Item::get()->first();
		$this->assertEquals($item->ItemName, 'MembershipItem1');
	}

	public function testFailsForNonMembershipItem(){
		$invoice = Invoice::get()->filter('TxnId', 'NonMembershipInvoice')->first();
		$result = $invoice->processPurchase();
		$this->assertFalse($result);
		$this->assertEquals($invoice->Status, Invoice::STATUS_PENDING);
	}

	public function testSucceedsForMembershipItem(){
		$invoice = Invoice::get()->filter('TxnId', 'MembershipInvoice')->first();
		$member = $invoice->Member();
		Debug::Show($member);
		$this->assertEquals($member->MembershipExpiry, '2017-07-28');
		$result = $invoice->processPurchase();
		$this->assertTrue($result);
		$member = $invoice->Member();
		Debug::Show($member);
		
		$expected = new DateTime('NOW');
		$expected = DateHelper::addMonths($expected, 12);
		
		$this->assertEquals($member->MembershipExpiry, $expected->format('Y-m-d'));
		
		$expectedGroup = $invoice->InvoiceLines()->first()->Item()->Group();
		
		$groups = $member->Groups();
		$this->assertEquals(1, $groups->count());

		Debug::Show($expectedGroup);
		$group = $groups->first();
		Debug::Show($group);

		$this->assertEquals($expectedGroup->Code, $group->Code);
	}
}