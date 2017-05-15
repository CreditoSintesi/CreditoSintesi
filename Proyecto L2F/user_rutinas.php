<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];
extract($_REQUEST);
?>
<!DOCTYPE html>
<html>
<head>
	<title>registro usuarios</title>
</head>

<body>
<h1>MIS RUTINAS</h1>
<?php
$fecha_actual = date('Y-m-d');

$sql = "SELECT * FROM tbl_rutina_usuario WHERE id_usuario = $id_usuario";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());
if(mysqli_num_rows($resultado)>0){

	$sql2 = "SELECT DISTINCT * FROM tbl_rutina_usuario , tbl_rutina, tbl_usuario WHERE tbl_rutina.id_rutina = tbl_rutina_usuario.id_rutina  AND tbl_usuario.id_usuario = tbl_rutina_usuario.id_usuario AND fecha_fin > $fecha_actual GROUP BY tbl_rutina.nombre_rutina ";

	//cho $sql2 ."<br>";
	$resultado = mysqli_query($conexion, $sql2) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){

		while($fila = mysqli_fetch_array($resultado)){
			echo "Esta es tu rutina: ";
			echo $fila['nombre_rutina'];	


		}
	}
}else{



?>
<script type="text/javascript">
	function alerta(nombre_rutina) {
		alert(nombre_rutina);
	}
</script>
<h1>Rutinas disponibles para: <?php echo $_SESSION['nombre_usuario']?> </h1>
<?php
include('mostrar_rutinas_objetivo.php');
echo $aux;
}
?>


</body>
</html>