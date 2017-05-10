<?php
	session_start();
	
?>
<!DOCTYPE html>
<html>
<head>
	<title>registro usuarios</title>
</head>
<body>	
		<form action="cuestionario.proc.php">
				<input type="text" name="apellidos_usuario">
				<input type="date" name="fecha_nacimiento">
				<input type="text" name="altura_usuario">
				<input type="text" name="peso_usuario">
				<select name="sexo_usuario">
					<option value="Mujer">Mujer</option>
					<option value="Hombre">Hombre</option>
					<option value="No Especifica">No Especifica</option>
				</select>

				<?php //hacer select de una consulta ?>
				<select name="objetivo_usuario">
					<option value="Mujer">Mujer</option>
					<option value="Hombre">Hombre</option>
					<option value="No Especifica">No Especifica</option>
				</select>
				<input type="submit" value="Enviar">
		</form>
		

</body>
</html>