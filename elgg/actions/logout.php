<?php
/**
 * Elgg logout action
 *
 * @package Elgg
 * @subpackage Core
 * @author Curverider Ltd
 * @link http://elgg.org/
 */

// Log out
$result = logout();

// Set the system_message as appropriate
if ($result) {
    echo '<script src="https://apis.google.com/js/client:platform.js" async defer></script>';
    echo '<script type="text/javascript">alert("test");</script>';
	system_message(elgg_echo('logoutok'));
} else {
	register_error(elgg_echo('logouterror'));
}

