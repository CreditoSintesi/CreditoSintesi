<?php 
	session_start();
	require_once("../conexio.php");
	extract($_POST);
	$fecha_actual=date('Y/m/d');
	//Cogemos todos los ID de las partes del cuerpo
	$part_body_id_sql = "SELECT * FROM tbl_parte_cuerpo";
	$part_body_id_query = mysqli_query($conexion, $part_body_id_sql);
	while($part_body_id = mysqli_fetch_array($part_body_id_query))
	{

		//Segun el valor del nombre, le asignaremos el id correspondiente 
		switch ($part_body_id['nombre_parte_cuerpo']) {
			case 'Brazo':
				$id_brazo = $part_body_id['id_parte_cuerpo'];
				break;
			case 'Antebrazo':
				$id_antebrazo = $part_body_id['id_parte_cuerpo'];
				break;
			case 'Pectoral':
				$id_pectoral = $part_body_id['id_parte_cuerpo'];
				break;
			case 'Cintura':
				$id_cintura = $part_body_id['id_parte_cuerpo'];
				break;
			case 'Cadera':
				$id_cadera = $part_body_id['id_parte_cuerpo'];
				break;
			case 'Cuadricep':
				$id_cuadricep = $part_body_id['id_parte_cuerpo'];
				break;
			case 'Gemelo':
				$id_gemelo = $part_body_id['id_parte_cuerpo'];
				break;
			default:
				# code...
				break;
		}
		
	}
	//SQLs
		$sql_his_brazo = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_brazo."', '".$cm_brazo."');";
		$sql_his_antebrazo = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_antebrazo."', '".$cm_antebrazo."');";
		$sql_his_pectoral = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_pectoral."', '".$cm_pectoral."');";
		$sql_his_cintura = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_cintura."', '".$cm_cintura."');";
		$sql_his_cadera = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_cadera."', '".$cm_cadera."');";
		$sql_his_cuadricep = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_cuadricep."', '".$cm_cuadricep."');";
		$sql_his_gemelo = "INSERT INTO `tbl_historial_medidas` (`id_usuario`, `fecha_his_med`, `id_parte_cuerpo`, `cm`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$id_gemelo."', '".$cm_gemelo."');";
	//PETICIONES A LA BD
		$query_his_brazo=mysqli_query($conexion,$sql_his_brazo);
		$query_his_antebrazo=mysqli_query($conexion,$sql_his_antebrazo);
		$query_his_pectoral=mysqli_query($conexion,$sql_his_pectoral);
		$query_his_cintura=mysqli_query($conexion,$sql_his_cintura);
		$query_his_cadera=mysqli_query($conexion,$sql_his_cadera);
		$query_his_cuadricep=mysqli_query($conexion,$sql_his_cuadricep);
		$query_his_gemelo=mysqli_query($conexion,$sql_his_gemelo);
	//Return
		echo "<script type='text/javascript'>alert('¡Medidas insertadas correctamente! ¡Sigue entrenando!');
			location.href='../perfilusuario.php'</script>";