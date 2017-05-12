<?php 
extract($_REQUEST);
include 'includes/header_login.php';

		if($err = null || ""){

			$err=0;
		}else{

		}

?>

		<form action="login.proc.php" method="POST">

				<input type="text" name="email_usuario" placeholder="Email usuario"><br>
				<input type="password" name="pass_usuario" placeholder="Contraseña"><br>

				<input type="submit" value="Login">
		</form>
		

<?php 

		
		if(isset($_POST['error'])){

			//echo $_POST['error'];
		}else if ($err == 1) {
			echo "login incorrecto";
		}
		

		include 'includes/footer_azul.php'

		?>