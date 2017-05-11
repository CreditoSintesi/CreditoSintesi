<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];

$sql = "SELECT * FROM tbl_usuario WHERE id_usuario = ".$id_usuario;
$resultado=mysqli_query($conexion, $sql);

	if (mysqli_num_rows($resultado) != 0 ) {
		while ($usuario = mysqli_fetch_array($resultado)) {
				if ($usuario['estado_usuario'] == 'Inactivo') {
					header("location : cuestionario.php?err=2");
				}
			}
	}

?>
<!DOCTYPE html>
<html>
<head>
	<title>registro usuarios</title>
</head>
<body>	
<h1>Bienvenido a tu Main pag <?php echo $_SESSION['nombre_usuario']?> </h1>

<a href="user_rutinas.php">Ir a mis rutinas</a>


</body>
</html>