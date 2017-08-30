<?php
class EventTicket extends DataObject {
	private static $db = array (
	);
	
	private static $has_one = array(
		'Event' => 'Event',
		'Member' => 'Member'
	);

	private static $has_many = array(
		'EventTicketLines' => 'EventTicketLine'
	);
}