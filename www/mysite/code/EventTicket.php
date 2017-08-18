<?php
class EventTicket extends DataObject {
	private static $db = array (
	);
	
	private static $has_one = array(
		'EventTicketType' => 'EventTicketType',
		'Event' => 'Event'
	);
}