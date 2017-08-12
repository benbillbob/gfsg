<?php
class InvoiceLine extends DataObject {
	private static $db = array (
		'Logs' => 'Varchar',
		'Amount' => 'Currency',
		'Quantity' => 'Int'
	);
	
	private static $has_one = array(
		'Invoice' => 'Invoice',
		'Item' => 'Item'
	);
	
	public function getCMSFields() {
		$fields = FieldList::create(
			CurrencyField::create('Amount')
		);
		
		return $fields;
	}
	
	public function process($member)
	{
		$item = $this->Item();
		if ($item instanceof Membership)
		{
			return $this->processMembership($member);
		}

		return $this->processItem($member);
	}
	
	private function processItem($member)
	{
		return null;
	}
	
	private function processMembership($member)
	{
		if (!$member)
		{
			return 'Not a member';
		}
		
		$membershipExpiry = $member->MembershipExpiry;
		$dt = new DateTime("NOW");
		if (new DateTime($membershipExpiry) < $dt)
		{
			$membershipExpiry = $dt->format("Y-m-d");
		}
		
		$membershipExpiry = DateHelper::addmonths(new DateTime($membershipExpiry), $item->MembershipMonths);
		$this->updateMember($member, $item, $membershipExpiry);
		
		return null;
	}
	
	private function updateMember($member, $membership, $membershipExpiry)
	{
		$member->Groups()->add($membership->Group());
		
		$member->Membership = $membership;
		$member->MembershipExpiry = $membershipExpiry->format("Y-m-d");
		$member->write();
	}
}
