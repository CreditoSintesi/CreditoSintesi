<?php 
  require_once("conexio.php");
  //session_start();
  require_once("includes/header_azul.php");
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
             round($user_tall,2);
      //End edad
      //Para calcular el tiempo que el usuario lleva registrado
             $user_init_date = date_create($user_init_date);//Cogemos la fecha en la que el usuario se registró
             $actual_date = date('Y/m/d'); //Cogemos la fecha actual
             $actual_date = date_create($actual_date);
             $init_date = date_diff($user_init_date,$actual_date);

            $total_month =  $init_date->format('%y%')*12+$init_date->format('%m%')." Meses";
            
            if($total_month == "0 Meses")
            {
              $total_month = $init_date->format('%d%')." Días";
            }

      //Para calcular el peso
            $control = 0;
            $sql_height = "SELECT * FROM `tbl_historial_peso` WHERE `id_usuario` = ". $_SESSION['id_usuario']." ORDER BY `fecha_his_pes` DESC LIMIT 0,3";
            //Lanzamos la consulta a la BBDD
            $height_query = mysqli_query($conexion,$sql_height);
            while($data_height = mysqli_fetch_array($height_query))
            {
              switch ($control) {
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
               $control++;
            }
           $imc = $height1/pow(1.79,2);
           //echo round($imc,"2");die;
  //Obtenemos las medidas de usuario 
      //SQL
        //brazo
            $select_brazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=2 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
            //echo $select_brazo_sql;die;
        //Antebrazo
             $select_antebrazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=3 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Pectoral
             $select_pectoral_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=4 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Cintura
             $select_cintura_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=5 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Cadera
              $select_cadera_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=6 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Cuadricep
               $select_cuadricep_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=7 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Gemela
               $select_gemelo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=8 ORDER BY `fecha_his_med` DESC LIMIT 0,1";
      //Querys
        $select_brazo_query=mysqli_query($conexion,$select_brazo_sql);
        $select_antebrazo_query=mysqli_query($conexion,$select_antebrazo_sql);
        $select_pectoral_query=mysqli_query($conexion,$select_pectoral_sql);
        $select_cintura_query=mysqli_query($conexion,$select_cintura_sql);
        $select_cadera_query=mysqli_query($conexion,$select_cadera_sql);
        $select_cuadricep_query=mysqli_query($conexion,$select_cuadricep_sql);
        $select_gemelo_query = mysqli_query($conexion,$select_gemelo_sql);
      //Seleccionamos los datos de la BD
        while($data_brazo = mysqli_fetch_array($select_brazo_query))
        {
          $brazo_cm = $data_brazo['cm'];
          $brazo_date = date("d-m-Y", strtotime($data_brazo['fecha_his_med']));
        }
        while($data_antebrazo = mysqli_fetch_array($select_antebrazo_query))
        {
          $antebrazo_cm = $data_antebrazo['cm'];
          $antebrazo_date = date("d-m-Y", strtotime($data_antebrazo['fecha_his_med']));
        }
        while($data_pectoral = mysqli_fetch_array($select_pectoral_query))
        {
          $pectoral_cm = $data_pectoral['cm'];
          $pectoral_date = date("d-m-Y", strtotime($data_pectoral['fecha_his_med']));
        }
        while($data_cintura = mysqli_fetch_array($select_cintura_query))
        {
          $cintura_cm = $data_cintura['cm'];
          $cintura_date = date("d-m-Y", strtotime($data_cintura['fecha_his_med']));
        }
        while($data_cadera= mysqli_fetch_array($select_cadera_query))
        {
          $cadera_cm = $data_cadera['cm'];
          $cadera_date = date("d-m-Y", strtotime($data_cadera['fecha_his_med']));
        
        }
        while($data_cuadricep= mysqli_fetch_array($select_cuadricep_query))
        {
          $cuadricep_cm = $data_cuadricep['cm'];
          $cuadricep_date = date("d-m-Y", strtotime($data_cuadricep['fecha_his_med']));
        }
        while($data_gemelo= mysqli_fetch_array($select_gemelo_query))
        {
          $gemelo_cm = $data_gemelo['cm'];
          $gemelo_date = date("d-m-Y", strtotime($data_gemelo['fecha_his_med']));
        }
      //End obtener datos de usuario       
?>


        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Tus Datos</h2>
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
                            <td>Tiempo</td>
                            <td><?php echo $total_month; ?></td>
                          </tr>
                          <tr>
                            <td>Altura</td>
                            <td><?php $user_tall_m = $user_tall/100; echo round($user_tall_m,"2")." m"; ?></td>
                          </tr>
                          <tr>
                            <td>IMC</td>
                            <td><?php 
                                  if(isset($height1)){
                                    echo round($imc,"2");
                                  }
                                  else{
                                    echo "NA";
                                  }
                             ?></td>
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
                          <tr>
                            <td colspan="2">
                                <button class = "btn btn-primary" data-toggle="modal" data-target="#dataUser">Editar información</button>
                            </td>
                          </tr>
                        </table>
                    </div>
                </div>
            </div>
            
               <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                       <h3 class="panel-title" onclick="display_element('pr_peso')" style="cursor: pointer;">Historial peso</h3>
                      </div>
                     
                  </div>
               </div> 
               <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title" onclick="display_element('pr_cuerpo')">Historial medidas</h3>
                      </div>
                      
                  </div>
                </div> 
                  <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title" onclick="display_element('sh_peso')">¡Pésate!</h3>
                      </div>
                  </div>
               </div>

                <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title" onclick="display_element('sh_medidas')">¡Mídete!</h3>
                      </div>
                  </div>
                </div>
                <div class="col-sm-8">  
                <table class="table table-striped" id="pr_peso" name="pr_peso">
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
              <tr>
                <td colspan="3"><a href="weight.php"><button class="btn btn-info">Ver más</button></a></td>
            </tbody>
          </table>
          </div>

          <!-- PARTE CUERPO -->
          
            <div class="col-sm-8" id ="pr_cuerpo">  
             <table class="table table-striped">
              <thead>
                <tr>
                  <th>Grupo muscular</th>
                  <th>Fecha</th>
                  <th>Medida (cm)</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Brazo</td>
                  <td><?php 
                  echo $brazo_date;?></td>
                  <td><?php echo $brazo_cm;?></td>
                </tr>
                <tr>
                  <td>Antebrazo</td>
                  <td><?php 
                  echo $antebrazo_date;?></td>
                  <td><?php echo $antebrazo_cm;?></td>
                </tr>
                 <tr>
                  <td>Brazo</td>
                  <td><?php 
                  echo $brazo_date;?></td>
                  <td><?php echo $brazo_cm;?></td>
                </tr>
                <tr>
                  <td>Pectoral</td>
                  <td><?php echo $pectoral_date; ?></td>
                  <td><?php echo $pectoral_cm; ?></td>
                </tr>
                <tr>
                  <td>Cintura</td>
                  <td><?php echo $cintura_date;?></td>
                  <td><?php echo $cintura_cm; ?></td>
                </tr>
                <tr>
                 <td>Cadera</td>
                 <td><?php echo $cadera_date; ?></td>
                 <td><?php echo $cadera_cm; ?></td>
                </tr>
                <tr>
                  <td>Cuadricep</td>
                  <td><?php echo $cuadricep_date; ?></td>
                  <td><?php echo $cuadricep_cm; ?></td>
                </tr>
                <tr>
                  <td>Gemelo</td>
                  <td><?php echo $gemelo_date;?></td>
                  <td><?php echo $gemelo_cm;?></td>
                </tr>
                <tr>
                  <td colspan="3">
                    <a href="body_history.php">
                      <button class="btn btn-info">Ver más</button>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
            <!--AÑADIR PESO-->
            <div class="col-sm-8" id ="sh_peso" name="sh_peso">
            <form action="proc/add_peso.proc.php" method="POST">
               <table class="table table-striped" border>
                <thead>
                  <tr>
                    <th colspan="4">Añadir peso</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td >Peso</td>
                    <td colspan="2"><input type="number" class="form-control" id="height" name="height" value="<?php echo $height1; ?>"></td>
                    <td>KG</td>
                  </tr>
                  <tr>
                    <td colspan="2"><p class="col-form-label" onclick="add_height()" >+</p></td>
                    <td colspan="2"><p class="col-form-label" onclick="rest_height()">-</p></td>
                  </tr>
                  <tr>
                    <td colspan="4"><input type="submit" class="btn btn-default" value="Enviar"/></td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
          <!-- END AÑADIR PESO -->
          <!--AÑADIR MEDIDAS-->
           <div class="col-sm-8" id ="sh_medidas" name="sh_medidas">
            <form action="proc/add_medidas.proc.php" method="POST">
               <table class="table table-striped" border>
               <thead>
                  <tr>
                    <th colspan="4">Añadir medidas</th>
                  </tr>
                </thead>
                  <tr>
                    <td>Brazo</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_brazo' name='cm_brazo' value=".$brazo_cm." required>"; ?></td>
                    <td>+</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td>Antebrazo</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_antebrazo' name='cm_antebrazo' value=".$antebrazo_cm." required>"; ?></td>
                    <td>+</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td>Pectoral</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_pectoral' name='cm_pectoral' value=".$pectoral_cm." required>"; ?></td>
                    <td>+</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td>Cintura</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_cintura' name='cm_cintura' value=".$cintura_cm." required>"; ?></td>
                    <td>+</td>
                    <td>-</td>
                  </tr>
                   <tr>
                    <td>Cadera</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_cadera' name='cm_cadera' value=".$cadera_cm." required>"; ?></td>
                    <td>+</td>
                    <td>-</td>
                  </tr>
                   <tr>
                    <td>Cuadricep</td>
                     <td><?php echo  "<input type='number' class='form-control' id='cm_cuadricep' name='cm_cuadricep' value=".$cuadricep_cm." required>"; ?></td>
                    <td>+</td>
                    <td>-</td>
                  </tr>
                   <tr>
                    <td>Gemelo</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_gemelo' name='cm_gemelo' value=".$gemelo_cm." required>"; ?></td>
                    
                    <td>+</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td colspan="4"><input type="submit" class="btn btn-default" value="Enviar"/></td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
          <!--END AÑADIR MEDIDAS-->
          <!-- END PARTE CUERPO -->
                   <!--- row --> 


                </div>
                <!-- Ventana Modal -->
                    <div id="dataUser" class="modal fade" role="dialog">
                      <div class="modal-dialog">
                      <!-- Modal content-->
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Cambiar datos</h4>
                        </div>
                        <div class="modal-body">
                          <?php 
                            require_once("includes/ch_user_data.php");
                           ?>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                      </div>

                    </div>
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
    <script type="text/javascript">
    function hidden_elements(){
      document.getElementById('pr_cuerpo').style.display='none';
      document.getElementById('pr_peso').style.display='none';
      document.getElementById('sh_peso').style.display='none';
      document.getElementById('sh_medidas').style.display='none';
      
      }
    function display_element(table_id){
      if(document.getElementById(table_id).style.display=='none')
         {
          document.getElementById(table_id).style.display='inline-table';
         }
      else
      {
         document.getElementById(table_id).style.display='none';
      }
      
    }
    function add_height()
    {
      var height = document.getElementById('height').value;
      height++;
      document.getElementById('height').value=height;
      
    }
     function rest_height()
    {
      var height = document.getElementById('height').value;
      height--;
      if(height>0)
      {
        document.getElementById('height').value=height;
      }
      else
      {
        document.getElementById('height').value=0;
      }
      
    }
    window.onload(hidden_elements());
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
