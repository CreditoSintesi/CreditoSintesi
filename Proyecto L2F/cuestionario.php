<?php
	session_start();
	//print_r($_SESSION);
	include 'includes/header_login.php';

?>
<script type="text/javascript">
	function seleccionado (){
            var imagen = document.getElementsByName('id_tipo_cuerpo');
            var cuerpo  =  document.getElementsByName('cuerpo');

            if (imagen[0].checked) {
                cuerpo[0].src = "media/img/tipocuerpo/mesomorfo3.png";
            }else{
                cuerpo[0].src = "media/img/tipocuerpo/mesomorfo.png";
            }

            if (imagen[1].checked) {
                 cuerpo[1].src = "media/img/tipocuerpo/ectomorfo1.png";
            }else{
                cuerpo[1].src = "media/img/tipocuerpo/ectomorfo.png";
            }


            if (imagen[2].checked) {
                 cuerpo[2].src = "media/img/tipocuerpo/Endomorfo2.png";
            }else{
                cuerpo[2].src = "media/img/tipocuerpo/Endomorfo.png";
            }

        }
        
</script>
<body>	

	<div class="container">
		<h1><?php echo "Hola ".$_SESSION['nombre_usuario']."!"; ?></h1><br>
		  
		
		<?php
		if ((isset($err)) && ($err == 2)){
			echo "para continuar debes primero contestar el cuestionario obligatorio";
		}
		?>
	   <form class="form-signin" action="cuestionario.proc.php" method="POST" action="login.proc.php">
		<h2 class="form-signin-heading">Porfavor rellena el siguiente formulario</h2>

		
        <input type="user" id="inputApellidos" class="form-control"  name="apellidos_usuario" placeholder="Apellidos" required autofocus>

        <input type="date" id="inputFecha" class="form-control"  name="fecha_nacimiento" placeholder="Fecha de nacimiento" required max="2003-12-31" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" title="Fecha de nacimiento">           
		

		<input type="user" id="inputPeso" class="form-control"  name="peso_usuario" placeholder="Peso (Kg)" required>
			
		<input type="user" id="inputAltura" class="form-control"  name="altura_usuario" placeholder="Altura (Cm)" required>
				
		<!--<input type="select" id="inputAltura" class="form-control"  name="altura_usuario" placeholder="Sexo" required> -->

		<select class="form-control" name="sexo_usuario">
					<option value="">Selecciona Sexo</option>
					<option value="Mujer">Mujer</option>
					<option value="Hombre">Hombre</option>
					<option value="No Especifica">No Especifica</option>
				</select>

				

				<select class="form-control" name="id_objetivo">
				<option value="">Cual es tu objetivo ?</option>
				<?php include('select_dinamico_bd.php') ?>	
				</select>
				<input type="user" id="inputAltura" class="form-control" placeholder="Con que tipo de cuerpo te identificas?" readonly>
			
				<div class="row">
					<div class="col-xs-4">
						<img src="media/img/tipocuerpo/mesomorfo.png" height="100px" width="100px"name="cuerpo">
					</div>
					<div class="col-xs-4">
						<img src="media/img/tipocuerpo/ectomorfo.png" height="100px" width="100px" name="cuerpo">
					</div>
					<div class="col-xs-4">			
						<img src="media/img/tipocuerpo/endomorfo.png" height="100px" width="100px" name="cuerpo">
					</div>
				</div>
					<div class="col-xs-4 text-center">
						<input type="radio" name="id_tipo_cuerpo" value="1" onclick ="seleccionado()"  title="cuerpo mesomorfo" />
					</div>
					<div class="col-xs-4 text-center">
						<input type="radio" name="id_tipo_cuerpo" value="2" onclick ="seleccionado()" title="cuerpo ectomorfo" />
					</div>

					<div class="col-xs-4 text-center">
		  				<input type="radio" name="id_tipo_cuerpo" value="3" onclick ="seleccionado()" title="cuerpo Endomorfo" />
		  			</div>
				
				<input class="form-control btn btn-primary btn-lg"   type="submit" value="Enviar"><br>
		</form>
	</div>

	<?php 
		

		include 'includes/footer_azul.php'

		?>


