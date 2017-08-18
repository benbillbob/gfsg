<?php
class EventContainerPage extends Page {
	private static $db = array ();
	private static $has_many = array(
        'Events' => 'Event'
    );
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Events', GridField::create('Events', 'Events', $this->Events(), GridFieldConfig_RecordEditor::create()));
		return $fields;
	}}


class EventContainerPage_Controller extends Page_Controller 
{
	public function init() 
	{
		Requirements::set_write_js_to_body(false);
		Requirements::javascript(THIRDPARTY_DIR."/jquery/jquery.js");
		Requirements::javascript("mysite/code/CreateInvoice.js");
		Requirements::javascript("mysite/external/fullcalendar/moment.min.js");
		Requirements::javascript("mysite/external/fullcalendar/fullcalendar.min.js");
		Requirements::css("mysite/external/fullcalendar/fullcalendar.min.css");
		
		Requirements::customScript('
		$(document).ready(function() {
			jQuery("#calendar").fullCalendar({
				events: "'.$this->data()->Link().'events"
			});
		});');
		parent::init();
	}
	
	private static $allowed_actions = array(
        'createInvoice',
		'show',
		'events'
	);
	
	public function events(SS_HTTPRequest $request) {
		$this->getResponse()->addHeader('Content-type', 'application/json');		

		$start = $request->getVars()['start'];
		$end = $request->getVars()['end'];
		
		$format = '{
			"title": "%s",
			"start": "%s"},
		';
		
		$events = Event::get();

		if ($start && $end){
			$events = $events->filter(array('StartDate:GreaterThan' => $start, 'EndDate:LessThan' => $end));
		}

		if (count($events) == 0){
			return '';
		}
		
		$data = '[';
		
		foreach($events as $event) {
			$data = $data . sprintf($format, $event->Title, $event->StartDate);
		}
		
		$data = substr(trim($data), 0, -1);
		$data = $data.']';
		
		return $data;
	}
	
	public function show(SS_HTTPRequest $request) {
		$event = Event::get()->byID($request->param('ID'));
		if (!$event){
			return $this->httpError(404, 'Could not find event');
		}
		
		return array('Event' => $event);
	}
	
	public function createInvoice(SS_HTTPRequest $request) {
        $postVars = $request->postVars();

		$item = Item::get()->filter('ItemNumber', $postVars['item_number'])->first();
		
		if (!$item)
		{
			throw new Exception('Item - ' . $postVars['item_number'] . ' not found.');
		}
		
		$id = $this->createTxnId();
		$invoice = Invoice::create();
		$invoice->TxnId = $id;
		$invoice->Status = Invoice::STATUS_PENDING;
		$invoice->Processed = false;
		$invoice->MemberID = Member::currentUser()->ID;
		$invoice->write();
		
		$invoiceLine = InvoiceLine::create();
		$invoiceLine->InvoiceID = $invoice->ID;
		$invoiceLine->ItemID = $item->ID;
		$invoiceLine->Quantity = $postVars['quantity'];
		$invoiceLine->Amount = $postVars['amount'];
		$invoiceLine->write();
		
		return $id;
    }
	
	private function createTxnId()
	{
		return DB::query('SELECT uuid()')->value();
	}
}

