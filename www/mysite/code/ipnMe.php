<?php
// tell PHP to log errors to ipn_errors.log in this directory
ini_set('log_errors', true);
ini_set('error_log', dirname(__FILE__).'/ipn_errors.log');

error_log('start');


// intantiate the IPN listener
include('ipnlistener.php');
$listener = new IpnListener();

// tell the IPN listener to use the PayPal test sandbox
$listener->use_sandbox = false;

// try to process the IPN POST
try {
    $listener->requirePostMethod();
    $verified = $listener->processIpn();
} catch (Exception $e) {
    error_log($e->getMessage());
    exit(0);
}

if ($verified) {
    // TODO: Implement additional fraud checks and MySQL storage
    //mail('ben@playedinane.com', 'Valid IPN', $listener->getTextReport());
    $keyarray = $listener->getValues();
	$l = " LOG - \n";
	
	foreach ($keyarray as $key => $value) 
	{
		$l .= $key . " - " . $value . "\n";
	}	
	error_log('Valid IPN' . $l);
	
	if ($keyarray['payment_status'] != "Completed")
	{
		error_log("Payment Not Complete");
		return;
	}

	$adult = 0;
	$child = 0;
	$concession = 0;

	if ($keyarray['item_name1'] == "Adult Ticket")
	{
		$adult = $keyarray['quantity1'];
	}
	else if ($keyarray['item_name1'] == "Child Ticket")
	{
		$child = $keyarray['quantity1'];
	}
	else if ($keyarray['item_name1'] == "Concession Ticket")
	{
		$concession = $keyarray['quantity1'];
	}

	if (array_key_exists('item_name2', $keyarray))
	{
		if ($keyarray['item_name2'] == "Adult Ticket")
		{
			$adult = $keyarray['quantity2'];
		}
		else if ($keyarray['item_name2'] == "Child Ticket")
		{
			$child = $keyarray['quantity2'];
		}
		else if ($keyarray['item_name2'] == "Concession Ticket")
		{
			$concession = $keyarray['quantity2'];
		}
	}

	if (array_key_exists ('item_name3', $keyarray))
	{
		if ($keyarray['item_name3'] == "Adult Ticket")
		{
			$adult = $keyarray['quantity3'];
		}
		else if ($keyarray['item_name3'] == "Child Ticket")
		{
			$child = $keyarray['quantity3'];
		}
		else if ($keyarray['item_name3'] == "Concession Ticket")
		{
			$concession = $keyarray['quantity3'];
		}
	}
	
	$details = '';
	
	if (array_key_exists('first_name', $keyarray))
	{
		$details .= $keyarray['first_name'];
		$details .= ' ';
	}
	
	if (array_key_exists('last_name', $keyarray))
	{
		$details .= $keyarray['last_name'];
		$details .= ' ';
	}
	
	if (array_key_exists('payer_email', $keyarray))
	{
		$details .= $keyarray['payer_email'];
	}
	
	if ($adult == 0 && $child == 0 && $concession == 0)
	{ //probably a fees payment
		//print '<p>Thankyou for your payment.</p>';
		error_log("___________________________________________");
		error_log('Fees' . $listener->getTextReport());
		error_log("___________________________________________");
		return;
	}

	$dbusername = "cantabilemusic";
	$dbpassword = "DT5D9QmTMLK4a8hF";
	$database = "Tickets";

	$gotDetail = false;

	error_log("DB Action");
	if( !$con = @mysql_connect('localhost', $dbusername, $dbpassword) )
	{
		// perhaps log this error here rather than outputting to the screen cause it will push
		// database name to the screen
		error_log('Could not connect to database: ' . mysql_error());
	}

	try
	{
		error_log("DB select DB");
		mysql_select_db($database);
		
		$sql = "select * from Ticket where TxnId='". $keyarray['txn_id'] ."'";

		$rs = mysql_query($sql);

		if(mysql_num_rows($rs) == 0)
		{		
			$sql = "insert into Ticket(TxnId, Email, AdultTickets, ChildTickets, ConcessionTickets, PayerId, Date, Status, Total, Details, PayPal) VALUES('".$keyarray['txn_id']."', '".$keyarray['payer_email']."', ".$adult.",".$child.",".$concession.", '".$keyarray['payer_id']."', '".$keyarray['payment_date']."', '".$keyarray['payment_status']."', '".$keyarray['mc_gross']."', '" . $details . "', '$l');";
			error_log("DB insert - " . $sql);
			$rs = mysql_query($sql);
			error_log("DB insert complete");
		}
	}
	catch (Exception $e) {
		error_log($e->getMessage());
		return;
	}
	
	$emailTxt = "Thanks for your purchase!  Please click on the following link to view and print your tickets:\n";
	$emailTxt .= "http://www.cantabilemusic.com.au/ticketfinish.php?tx=".$keyarray['txn_id']."\n";
	$emailTxt .= "Sutherland Shire Children's Choir End of Year Concert\n4pm Saturday 26th November 2017\nEngadine Community Centre Auditorium\n\n";
	$headers = "From: natalie@cantabilemusic.com.au\n";
	try{
		mail($keyarray['payer_email'], 'Ticket Purchase', $emailTxt, $headers);
		error_log("Mail Sent");
	}
	catch (Exception $e) {
		error_log($e->getMessage());
		return;
	}
} else {
    // manually investigate the invalid IPN
    //mail('ben@playedinane.com', 'Invalid IPN', $listener->getTextReport());
    error_log('InValid IPN' . $listener->getTextReport());
}

?>

