<?php

if (isset($_COOKIE["GOOGLE_LOGIN"])) {
    $google_login = $_COOKIE["GOOGLE_LOGIN"];
    if ($google_login == "false") {
        console . log("FB login stopped!!!!!!!!!!");
        $re = array(
            'success' => false,
        );
        die(json_encode($re));
    }
}


require_once(dirname(__FILE__) . "/engine/start.php");

$json = file_get_contents('https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=' . $_POST['idToken']);
$json_object = json_decode($json, true);
if ($json_object['email'] != "") {


    $user = get_user_by_username(md5($json_object['email']));
    if ($user) {

    } else {
        $guid = register_user(md5($json_object['email']), "123456", $json_object['name'], $json_object['email'], $allow_multiple_emails = false, $friend_guid = 0, $invitecode = '');
        set_user_validation_status($guid, TRUE, 'first_run');

        $user = get_user_by_email($json_object['email']);
    }

    $status = login($user);

    if ($status) {
        $re = array(
            'success' => true,
        );
    } else {
        $re = array(
            'success' => false,
            'message' => "System wrong"
        );
    }
} else {
    $re = array(
        'success' => false,
        'message' => "Login wrong~",
    );
}
header('Content-type: application/json');
die(json_encode($re));
