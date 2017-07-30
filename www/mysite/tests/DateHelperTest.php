<?php

class DateHelperTest extends SapphireTest {
	public function testAddOneMonth(){
		$date = new DateTime("2017-01-01");
		
		$newDate = DateHelper::addMonths($date, 1);
		
		$this->assertEquals($date->format('Y-m-d'), '2017-02-01');
	}

	public function testAdd12Months(){
		$date = new DateTime("2017-01-01");
		
		$newDate = DateHelper::addMonths($date, 12);
		
		$this->assertEquals($date->format('Y-m-d'), '2018-01-01');
	}
}