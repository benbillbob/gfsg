<?php

class InvoiceTest extends SapphireTest {

    protected static $fixture_file = 'mysite/tests/InvoiceTest.yml';

    public function testFixtureLoadedToDb() {
		$item = Item::get()->first();
		$this->assertEquals($item->ItemName, 'MembershipItem1');
	}

	public function testSucceedsForItem(){
		$config = SiteConfig::current_site_config();
		$config->ItemPurchaseEmail = 'TestEmail@test.com';
		$config->write();
		$invoice = Invoice::get()->filter('TxnId', 'NonMembershipInvoice')->first();
		$this->assertNotNull($invoice);
		$result = $invoice->processPurchase();
		$this->assertNull($result);
		$this->assertEquals($invoice->Status, Invoice::STATUS_COMPLETE);
		
		$mailer = Email::mailer();
		$email = $mailer->findEmail(SiteConfig::current_site_config()->ItemPurchaseEmail);
		$this->assertNotNull($email);
		$this->assertEquals(SiteConfig::current_site_config()->ItemPurchaseEmail, $email['to']);
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