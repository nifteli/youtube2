<?php
	$mail = new PHPMailer;
	$mail->isSMTP();                                      // Set mailer to use SMTP
	$mail->CharSet = "UTF-8";
	$mail->Host = 'smtp.gmail.com';  					  // Specify main and backup SMTP servers
	$mail->SMTPAuth = true;                               // Enable SMTP authentication
	//$mail->SMTPDebug = 1;
	$mail->Username = 'portagaltest@gmail.com';           // SMTP username
	$mail->Password = 'testportagal';                     // SMTP password
	$mail->SMTPSecure = 'ssl';                            // Enable encryption, 'ssl' also accepted
	$mail->Port       = 465;
	$mail->From = 'test@gmail.com';
	$mail->FromName = 'Youtube';
	$mail->isHTML(true);                                  // Set email format to HTML
	
	//$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
	//$mail->addReplyTo('info@example.com', 'Information');
	//$mail->addCC('cc@example.com');
	//$mail->addBCC('bcc@example.com');

	//$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
	//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
	//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
?>