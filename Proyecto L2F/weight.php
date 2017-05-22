<?php 
  require_once("conexio.php");
  require_once("includes/header_azul.php"); 
  //session_start();
  //consulta para obtener todos los pesos del usuario
  $select_weight_sql = "SELECT * FROM `tbl_historial_peso` WHERE id_usuario = ".$_SESSION['id_usuario']." ORDER BY `fecha_his_pes` ASC";
  //echo $select_weight_sql;die;
  $select_weight_query = mysqli_query($conexion,$select_weight_sql);
  echo "<div class='col-md-6'>";
  echo "<table class='table'>";
  echo "<tr><th>Fecha</th><th>Peso</th>";
  while($data_weight = mysqli_fetch_array($select_weight_query))
  {
  	echo "<tr><td>".$data_weight['fecha_his_pes']."</td><td>".$data_weight['peso']."</td></tr>";
  }
  echo "</table>";
  echo "</div>";
?>
<div class='col-md-6'>
	<br/>
	<br/>
	<img src="proc/weight_grafic.proc.php"> 
</div>
<br/>
<a href="perfilusuario.php"><button>Volver</button></a>