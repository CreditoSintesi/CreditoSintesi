<?php

session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];
extract($_REQUEST);
$fecha_actual = date('Y-m-d');
$sql = "UPDATE tbl_dieta_usuario SET fecha_fin_dieta = '$fecha_actual', dieta_finalizada = 'si' WHERE id_usuario = $id_usuario AND id_dieta = $id_dieta";

	//echo $sql ."<br><br><br><br>";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	

//header('location: user_dieta.php');
	

?>