<?php
	session_start();
	extract($_REQUEST);

	include("conexio.php");

	//primero hay que actualizar la tbl_usuario where id_usuario = $id_usuario;
	$consulta = "UPDATE tbl_usuario SET id_objetivo = '$id_objetivo', apellidos_usuario = '$apellidos_usuario', sexo_usuario = '$sexo_usuario', altura_usuario = '$altura_usuario', fecha_nacimiento = '$fecha_nacimiento', estado_usuario = 'Activo' WHERE condition;" ; 
	echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

	//segundo insertar primer registro de historial peso




	mysqli_close($conexion);

	//header("location main.php?usuario=activo");

?>