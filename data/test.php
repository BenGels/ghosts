<?php

    require_once("Ghosts.php");
    $ghosts = new Ghosts();

    if(isset($_GET["method"]) && method_exists($ghosts,$_GET["method"]))
    {
        unset($_GET["method"]);
        $result = call_user_func_array(array($ghosts, $_GET["method"]), $_GET);
        echo json_encode($result);
        die();
    }
    else
    {
        echo json_encode($ghosts->query($_GET["target"],$_GET["of"],$_GET["id"]));
        die();
    }





?>