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
	 <form name='form' action='asignar_rutina.proc.php' method="POST" >

	<?php


			echo "Nombre Rutina : ".$fila['nombre_rutina']."<br>";
			echo "Duración Rutina : ".$fila['duracion_rutina']." meses<br>";
	?>

			<input type='hidden' name='duracion_rutina' value='<?php echo $fila['duracion_rutina']; ?>'>
			<input type='hidden' name='id_rutina' value='<?php echo $fila['id_rutina'];?>'>
	<?php
			echo "Objetivo Rutina: : ".$fila['nombre_objetivo']."<br>";
			// $id_rutina = $fila['id_rutina'];
			// $duracion_rutina = $fila['duracion_rutina'];
			// echo "<a href='asignar_rutina.proc.php?id_rutina=".$id_rutina."'>enviar</a>";
			
			?>
			<!-- <button onclick="alerta()"> <?php //echo $fila['nombre_rutina']; ?> </button> -->
			<input type="submit" name="enviar" value="enviar">
			 </form> 
			<?php
		}

	}

	

	
?>