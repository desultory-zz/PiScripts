<?php
//Simple utility to control the gpio tool on a raspberry pi
// {ip}/gpio.php?r=1?p=x will read the state on pin x
// {ip}/gpio.php?w=1?p=x?s=1 will turn pin x on
// {ip}/gpio.php?w=1?p=x?s=0 will turn pin x off
if (isset($_GET['p'])) {
	$pin = $_GET['p'];
}
if (isset($_GET['r'])) {
	$read = $_GET['r'];
}
if (isset($_GET['w'])) {
	$write = $_GET['w'];
}
if (isset($_GET['s'])) {
	$state = $_GET['s'];
}
if (isset($read) && $read) {
	echo exec(escapeshellcmd("gpio read " . $pin));
}
if (isset($write) && $write) {
	exec(escapeshellcmd("gpio mode " . $pin . " out"));
	exec(escapeshellcmd("gpio write " . $pin . " " .$state));
}
