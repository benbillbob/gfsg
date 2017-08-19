<?php
class Event extends DataObject {
	private static $db = array (
		'Title' => 'Varchar',
		'Content' => 'HTMLText',
		'EventStartDate' => 'Date',
		'EventStartTime' => 'Time',
		'EventEndDate' => 'Date',
		'EventEndTime' => 'Time',
		'TotalTickets' => 'int',
		'OnSaleStartDate' => 'Date',
		'OnSaleStartTime' => 'Time',
		'OnSaleEndDate' => 'Date',
		'OnSaleEndTime' => 'Time'
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
			DateField::create('EventStartDate'),
			TimeField::create('EventStartTime'),
			DateField::create('EventEndDate'),
			TimeField::create('EventEndTime'),
			NumericField::create('TotalTickets'),
			DateField::create('OnSaleStartDate'),
			TimeField::create('OnSaleStartTime'),
			DateField::create('OnSaleEndDate'),
			TimeField::create('OnSaleEndTime'),
			GridField::create('EventTicketTypes', 'EventTicketTypes', $this->EventTicketTypes(), GridFieldConfig_RecordEditor::create())
		);
		
		return $fields;
	}
	
	public function Link(){
		return $this->EventContainerPage()->Link('show/' . $this->ID);
	}
}