<?php
class EventTicketType extends Item {
	private static $db = array (
	);
	
	private static $has_one = array(
		'Event' => 'Event'
	);
}