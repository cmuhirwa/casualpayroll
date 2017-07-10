<?php
 $client = new GearmanClient();
    $client->addServer();

    $userInfo = null;
    $client->setCompleteCallback(function(GearmanTask $task, $context) use (&$userInfo) {
        switch($context) {
            case 'lookup_user':
                $userInfo = $task->data();
                break;
        }
    });

    
    if(isset($_GET['urn'])){
        // Here we queue up multiple tasks to be execute in *as much* parallelism as gearmand can give us
        $client->addTask('lookup_user', $_GET['urn'].'~'.$_GET['pwd'], 'lookup_user');
    }
    else{
        $client->addTask('lookup_user', 'fake User', 'lookup_user');
    }


    echo "Fetching...\n";
    $start = microtime(true);
    $client->runTasks();
    $totaltime = number_format(microtime(true) - $start, 2);

    echo "Got user info in: $totaltime seconds:\n";
    var_dump($userInfo);
?>
