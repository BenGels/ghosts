<?php
require_once("Ghosts.php");
$ghosts = new Ghosts();
$ghosts->delete(($_GET["id"]));