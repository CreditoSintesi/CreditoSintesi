<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];
extract($_REQUEST);
include('includes/header_rojo.php');
?>
<style type="text/css">
	#boton{
  font-size: 1.5em;
  padding: 20px;
  border-width: thin medium thick 30px;
  border-color: blue;
  border-style: solid;
  color: black;
  width: 15%;
  }
  #flecha{
  font-size: 1.5em;
  padding: 1px;
  border-color: blue;
   border-style: solid;
  color: black;
  width: 5%;
  }
  #empezar{
  	 font-size: 1.5em;
	  padding: 20px;
	  border-width: thin medium thick 30px;
	  border-color: blue;
	  border-style: solid;
	  color: black;
	  width: 15%;
  }


</style>

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
			echo "Esta es tu rutina: ";
			echo $fila['nombre_rutina']."<br><br>";	

			echo " <div id=boton onclick='mostrarInfo(".$fila['id_rutina'].")'> Detalle rutina </div> <div id='flecha' onclick='esconder()'>↑</div>";
			echo "<p id='datos'></p>";

			//aqui vendrá la consulta en la cual se mirará que en la tbl_historial_rutina no esté el id_usuario, id_rutina y la fecha actual para evitar que vuelva a hacer ejercicio hoy. se le mandará un alert o algo... 
			echo "<div  id='empezar' ><a href='rutina_diaria.php?id_rutina=".$fila['id_rutina']."'> Empezar rutina </a></div>";
		}
	}
}else{



?>

<h1>Rutinas disponibles para: <?php echo $_SESSION['nombre_usuario']?> </h1>
<?php
include('mostrar_rutinas_objetivo.php');
//echo $aux;
}

include('includes/footer_rojo.php');
?>


