<?php


include_once('includes/header_rojo.php')
?>
<script type="text/javascript">

function ejercicio(){
document.getElementById("imagen").style.display = "none";
document.getElementById("info").style.display = "block";
document.getElementById("img").style.src = "Media/img/icon/ntxt.png";
}

function txt(){
document.getElementById("imagen").style.display = "block";
document.getElementById("info").style.display = "none";
document.getElementById("txto").style.src = "Media/img/icon/nimg.png";

}

</script>
	
</script>

<body>

	 	


<?php
		$sql = "SELECT * FROM tbl_ejercicio, tbl_rutina_ejer WHERE tbl_ejercicio.id_ejercicio = $id_ejercicio AND tbl_rutina_ejer.id_rutina_ejer = $id_rutina_ejer";

	//echo $sql ."<br><br><br><br>";
	$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());	
	if(mysqli_num_rows($resultado)>0){

		while($fila = mysqli_fetch_array($resultado)){
			?>
		<div class="container">
		 <div class="row">
		   <h3>
			<?php
			echo $fila['nombre_ejercicio']."</h3>";

			?>

	      <div class="col-md-12 col-xs-18">
           <div class="panel panel-danger">
           
            <div class='panel-body'>
			<?php
			echo"<img class='featurette-image img-responsive center-block' id='imagen' src='".$fila['img_ejercicio']."' alt='".$fila['nombre_ejercicio']."' style='width:250px;height:250px;'> <br>";
			echo "<div id='info' style='display:none;'><b>Series : </b> ".$fila['series']."<br>";
			echo "<b>Repeticiones : </b> ".$fila['repeticiones']."<br>";
			// echo "Foto Imagen: ".$fila['img_ejercicio']."<br>";
			echo "<b>Descripción : </b> ".$fila['descripcion_ejercicio']."<br><br></div>";
?>	
			<div class="container">
				<div class="col-md-2  col-xs-8 img-responsive center-block">
					<img id='img' onclick='txt()' src="Media\img\icon\img.png" width='32px' height='32px' >
				</div>
				<div class="col-md-2  col-xs-4 img-responsive center-block">
					<img id='txto' onclick='ejercicio ()' src="Media\img\icon\txt.png" width='32px' height='32px' >
				</div>
			</div>
			</div> </div> </div></div>
<?php
			// echo "Dia de la rutina: ".$fila['num_dia']."<br>";
			
		}
	}

	?> 
</div>
</div>
</div>
	<?php
include_once('includes/footer_rojo.php')
?>
