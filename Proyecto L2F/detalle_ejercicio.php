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
extract($_REQUEST);

include_once('includes/header_rojo.php')
?>
<script type="text/javascript">
	function atras(){
		history.back();
	}
	
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

	      <div class="col-md-8">
           <div class="panel panel-danger">
            
            <div class='panel-body'>
			<?php
			echo"<img src='".$fila['img_ejercicio']."' alt='".$fila['nombre_ejercicio']."' style='width:304px;height:228px;'><br>";
			echo "Series : ".$fila['series']."<br>";
			echo "Repeticiones: ".$fila['repeticiones']."<br>";
			// echo "Foto Imagen: ".$fila['img_ejercicio']."<br>";
			echo "Descripción: ".$fila['descripcion_ejercicio']."</div> </div> </div>";
			// echo "Dia de la rutina: ".$fila['num_dia']."<br>";
			echo " <button onclick='atras();'>Volver atras</button> ";
		}
	}

	?> 
</div>
</div>
</div>
	<?php
include_once('includes/footer_rojo.php')
?>
