<?php 
extract($_REQUEST);

include 'includes/header_login.php';

if($err = null || ""){

			$err=0;
		}else{

		}
?>

<div class="container">

      <form class="form-signin" action="registro.proc.php" method="POST" action="registro.proc.php" method="POST">
        <h2 class="form-signin-heading">Registrate </h2>

        <label for="inputUser" class="sr-only">Nombre usuario</label>
        <input type="user" id="inputUser" class="form-control"  name="nombre_usuario" placeholder="Nombre" required autofocus>

        <label for="inputEmail" class="sr-only">Email</label>
        <input type="email" id="inputEmail" class="form-control"  name="email_usuario" placeholder="Email" required>

        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input type="password" id="inputPassword" class="form-control" name="pass_usuario" placeholder="Contraseña" required>

        <label for="inputPassword2" class="sr-only">Repita Contraseña</label>
        <input type="password" id="inputPassword2" class="form-control" name="pass_usuario2" placeholder="Contraseña" required> <br>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Registrate</button>
        o si ya tienes cuenta haz <a href="login.php">login</a>
      </form>
<?php 
		
		if ($err == 1) {
			echo " Las contraseñas no coinciden ";
		}
		?>
    </div> <!-- /container -->
		
		
<?php

		include 'includes/footer_azul.php';

		?>