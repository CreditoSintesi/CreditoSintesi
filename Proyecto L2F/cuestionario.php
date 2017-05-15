<?php
	session_start();
	print_r($_SESSION);
	include 'includes/header_login.php';

?>
<script type="text/javascript">
	function seleccionado (){
            var imagen = document.getElementsByName('id_tipo_cuerpo');
            var cuerpo  =  document.getElementsByName('cuerpo');

            if (imagen[0].checked) {
                cuerpo[0].src = "img/1.1.png";
            }else{
                cuerpo[0].src = "img/1.png";
            }

            if (imagen[1].checked) {
                 cuerpo[1].src = "img/2.1.png";
            }else{
                cuerpo[1].src = "img/2.png";
            }


            if (imagen[2].checked) {
                 cuerpo[2].src = "img/3.1.png";
            }else{
                cuerpo[2].src = "img/3.png";
            }

        }
        
</script>
<body>	
		<h1><?php echo "Hola ".$_SESSION['nombre_usuario']."!"; ?></h1><br>
		<h3>Porfavor rellena el siguiente formulario</h3>
		<?php
		if ((isset($err)) && ($err == 2)){
			echo "para continuar debes primero contestar el cuestionario obligatorio";
		}
		?>
		<form action="cuestionario.proc.php">
				<input type="text" name="apellidos_usuario" placeholder="Apellidos"><br>
				<input type="date" name="fecha_nacimiento" placeholder="Fecha de nacimiento" max="2003-12-31" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
                    title="El formato debe ser yyyy-mm-dd"><br>
				<input type="text" name="altura_usuario" placeholder="Altura"><label>(cm)</label><br>
				<input type="text" name="peso_usuario" placeholder="Peso"><label>(kg)</label><br>
				<select name="sexo_usuario">
					<option value="">Selecciona Sexo</option>
					<option value="Mujer">Mujer</option>
					<option value="Hombre">Hombre</option>
					<option value="No Especifica">No Especifica</option>
				</select><br>
				<select name="id_objetivo">
				<option value="">Cual es tu objetivo ?</option>
				<?php include('select_dinamico_bd.php') ?>	
				</select><br><br>
				Con que tipo de cuerpo te identificas?<br>
				<label>
	  				<input type="radio" name="id_tipo_cuerpo" value="1" onclick ="seleccionado()"  title="cuerpo mesomorfo" />
					<img src="img/1.png" height="100px" width="100px"name="cuerpo">
				</label>
				<br>
				<label>
	  				<input type="radio" name="id_tipo_cuerpo" value="2" onclick ="seleccionado()" title="cuerpo ectomorfo" />
					<img src="img/2.png" height="100px" width="100px" name="cuerpo">
				</label>
				<br>
				<label>
	  				<input type="radio" name="id_tipo_cuerpo" value="3" onclick ="seleccionado()" title="cuerpo Endomorfo" />
					<img src="img/3.png" height="100px" width="100px" name="cuerpo">
				</label>
				<br>
				<input type="submit" value="Enviar"><br>
		</form>
		

	<?php 
		

		include 'includes/footer_azul.php'

		?>
