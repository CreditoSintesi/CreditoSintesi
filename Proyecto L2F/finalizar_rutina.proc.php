<?php

session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];
extract($_REQUEST);
$fecha_actual = date('Y-m-d');
$sql = "UPDATE tbl_rutina_usuario SET fecha_fin = '$fecha_actual', rutina_finalizada = 'si' WHERE id_usuario = $id_usuario AND id_rutina = $id_rutina";

	//echo $sql ."<br><br><br><br>";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	

header('location: user_rutinas.php');
	

?>