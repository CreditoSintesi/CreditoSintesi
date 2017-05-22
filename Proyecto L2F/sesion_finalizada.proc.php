<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];
extract($_REQUEST);

$fecha_registro = date('Y-m-d');
$sql = "INSERT INTO `tbl_historial_rutinas` (`sesion_rutina`, `fecha`, `id_usuario`, `id_rutina`) VALUES ( $sesion_rutina, '$fecha_registro', $id_usuario, $id_rutina) ";

	//echo $sql ."<br><br><br><br>";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
	
header("location: user_rutinas.php");

?>