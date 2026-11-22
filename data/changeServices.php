<?php

require_once("Ghosts.php");
$ghosts = new Ghosts();
echo $ghosts->updateService($_GET['id'], intval($_GET['value']));