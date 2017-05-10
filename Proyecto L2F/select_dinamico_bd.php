<?php
include("conexio.php");

	$consulta = "SELECT * FROM `tbl_objetivo` " ; 
	echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

	if(mysqli_num_rows($resultado)>0){

	while($fila = mysqli_fetch_array($resultado)){


			echo "<option value=".$fila['id_objetivo'].">". $fila['nombre_objetivo']."  </option>";

		}
	}
	mysqli_close($conexion);
?>