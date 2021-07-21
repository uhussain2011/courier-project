<?php

include_once 'Classes/courierfunc.php';





$create = new DeleteClass();
if(isset($_GET['id']))
{
    $create->delete($_GET['id']);

    $_SESSION["type"] = "alert-danger";
    $_SESSION["message"] = "Record deleted successfully";

    header("LOCATION: ".$base_path);
}
else
{
    header("LOCATION: ".$base_path);
}
