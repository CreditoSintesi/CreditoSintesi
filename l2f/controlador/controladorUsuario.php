<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
  include("../modelo/Usuario.php");

extract($_REQUEST);

$usuario = new Usuario($nombre_usuario, $email_usuario, $pass_usuario, $fecha_registro, $edad_usuario);
require_once("../vista/vistaUsuario.php");
 
