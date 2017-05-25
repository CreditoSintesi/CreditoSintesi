<?php
require_once("includes/header_rojo.php");
$id_usuario = $_SESSION['id_usuario'];

	extract($_REQUEST);

	include("conexio.php");
?>
<div class="container">
<h1>Rutina del día</h1>
<div class="col-md-12">
	<form action="sesion_finalizada.proc.php">
<?php
//MOSTRAR EJERCICIOS QUE TOCAN
//primero comprobamos que el id_usuario y el id_rutina está en la tbl_historial_rutinas , si es así, habrá que mirar ultima sesion rutina (fecha más antigua?) y luego comparar con las sesiones_semana_rutina de la tbl_rutina de esa rutina. si el numero de sesion_rutina y sesion_semana_rutina son iguales, entonces hay que mostrar los ejercicios de dia 1 otra vez.
//si el usuario no está entonces se muestran los ejercicios de la primera sesion

$consulta = "SELECT *, MAX(fecha) as 'ultima_fecha' FROM tbl_historial_rutinas, tbl_rutina WHERE  tbl_historial_rutinas.id_usuario = $id_usuario AND tbl_historial_rutinas.id_rutina = tbl_rutina.id_rutina " ;
 
   echo $consulta."<br><br><br><br>";
$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

	$res = mysqli_fetch_array($resultado);

	// print_r($res);

	if(mysqli_num_rows($resultado)>0){
		echo "aqui";
		// print_r ($resultado);
		//echo "hay datos";
		//primero se comprueba que la sesion 

		if (($res['id_historial_rutinas']!=null)) {
			echo "he entrado";
	
		$cont = 1 ;
		// echo $cont;
		

		print_r($res);
		while($res){

			$ultima_fecha = $res['ultima_fecha'];
			$sesiones_semana_rutina = $res['sesiones_semana_rutina']; //sesiones a la semana//
			$duracion = $res['duracion_rutina']; //en meses
<<<<<<< HEAD
			 // echo $sesiones_semana_rutina;

=======
			 //echo $sesiones_semana_rutina;
>>>>>>> origin/master
			$sql = "SELECT fecha, id_historial_rutinas, sesion_rutina FROM tbl_historial_rutinas WHERE id_usuario = $id_usuario AND id_rutina= $id_rutina AND fecha = '$ultima_fecha'";

			 echo $sql."<br><br><br><br>";
			$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
			if(mysqli_num_rows($resultado)>0){
			//echo "hay datos";
			//primero se comprueba que la sesion 
			while($res = mysqli_fetch_array($resultado)){

				$sesion_rutina = $res['sesion_rutina'];
				 //echo $sesion_rutina;
				if ($sesion_rutina == $sesiones_semana_rutina) {
					
					//si son iguales entonces hay que empezar con la sesion 1
					$sql2 = "SELECT  * FROM tbl_rutina, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina_ejer.num_dia = '1' ";

					 // echo $sql2."<br><br><br><br>";
					$cont = 1;
					$resultado = mysqli_query($conexion, $sql2) or die (mysqli_error());	
					if(mysqli_num_rows($resultado)>0){
							echo " <h4> Ejercicios sesion 1</h4>";
							while($fila = mysqli_fetch_array($resultado)){
							
						
							echo "<div class='col-md-4'> <div class='panel panel-primary'> <div class='panel-heading'> Ejercicio ".$cont." : ".$fila['nombre_ejercicio']." </div>";
							echo "<div class='panel-body'>  Series : ".$fila['series']."<br>";
							echo "Repeticiones: ".$fila['repeticiones']."<br>";
							
							echo "<input type='hidden' name='id_rutina' value=".$fila['id_rutina'].">";
							echo "<input type='hidden' name='sesion_rutina' value=1>";
							echo "</div></div></div>";
							$cont++;
						}
					}
				}else if ($sesion_rutina > $sesiones_semana_rutina){

					//si no son iguales entonces se mostrara los ejercicios de la sesion  1

					$sesion_rutina = 1; 

					//aqui se mostrará los ejercicios de la rutina en la sesiòn +1 

					$consulta= "SELECT * FROM tbl_historial_rutinas, tbl_rutina, tbl_ejercicio, tbl_rutina_ejer WHERE tbl_historial_rutinas.id_rutina = tbl_rutina.id_rutina AND tbl_rutina_ejer.id_ejercicio= tbl_ejercicio.id_ejercicio AND tbl_rutina_ejer.id_rutina=tbl_historial_rutinas.id_rutina AND tbl_rutina_ejer.num_dia = $sesion_rutina AND tbl_rutina.id_rutina = $id_rutina ";

					 // echo $consulta ."<br><br><br><br>";

					$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());	
					if(mysqli_num_rows($resultado)>0){

						echo "<div class='panel-primary panel-heading'> <h4>Ejercicios sesion  ".$sesion_rutina."</h4></div><br>";
							
					
						while($fila = mysqli_fetch_array($resultado)){
	
							echo "<div class='col-md-4'> <div class='panel panel-primary'> <div class='panel-heading'> Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."</div>";
							echo "<div class='panel-body'> Series : ".$fila['series']."<br>";
							echo "Repeticiones: ".$fila['repeticiones']."<br>";
							echo "<input type='hidden' name='id_rutina' value=".$id_rutina.">";
							echo "<input type='hidden' name='sesion_rutina' value=".$sesion_rutina.">";
							echo "</div></div></div>";
							$cont++;
						}
					}
				}else{
					//si no son iguales entonces se mostrara los ejercicios de la sesion = sesion + 1

					++$sesion_rutina; 

					//aqui se mostrará los ejercicios de la rutina en la sesiòn +1 

					$consulta= "SELECT * FROM tbl_historial_rutinas, tbl_rutina, tbl_ejercicio, tbl_rutina_ejer WHERE tbl_historial_rutinas.id_rutina = tbl_rutina.id_rutina AND tbl_rutina_ejer.id_ejercicio= tbl_ejercicio.id_ejercicio AND tbl_rutina_ejer.id_rutina=tbl_historial_rutinas.id_rutina AND tbl_rutina_ejer.num_dia = $sesion_rutina AND tbl_rutina.id_rutina = $id_rutina GROUP BY tbl_rutina_ejer.id_ejercicio";

					 // echo $consulta ."<br><br><br><br>";

					$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());	
					if(mysqli_num_rows($resultado)>0){
						$cont = 1;
						echo "<h4>Ejercicios sesion  ".$sesion_rutina."</h4><br>";
							
					
						while($fila = mysqli_fetch_array($resultado)){

							echo "<div class='col-md-4'> <div class='panel panel-primary'> <div class='panel-heading'>  Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."</div>";
							echo "<div class='panel-body'> Series : ".$fila['series']."<br>";
							echo "Repeticiones: ".$fila['repeticiones'];
							echo "<input type='hidden' name='id_rutina' value=".$id_rutina.">";
							echo "<input type='hidden' name='sesion_rutina' value=".$sesion_rutina.">";
							echo "</div></div></div>";
							$cont ++;
						}
					}
				}

				//aqui acaba los condicionales si hay usuario en tbl_rutina_usuario
			}
			}
		}	

	
