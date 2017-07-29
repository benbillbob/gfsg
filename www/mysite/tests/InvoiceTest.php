<?php

class InvoiceTest extends SapphireTest {

    protected static $fixture_file = 'mysite/tests/InvoiceTest.yml';

    public function testFixtureLoadedToDb() {
		$item = Item::get()->first();
		$this->assertEquals($item->ItemName, 'MembershipItem1');
    }
	
	public function testSecondMembershipLoaded() {
		$item = Item::get()->filter('ItemName', 'MembershipItem2')->first();
		$this->assertEquals($item->ItemName, 'MembershipItem2');
	}
}