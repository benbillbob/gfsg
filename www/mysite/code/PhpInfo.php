<?php
class PhpInfo extends BuildTask {
	protected $title = 'Show Php Info';
	protected $description = 'Runs and outputs phpinfo()';
	protected $enabled = true;
	function run($request) {
		echo phpinfo();
	}
}
