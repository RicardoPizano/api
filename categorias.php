<?php
/**
 * Conexion a la base de datos y comprobación de conexion correta
 */
require_once('bd.php');

/**
 * Funcion encargada de regresar un JSON con las categorias y su descripcion
 */
function getCategorias(){
    // Conexion a la base de datos
    $con = conexion();

    // Select todas las categorias
    $query = "SELECT * FROM categorias";
    $select = $con -> query($query);

    // Valida que existan categorias en la base de datos
    if(($select -> num_rows) > 0){

        // Se crea array vacio que contendra todas las categorias que existen
        $arrayCategorias = array();

        // Mientras exista una categoria crea un array de la categoria y la agrega a la variable de
        // todas las categorias que existen
        while($row = $select->fetch_assoc()){
            $categoria = [
                "id" => $row['cat_id'],
                "nombre" => $row['cat_nombre'],
                "descripcion" => $row['cat_descripcion']
            ];
            $arrayCategorias[] = $categoria;
        }

        // Crea el array de respuesta con todas las categorias de la base de datos
        $categorias = ["res" => "1", "categorias" => $arrayCategorias];

        // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
        $json = json_encode($categorias);
        $con -> close();
        print($json);
    }else{
        // Respuesta en caso de que no contenga todos los datos necesarios la url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        $con -> close();
        print($json);
    }
}

/**
 * segmento encargado de verificar que la url tenga el parametro de la accion, en caso de no tener el parametro a
 * regresa un json con res=0 y un msg de operacion no existe en caso contrario conprueba la accion y dependiendo
 * de la accion solicitada realiza una funcion especifrica
 */
if(isset($_GET['a'])){
    $accion = $_GET['a']; // Se obtiene la accion po0r metodo GET
    switch ($accion){ // Switch encargado de verificar la accion
/*------------------------------------------------------------------------------------- OBTENCION CATEGORIAS ---------*/
        case 'getCategorias':
            getCategorias();
            break;
/*------------------------------------------------------------------------------------- CASO DEFAULT -----------------*/
        default:
            $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
            print($json);
            break;
    }
}else{
    $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
    print($json);
}