<?php

class TicketInvoiceTest extends SapphireTest {

    protected static $fixture_file = 'mysite/tests/TicketInvoiceTest.yml';

    public function testFixtureLoadedToDb() {
		$item = Item::get()->first();
		$this->assertEquals($item->ItemName, 'AdultTicketTypeName');
	}

	public function testSucceedsForItem(){
		$invoice = Invoice::get()->filter('TxnId', 'SingleTicketInvoice')->first();
		$this->assertNotNull($invoice);
		$result = $invoice->processPurchase();
		$this->assertNull($result);
		$this->assertEquals($invoice->Status, Invoice::STATUS_COMPLETE);
	}

	public function testCreatesTicketWithOneLine(){
		$invoice = Invoice::get()->filter('TxnId', 'SingleTicketInvoice')->first();
		$result = $invoice->processPurchase();
		$this->assertNull($result);
		
		$event = Event::get()->first();
		$ticket = EventTicket::get()->first();
		$this->assertNotNull($ticket);
		Debug::Show($ticket);
		$ticketEvent = $ticket->Event();
		$this->assertNotNull($ticketEvent);
		$this->assertEquals($event->Title, $ticketEvent->Title);
	}
}