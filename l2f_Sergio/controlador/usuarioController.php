
<?php

require_once("modelo/Usuario.php");
extract($_REQUEST);




$usuario = new Usuario("sergio","sergio@gmail.com","1234");

require_once("vista/usuario.phtml");
 
