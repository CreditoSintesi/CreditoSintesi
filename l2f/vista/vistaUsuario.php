<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Modelo-vista-controlador</title>
</head>
<body>
    <h1>Usuarios disponibles</h1>
    
        <?php
        include("../modelo/Usuario.php");
        echo $usuario->getNombreUsuario();
        ?>
    
</body>
</html>