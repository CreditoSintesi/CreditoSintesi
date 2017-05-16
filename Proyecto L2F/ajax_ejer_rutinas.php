<?php

include_once('conexio.php');
extract($_REQUEST);
$id_rutina = 6;
$consulta = "SELECT DISTINCT * FROM tbl_rutina, tbl_objetivo WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_objetivo = tbl_objetivo.id_objetivo";

	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){

		while($fila = mysqli_fetch_array($resultado)){
			echo "Duracion rutina   : ".$fila['duracion_rutina']."  --   Objetivo:   ".$fila['nombre_objetivo']."<br><br><br>";
		

			
		}
	}


$sql = "SELECT DISTINCT * FROM tbl_rutina, tbl_objetivo, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina.id_objetivo = tbl_objetivo.id_objetivo";

	//echo $sql ."<br><br><br><br>";
	$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){

		while($fila = mysqli_fetch_array($resultado)){
			echo "Nombre ejercicio : ".$fila['nombre_ejercicio']."<br>";
			echo "Series : ".$fila['series']."<br>";
			echo "repeticiones: ".$fila['repeticiones']."<br>";
			echo "Dia de la rutina: ".$fila['num_dia']."<br><br><br>";
			
		}
	}
?>