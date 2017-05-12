<?php 
  require_once("conexio.php");
  session_start();
  //Revisar consulta integridad datos
  $sql = "SELECT * 
          FROM `tbl_usuario` 
            LEFT JOIN `tbl_tipo_cuerpo` ON `tbl_tipo_cuerpo`.`id_tipo_cuerpo`= `tbl_usuario`.`id_tipo_cuerpo`
            LEFT JOIN `tbl_objetivo` ON `tbl_objetivo`.`id_objetivo` = `tbl_usuario`.`id_objetivo`
          WHERE `id_usuario` =". $_SESSION['id_usuario'];
    //echo $sql;die;
    $data_user=mysqli_query($conexion,$sql);
        while($data = mysqli_fetch_array($data_user))
             {
                $user_name = $data['nombre_usuario'] ." ". $data['apellidos_usuario'];
                $user_init_date = $data['fecha_registro'];
                $user_mail = $data['email_usuario'];
                $user_tall = $data['altura_usuario'];
                $user_old = $data['fecha_nacimiento'];
                $user_objetive = $data['nombre_objetivo'];
                $user_type_body = $data['nombre_tipo_cuerpo'];
             }
      //Para calcular la edad del usuario
             $user_old = date_create($user_old);//traducimos la edad
             $actual_date = date('Y/m/d'); //Cogemos la fecha actual
             $date = date_create($actual_date); //traducimos la fecha actual
             $user_edad = date_diff($user_old,$date); //Comparamos las fechas
             $years = $user_edad->format('%y%'); //Cogemos la diferencia en años
      //End edad
      //Para calcular el peso
             $cpeso = 0;
            $sql_height = "SELECT * FROM `tbl_historial_peso` WHERE `id_usuario` = ". $_SESSION['id_usuario']." ORDER BY `fecha_his_pes` LIMIT 0,3";
            //Lanzamos la consulta a la BBDD
            $height_query = mysqli_query($conexion,$sql_height);
            while($data_height = mysqli_fetch_array($height_query))
            {
              switch ($cpeso) {
                case '0':
                   $hdata1 = $data_height['fecha_his_pes'];
                   $height1 = $data_height['peso'];
                  break;
                case '1':
                   $hdata2 = $data_height['fecha_his_pes'];
                   $height2 = $data_height['peso'];
                  break;
                case '2':
                 $hdata3 = $data_height['fecha_his_pes'];
                 $height3 = $data_height['peso'];
                break;
                default:

                break;

              }
               $cpeso++;
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
                        <a href="#">Cerrar Sesion  <img src="media/img/icon/logout.png" width="20px" height="20px" onmouseover="this.src='media/img/icon/logout2.png';" onmouseout="this.src='media/img/icon/logout.png';"></a>
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
            
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <img src="media/img/icon/perfilboy.png" class="img-responsive img-circle" style="margin: auto;">
                    </div>
                    <div class="panel-body table-responsive">
                        
                        <table class="table table-bordered">
                          <tr>
                            <td>Nombre</td>
                            <td><?php echo $user_name; ?></td>
                          </tr>
                          <tr>
                            <td>Email</td>
                            <td><?php echo $user_mail; ?></td>
                          </tr>
                          <tr>
                            <td>Días fitness</td>
                            <td><?php echo $user_init_date; ?></td>
                          </tr>
                          <tr>
                            <td>Altura</td>
                            <td><?php echo ($user_tall/100)."m"; ?></td>
                          </tr>
                          <tr>
                            <td>Tipo cuerpo</td>
                            <td><?php echo $user_type_body; ?></td>
                          </tr>
                          <tr>
                            <td>Objetivo</td>
                            <td><?php echo $user_objetive; ?></td>
                          </tr>
                          <tr>
                            <td>Edad</td>
                            <td><?php echo $years; ?></td>
                          </tr>
                        </table>
                    </div>
                </div>
            </div>
            
               <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Historial peso</h3>
                      </div>
                     
                  </div>
               </div> 
               <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Historial medidas</h3>
                      </div>
                      
                  </div>
                </div> 
                  <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Panel title</h3>
                      </div>
                  </div>
               </div>

                <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Panel title</h3>
                      </div>
                  </div>
                </div>
                <div class="col-sm-8">  
                <table class="table table-striped">
            <thead>
              <tr>
                <th>Dia</th>
                <th>Peso</th>
                <th>Diferencia peso</th>
                
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <?php 
                      if(isset($hdata1))
                        {
                         echo $hdata1;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                </td>
                <td>
                   <?php 
                      if(isset($height1))
                        {
                         echo $height1;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                  
                </td>
                 <td>
                   <?php 
                      if(isset($height2))
                        {
                          $dif = $height2-$height1;
                          echo $dif;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                  
                </td>
              </tr>
              <tr>
                <td>
                  <?php 
                      if(isset($hdata2))
                        {
                         echo $hdata2;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                </td>
                <td>
                   <?php 
                      if(isset($height2))
                        {
                         echo $height2;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                  
                </td>
                 <td>
                   <?php 
                      if(isset($height3))
                        {
                          $dif = $height3-$height2;
                          echo $dif;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                  
                </td>
              </tr>
              <tr>
                <td>
                  <?php 
                      if(isset($hdata3))
                        {
                         echo $hdata3;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                </td>
                <td>
                   <?php 
                      if(isset($height3))
                        {
                         echo $height3;
                        }
                        else 
                        {
                          echo "N/A";
                        }
                  ?>
                  
                </td>
                <td>--</td>
  
              </tr>
            </tbody>
          </table>
          </div>
                   <!--- row --> 


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
