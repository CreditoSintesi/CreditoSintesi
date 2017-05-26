<?php 
	session_start();
	require_once("../conexio.php");
	extract($_POST);
	$fecha_actual=date('Y/m/d');
	//$fecha_actual="2017/05/16";
	$insert_height_sql= "INSERT INTO `tbl_historial_peso` ( `id_usuario`, `fecha_his_pes`, `peso`) VALUES ('".$_SESSION['id_usuario']."', '".$fecha_actual."', '".$height."');";
		//Creamos una consulta para coger el último peso, el nombre del objetivo y la fecha del peso
	$last_height_sql = "SELECT tbl_usuario.id_usuario, peso,nombre_objetivo, fecha_his_pes
				FROM tbl_usuario
					RIGHT JOIN tbl_historial_peso ON tbl_usuario.id_usuario = tbl_historial_peso.id_usuario
					RIGHT JOIN tbl_objetivo ON tbl_usuario.id_objetivo = tbl_objetivo.id_objetivo
				WHERE tbl_usuario.id_usuario=".$_SESSION['id_usuario']."  
					ORDER BY `tbl_historial_peso`.`fecha_his_pes` DESC 
					LIMIT 0,1";
		$last_height_query = mysqli_query($conexion,$last_height_sql);
		while($last_height_data = mysqli_fetch_array($last_height_query))
		{

			if($last_height_data['nombre_objetivo']=='Adelgazar')
			{
				
				if($last_height_data['peso']<$height)
				{
					echo "<script type='text/javascript'>
							alert('¡Vaya! Parece ser que has engordado desde la última vez, no te preocupes, piensa en que has podido fallar y ¡solucionalo! si ves que no puedes, recuerda!,tenemos técnicos especialistas que te pueden ayudar');
						</script>";
				}
			}
		}
		$insert_height_query=mysqli_query($conexion,$insert_height_sql);
		if($insert_height_query)
		{
			echo "<script type='text/javascript'>alert('¡Peso insertado correctamente ya puedes acceder a él!');
					location.href='../perfilusuario.php';</script>";
		}
	
		else 
		{
			echo "<script type='text/javascript'>alert('¡Ups!¡Ha ocurrido un error! Por favor inténtelo mas tarde');
			location.href='../perfilusuario.php'</script>";
		}
	//echo $height;
 ?>