
$('form').each(function()
{
	var $localForm = $(this);
	var $submit = $("input[type=submit]", $localForm);
	$submit.click(function(e) {
		e.preventDefault(); //This will prevent form from submitting

		var dataToBeSent = $localForm.serialize();

		$.post(window.location.pathname + '/createInvoice', dataToBeSent, function(data) {
			$('#Custom', $localForm).val(data);
			$localForm[0].submit();   //Send client to the payment processor
		});
	});
});