<?php
class PayPalReturnPage extends Page {
private static $db = array (
    'SuccessContent' => 'HTMLText',
    'FailureContent' => 'HTMLText',
    'PendingContent' => 'HTMLText'
  );

  public function getCMSFields() {
	$fields = parent::getCMSFields();
    $fields->addFieldToTab('Root.Main', HTMLEditorField::create('SuccessContent'));   
    $fields->addFieldToTab('Root.Main', HTMLEditorField::create('FailureContent'));
    $fields->addFieldToTab('Root.Main', HTMLEditorField::create('PendingContent'));
	$fields->removeFieldFromTab("Root.Main","Content");
    return $fields;
  }  
}

include('ipn.php');

class PayPalReturnPage_Controller extends Page_Controller 
{
	public function init() 
	{
		$this->Content = $this->getContent();

		parent::init();
	}
	
	private function getContent()
	{
		$member = Member::currentUser();
		if (!$member)
		{
			Debug::message("Not logged in");
			return "Not logged in.";
		}
		
		$tx = $this->getRequest()->getVar('tx');
		if ($tx === NULL)
		{
			Debug::message("No TX Provided in url");
			return "No transaction found. Please contact support.";
		}

		if ($this->isProcessed($tx, $member))
		{
			Debug::message("Processed Already - ". $tx);
			return $this->renderMemberInfo($member);
		}
		
		Debug::Message("Current Member TX - " . $member->TxnId);
		
		$ipn = new Ipn();
		$use_sandbox = SiteConfig::current_site_config()->MiniCartTestMode;
		$authToken = SiteConfig::current_site_config()->MiniCartAuthToken;
		
		$response = $ipn->processTx($tx, $authToken, $use_sandbox);
		
		Debug::show($response);

		if (!$this->validateResponse($response))
		{
			return $this->FailureContent;
		}
		
		$values = $this->getValues($response);

		if ($values['payment_status'] != "Completed")
		{
			return $this->PendingContent;
		}
		
		$memberNumber = $values['custom'];
		
		Debug::Message("Member number - " . $member->ID);
		if ($member->ID != $memberNumber)
		{
			$this->FailureContent = "Incorrect member processing. Please contact support.";
			return $this->FailureContent;
		}
		
		$itemNumber = $values['item_number1'];
		$itemPrice = $values['mc_gross_1'];
		
		$withJournal = false;
		$membership = Membership::get()->filter('ItemNumber', $itemNumber)->first();
		if ($membership)
		{
			$membershipAmount = $membership->Amount;
		}
		else
		{
			$membership = Membership::get()->filter('ItemNumberWithJournal', $itemNumber)->first();
			if ($membership)
			{
				$membershipAmount = $membership->AmountWithJournal;
				$withJournal = true;
			}
		}
		
		if (!membership)
		{
			Debug::message('Membership not found');
			Debug::Show($itemNumber);
			$this->FailureContent = "Incorrect member processing. Please contact support.";
			return $this->FailureContent;
		}
		
		if ($membershipAmount != $itemPrice)
		{
			Debug::message('Membership price mismatch');
			Debug::Show($itemPrice);
			Debug::Show($membershipAmount);
			$this->FailureContent = "Membership price mismatch. Please contact support.";
			return $this->FailureContent;
		}	

		$membershipExpiry = $this->addMonths($membership->MembershipMonths);
		
		$this->updateMember($member, $tx, $membership, $membershipExpiry, $withJournal);
		
		return $this->SuccessContent;
	}
	
	private function addMonths($months)
	{
		$dt = new DateTime("NOW");

		$oldDay = $dt->format("d");
		$dt->add(new DateInterval("P".$months."M"));
		$newDay = $dt->format("d");

		if($oldDay != $newDay) {
			// Check if the day is changed, if so we skipped to the next month.
			// Substract days to go back to the last day of previous month.
			$dt->sub(new DateInterval("P" . $newDay . "D"));
		}

		return $dt;
	}
	
	private function isProcessed($tx, $member)
	{
		return $member->TxnId == $tx;
	}
	
	private function renderMemberInfo($member)
	{
		return $member->renderWith('MemberProfileFieldsSection');
	}
	
	private function validateResponse($response)
	{
		if (strpos($response, "SUCCESS") !== false) {
            return true;
		}
		
		return false;
	}
	
	private function getValues($data)
	{
		$lines = explode("\n", trim($data));
		$keyarray = array();
		for ($i = 1; $i < count($lines); $i++) {
			$temp = explode("=", $lines[$i],2);
			$keyarray[urldecode($temp[0])] = urldecode($temp[1]);
		}
		
		return $keyarray;
	}
	
	private function updateMember($member, $tx, $membership, $membershipExpiry, $withJournal)
	{
		$group = Group::get()->filter('ID',$membership->GroupID)->first();
		$member->Groups()->add($group);
		
		$member->Membership = $membership;
		$member->MembershipExpiry = $membershipExpiry->format("Y-m-d");
		$member->WithJournal = $withJournal;
		$member->TxnId = $tx;
		if (!$this.isProcessed(Member::currentUser(), $tx))
		{
			$member->write();
		}
	}
}

