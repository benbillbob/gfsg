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
		$this->assertNotNull($ticket->Barcode);
		$this->assertEquals(16, strlen($ticket->Barcode));
		$this->assertNotNull($ticket);
		$ticketEvent = $ticket->Event();
		$this->assertNotNull($ticketEvent);
		$this->assertEquals($event->Title, $ticketEvent->Title);
		$ticketLine = $ticket->EventTicketLines()->first();
		$this->assertEquals('AdultTicketTypeName', $ticketLine->EventTicketType()->ItemName);
	}
}