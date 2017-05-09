<?php


class Usuario {

    
    //atributos
    private $id_usuario;
    private $nombre_usuario;
    private $email_usuario;
    private $pass_usuario;
    private $apellidos_usuario;
    private $sexo_usuario;
    private $fecha_nacimiento;
    private $altura_usuario;
    private $peso_usuario;
    
    
    function getNombre_usuario() {
        return $this->nombre_usuario;
    }

    function getEmail_usuario() {
        return $this->email_usuario;
    }

    function getPass_usuario() {
        return $this->pass_usuario;
    }

    function getApellidos_usuario() {
        return $this->apellidos_usuario;
    }

    function getSexo_usuario() {
        return $this->sexo_usuario;
    }

    function getFecha_nacimiento() {
        return $this->fecha_nacimiento;
    }

    function getAltura_usuario() {
        return $this->altura_usuario;
    }

    function getPeso_usuario() {
        return $this->peso_usuario;
    }

    function setNombre_usuario($nombre_usuario) {
        $this->nombre_usuario = $nombre_usuario;
    }

    function setEmail_usuario($email_usuario) {
        $this->email_usuario = $email_usuario;
    }

    function setPass_usuario($pass_usuario) {
        $this->pass_usuario = $pass_usuario;
    }

    function setApellidos_usuario($apellidos_usuario) {
        $this->apellidos_usuario = $apellidos_usuario;
    }

    function setSexo_usuario($sexo_usuario) {
        $this->sexo_usuario = $sexo_usuario;
    }

    function setFecha_nacimiento($fecha_nacimiento) {
        $this->fecha_nacimiento = $fecha_nacimiento;
    }

    function setAltura_usuario($altura_usuario) {
        $this->altura_usuario = $altura_usuario;
    }

    function setPeso_usuario($peso_usuario) {
        $this->peso_usuario = $peso_usuario;
    }
    
    public function Usuario($apellidos_usuario ,$peso_usuario, $altura_usuario, $fecha_nacimiento, $sexo_usuario ){
        
        $this->apellidos_usuario = $apellidos_usuario;
        $this->fecha_nacimiento = $fecha_nacimiento;
        $this->peso_usuario = $peso_usuario;
        $this->sexo_usuario = $sexo_usuario;
        $this->altura_usuario = $altura_usuario;
    }
        //constructor
    public function __construct($nombre_usuario, $email_usuario, $pass_usuario) {
        $this->nombre_usuario = $nombre_usuario;
        $this->email_usuario = $email_usuario;
        $this->pass_usuario = $pass_usuario;
        //$this->fecha_registro = $fecha_registro;
        //$this->edad_usuario = $edad_usuario;
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
            
            //
            
            //$resultado = $ejecutar->fetchAll();
            
        } catch (Exception $ex) {
            echo $ex->getMessage();
        }
    }
        public function updateCuestionario(Usuario $usuario) {
        try {
            //hacemos los getters del objeto usuario
                
            $fecha_update=date("Y/m/d");
            
            //iniciamos una nueva conexion PDO a nuestra bd
            $conexion = new PDO('mysql:host=localhost; dbname=bd_l2f', 'root', '');
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //generamos nuestra sentencia sql con los valores del insert y las variables
            
           
             $sql = "UPDATE `tbl_usuario`   
                    (`apellidos_usuario`,`sexo_usuario`,`altura_usuario`,`fecha_nacimiento`) 
                    VALUES (:apellidos_usuario, :sexo_usuario, :altura_usuario, :fecha_nacimiento)
                    WHERE tbl_usuario.id_usuario = :id_usuario;
                    ";
            //se prepara el sql
            $ejecutar=$conexion->prepare($sql);
            //relacionamos las variables con los registros del sql
            $ejecutar->bindParam(":apellidos_usuario", $apellidos_usuario);
            $ejecutar->bindParam(":sexo_usuario", $sexo_usuario);
            $ejecutar->bindParam(":altura_usuario", $altura_usuario);
            $ejecutar->bindParam(":fecha_nacimiento", $fecha_nacimiento);
            //ejecutamos la consulta
            $ejecutar->execute();
            
            //y a continuación tenemos que insertar el historial de peso.
            //$resultado = $ejecutar->fetchAll();
            
        } catch (Exception $ex) {
            echo $ex->getMessage();
        }

    }

}
