<?php

include_once('conexio.php');
extract($_REQUEST);

$consulta = "SELECT DISTINCT * FROM tbl_rutina, tbl_objetivo WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_objetivo = tbl_objetivo.id_objetivo";

	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){

		while($fila = mysqli_fetch_array($resultado)){
		

		?>	
		<div class='container'>
		<div class='col-md-10'><br>
		<?php
			//echo "Duracion rutina   : ".$fila['duracion_rutina']."  --   Objetivo:   ".$fila['nombre_objetivo']."<br><br><br>";
				
		}
	}


$sql = "SELECT DISTINCT * FROM tbl_rutina, tbl_objetivo, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina.id_objetivo = tbl_objetivo.id_objetivo order by tbl_rutina_ejer.num_dia ";

	//echo $sql ."<br><br><br><br>";
	$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){

		while($fila = mysqli_fetch_array($resultado)){
			?>
	      <div class="col-md-3">
          <div class="panel panel-danger">
            <div class="panel-heading">
              <h3 class="panel-title">
			<?php

			echo $fila['nombre_ejercicio']."</h3> </div>
            <div class='panel-body'>";
			echo "Series : ".$fila['series']."<br>";
			echo "repeticiones: ".$fila['repeticiones']."<br>";
			echo "Dia de la rutina: ".$fila['num_dia']."<br>";

			echo "<div class='text-center col-md-12 panel-body' ><a class='btn btn-primary' href='detalle_ejercicio.php?id_ejercicio=".$fila['id_ejercicio']."&id_rutina_ejer=".$fila['id_rutina_ejer']."'> Ver más detalles </a></div> </div> </div> </div>";
				
			
		}
	}



?>

</div>
</div>