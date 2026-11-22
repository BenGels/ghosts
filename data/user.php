<?php
require_once("Ghosts.php");
$ghosts = new Ghosts();
$user = ($ghosts->getUsers());
echo json_encode($user);
die();