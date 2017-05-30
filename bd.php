<?php
    function conexion(){
        $con = new mysqli("localhost", "root", "", "venta_tickets");
        $con->set_charset("utf8");
        return $con;
    }