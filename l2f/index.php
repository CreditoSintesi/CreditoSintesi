<?php
require_once("config.php");

if(!empty($_GET["accion"]))
{
	$accion=$_GET["accion"];
}else
{
	$accion="principal";
}

if(is_file("controlador/".$accion."Controller.php"))
{
	require_once("controlador/".$accion."Controller.php");
}else
{
	require_once("controlador/errorController.php");
}
?>
