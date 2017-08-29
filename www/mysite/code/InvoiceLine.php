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
		if (!is_subclass_of($item, Item::class))
		{
			return $this->processItem($member);
		}
		else if ($item instanceof Membership)
		{
			return $this->processMembership($member);
		}
		
		return 'Unknown line type';
	}
	
	private function processItem($member)
	{
		$body = $this->ItemName;
		
		$email = new Email();
		$email
			->setTo(SiteConfig::current_site_config()->ItemPurchaseEmail)
			->setSubject('GFSG Purchase')
			->setBody($body);
			
		$email->sendPlain($body);
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
		
		$membershipExpiry = DateHelper::addmonths(new DateTime($membershipExpiry), $this->Item()->MembershipMonths);
		$this->updateMember($member, $this->Item(), $membershipExpiry);
		
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
