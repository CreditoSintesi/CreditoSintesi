<?php 
extract($_REQUEST);
include 'includes/header_login.php';

		if($err = null){

			$err=0;
		}

		
?>
      
	
	<div class="container">

      <form class="form-signin" action="login.proc.php" method="POST" action="login.proc.php">
        <h2 class="form-signin-heading">Inicia sesión porfavor</h2>
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="email" id="inputEmail" class="form-control"  name="email_usuario" placeholder="Email" required autofocus> 
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input type="password" id="inputPassword" class="form-control email" name="pass_usuario" placeholder="Contraseña" required> <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar sesión</button>
        Si no tienes cuenta <a href="registro.php">registrate</a><br>
      </form>

   
	



<?php 

		
		
		if ($err == 1) {
			
			
			echo "login incorrecto";
			echo "</div> <!-- /container -->";
		}
		
		 echo " </div> <!-- /container --> ";
		include 'includes/footer_azul.php';

		?>