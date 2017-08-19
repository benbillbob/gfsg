<?php
class Article extends DataObject {
	private static $db = array (
		'Title' => 'Varchar',
		'Summary' => 'HTMLText',
		'Content' => 'HTMLText'
	);
	
	private static $has_one = array(
		'NewsPage' => 'NewsPage'
	);
	
	
	public function getCMSFields() {
		$fields = FieldList::create(
			TextField::create('Title'),
			HTMLEditorField::create('Summary'),
			HTMLEditorField::create('Content')
		);
		
		return $fields;
	}
	
	public function Link(){
		return $this->NewsPage()->Link('show/' . $this->ID);
	}
}