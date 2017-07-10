<?php

$worker = new GearmanWorker();
$worker->addServer();

$worker->addFunction('lookup_user', function(GearmanJob $job){
	

	sleep(10);


    $username = $job->workload();
    $pieces = explode("~", $username);
	$urn = $pieces[0];
	$pwd = $pieces[1];

   	include('db.php');
    $sql = $db->query("SELECT * FROM users WHERE username = '$urn' AND password = '$pwd'");
    $checkifEsists = mysqli_num_rows($sql);
    if($checkifEsists){

	    $phone1 = '725594646';
	    $phone2 = '';
	    $amount = '';
	    $pushName = $job->workload();
	    $pullName = 'Casual';
	   
		$url = 'https://lightapi.torque.co.rw/requestpayment/';
		
		$data = array();
		$data["agentName"] 		= "UPLUS";
		$data["agentId"] 		= "0784848236";
		$data["phone"] 			= $phone1;
	    $data["phone2"] 		= $phone2;
		$data["amount"] 		= $amount;
		$data["fname"] 			= $pushName;
		$data["policyNumber"]	= ''.$pullName.' / '.$pushName.'';


	    $options = array(
			'http' => array(
				'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
				'method'  => 'POST',
				'content' => http_build_query($data)
			)
		);
		$context  = stream_context_create($options);
		$result = file_get_contents($url, false, $context);
		if ($result === FALSE) 
		{ 
			return 'Sorry! We had some network problem connecting to mtn.<br>
			Please try again.';	
		}
		else
		{
			$server_output = $result;
			$firstcheck 	= json_decode($server_output);
			$information2 		= $firstcheck->{'information2'};
			
			include('db.php');
			$sql = $db->query("INSERT INTO `users`(name, createdDate) 
			VALUES ('$information', now())");

		}
	}// Close Checking user
	else{
		return 'You are not allowed to transfer any money here you gave us a '.$username;
	}

});
while ($worker->work());
?>