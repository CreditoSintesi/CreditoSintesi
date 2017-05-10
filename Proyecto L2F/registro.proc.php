<?php
	session_start();
	include_once('conexio.php');

	extract($_REQUEST);

	if($pass_usuario !=  $pass_usuario2 ){
		//lo mandamos a la mierda
		$_POST['error'] = "las contraseñas no coinciden";
		header('location: principal.php');

	}else{
		
		$pass_usuario=  hash('sha512',$pass_usuario);
		$fecha_registro = date('Y-m-d');

		$sql = "INSERT INTO `tbl_usuario` (`nombre_usuario`, `email_usuario`, `pass_usuario`, `fecha_registro`) VALUES ('$nombre_usuario', '$email_usuario', '$pass_usuario', '$fecha_registro')";
		echo $sql;
		$resultado=mysqli_query($conexion, $sql);

		$id = mysqli_insert_id($conexion);

		$_SESSION['id_usuario'] = $id;
		$_SESSION['nombre_usuario'] = $nombre_usuario;

		header('location: cuestionario.php');
	}
?>