<?php

	/**
	* 
	*/
	class Usuario
	{
		//atributos
		private $nombre_usuario;
		private $email_usuario;
		private $pass_usuario;
		private $fecha_registro;
		private $edad_usuario;
		
		//constructor
		public function __construct($nombre_usuario, $email_usuario, $pass_usuario)
		{
			$this->nombre_usuario = $nombre_usuario;
			$this->email_usuario = $email_usuario;
			$this->pass_usuario = $pass_usuario;
			//$this->fecha_registro = $fecha_registro;
			//$this->edad_usuario = $edad_usuario;
		}
		//getters
		public function getNombreUsuario(){
			return $this->$nombre_usuario;
		}            
                public function getEmailUsuario() {
                    return $this->email_usuario;
                }
                public function  getPassUsuario(){
                    return $this->pass_usuario;
                }
                
                public function getFechaRegistro(){
                    return $this->fecha_registro;
                }
                public function getEdadUsuario(){
                    return $this->edad_usuario;
                }
                
                //setters
                public function setNombreUsuario($nombre){
                     $this->nombre_usuario = $nombre_usuario;
                }   
               public function setEmailUsuario($email){
                    $this->email_usuario = $email_usuario;
               }
               public function setPassUsuario($pass){
                    $this->pass_usuario = $pass_usuario;
               }
               public function setFechaRegistro($fecha_registro){
                   $this->fecha_registro = $fecha_registro;
               }
               public function setEdadUsuario($edad){
                   $this->edad_usuario = $edad;
               }
               
               
	}
