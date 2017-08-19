<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	'type' => 'MySQLDatabase',
	'server' => 'localhost',
	'username' => 'gfsg',
	'password' => 'ueWLUgGtbetMa54q',
	'database' => 'gfsg',
	'path' => ''
);

// Set the site locale
i18n::set_locale('en_AU');
