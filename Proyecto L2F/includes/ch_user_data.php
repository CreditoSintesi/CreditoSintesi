<table>
	<form action="proc/ch_user_data.proc.php" method="POST" onsubmit="return val_ch_user()">
		<table class="table table-bordered">
	         <?php
	         //Seleccionamos los datos del usuario
	          $sql = "SELECT * 
         		 FROM `tbl_usuario` 
          		  LEFT JOIN `tbl_tipo_cuerpo` ON `tbl_tipo_cuerpo`.`id_tipo_cuerpo`= `tbl_usuario`.`id_tipo_cuerpo`
           		  LEFT JOIN `tbl_objetivo` ON `tbl_objetivo`.`id_objetivo` = `tbl_usuario`.`id_objetivo`
          		 WHERE `id_usuario` =". $_SESSION['id_usuario'];
    
		   		 $data_user=mysqli_query($conexion,$sql);
		        while($data = mysqli_fetch_array($data_user))
		             {
		             	echo "<tr><td>Nombre:</td><td><input type='text' id='ch_name' name='ch_name' value='".$data['nombre_usuario']."' class='form-control'/></td></tr>";
		             	echo "<tr><td>Apellidos:</td><td><input type='text' id='ch_lastname' name='ch_lastname' value='".$data['apellidos_usuario']."' class='form-control'/></td></tr>";
		             	echo "<tr><td>Correo:</td><td><input type='mail' id='ch_mail' name='ch_mail' value='".$data['email_usuario']."' class='form-control'/></td></tr>";
		             	echo "<tr><td>Altura:</td><td><input type='mail' id='ch_tall' name='ch_tall' value='".$data['altura_usuario']."' class='form-control'/>(cm)</td></tr>";
		             	$old_objective = $data['id_objetivo'];
		             	$old_type_body=$data['id_tipo_cuerpo'];
		                //echo "<tr><td>Objetivo:</td><td><input type='text' id='ch_objetive' name='ch_objetive'  value='".$data['nombre_objetivo']."' class='form-control'/></tr>";
		                 //echo "<tr><td>Tipo cuerpo:</td><td><input type='text' id='ch_type_body' name='ch_type_body' value='".$data['nombre_tipo_cuerpo']."' class='form-control'/></tr>";
		             }
		      //Seleccionamos el ID y el nombre de los tipos de cuerpo.
		      $type_body_sql="SELECT * FROM `tbl_tipo_cuerpo`";
		      $type_body_query = mysqli_query($conexion,$type_body_sql);
		      //Pintamos el apartado de seleccion de tipo de cuerpo
		      echo "<tr><td>Tipo cuerpo:</td><td><select name='ch_type_body' id='ch_type_body' class='form-control'>";
		      while($type_body_data = mysqli_fetch_array($type_body_query))
		      {
		      	
		      	if( $type_body_data['id_tipo_cuerpo']==$old_type_body)
		      	{
		      		echo "<option value='".$type_body_data['id_tipo_cuerpo']."' selected>".$type_body_data['nombre_tipo_cuerpo']."</option>";
		      	}
		      	else
		      	{
		      		echo "<option value='".$type_body_data['id_tipo_cuerpo']."'>".$type_body_data['nombre_tipo_cuerpo']."</option>";
		     	}
		      }
		      echo "</select>";
		      $objective_sql = "SELECT * FROM `tbl_objetivo`";
		      $objective_query = mysqli_query($conexion,$objective_sql);
		      echo "<tr><td>Objetivo:</td><td><select name='ch_objective' id='ch_objective' class='form-control'>";
		       while($objective_data = mysqli_fetch_array($objective_query))
		      {
		      	if($objective_data['id_objetivo']==$old_objective)
		      	{
		      		echo "<option value='".$objective_data['id_objetivo']."' selected>".$objective_data['nombre_objetivo']."</option>";
		      	}
		      	else
		      	{
		      		echo "<option value='".$objective_data['id_objetivo']."'>".$objective_data['nombre_objetivo']."</option>";
		     	}
		      }
		     
				 echo "</select></td></tr>";
				?>
		      <tr><td colspan="2"><input class="btn btn-primary" type="submit" name="Enviar" value="¡Actualizar!">
		</table>
	</form>