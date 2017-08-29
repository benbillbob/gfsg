<?php

class MySiteConfig extends DataExtension
{
    private static $db = array(
        'ItemPurchaseEmail' => 'Text'
    );

    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldToTab(
            'Root.MySite',
            new TextField('ItemPurchaseEmail', 'ItemPurchaseEmail')
        );
    }
}
