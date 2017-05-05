
<?php

require_once("modelo/Usuario.php");
extract($_REQUEST);

$usuario = new Usuario($_POST['nombre_usuario'],$_POST['email_usuario'],$_POST['pass_usuario']);

require_once("vista/usuario.phtml");
 
