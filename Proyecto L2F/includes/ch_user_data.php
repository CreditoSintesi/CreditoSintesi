<table>
	<form action="proc/ch_user_data.proc.php" method="POST">
		<table class="table table-bordered">
	         <?php
	          $sql = "SELECT * 
         		 FROM `tbl_usuario` 
          		  LEFT JOIN `tbl_tipo_cuerpo` ON `tbl_tipo_cuerpo`.`id_tipo_cuerpo`= `tbl_usuario`.`id_tipo_cuerpo`
           		  LEFT JOIN `tbl_objetivo` ON `tbl_objetivo`.`id_objetivo` = `tbl_usuario`.`id_objetivo`
          		 WHERE `id_usuario` =". $_SESSION['id_usuario'];
    
		   		 $data_user=mysqli_query($conexion,$sql);
		        while($data = mysqli_fetch_array($data_user))
		             {
		             	echo "<tr><td>Nombre:</td><td><input type='text' id='ch_name' name='ch_name' value='".$data['nombre_usuario']."'/></td></tr>";
		             	echo "<tr><td>Apellidos:</td><td><input type='text' id='ch_lastname' name='ch_lastname' value='".$data['apellidos_usuario']."'/></td></tr>";
		             	echo "<tr><td>Correo:</td><td><input type='mail' id='ch_mail' name='ch_mail' value='".$data['email_usuario']."'/></td></tr>";
		             	echo "<tr><td>Altura:</td><td><input type='mail' id='ch_tall' name='ch_tall' value='".$data['altura_usuario']."'/>(cm)</td></tr>";
		                echo "<tr><td>Objetivo:</td><td><input type='text' id='ch_objetive' name='ch_objetive'  value='".$data['nombre_objetivo']."'/></tr>";
		                 echo "<tr><td>Tipo cuerpo:</td><td><input type='text' id='ch_type_body' name='ch_type_body' value='".$data['nombre_tipo_cuerpo']."'/></tr>";
		             }
		      ?>
		      <tr><td cols="2"><input type="submit" name="Enviar" value="¡Actualizar!">
		</table>
	</form>