// echo $res['id_historial_rutinas'];
		}else{
			$sql2 = "SELECT  * FROM tbl_rutina, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina_ejer.num_dia = '1'";

		echo $sql2 ."<br><br><br><br>";
		$cont = 1;
		$resultado = mysqli_query($conexion, $sql2) or die (mysqli_error());	
		if(mysqli_num_rows($resultado)>0){

				echo "<h4>Ejercicios sesion primera sesión:</h4>";

			while($fila = mysqli_fetch_array($resultado)){
		
				echo "<div class='col-md-4'> <div class='panel panel-primary'> <div class='panel-heading'>  Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."</div>";
				echo "<div class='panel-body'> Series : ".$fila['series']."<br>";
				echo "Repeticiones: ".$fila['repeticiones']."<br>";
				echo "<input type='hidden' name='id_rutina' value=".$fila['id_rutina'].">";
				echo "<input type='hidden' name='sesion_rutina' value=1>";
				echo "</div></div></div>";
				$cont++;
			}
			$res = mysqli_fetch_array($resultado);
			// print_r($res);
		}
		}
}
	/*else{
		//echo "no hay datos";

		//ahora mostraremos todos los ejercicios de la rutina con el dia de la sesion 1.


		$sql2 = "SELECT  * FROM tbl_rutina, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina_ejer.num_dia = '1'";

		echo $sql2 ."<br><br><br><br>";
		$cont = 1;
		$resultado = mysqli_query($conexion, $sql2) or die (mysqli_error());	
		if(mysqli_num_rows($resultado)>0){

				echo "<h4>Ejercicios sesion 1:</h4>";

			while($fila = mysqli_fetch_array($resultado)){
		
				echo "<div class='col-md-4'> <div class='panel panel-primary'> <div class='panel-heading'>  Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."</div>";
				echo "<div class='panel-body'> Series : ".$fila['series']."<br>";
				echo "Repeticiones: ".$fila['repeticiones']."<br>";
				echo "<input type='hidden' name='id_rutina' value=".$fila['id_rutina'].">";
				echo "<input type='hidden' name='sesion_rutina' value=1>";
				echo "</div></div></div>";
				$cont++;
			}
		}

	}
*/

?>
</div>
</div>
</div>
<div class="text-center col-md-12 panel-body">
<input class="btn btn-primary text-center" type="submit" value="Acabar ejercicios"></div>
</form>
<?php
include('includes/footer_rojo.php');
?>
