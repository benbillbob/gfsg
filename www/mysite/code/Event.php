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
	
	public function EventStartDateTime(){
		$date = $this->EventStartDate;
		$time = $this->EventStartTime;
		
		return Event::ISODateTimeString($date, $time);
	}

	public function EventEndDateTime(){
		$date = $this->EventEndDate;
		$time = $this->EventEndTime;
		
		return Event::ISODateTimeString($date, $time);
	}
	
	public function OnSaleStartDateTime(){
		$date = $this->OnSaleStartDate;
		$time = $this->OnSaleStartTime;
		
		return Event::ISODateTimeString($date, $time);
	}

	public function OnSaleEndDateTime(){
		$date = $this->OnSaleEndDate;
		$time = $this->OnSaleEndTime;
		
		return Event::ISODateTimeString($date, $time);
	}

	public static function ISODateTimeString($date, $time){
		if (!$date){
			return null;
		}
		
		$str = $date;
		if ($time){
			$str .=' '.$time;
		}
		
		$merge = new DateTime($str);
		return $merge->format(DateTime::ATOM);
	}
	
	public function OnSaleNow(){
		$start = $this->OnSaleStartDateTime();
		$end = $this->OnSaleEndDateTime();
		
		if (!$start || !$end){
			return false;
		}
		
		$now = (new DateTime('NOW'))->format(DateTime::ATOM);
		Debug::Show($now);
		return $start < $now && $now < $end;
	}
	
	
	public function Link(){
		return $this->EventContainerPage()->Link('show/' . $this->ID);
	}
}