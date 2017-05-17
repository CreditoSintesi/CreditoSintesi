<?php
	session_start();
	extract($_REQUEST);
	echo $altura_usuario;
	include("conexio.php");
	$id_usuario = $_SESSION['id_usuario']; 
	//primero hay que actualizar la tbl_usuario where id_usuario = $id_usuario;
	$consulta = "UPDATE tbl_usuario SET id_objetivo = '$id_objetivo', apellidos_usuario = '$apellidos_usuario', sexo_usuario = '$sexo_usuario', altura_usuario = '$altura_usuario', fecha_nacimiento = '$fecha_nacimiento', estado_usuario = 'Activo' WHERE id_usuario = $id_usuario;" ; 
	echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

	//segundo insertar primer registro de historial peso

	$fecha_historial = date('Y-m-d');

	$consulta = "INSERT INTO tbl_historial_peso (id_usuario, fecha_his_pes, peso) VALUES ($id_usuario, '$fecha_historial', $peso_usuario);" ; 
	echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());



	mysqli_close($conexion);

	header("location: main.php);

?>