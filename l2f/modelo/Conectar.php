<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Conectar
 *
 * @author 1001489.joan23
 */

class Conectar{
    public static function conexion(){
        $conexion=new mysqli("localhost", "root", "", "bd_l2f");
        $conexion->query("SET NAMES 'utf8'");
        return $conexion;
    }
}

