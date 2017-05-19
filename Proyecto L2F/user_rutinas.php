<?php
session_start();
include_once('conexio.php');

$id_usuario = $_SESSION['id_usuario'];
 $sql = "SELECT * FROM `tbl_usuario` WHERE `id_usuario` = ". $_SESSION['id_usuario'];

    $data_user=mysqli_query($conexion,$sql);
        while($data = mysqli_fetch_array($data_user))
             {
             	if($data['estado_usuario']=="Inactivo")
             	{
             		echo "<script type='text/javascript'>alert('¡Ep!¡No has rellenado el cuestionario, nos hacen falta los datos para poder ayudarte a conseguir tus objetivos!');
					location.href='cuestionario.php?err=2';</script>";
             		
             	}
             	else if($data['estado_usuario']=="Dado de baja")
             	{echo "<script type='text/javascript'>alert('¡Ep!¡Nos habías abandonado anteriormente!');
					location.href='index.php?err=2';</script>";
             	}
             	 
                $user_name = $data['nombre_usuario'] ." ". $data['apellidos_usuario'];
             }
      require_once("includes/header_rojo.php");

extract($_REQUEST);
?>

<script type="text/javascript">
	
function mostrarInfo(id_rutina){

    

if (window.XMLHttpRequest)
{// code for IE7+, Firefox, Chrome, Opera, Safari
xmlhttp=new XMLHttpRequest();
}
else
{// code for IE6, IE5
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
{
document.getElementById("datos").style.display='block';
document.getElementById("datos").innerHTML=xmlhttp.responseText;

}else{ 
//document.getElementById("datos").innerHTML='Cargando...';
}
}
xmlhttp.open("POST","ajax_ejer_rutinas.php",true);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send("$id_rutina="+id_rutina);


}

function esconder(){
	document.getElementById("datos").style.display='none';
}

</script>



<body>
<div class="container">
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
?>

      <div class="col-sm-11">
        <div class="panel panel-primary">
<?php
			echo "<h4>".$fila['nombre_rutina']."</h4>";	

			echo " <div class='panel-primary panel-heading' onclick='mostrarInfo(".$fila['id_rutina'].")'> Detalle rutina </div>";
            ?>
                 <div class="panel-primary alert-danger text-center" id='flecha' onclick='esconder()'><img id='up' src='media/img/icon/up.png' height="50" width="50" ></div>
<?php			echo "<div id='datos'></div>";

			//aqui vendrá la consulta en la cual se mirará que en la tbl_historial_rutina no esté el id_usuario, id_rutina y la fecha actual para evitar que vuelva a hacer ejercicio hoy. se le mandará un alert o algo... 

			$fecha_actual = date('Y-m-d');
			$sql = "SELECT * FROM tbl_historial_rutinas WHERE id_usuario = $id_usuario AND id_rutina= $id_rutina AND fecha = '$fecha_actual' ";

			if(mysqli_num_rows($resultado)>0){
				echo "<div class='panel-primary panel-heading' style='background-color: grey; color: white;'>Empezar rutina</div></div>";
			
		}else{
			echo "<a href='rutina_diaria.php?id_rutina=".$fila['id_rutina']."'> <div class='panel-primary panel-heading' style='background-color: #F00808; color: white;'>Empezar rutina</div></a></div>";
		}

		}
	}
}else{



?>

<h1>Rutinas disponibles para: <?php echo $_SESSION['nombre_usuario']?> </h1>
<?php

include('mostrar_rutinas_objetivo.php');
//echo $aux;
echo '</div>';
}

include('includes/footer_rojo.php');
?>


