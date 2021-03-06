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
            if(!isset($height1))
            {
              $imc = "No disponible";
            }
            else
            {
               $imc = $height1/pow(1.79,2);
            }
  //Obtenemos los ID de la part del cuerpo
  $part_body_id_sql = "SELECT * FROM tbl_parte_cuerpo";

  $part_body_id_query = mysqli_query($conexion, $part_body_id_sql);
  while($part_body_id = mysqli_fetch_array($part_body_id_query))
  {

    //Segun el valor del nombre, le asignaremos el id correspondiente 
    switch ($part_body_id['nombre_parte_cuerpo']) {
      case 'Brazo':
        $id_brazo = $part_body_id['id_parte_cuerpo'];
        break;
      case 'Antebrazo':
        $id_antebrazo = $part_body_id['id_parte_cuerpo'];
        break;
      case 'Pectoral':
        $id_pectoral = $part_body_id['id_parte_cuerpo'];
        break;
      case 'Cintura':
        $id_cintura = $part_body_id['id_parte_cuerpo'];
        break;
      case 'Cadera':
        $id_cadera = $part_body_id['id_parte_cuerpo'];
        break;
      case 'Cuadricep':
        $id_cuadricep = $part_body_id['id_parte_cuerpo'];
        break;
      case 'Gemelo':
        $id_gemelo = $part_body_id['id_parte_cuerpo'];
        break;
      default:
        # code...
        break;
    }
  }
    //END ID parte cuerpo         
  //Obtenemos las medidas de usuario 
      //SQL
        //brazo
            $select_brazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_brazo." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
            //echo $select_brazo_sql;die;
        //Antebrazo
             $select_antebrazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_antebrazo." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Pectoral
             $select_pectoral_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_pectoral." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Cintura
             $select_cintura_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_cintura." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Cadera
              $select_cadera_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_cadera." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Cuadricep
               $select_cuadricep_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_cuadricep." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
        //Gemela
               $select_gemelo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_gemelo." ORDER BY `fecha_his_med` DESC LIMIT 0,1";
      //Querys

        $select_brazo_query=mysqli_query($conexion,$select_brazo_sql);
        $select_antebrazo_query=mysqli_query($conexion,$select_antebrazo_sql);
        $select_pectoral_query=mysqli_query($conexion,$select_pectoral_sql);
        $select_cintura_query=mysqli_query($conexion,$select_cintura_sql);
        $select_cadera_query=mysqli_query($conexion,$select_cadera_sql);
        $select_cuadricep_query=mysqli_query($conexion,$select_cuadricep_sql);
        $select_gemelo_query = mysqli_query($conexion,$select_gemelo_sql);
      //Seleccionamos los datos de la BD
        //Controlamos que nos devuelva algo
        if(mysqli_num_rows($select_brazo_query)>0){
        while($data_brazo = mysqli_fetch_array($select_brazo_query))
         {
           $brazo_cm = $data_brazo['cm'];
           $brazo_date = date("d-m-Y", strtotime($data_brazo['fecha_his_med']));
          }
         }
         else 
         {
          $brazo_cm = 0;
          $brazo_date = "No disponible";
         }
         if(mysqli_num_rows($select_antebrazo_query)>0)
         {
            while($data_antebrazo = mysqli_fetch_array($select_antebrazo_query))
            {
              $antebrazo_cm = $data_antebrazo['cm'];
              $antebrazo_date = date("d-m-Y", strtotime($data_antebrazo['fecha_his_med']));
            }
         }
         else 
         {
           $antebrazo_cm = 0;
           $antebrazo_date = "No disponible";
         }
        if(mysqli_num_rows($select_pectoral_query)>0)
        {
          while($data_pectoral = mysqli_fetch_array($select_pectoral_query))
          {
            $pectoral_cm = $data_pectoral['cm'];
            $pectoral_date = date("d-m-Y", strtotime($data_pectoral['fecha_his_med']));
          }
        }
        else
        {
           $pectoral_cm = 0;
           $pectoral_date = "No disponible";
        }
        if(mysqli_num_rows($select_cintura_query)>0)
        {
          while($data_cintura = mysqli_fetch_array($select_cintura_query))
          {
            $cintura_cm = $data_cintura['cm'];
            $cintura_date = date("d-m-Y", strtotime($data_cintura['fecha_his_med']));
          }
        }
        else 
        {
           $cintura_cm = 0;
           $cintura_date = "No disponible";
        }
        if(mysqli_num_rows($select_cadera_query)>0)
        {
          while($data_cadera= mysqli_fetch_array($select_cadera_query))
          {
            $cadera_cm = $data_cadera['cm'];
            $cadera_date = date("d-m-Y", strtotime($data_cadera['fecha_his_med']));
          
          }
        }
        else 
        {
           $cadera_cm = 0;
           $cadera_date = "No disponible";
        }
        if(mysqli_num_rows($select_cuadricep_query)>0)
        {
          while($data_cuadricep= mysqli_fetch_array($select_cuadricep_query))
          {
            $cuadricep_cm = $data_cuadricep['cm'];
            $cuadricep_date = date("d-m-Y", strtotime($data_cuadricep['fecha_his_med']));
          }
        }
        else 
        {
           $cuadricep_cm = 0;
           $cuadricep_date = "No disponible";
        }
        if(mysqli_num_rows($select_gemelo_query)>0)
        {
          while($data_gemelo= mysqli_fetch_array($select_gemelo_query))
          {
            $gemelo_cm = $data_gemelo['cm'];
            $gemelo_date = date("d-m-Y", strtotime($data_gemelo['fecha_his_med']));
          }
        }
        else 
        {
          $gemelo_cm = 0;
          $gemelo_date = "No disponible";
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
                        <h3 class="panel-title" onclick="display_element('pr_cuerpo')" style="cursor: pointer;">Historial medidas</h3>
                      </div>
                      
                  </div>
                </div> 
                  <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title" onclick="display_element('sh_peso')" style="cursor: pointer;">¡Pésate!</h3>
                      </div>
                  </div>
               </div>

                <div class="col-sm-2">
                  <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title" onclick="display_element('sh_medidas')" style="cursor: pointer;">¡Mídete!</h3>
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
                          echo "--";
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
                          echo "--";
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
                          echo "--";
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
                          echo "--";
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
                          echo "--";
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
                          echo "--";
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
                          echo "--";
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
                          echo "--";
                        }
                  ?>
                  
                </td>
                <td>--</td>
              </tr>
              <tr>
                <?php 
                if (isset($height3))
                {
                  echo  "<td colspan='3'><a href='weight.php'><button class='btn btn-primary'>Ver más</button></a></td>";
                } 
                ?>
               
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
                
                    <?php
                      //Preparamos una consulta para obtener TODAS las mediciones de una parte del cuerpo
                       $count_medidas_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_brazo."";
                       $count_medidas_query = mysqli_query($conexion,$count_medidas_sql);
                       if(mysqli_num_rows($count_medidas_query)>=3)
                       {
                        echo "<tr> <td colspan='3'> <a href='body_history.php'>";
                        echo " <button class='btn btn-primary'>Ver más</button>";
                        echo "</a> </td> </tr>";
                       }
                   ?>
                     
                    
              </tbody>
            </table>
          </div>
            <!--AÑADIR PESO-->
            <div class="col-sm-8" id ="sh_peso" name="sh_peso">
            <form action="proc/add_peso.proc.php" method="POST" onsubmit="return val_weight();">
               <table class="table table-striped" border>
                <thead>
                  <tr>
                    <th colspan="4">Añadir peso</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td >Peso</td>
                    <td colspan="2">
                    <?php
                        if(!isset($height1))
                        {
                          echo "<input type='number' class='form-control' id='height' name='height'></td>";
                        }
                        else 
                        {
                          echo "<input type='number' class='form-control' id='height' name='height' value=".$height1.">";
                        }
                    ?></td>
                    <td>KG</td>
                  </tr>
                  <tr>
                    <td colspan="2"><center><label class="col-form-label btn btn-default" onclick="add_height()" >+</label></center></td>
                    <td colspan="2"><center><label class="col-form-label btn btn-default" onclick="rest_height()">-</label></center></td>
                  </tr>
                  <tr>
                    <td colspan="4"><input type="submit" class="btn btn-primary" value="Enviar"/></td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
          <!-- END AÑADIR PESO -->
          <!--AÑADIR MEDIDAS-->
           <div class="col-sm-8" id ="sh_medidas" name="sh_medidas">
            <form action="proc/add_medidas.proc.php" method="POST" onsubmit="return val_medidas()">
               <table class="table table-striped" border>
               <thead>
                  <tr>
                    <th colspan="4">Añadir medidas</th>
                  </tr>
                </thead>
                  <tr>
                    <td>Brazo</td>
                    <td><?php echo"<input type='number' class='form-control' id='cm_brazo' name='cm_brazo' value=".$brazo_cm." required>"; ?></td>
                    <td><label class="btn btn-default" onclick="plus_cm('cm_brazo');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_brazo');">-</label></td>
                  </tr>
                  <tr>
                    <td>Antebrazo</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_antebrazo' name='cm_antebrazo' value=".$antebrazo_cm." required>"; ?></td>
                    <td><label class="btn btn-default" onclick="plus_cm('cm_antebrazo');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_antebrazo');">-</label></td>
                  </tr>
                  <tr>
                    <td>Pectoral</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_pectoral' name='cm_pectoral' value=".$pectoral_cm." required>"; ?></td>
                    <td><label class="btn btn-default" onclick="plus_cm('cm_pectoral');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_pectoral');">-</label></td>
                  </tr>
                  <tr>
                    <td>Cintura</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_cintura' name='cm_cintura' value=".$cintura_cm." required>"; ?></td>
                   <td><label class="btn btn-default" onclick="plus_cm('cm_cintura');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_cintura');">-</label></td>
                  </tr>
                   <tr>
                    <td>Cadera</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_cadera' name='cm_cadera' value=".$cadera_cm." required>"; ?></td>
                    <td><label class="btn btn-default" onclick="plus_cm('cm_cadera');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_cadera');">-</label></td>
                  </tr>
                   <tr>
                    <td>Cuadricep</td>
                     <td><?php echo  "<input type='number' class='form-control' id='cm_cuadricep' name='cm_cuadricep' value=".$cuadricep_cm." required>"; ?></td>
                    <td><label class="btn btn-default" onclick="plus_cm('cm_cuadricep');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_cuadricep');">-</label></td>
                  </tr>
                   <tr>
                    <td>Gemelo</td>
                    <td><?php echo  "<input type='number' class='form-control' id='cm_gemelo' name='cm_gemelo' value=".$gemelo_cm." required>"; ?></td>
                    
                    <td><label class="btn btn-default" onclick="plus_cm('cm_gemelo');">+</label></td>
                    <td><label class="btn btn-default" onclick="rest_cm('cm_gemelo');">-</label></td>
                  </tr>
                  <tr>

                    <td colspan='4'><input type='submit' class='btn btn-primary' value='Enviar'/></td>
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
              <!-- END VENTANA MODAL -->
             

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
    function plus_cm(id)
    {
      var cm = document.getElementById(id).value;
        cm++;
        document.getElementById(id).value=cm
    }
     function rest_cm(id)
    {
      var cm = document.getElementById(id).value;
      cm--;
      if(cm>=0)
     {
       document.getElementById(id).value=cm;
     }
      else
     {
       document.getElementById(id).value.value=0;
     }
      
    }
    function val_weight()
    {
      var msg ="";
      if(!/^([0-9])*$/.test(document.getElementById('height').value))
      {
        msg+="¡ep! la medida del bicep en números \n";
        document.getElementById('height').style.borderColor="red";
      }
      if(document.getElementById('height').value<=0)
      {
         msg+="Por mas que adelgaces, este peso es imposible! \n";
         document.getElementById('height').style.borderColor="red";
      }
      if(msg!="")
      {
      	alert(msg);
      	return false;
      }
      else
      {
      	return true;
      }
     }
    function val_medidas()
    {
      var msg ="";
      if(!/^([0-9])*$/.test(document.getElementById('cm_brazo').value))
      {
        msg+="¡ep! la medida del bicep en números \n";
        document.getElementById('cm_brazo').style.borderColor="red";
      }
      if(document.getElementById('cm_brazo').value>=100)
      {
         msg+="Revisa la medida del bicep \n";
         document.getElementById('cm_brazo').style.borderColor="red";
      }
       if(!/^([0-9])*$/.test(document.getElementById('cm_antebrazo').value)==true)
      {
        msg+="¡ep! la medida del antebrazo en números \n";
        document.getElementById('cm_brazo').style.borderColor="red";
      }
      if(document.getElementById('cm_antebrazo').value>=100)
      {
         msg+="Revisa la medida del antebrazo \n";
         document.getElementById('cm_antebrazo').style.borderColor="red";
      }
       if(!/^([0-9])*$/.test(document.getElementById('cm_pectoral').value))
      {
        msg+="¡ep! la medida del pectoral en números \n";
        document.getElementById('cm_pectoral').style.borderColor="red";
      }
      if(document.getElementById('cm_pectoral').value>=200)
      {
         msg+="Revisa la medida del pectoral \n";
         document.getElementById('cm_pectoral').style.borderColor="red";
      }
       if(!/^([0-9])*$/.test(document.getElementById('cm_cintura').value))
      {
        msg+="¡ep! la medida de la cintura  en números \n";
        document.getElementById('cm_cintura').style.borderColor="red";
      }
      if(document.getElementById('cm_cintura').value>=150)
      {
         msg+="Revisa la medida de la cintura \n";
         document.getElementById('cm_cintura').style.borderColor="red";
      }
      if(!/^([0-9])*$/.test(document.getElementById('cm_cadera').value))
      {
        msg+="¡ep! la medida de la cadera en números \n";
        document.getElementById('cm_cadera').style.borderColor="red";
      }
      if(document.getElementById('cm_cadera').value>=150)
      {
         msg+="Revisa la medida de la cadera \n";
         document.getElementById('cm_cadera').style.borderColor="red";
      }
      if(!/^([0-9])*$/.test(document.getElementById('cm_cuadricep').value))
      {
        msg+="¡ep! la medida del cuadricep en números \n";
        document.getElementById('cm_cuadricep').style.borderColor="red";
      }
      if(document.getElementById('cm_cuadricep').value>=100)
      {
         msg+="Revisa la medida del cuadricep \n";
         document.getElementById('cm_cuadricep').style.borderColor="red";
      }
       if(!/^([0-9])*$/.test(document.getElementById('cm_gemelo').value))
      {
        msg+="¡ep! la medida del gemelo en números \n";
        document.getElementById('cm_gemelo').style.borderColor="red";
      }
      if(document.getElementById('cm_gemelo').value>=100)
      {
         msg+="Revisa la medida del gemelo \n";
         document.getElementById('cm_gemelo').style.borderColor="red";
      }
      if(msg!="")
      {
        alert(msg);
        return false;
      }
    }
    function val_ch_user()
    {
       var msg ="";
       if(document.getElementById('ch_tall').value=="")
       {
          msg+="El campo altura es obligatorio";
          document.getElementById('ch_tall').style.borderColor="red";
       }
       
         if (!/^([0-9])*$/.test(document.getElementById('ch_tall').value))
         {
           msg+="¡ep! la altura en números \n";

           document.getElementById('ch_tall').style.borderColor="red";
         }
       
       if(document.getElementById('ch_name').value=="")
       {
         msg+="Introduzca un nombre \n";
          document.getElementById('ch_name').style.borderColor="red";
       }
      if(document.getElementById('ch_lastname').value=="")
       {
         msg+="Introduzca un nombre \n";
          document.getElementById('ch_lastname').style.borderColor="red";
       }
      if(document.getElementById('ch_mail').value=="")
       {
          msg+="Introduzca un correo valido \n";
          document.getElementById('ch_mail').style.borderColor="red";
       }
       if(msg!="")
       {
        alert(msg);
        return false;
       }
       else 
       {
        return true;
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