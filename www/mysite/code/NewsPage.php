<?php
class NewsPage extends Page {
	private static $db = array ();
	private static $has_many = array(
        'Articles' => 'Article'
    );
	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Articles', GridField::create('Articles', 'Articles', $this->Articles(), GridFieldConfig_RecordEditor::create()));
		return $fields;
	}}


class NewsPage_Controller extends Page_Controller 
{
	private static $allowed_actions = array(
		'show'
	);
	
	public function show(SS_HTTPRequest $request) {
		$article = Article::get()->byID($request->param('ID'));
		if (!$article){
			return $this->httpError(404, 'Could not find article');
		}
		
		return array('Article' => $article);
	}
}