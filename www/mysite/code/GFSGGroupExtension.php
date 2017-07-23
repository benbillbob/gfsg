<?php

class GFSGGroupExtension extends DataExtension {
  public function updateCMSFields(FieldList $currentFields) {
	$currentFields->addFieldToTab('Root.Members', CheckboxField::create('IsPaidMembership'), 'Description');
  }

	private static $db = array (
		'IsPaidMembership' => 'Boolean'
	);
}