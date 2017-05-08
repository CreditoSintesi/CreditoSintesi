<?php


class Usuario {

    
    //atributos
    private $nombre_usuario;
    private $email_usuario;
    private $pass_usuario;
    
    //constructor
    public function __construct($nombre_usuario, $email_usuario, $pass_usuario) {
        $this->nombre_usuario = $nombre_usuario;
        $this->email_usuario = $email_usuario;
        $this->pass_usuario = $pass_usuario;
        //$this->fecha_registro = $fecha_registro;
        //$this->edad_usuario = $edad_usuario;
    }
    
  

    //getters
    public function getNombreUsuario() {
        return $this->nombre_usuario;
    }

    public function getEmailUsuario() {
        return $this->email_usuario;
    }

    public function getPassUsuario() {
        return $this->pass_usuario;
    }

    public function getFechaRegistro() {
        return $this->fecha_registro;
    }

    public function getEdadUsuario() {
        return $this->edad_usuario;
    }

    //setters
    public function setNombreUsuario($nombre) {
        $this->nombre_usuario = $nombre_usuario;
    }

    public function setEmailUsuario($email) {
        $this->email_usuario = $email_usuario;
    }

    public function setPassUsuario($pass) {
        $this->pass_usuario = $pass_usuario;
    }

    public function setFechaRegistro($fecha_registro) {
        $this->fecha_registro = $fecha_registro;
    }

    public function setEdadUsuario($edad) {
        $this->edad_usuario = $edad;
    }

    public function alta(Usuario $usuario) {
        try {
            //hacemos los getters del objeto usuario
            $nombre_usuario = $usuario->getNombreUsuario();
            $email_usuario = $usuario->getEmailUsuario();
            $pass_usuario = $usuario->getPassUsuario();     
            $fecha_registro=date("Y/m/d");
            
            //iniciamos una nueva conexion PDO a nuestra bd
            $conexion = new PDO('mysql:host=localhost; dbname=bd_l2f', 'root', '');
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //generamos nuestra sentencia sql con los valores del insert y las variables
            
            //$sql = "INSERT INTO `tbl_usuario` (`nombre_usuario`, `email_usuario`, `pass_usuario`) VALUES (:nombre_usuario, :email_usuario, :pass_usuario)";
            $sql = "INSERT INTO tbl_usuario (nombre_usuario, email_usuario, pass_usuario, fecha_registro) VALUES (:nombre_usuario, :email_usuario, :pass_usuario, :fecha_registro)";
            
            //se prepara el sql
            $ejecutar=$conexion->prepare($sql);
            //relacionamos las variables con los registros del sql
            $ejecutar->bindParam(":nombre_usuario", $nombre_usuario);
            $ejecutar->bindParam(":email_usuario", $email_usuario);
            $ejecutar->bindParam(":pass_usuario", $pass_usuario);
            $ejecutar->bindParam(":fecha_registro", $fecha_registro);
            //$ejecutar->execute(array('nombre_usuario'=> $usuario->getNombreUsuario(),'pass_usuario'=> $usuario->getPassUsuario(),'email_usuario'=> $usuario->getEmailUsuario() ));
            //ejecutamos la sentencia sql
            $ejecutar->execute();
            //$resultado = $ejecutar->fetchAll();
            
        } catch (Exception $ex) {
            echo $ex->getMessage();
        }
    }
        public function updateActualizar(Usuario $usuario) {
        try {
            //hacemos los getters del objeto usuario
            $nombre_usuario = $usuario->getNombreUsuario();
            $email_usuario = $usuario->getEmailUsuario();
            $pass_usuario = $usuario->getPassUsuario();     
            $fecha_registro=date("Y/m/d");
            
            //iniciamos una nueva conexion PDO a nuestra bd
            $conexion = new PDO('mysql:host=localhost; dbname=bd_l2f', 'root', '');
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //generamos nuestra sentencia sql con los valores del insert y las variables
            
            //$sql = "INSERT INTO `tbl_usuario` (`nombre_usuario`, `email_usuario`, `pass_usuario`) VALUES (:nombre_usuario, :email_usuario, :pass_usuario)";
            $sql = "INSERT INTO tbl_usuario (nombre_usuario, email_usuario, pass_usuario, fecha_registro) VALUES (:nombre_usuario, :email_usuario, :pass_usuario, :fecha_registro)";
            
            //se prepara el sql
            $ejecutar=$conexion->prepare($sql);
            //relacionamos las variables con los registros del sql
            $ejecutar->bindParam(":nombre_usuario", $nombre_usuario);
            $ejecutar->bindParam(":email_usuario", $email_usuario);
            $ejecutar->bindParam(":pass_usuario", $pass_usuario);
            $ejecutar->bindParam(":fecha_registro", $fecha_registro);
            //$ejecutar->execute(array('nombre_usuario'=> $usuario->getNombreUsuario(),'pass_usuario'=> $usuario->getPassUsuario(),'email_usuario'=> $usuario->getEmailUsuario() ));
            //ejecutamos la sentencia sql
            $ejecutar->execute();
            //$resultado = $ejecutar->fetchAll();
            
        } catch (Exception $ex) {
            echo $ex->getMessage();
        }

    }

}
