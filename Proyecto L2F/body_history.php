<?php 
  require_once("conexio.php");
  require_once("includes/header_azul.php"); 
  //session_start();
  //consulta para obtener todos los pesos del usuario
 //Obtenemos las medidas de usuario 
      //SQL
        //brazo
            $select_brazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=2";
            //echo $select_brazo_sql;die;
        //Antebrazo
             $select_antebrazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=3";
        //Pectoral
             $select_pectoral_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=4";
        //Cintura
             $select_cintura_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=5";
        //Cadera
              $select_cadera_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=6";
        //Cuadricep
               $select_cuadricep_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=7";
        //Gemela
               $select_gemelo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=8";
        //Querys
               $select_brazo_query=mysqli_query($conexion,$select_brazo_sql);
               $select_antebrazo_query=mysqli_query($conexion,$select_antebrazo_sql);
               $select_pectoral_query=mysqli_query($conexion,$select_pectoral_sql);
               $select_cintura_query=mysqli_query($conexion,$select_cintura_sql);
               $select_cadera_query=mysqli_query($conexion,$select_cadera_sql);
               $select_cuadricep_query=mysqli_query($conexion,$select_cuadricep_sql);
               $select_gemelo_query = mysqli_query($conexion,$select_gemelo_sql);
        

?>
  <br>
  <div class="contrainer">
    <div class="row">
    <div class="col-xs-18">
      
      <div class="col-xs-4">
        <button class="btn btn-primary" onclick="sh_table('bicep');">Bicep</button>
      </div>
      <div class="col-xs-4">
        <button class="btn btn-primary" onclick="sh_table('antebrazo');">Antebrazo</button>
      </div>
      <div class="col-xs-4"> 
        <button class="btn btn-primary" onclick="sh_table('pectoral');">Pectoral</button>
      </div>
      <br>
      <br>
      <div class="col-xs-4">
        <button class="btn btn-primary" onclick="sh_table('cintura');">Cintura</button>
       </div>
      <div class="col-xs-4"> 
        <button class="btn btn-primary" onclick="sh_table('cadera');">Cadera</button>  
       </div>
      <div class="col-xs-4"> 
        <button class="btn btn-primary" onclick="sh_table('cuadricep');">Cuadricep</button>  
      </div>
      <br>
      <br>
      <div class="col-xs-4">  
        <button class="btn btn-primary" onclick="sh_table('gemelo');">Gemelo</button>
      </div>
        <br>
        <br>
     </div>   
    </div>
    <div class="row">  
    <div class="col-md-10">
      <?php 
          echo "<div class='panel panel-default col-md-5' id='bicep'>
                 <div class='panel-heading'>Bicep</div>
                  <div class='panel-body'>
                  <table class='table'>
                    <thead>
                      <th>Fecha</th>
                      <th>Medida</th>
                  </thead>
                 <tbody>";
                  while($brazo_data = mysqli_fetch_array($select_brazo_query))
                  {
                    echo "<tr><td>".date("d-m-Y", strtotime($brazo_data['fecha_his_med']))."</td>";
                    echo "<td>".$brazo_data['cm']."</td></tr>"; 
                  }
                echo "</tbdoy>
                 </table>
                 </div>
             </div>
             ";
            //End tabla Brazo
           echo "
           <div class='panel panel-default col-md-5' id='antebrazo'>
                 <div class='panel-heading'>Antebrazo</div>
                  <div class='panel-body'>
                     <table class='table'>
                      <thead>
                        <th>Fecha</th>
                        <th>Medida</th>
                      </thead>
                      <tbody>";
                        while($antebrazo_data = mysqli_fetch_array($select_antebrazo_query))
                        {
                          echo "<tr><td>".date("d-m-Y", strtotime($antebrazo_data['fecha_his_med']))."</td>";
                          echo "<td>".$antebrazo_data['cm']."</td></tr>"; 
                        }
                      echo "</tbdoy>
                      </table>
                  </div>
                </div>
                ";
            //End AnteBrazo
            echo "
              <div class='panel panel-default col-md-5' id='pectoral'name='pectoral'>
                 <div class='panel-heading'>Pectoral</div>
                 <div class='panel-body'>
                    <table class='table'>
                    <thead>
                      <th>Fecha</th>
                      <th>Medida</th>
                    </thead>
                    <tbody>";
                      while($pectoral_data = mysqli_fetch_array($select_pectoral_query))
                      {
                        echo "<tr><td>".date("d-m-Y", strtotime($pectoral_data['fecha_his_med']))."</td>";
                        echo "<td>".$pectoral_data['cm']."</td></tr>"; 
                      }
              echo "</tbdoy>
                </table>
              </div>
              </div>
              ";
            //End Pectoral
               echo "
              <div class='panel panel-default col-md-5' id='cintura' name='cintura'>
                 <div class='panel-heading'>Cintura</div>
                 <div class='panel-body'>
                  <table class='table'>
                  <thead>
                    <th>Fecha</th>
                    <th>Medida</th>
                  </thead>
                  <tbody>";
                    while($cintura_data = mysqli_fetch_array($select_cintura_query))
                    {
                      echo "<tr><td>".date("d-m-Y", strtotime($cintura_data['fecha_his_med']))."</td>";
                      echo "<td>".$cintura_data['cm']."</td></tr>"; 
                    }
                  echo "</tbdoy>
                  </table>
                </div>
              </div>
            ";

            //End Cintura
            echo " 
              <div class='panel panel-default col-md-5' id='cadera' name='cadera'>
                 <div class='panel-heading'>Cadera</div>
                   <div class='panel-body'>  
                    <table class='table' id='cadera' name='cadera'>
                      <thead>
                        <th>Fecha</th>
                        <th>Medida</th>
                      </thead>
                      <tbody>";
                        while($cadera_data = mysqli_fetch_array($select_cadera_query))
                        {
                          echo "<tr><td>".date("d-m-Y", strtotime($cadera_data['fecha_his_med']))."</td>";
                          echo "<td>".$cadera_data['cm']."</td></tr>"; 
                        }
                      echo "</tbdoy>
                    </table>
                  </div>
                </div>
                ";
            //End Cadera
            echo "
            <div class='panel panel-default col-md-5' id='cuadricep'name='cadera'>
                 <div class='panel-heading'>Cuadricep</div>
                   <div class='panel-body'>  
                    <table class='table'>
                      <thead>
                        <th>Fecha</th>
                        <th>Medida</th>
                      </thead>
                      <tbody>";
                        while($cuadricep_data = mysqli_fetch_array($select_cuadricep_query))
                        {
                          echo "<tr><td>".date("d-m-Y", strtotime($cuadricep_data['fecha_his_med']))."</td>";
                          echo "<td>".$cuadricep_data['cm']."</td></tr>"; 
                        }
                      echo "</tbdoy>
                    </table>
                  </div>
                </div>
              ";
            //End Cuadricep
            echo "
            <div class='panel panel-default col-md-5' id='gemelo'name='gemelo'>
                 <div class='panel-heading'>Gemelo</div>
                   <div class='panel-body'>  
                      <table class='table' id='gemelo' name='gemelo'>
                      <thead>
                        <th>Fecha</th>
                        <th>Medida</th>
                      </thead>
                      <tbody>";
                        while($gemelo_data = mysqli_fetch_array($select_gemelo_query))
                        {
                          echo "<tr><td>".date("d-m-Y", strtotime($gemelo_data['fecha_his_med']))."</td>";
                          echo "<td>".$gemelo_data['cm']."</td></tr>"; 
                        }
                      echo "</tbdoy>
                      </table>
                  </div>
                </div>
              ";
            //End Gemelos
       ?>
     </div>
      <div class='col-md-10'>
      	<img src="proc/history_body_grafic.proc.php" style="width:100%"> 
          <a href="perfilusuario.php"><button class="btn btn-primary">Volver</button></a>
      </div>
  
</div>
</div>
</div>
</div>
<?php 
include("includes/footer_azul.php") ?>
<script type="text/javascript">
  function disable_table(){
    document.getElementById("bicep").style.display='none';
    document.getElementById("antebrazo").style.display='none';
    document.getElementById("pectoral").style.display='none';
    document.getElementById("cintura").style.display='none';
    document.getElementById("cadera").style.display='none';
    document.getElementById("cuadricep").style.display='none';
    document.getElementById("gemelo").style.display='none';
  }
  function sh_table(id){
    if(document.getElementById(id).style.display=='none')
         {
          document.getElementById(id).style.display='inline-table';
         }
      else
      {
         document.getElementById(id).style.display='none';
      }
  }
  window.onload(disable_table());
</script>