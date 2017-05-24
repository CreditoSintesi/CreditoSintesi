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
?>


<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>L2f</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/bootstrapVerde.css" rel="stylesheet">
    <!--<link href="css/bootstrap-theme.Azul.css" rel="stylesheet">-->
      <link href="css/modern-business.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
 <div class="container">

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>

          <a class="navbar-brand-left" href="main.php" ><img src="media/logo/logoVerde.png" width="42px" height="42px"' style="margin: 5px 5px 5px 5px;" ></a>
        </div>       
        <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="main.php">Bienvenido, <?php echo $user_name; ?></a>
                    </li>
                    <li>
                        <a href="perfilusuario.php">Perfil</a>
                    </li>
                    <li>
                        <a href="user_rutinas.php">Rutinas</a>
                    </li>
                    <li>
                        <a href="user_dieta.php">Dietas</a>
                    </li>
                    <li>
                        <a href="logout.proc.php">Cerrar Sesion  <img src="media/img/icon/logout.png" width="20px" height="20px" onmouseover="this.src='media/img/icon/logout4.png';" onmouseout="this.src='media/img/icon/logout.png';"></a>
                    </li>
                   </ul> 
        </div>
      </div>
    </nav>
<!--/.navbar-collapse -->
