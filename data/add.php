<?php

    require_once("Ghosts.php");
    $ghosts = new Ghosts();
    $ghosts->addGhost(
        $_GET['type'],
        $_GET['power'],
        $_GET['services'],
        explode(",",$_GET['forces']),
        $_GET['owner']
    );
?>