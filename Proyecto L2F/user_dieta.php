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

<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>




<div class="container">
<h1>MI DIETA</h1>
<?php
$fecha_actual = date('Y-m-d');

//PRIMERO BUSCAMOS SI EL USUARIO TIENE ALGUNA RUTINA ASIGNADA
$sql = "SELECT * FROM tbl_dieta_usuario WHERE id_usuario = $id_usuario";
$resultado = mysqli_query($conexion, $sql) or die (mysqli_error());
if(mysqli_num_rows($resultado)>0){

    //REALIZAMOS OTRA CONSULTA PARA VER SI ESE USUARIO TIENE UNA DIETA SIN FINALIZAR
    $consulta = "SELECT * FROM tbl_dieta_usuario, tbl_dieta, tbl_usuario WHERE tbl_dieta.id_dieta = tbl_dieta_usuario.id_dieta  AND tbl_usuario.id_usuario = tbl_dieta_usuario.id_usuario AND dieta_finalizada = 'no' ";

    $resultado = mysqli_query($conexion, $consulta) or die (mysqli_error());

    //SI ES ASI, ENTONCES LE MOSTRAREMOS LOS DETALLES DE LA DIETA 
    if(mysqli_num_rows($resultado)>0){


        while($fila = mysqli_fetch_array($resultado)){

            $id_dieta = $fila['id_dieta'];
?>
      <div class="col-sm-11">
        <div class="panel panel-primary">
<?php
        

            echo " <div class='panel-primary panel-heading' onclick='mostrarInfo(".$id_dieta.")'>    ".$fila['nombre_dieta']." - Descargar PDF </div>";
            ?>
                 <div class="panel-primary alert-danger text-center" id='flecha' onclick='esconder()'><img id='up' src='media/img/icon/up.png' height="50" width="50" ></div>
<?php           echo "<div id='datos'></div>";
            
        }
            
            echo "<form action='finalizar_dieta.proc.php'>";
            echo "<input type='hidden' name='id_dieta' value='".$id_dieta."'> ";
            echo "<input type='submit' class='btn btn-primary' value='Finalizar Dieta'>";
            echo "</form>";


        //SI EL USUARIO SI  QUE ESTA PERO TIENE UNA RUTINA FINALIZADA ENTONCES SE LE INDICA SI QUIERE HACER UNA NUEVA O BIEN PUEDE IR A SU PERFIL PARA CAMBIAR EL OBJETIVO  
        }else{

            echo"Selecciona una nueva dieta o cambia tu objetivo desde tu perfil para nuevas dietas";
            //LINK A SU PERFIL???
            include('dietas_objetivo.php');
            //echo $aux;
            echo '</div>';
        }
}else{
    //EL USUARIO NO TIENE NINGUNA DIETA ASIGNADA, SE LE MOSTRARAN LAS DIETAS QUE TIENE DISPONIBLES SEGUN SU OBJETIVO


include('dietas_objetivo.php');
//echo $aux;
echo '</div>';
}


include('includes/footer_rojo.php');
?>







