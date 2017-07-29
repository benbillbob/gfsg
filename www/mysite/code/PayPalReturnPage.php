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
include('PayPalPDT.php');

class PayPalItem
{
	public $itemName;
	public $itemNumber;
	public $itemQuantity;
	public $itemAmount;
}

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
		
		$ipn = new Ipn();
		$paypalPDT = new PayPalPDT();

		$invoice = $paypalPDT->getInvoice($ipn, $tx);

		if (!$invoice)
        {
            return $paypalPDT->getError();
        }

		if ($member->ID != $invoice->MemberID)
		{
			$this->FailureContent = "Incorrect member processing. Please contact support.";
			return $this->FailureContent;
		}
		
		return $invoice->processPurchase();
		
		// $membershipexpiry = $this->addmonths($membership->membershipmonths);
		
		// $this->updatemember($member, $tx, $membership, $membershipexpiry, $withjournal);
		
		return $this->SuccessContent;
	}
	
	private function processPurchase($invoice)
	{
		
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

