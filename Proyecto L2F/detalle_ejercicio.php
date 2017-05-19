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
<script type="text/javascript">
	function atras(){
		history.back();
	}
	
</script>
<body>
<?php
		$sql = "SELECT * FROM tbl_ejercicio, tbl_rutina_ejer WHERE tbl_ejercicio.id_ejercicio = $id_ejercicio AND tbl_rutina_ejer.id_rutina_ejer = $id_rutina_ejer";

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
			echo "Repeticiones: ".$fila['repeticiones']."<br>";
			echo"<img src='".$fila['img_ejercicio']."' alt='".$fila['nombre_ejercicio']."' style='width:304px;height:228px;'><br>";
			// echo "Foto Imagen: ".$fila['img_ejercicio']."<br>";
			echo "Dia de la rutina: ".$fila['descripcion_ejercicio']."<br>";
			// echo "Dia de la rutina: ".$fila['num_dia']."<br>";
			echo " <button onclick='atras();'>Volver atras</button> </div> </div> </div>";
		}
	}
?>
</body>
</html>