<?php

class Conectar
{
	
	//conexion a tu base de datos
	
	
	public static function ruta()
	{
		return "http://localhost/l2f/";
	}
	
	public function comillas_inteligentes($valor)
	{
		// Retirar las barras
		if (get_magic_quotes_gpc()) {
			$valor = stripslashes($valor);
		}
	
		// Colocar comillas si no es entero
		if (!is_numeric($valor)) {
			$valor = "'" . mysql_real_escape_string($valor) . "'";
		}
		return $valor;
	}
	
}
?>