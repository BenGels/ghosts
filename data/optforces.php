<?php
require_once("Ghosts.php");
$ghosts = new Ghosts();
$result = $ghosts->query("OPTIONALFORCES","TYPE", $_GET['id']);
echo json_encode($result);