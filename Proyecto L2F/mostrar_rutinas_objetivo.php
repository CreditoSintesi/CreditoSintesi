<?php
//moostrar rutinas según el objetivo del usuario


	$id_usuario = $_SESSION['id_usuario'];

	extract($_REQUEST);

	include("conexio.php");

	$consulta = "SELECT *
      FROM `tbl_rutina`
INNER JOIN `tbl_objetivo`
        ON `tbl_rutina`.`id_objetivo` = `tbl_objetivo`.`id_objetivo`
INNER JOIN `tbl_usuario`
        ON `tbl_objetivo`.`id_objetivo` = `tbl_usuario`.`id_objetivo`
     WHERE `id_usuario` = '$id_usuario';" ; 
	echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

	if(mysqli_num_rows($resultado)>0){

	while($fila = mysqli_fetch_array($resultado)){
			echo "<br><br>";

			?>
	<form action='asignar_rutina.proc.php' method="POST" >

	<?php


			echo "Nombre Rutina : ".$fila['nombre_rutina']."<br>";
			echo "Duración Rutina : ".$fila['duracion_rutina']." meses<br>";
			echo "<input type='hidden' name='duracion_rutina' value='".$fila['duracion_rutina']."'>";
			echo "<input type='hidden' name='id_rutina' value='".$fila['id_rutina']."'>";
			echo "Objetivo Rutina: : ".$fila['nombre_objetivo']."<br>";
			?>
			
			<input type='submit' value= 'Asignarme esta rútina'> 
			</form>
			<?php
		}

	}

	

	
?>