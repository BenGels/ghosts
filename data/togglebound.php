<?php

require_once("Ghosts.php");
$ghosts = new Ghosts();
$ghosts->toggleBound($_GET['id']);