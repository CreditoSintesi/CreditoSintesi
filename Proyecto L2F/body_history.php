<?php 
  require_once("conexio.php");
  require_once("includes/header_azul.php"); 
  //session_start();
  //consulta para obtener todos los pesos del usuario
 //Obtenemos las medidas de usuario 
      //SQL
        //brazo
            $select_brazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=2";
            //echo $select_brazo_sql;die;
        //Antebrazo
             $select_antebrazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=3";
        //Pectoral
             $select_pectoral_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=4";
        //Cintura
             $select_cintura_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=5";
        //Cadera
              $select_cadera_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=6";
        //Cuadricep
               $select_cuadricep_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=7";
        //Gemela
               $select_gemelo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=8";
        //Querys
               $select_brazo_query=mysqli_query($conexion,$select_brazo_sql);
               $select_antebrazo_query=mysqli_query($conexion,$select_antebrazo_sql);
               $select_pectoral_query=mysqli_query($conexion,$select_pectoral_sql);
               $select_cintura_query=mysqli_query($conexion,$select_cintura_sql);
               $select_cadera_query=mysqli_query($conexion,$select_cadera_sql);
               $select_cuadricep_query=mysqli_query($conexion,$select_cuadricep_sql);
               $select_gemelo_query = mysqli_query($conexion,$select_gemelo_sql);
?>
<div class='col-md-6'>
	<br/>
	<br/>
	<img src="proc/bicep_grafic.proc.php"> 
</div>
<br/>
<a href="perfilusuario.php"><button>Volver</button></a>