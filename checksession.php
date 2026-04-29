<?php
// Load config to access session setup
require_once('main.inc.php'); // initializes OST config and session

echo '<pre>';

echo "SESSION CONTENTS:\n";
print_r(array_keys($_SESSION)); // safer: just show keys, not sensitive data

if (isset($_SESSION['_staff'])) {
    echo "\nStaff session detected ✅\n";
    print_r(array_keys($_SESSION['_staff']));
} else {
    echo "\nNo staff session detected ❌\n";
}

if (isset($_SESSION['_client'])) {
    echo "\nClient session detected ✅\n";
    print_r(array_keys($_SESSION['_client']));
}

echo '</pre>';
