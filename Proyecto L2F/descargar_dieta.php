<?php

$id = $_GET["id"]; 
$path = "./Media/pdf";
$enlace = $path."/".$id.".pdf"; 

header ("content-type: application/pdf"); 

readfile($enlace); 

?>