<?php

if (isset($_COOKIE["FB_LOGIN"])) {
    $fb_login = $_COOKIE["FB_LOGIN"];

    if ($fb_login == "false") {
        console.log("FB login stopped!!!!!!!!!!");
        $re = array(
            'success' => false,
        );
        die(json_encode($re));
    }
}


require_once(dirname(__FILE__) . "/engine/start.php");

$json = file_get_contents('https://graph.facebook.com/v2.5/me?access_token=' . $_POST['idToken']);
$json_object = json_decode($json, true);
$json_user_details = file_get_contents('https://graph.facebook.com/v2.5/' . $json_object['id'] . '?access_token=' . $_POST['idToken']);
if ($json_object['id'] != "") {
    $user = get_user_by_username(md5(($json_object['id']) . $json_object['name']));
    if ($user) {
    } else {
        $guid = register_user(md5(($json_object['id']) . $json_object['name']), "123456", $json_object['name'], "testacct.cs5331@yahoo.com.sg", $allow_multiple_emails = false, $friend_guid = 0, $invitecode = '');
        set_user_validation_status($guid, TRUE, 'first_run');

        $user = get_user_by_username($json_object['id']);
    }

    $status = login($user);
    if ($status) {
        $re = array(
            'success' => true,
            'message' => $json_user_details
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
        'message' => "fb login wrong",
    );
}
header('Content-type: application/json');
die(json_encode($re));


