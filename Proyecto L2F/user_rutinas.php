<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];

?>
<!DOCTYPE html>
<html>
<head>
	<title>registro usuarios</title>
</head>
<body>

<?php
$fecha_actual = date('Y-m-d');

$sql = "SELECT * FROM tbl_rutina_usuario WHERE id_usuario = $id_usuario";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());
if(mysqli_num_rows($resultado)>0){
	$sql2 = "SELECT * FROM tbl_rutina_usuario, tbl_rutina WHERE tbl_rutina_usuario.id_rutina=tbl_rutina.id_usuario fecha_fin <= $fecha_actual";
	$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){
		while($fila = mysqli_fetch_array($resultado)){
			echo $fila['id_rutina'];
		}
	}
}else{


echo $sql;
?>

<h1>Rutinas disponibles para: <?php echo $_SESSION['nombre_usuario']?> </h1>
<?php
include('mostrar_rutinas_objetivo.php');
}
?>


</body>
</html>