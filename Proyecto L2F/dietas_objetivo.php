<?php
//moostrar rutinas según el objetivo del usuario


	$id_usuario = $_SESSION['id_usuario'];

	extract($_REQUEST);

	include("conexio.php");

	$consulta = "SELECT *
      FROM `tbl_dieta`
INNER JOIN `tbl_objetivo`
        ON `tbl_dieta`.`id_objetivo` = `tbl_objetivo`.`id_objetivo`
INNER JOIN `tbl_usuario`
        ON `tbl_dieta`.`id_objetivo` = `tbl_usuario`.`id_objetivo`
     WHERE `id_usuario` = '$id_usuario';" ; 
	//echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());


	if(mysqli_num_rows($resultado)>0){

	while($fila = mysqli_fetch_array($resultado)){
			
		echo "<h1>Dietas disponibles para : ".$_SESSION['nombre_usuario']."</h1>";
			?>

	 <form name='form' action='asignar_rutina.proc.php' method="POST" >



	
	 <div class="col-sm-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title"><?php echo $fila['nombre_dieta']; ?></h3>
             </div>
             <div class="panel-body">
                          
<?php 
			
			echo "Duración Dieta : ".$fila['duracion_dieta']." <br>";
			echo "Valor energético diário : ".$fila['v_energetico_dieta']."Calorías <br>";
	?>

			
			<input type='hidden' name='id_dieta' value='<?php echo $fila['id_dieta'];?>'>
	<?php
			echo "Objetivo Dieta:  ".$fila['nombre_objetivo'].""; 
			 $id_dieta = $fila['id_dieta'];
			// $duracion_rutina = $fila['duracion_rutina'];
			// echo "<a href='asignar_rutina.proc.php?id_rutina=".$id_rutina."'>enviar</a>";
			
			?>
			<!-- <button onclick="alerta()"> <?php //echo $fila['nombre_rutina']; ?> </button> -->
			
		
			
			<br> <a href= <?php echo'"asignar_dieta.proc.php?id_dieta='.$id_dieta.'"'; ?>  onclick="$(this).closest('form').submit()" type="submit" class="btn btn-primary text-center" name="enviar" value="¡Empezar la dieta!">¡Empezar la dieta!</a>
			 </div>
			 </div>
			 </form> 
     </div> 
			<?php
		}

	}else{
		echo "No hay dietas para tu objetivo, asciende tu cuenta a premium para obtener más dietas.";
	}

	

	
?>