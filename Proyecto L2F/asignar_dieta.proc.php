<?php
	session_start();
	include_once('conexio.php');
	$id_usuario = $_SESSION['id_usuario'];
	extract($_REQUEST);
	$fecha_inicio = date('Y-m-d');
	$fecha_final = date('Y-m-d', strtotime ("$fecha_inicio +".$duracion_dieta." month"));

	echo $id_rutina;
	echo $duracion_dieta;
	echo $fecha_inicio;
	echo $fecha_final;
	$sql = "INSERT INTO `tbl_dieta_usuario` (`id_dieta`, `id_usuario`, `fecha_inicio_dieta`, `fecha_fin_dieta`) VALUES ('$id_dieta', '$id_usuario', '$fecha_inicio', '$fecha_final')";
	echo $sql ."<br>";

	$resultado=mysqli_query($conexion, $sql);

	header('location: user_dietas.php');
	
?>