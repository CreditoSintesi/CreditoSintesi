<?php
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
xmlhttp.open("POST","ajax_ejer_rutinas.php?id_rutina="+id_rutina ,true);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send('$id_rutina='+id_rutina);

}

function esconder(){
	document.getElementById("datos").style.display='none';
}

</script>



<body>
<div class="container">
<h1>Mis rutinas</h1>
<?php
$fecha_actual = date('Y-m-d');

//PRIMERO BUSCAMOS SI EL USUARIO TIENE ALGUNA RUTINA ASIGNADA
$sql = "SELECT * FROM tbl_rutina_usuario WHERE id_usuario = $id_usuario";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());
if(mysqli_num_rows($resultado)>0){

	//REALIZAMOS OTRA CONSULTA PARA VER SI ESE USUARIO TIENE UNA RUTINA SIN FINALIZAR
	$consulta = "SELECT * FROM tbl_rutina_usuario, tbl_rutina, tbl_usuario WHERE tbl_rutina.id_rutina = tbl_rutina_usuario.id_rutina  AND tbl_usuario.id_usuario = tbl_rutina_usuario.id_usuario AND rutina_finalizada = 'no' AND  tbl_rutina_usuario.id_usuario = $id_usuario ";
	echo $consulta;
	$resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

	//SI ES ASI, ENTONCES LE MOSTRAREMOS LOS DETALLES DE LA RUTINA O EMPEZAR A HACER EJERCICIO
	if(mysqli_num_rows($resultado)>0){


		while($fila = mysqli_fetch_array($resultado)){

			$id_rutina = $fila['id_rutina'];
?>
      <div class="col-sm-11">
        <div class="panel panel-primary">
<?php
		

			echo " <div class='panel-primary panel-heading' onclick='mostrarInfo(".$id_rutina.")'> Ejercicios :  ".$fila['nombre_rutina']."  </div>";
            ?>
                 <div class="panel-primary alert-danger text-center" id='flecha' onclick='esconder()'><img id='up' src='media/img/icon/up.png' height="50" width="50" ></div>
<?php			echo "<div id='datos'></div>";
			
		}
			//EN ESTA PARTE SI EL USUARIO YA HA HECHO EJERCICIO HOY, EL BOTON ESTARA BLOQUEADO. 

			$sql = "SELECT * FROM tbl_historial_rutinas WHERE id_usuario = $id_usuario AND id_rutina= $id_rutina AND fecha = '$fecha_actual' ";

			$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());
			if(mysqli_num_rows($resultado)>0){
				echo "<div class='panel-primary panel-heading' style='background-color: grey; color: white;'>Empezar rutina</div></div>";
				
			}else{
				echo "<a href='rutina_diaria.php?id_rutina=".$id_rutina."'> <div class='panel-primary panel-heading' style='background-color: #F00808; color: white;'>Empezar rutina</div></a></div>";
			}

			echo "<form action='finalizar_rutina.proc.php'>";
			echo "<input type='hidden' name='id_rutina' value='".$id_rutina."'> ";
			?>
			<div class="text-center panel-body">
			<?php
			echo "<input type='submit' class='btn btn-primary' value='Finalizar Rutina'> </div>";
			echo "</form>";


		//SI EL USUARIO SI 	QUE ESTA PERO TIENE UNA RUTINA FINALIZADA ENTONCES SE LE INDICA SI QUIERE HACER UNA NUEVA O BIEN PUEDE IR A SU PERFIL PARA CAMBIAR EL OBJETIVO	
		}else{

			echo"Selecciona una nueva Rutina o cambia tu objetivo desde tu perfil para nuevas rutinas";
			//LINK A SU PERFIL???
			include('mostrar_rutinas_objetivo.php');
			//echo $aux;
			echo '</div>';
		}
}else{
	//EL USUARIO NO TIENE NINGUNA RUTINA ASIGNADA, SE LE MOSTRARAN LAS RUTINAS QUE TIENE DISPONIBLES 

?>

<h1>Rutinas disponibles para: <?php echo $_SESSION['nombre_usuario']?> </h1>
<?php

include('mostrar_rutinas_objetivo.php');
//echo $aux;
echo '</div>';
}

echo '</div></div></div>';
include('includes/footer_rojo.php');
?>


