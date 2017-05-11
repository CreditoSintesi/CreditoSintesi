<?php
session_start();
include_once('conexio.php');
$id_usuario = $_SESSION['id_usuario'];

?>
<!DOCTYPE html>
<html>
<head>
	<title>registro usuarios</title>
</head>
<body>

<?php
$consulta = "SELECT *
      FROM `tbl_rutina`
INNER JOIN `tbl_objetivo`
        ON `tbl_rutina`.`id_objetivo` = `tbl_objetivo`.`id_objetivo`
INNER JOIN `tbl_usuario`
        ON `tbl_objetivo`.`id_objetivo` = `tbl_usuario`.`id_objetivo`
     WHERE `id_usuario` = '$id_usuario';" ; 

?>

<h1>Rutinas disponibles para: <?php echo $_SESSION['nombre_usuario']?> </h1>
<?php
include('mostrar_rutinas_objetivo.php');
?>


</body>
</html>