<?php
extract($_REQUEST);
?>
<!DOCTYPE html>
<html>
<head>
	<title>pag principal</title>
</head>
<body>	<h1>Página principal</h1>
		
		<a href="login.php">Logueate</a>
		<a href="registro.php">Registrate</a>
		<br><br>
		<?php

		if(isset($_POST['error'])){

			echo $_POST['error'];
		}else if ($err == 1) {
			echo "login incorrecto";
		}

		?>
</body>
</html>