<?php 
session_start();

extract($_REQUEST); //Recibimos $email_usuario i $pass_usuario
include_once('conexio.php');


//Encriptamos la password con hash sha512
$pass_usuario = hash('sha512',$pass_usuario);

$sql = "SELECT * FROM tbl_usuario WHERE email_usuario = '$email_usuario' AND pass_usuario = '$pass_usuario'";

$resultado=mysqli_query($conexion, $sql);

	if (mysqli_num_rows($resultado) != 0 ) {
		while ($usuario = mysqli_fetch_array($resultado)) {
			//hacemos la consulta y guardamos en las variables email y password el resultado de la consulta
			$email = $usuario['email_usuario'];
			$password = $usuario['pass_usuario'];
			//comprobamos que coinciden la pass y email del formulario con la consulta
			if ($email_usuario == $email && $pass_usuario == $password) {
				$_SESSION['id_usuario'] = $usuario['id_usuario'];
				$_SESSION['nombre_usuario'] = $usuario['nombre_usuario'];
				$_SESSION['email_usuario'] = $usuario['email_usuario'];
				echo $_SESSION['id_usuario']."<br>"; 
					echo $_SESSION['nombre_usuario']."<br>";
						echo $_SESSION['email_usuario']."<br>";

						$id_usuario = $_SESSION['id_usuario'];

			$sql = "SELECT * FROM tbl_usuario WHERE id_usuario = ".$id_usuario;
			
			$resultado=mysqli_query($conexion, $sql);

				if (mysqli_num_rows($resultado) != 0 ) {
					while ($usuario = mysqli_fetch_array($resultado)) {
							if ($usuario['estado_usuario'] == "Inactivo") {
								echo "el usuario esta inactivo";
								//die;
								header("location: cuestionario.php?err=2");
							}else{
								header('location: main.php');
							}

						}
				}
				
			}else{
				echo "error";
			}
		}
	} else {
		header('location: principal.php?err=1');
	}                      
?>