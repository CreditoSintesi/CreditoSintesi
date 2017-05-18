<?php 
	session_start();
	require_once("../conexio.php");
	extract($_POST);
	$updt_user_sql = "UPDATE `tbl_usuario` SET `nombre_usuario` = '".$ch_name."', `email_usuario` = '".$ch_mail."', `apellidos_usuario` = '".$ch_lastname."', `altura_usuario` = '".$ch_tall."', `id_objetivo` = '3', `id_tipo_cuerpo` = '3' WHERE `tbl_usuario`.`id_usuario` = ".$_SESSION['id_usuario'].";";
	//echo $updt_user_sql;die;
	if(mysqli_query($conexion,$updt_user_sql))
	{
		echo "<script type='text/javascript'>alert('¡Los cambios han sido realizados correctamente!');
					location.href='../perfilusuario.php';</script>";
	}
	else {
		echo "<script type='text/javascript'>alert('¡Ups! Ha surgido un error, intentelo mas tarde');
					location.href='../perfilusuario.php';</script>";
	}
 ?>