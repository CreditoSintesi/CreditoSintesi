
<?php 
    session_start(); //Iniciamos la sessión
     //Incluimos la conexion con la BBDD
   
     require_once("conexio.php");
     //Consulta para obtener los datos del usuario
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
      require_once("includes/header_azul.php")
 ?>
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Services Panels</h2>
            </div>
            <?php echo "<a href='perfilusuario.php?id=".$_SESSION['id_usuario']."'>"; ?>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <img src="media/img/icon/perfilboy.png" class="img-responsive img-circle" style="margin: auto;">
                    </div>
                    <div class="panel-body">
                        <h4>Perfil</h4>
                        <p>Accede a tu historial de pesos y medidas o modifica tus datos de registro.</p><br>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
            </a>
            <?php echo "<a href='user_rutinas.php?id=".$_SESSION['id_usuario']."'>"; ?>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                        <img src="media/img/icon/mancuerna.png" class="img-responsive img-circle" style="margin: auto;">
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Rutina</h4>
                        <p>¡Accede a tu rutina, selecciona una nueva rutina, rellena días o cambia la rutina!.
                        <br/>
                        ¡Tú puedes!</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
            </a>
            <?php echo "<a href='user_dieta?id=".$_SESSION['id_usuario']."'>"; ?>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                        <img src="media/img/icon/dieta.png" class="img-responsive img-circle" style="margin: auto;">
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Dieta</h4>
                        <p>!Observa tu dieta actual, cambiala, revisa los nuevos platos¡.
                        <br/>
                        ¡La dieta también es importante!</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
            </a>
            <?php echo "<a href='user_add_service?id=".$_SESSION['id_usuario']."'>"; ?>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                        <img src="media/img/icon/Servicio.png" class="img-responsive img-circle" style="margin: auto;">
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Servicios</h4>
                        <p>La personalización acelera los resultados<br/>
                        ¡Contrata a nuestros especialistas!</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
        </a>
</div>

  
<!-- Conflicto HERE-->
<?php

require_once("includes/footer_azul.php");


/*
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];

$sql = "SELECT * FROM tbl_usuario WHERE id_usuario = ".$id_usuario;
$resultado=mysqli_query($conexion, $sql);

	if (mysqli_num_rows($resultado) != 0 ) {
		while ($usuario = mysqli_fetch_array($resultado)) {
				if ($usuario['id_objetivo'] == null) {
					header("location : cuestionario.php?err=2");
				}
			}
	}


<!DOCTYPE html>
<html>
<head>
	<title>registro usuarios</title>
</head>
<body>	
<h1>Bienvenido a tu Main pag <?php echo $_SESSION['nombre_usuario'] </h1>

</body>
</html>*/
?>