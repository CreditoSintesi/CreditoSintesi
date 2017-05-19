<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];
extract($_REQUEST);
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<style type="text/css">
	#rutina{
  font-size: 1.5em;
  padding: 20px;
  border-width: thin medium thick 30px;
  border-color: blue;
  border-style: solid;
  color: black;
  width: 25%;
  }
</style>
<body>

<h1>Rutina del día</h1>
	<form action="sesion_finalizada.proc.php">
<?php

//MOSTRAR EJERCICIOS QUE TOCAN
//primero comprobamos que el id_usuario y el id_rutina está en la tbl_historial_rutinas , si es así, habrá que mirar ultima sesion rutina (fecha más antigua?) y luego comparar con las sesiones_semana_rutina de la tbl_rutina de esa rutina. si el numero de sesion_rutina y sesion_semana_rutina son iguales, entonces hay que mostrar los ejercicios de dia 1 otra vez.
//si el usuario no está entonces se muestran los ejercicios de la primera sesion

$sql = "SELECT * FROM tbl_historial_rutinas WHERE id_usuario = $id_usuario AND id_rutina= $id_rutina";

	// echo $sql ."<br><br>";

	$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){
		//echo "hay datos";
		//primero se comprueba que la sesion 

		//aqui se mostrará los ejercicios de la rutina en la sesiòn +1 
		$consulta= "SELECT * 
      FROM `tbl_rutina_ejer`
INNER JOIN `tbl_ejercicio`
        ON `tbl_ejercicio`.`id_ejercicio` = `tbl_ejercicio`.`id_ejercicio`
INNER JOIN `tbl_rutina`
        ON `tbl_rutina_ejer`.`id_rutina` = `tbl_rutina`.`id_rutina`
INNER JOIN `tbl_historial_rutinas`
        ON `tbl_rutina_ejer`.`id_rutina` = `tbl_historial_rutinas`.`id_rutina`
     WHERE `id_rutina` = '$id_rutina'";

		 echo $consulta ."<br><br><br><br>";

		$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());	
		if(mysqli_num_rows($resultado)>0){
				echo "Ejercicios sesion 1";
		
			while($fila = mysqli_fetch_array($resultado)){
				echo "<div id='rutina'>";
				echo " Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."<br>";
				echo "Series : ".$fila['series']."<br>";
				echo "repeticiones: ".$fila['repeticiones']."<br>";
				echo "<input type='checkbox' name='vehicle1'>";
				echo "<input type='hidden' name='id_rutina' value=".$fila['id_rutina'].">";
				echo "<input type='hidden' name='sesion_rutina' value=1>";
				echo "</div><br><br><br>";

			}
		}



	}else{
		//echo "no hay datos";

		//ahora mostraremos todos los ejercicios de la rutina con el dia de la sesion 1.


		$sql2 = "SELECT  * FROM tbl_rutina, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina_ejer.num_dia = '1'";

		// echo $sql2 ."<br><br><br><br>";

		$resultado = mysqli_query($conexion, $sql2) or die (mysqli_error());	
		if(mysqli_num_rows($resultado)>0){
				echo "Ejercicios sesion 1";
		
			while($fila = mysqli_fetch_array($resultado)){
				echo "<div id='rutina'>";
				echo " Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."<br>";
				echo "Series : ".$fila['series']."<br>";
				echo "repeticiones: ".$fila['repeticiones']."<br>";
				echo "<input type='checkbox' name='vehicle1'>";
				echo "<input type='hidden' name='id_rutina' value=".$fila['id_rutina'].">";
				echo "<input type='hidden' name='sesion_rutina' value=1>";
				echo "</div><br><br><br>";

			}
		}

	}

//AÑADIR HISTORIAL A LA BD
//Luego habrá que mirar si la suma total de id_historial_rutina con los id_rutina y id_usuario hacen el total de sesiones de la rutina 
//(el total de sesiones se hará cojiendo la duracion en meses * 4 semanas que tiene cada mes * numero de sesiones semanales)
//si el total de id es igual al total de sesiones entonces se dará por finalizada la rutina.



// $sql = "SELECT DISTINCT * FROM tbl_rutina, tbl_objetivo, tbl_rutina_ejer, tbl_ejercicio WHERE tbl_rutina.id_rutina= $id_rutina AND tbl_rutina.id_rutina = tbl_rutina_ejer.id_rutina AND tbl_rutina_ejer.id_ejercicio = tbl_ejercicio.id_ejercicio AND tbl_rutina.id_objetivo = tbl_objetivo.id_objetivo";

// 	//echo $sql ."<br><br><br><br>";
// 	$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
// 	if(mysqli_num_rows($resultado)>0){
// 			$cont = 1;
// 		while($fila = mysqli_fetch_array($resultado)){
// 			echo "<div id='rutina'>";
// 			echo " Ejercicio ".$cont." : ".$fila['nombre_ejercicio']."<br>";
// 			echo "Series : ".$fila['series']."<br>";
// 			echo "repeticiones: ".$fila['repeticiones']."<br>";
// 			echo "Sesion de la rutina: ".$fila['num_dia'];
// 			echo "</div><br><br><br>";
// 			$cont++;
// 		}
// 	}
?>
<br>
<input type="submit" value="Acabar ejercicios">
</form>
</body>
</html>