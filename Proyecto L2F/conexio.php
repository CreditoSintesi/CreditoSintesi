<?php
		
	//Conecta con la base de datos
		 $conexion = mysqli_connect('localhost', 'root', '', 'bd_l2f');

	//Establece el set de caracteres UTF-8
		$acentos = mysqli_query($conexion, "SET NAMES 'utf8'");

	//Si no se conecta correctamente salta error
		 if (!$conexion) {
		     echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
		     echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
		     echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
		     exit;
		 }else
?>

