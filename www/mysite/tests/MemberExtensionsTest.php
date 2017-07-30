 <?php

class MemberExtensionsTest extends SapphireTest {

    protected static $fixture_file = 'mysite/tests/MemberExtensionsTest.yml';

	public function testFixtureLoadsExtendedItems() {
		$member = Member::get()->first();
		Debug::Show($member);
		$expiry = $member->MembershipExpiry;
		$this->assertEquals($expiry, '2017-07-28');
    }
	
	public function testFixtureLoadsExtendedItemsFromRelation() {
		$member = Invoice::get()->first()->Member();
		Debug::Show($member);
		$expiry = $member->MembershipExpiry;
		$this->assertEquals($expiry, '2017-07-28');
    }

	public function testFixtureSavedExtendedItemsHoldExtendedValues() {
		$member = Member::get()->first();
		Debug::Show($member);
		$date = new DateTime("NOW");
		$expiry = $member->MembershipExpiry;
		$this->assertEquals($expiry, '2017-07-28');
		$member->MembershipExpiry = $date->format("Y-m-d");
		$member->write();

		Debug::Show($member);
		$this->assertEquals($member->MembershipExpiry, $date->format("Y-m-d"));

		$member = Member::get()->first();
		Debug::Show($member);
		$this->assertEquals($member->MembershipExpiry, $date->format("Y-m-d"));
    }
}