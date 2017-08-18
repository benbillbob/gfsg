<?php
class Event extends DataObject {
	private static $db = array (
		'Title' => 'Varchar',
		'Content' => 'HTMLText',
		'StartDate' => 'Date',
		'EndDate' => 'Date',
		'StartTime' => 'Time',
		'EndTime' => 'Time',
		'TotalTickets' => 'int'
	);
	
	private static $has_one = array(
		'EventContainerPage' => 'EventContainerPage'
	);
	
	private static $has_many = array(
		'EventTickets' => 'EventTicket',
		'EventTicketTypes' => 'EventTicketType'
	);
	
	public function getCMSFields() {
		$fields = FieldList::create(
			TextField::create('Title'),
			HTMLEditorField::create('Content'),
			DateField::create('StartDate'),
			TimeField::create('StartTime'),
			DateField::create('EndDate'),
			TimeField::create('EndTime'),
			NumericField::create('TotalTickets')
		);
		
		return $fields;
	}
	
	public function Link(){
		return $this->EventContainerPage()->Link('show/' . $this->ID);
	}
}