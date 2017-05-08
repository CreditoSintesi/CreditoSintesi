
<?php

require_once("modelo/Usuario.php");
extract($_REQUEST);
switch ($funcion) {
    
    case "alta":
        //$user = $_POST['nombre_usuario'];
        //echo $user;
        $usuario = new Usuario($_POST['nombre_usuario'],$_POST['email_usuario'],$_POST['pass_usuario']);
        //print_r($usuario);
        $usuario->alta($usuario);
        require_once("vista/usuario.phtml");
        break;
    case "modificar":
        
        break;
    case "eliminar":
        
        break;
    default: require_once("vista/usuario.phtml");
        
}





//$usuario = new Usuario($_POST['nombre_usuario'],$_POST['email_usuario'],$_POST['pass_usuario']);




 
