
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
    <link href="css/bootstrapAzul.css" rel="stylesheet">
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

          <a class="navbar-brand-left" href="#" ><img src="media/logo/logoAzul.png" width="42px" height="42px"' style="margin: 5px 5px 5px 5px;" ></a>
        </div>       
        <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">Bienvenido, <?php echo $user_name; ?></a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="logout.proc.php">Cerrar Sesion  <img src="media/img/icon/logout.png" width="20px" height="20px" onmouseover="this.src='media/img/icon/logout2.png';" onmouseout="this.src='media/img/icon/logout.png';"></a>
                    </li>
                   </ul> 
        </div>
      </div>
    </nav>
<!--/.navbar-collapse -->


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
                        <p>Accede a tu historial de pesos y medidas o modifica tus datos de registro.</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
            </a>
            <?php echo "<a href='user_rutina?id=".$_SESSION['id_usuario']."'>"; ?>
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

   <footer>
    <div class="container text-center">
      <div class="row">        
        <div class="col-md-4">
             <span class="copyright">Copyright &copy; L2F 2017</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
             <li><a href=""><img src="media/img/social/twitter.png" width="42px" align="42px" ></a></li>
             <li><a href=""><img src="media/img/social/face.png" width="42px" align="42px"></i></a></li>
             <li><a href=""><img src="media/img/social/insta.png" width="42px" align="42px"></i></a></li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li><a >Contacto</a></li>
              <li><a >Ayuda</a></li>
            </ul>
          </div>
        </div>
        </div>
      </footer>
      <!-- Finish Footer -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
<!-- Conflicto HERE-->
<?php
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