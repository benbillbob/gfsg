<?php

class BasicPageFixtureTest extends FunctionalTest {
	protected static $fixture_file = 'mysite/tests/BasicPageFixtureTest.yml';
	
	static $use_draft_site = true;
	
	public function setUp()
	{
		parent::setUp();
		$this->page = $this->objFromFixture('Page', 'TestPage');
	}
	
    public function testPage()
    {        
		$result = $this->get($this->page->AbsoluteLink());
        $this->assertEquals(200, $result->getStatusCode());
    }
}
