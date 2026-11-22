<?php

require_once("Ghosts.php");
$ghosts = new Ghosts();
echo $ghosts->changeDamage($_GET['id'],$_GET['type'],  intval($_GET['value']));