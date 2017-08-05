<?php
class UpdateMembership extends BuildTask {
	protected $title = 'Update Memberships';
	protected $description = 'Process current membership. Deactivate expired ones.';
	protected $enabled = true;
	function run($request) {
		$members = Member::get();
		foreach ($members as $member)
		{
			echo $member->Name . " - " . $member->Membership . " - " . $member->MembershipExpiry . "\r\n";
		}

		$memberships = Membership::get();
		foreach ($memberships as $membership)
		{
			echo $membership->ItemName . " - " . $membership->ItemNumber . " - " . "\r\n";
		}
	}
}
