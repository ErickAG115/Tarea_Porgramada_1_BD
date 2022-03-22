<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
.success {color: #008000;}
</style>
</head>
<body>  

<?php


$serverName = 'ERICK';
$connectionInfo = array('Database'=>'Tarea programada');
$conn = sqlsrv_connect($serverName, $connectionInfo);

$name = $cantidad = $insertN = $insertP = "";


?>
<div id="login" class="container">
<h2>Information Post</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
  <input type="text" name="name" value="<?php echo $name;?>">
  <input type="submit" name="submit" value="Filtrar Nombre">
  <br><br>
  <input type="number" name="quantity" value="<?php echo $cantidad;?>">
  <input type="submit" name="submit" value="Filtrar Cantidad">
  <br><br>
  Insertar Nuevo Articulo
  <br><br>
  Nombre: <input type="text" name="nameI" value="<?php echo $insertN;?>">
  <br><br>
  Precio: <input type="number" name="priceI" value="<?php echo $insertP;?>">
  <br><br>
  <input type="submit" name="submit" value="Aceptar">
  <input type="submit" name="submit" value="Cancelar">
  <br><br>
  <input type="submit" name="submit" value="Log Off">
</form>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if($_POST['submit'] == "Filtrar Nombre"){
    $name = test_input($_POST["name"]);
    $tsql = "EXEC filtrarNombre @pNombre = '$name'";
    $stmt = sqlsrv_query( $conn, $tsql); 
    while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
      echo $row['Nombre'];
      echo " |||| Precio:  ";
      echo $row['Precio'];
      echo nl2br("\n");
    }

  }
  if($_POST['submit'] == 'Aceptar'){
    $insertN = test_input($_POST["nameI"]);
    $insertP = test_input($_POST["priceI"]);
    if(empty($insertN)||empty($insertP)){
      echo "Hay espacios vacios";
    }
    else{
      $tsql = "EXEC insertarArticulo @pNombre = '$insertN', @pPrecio = '$insertP'";
      $stmt = sqlsrv_query( $conn, $tsql);
      $check = sqlsrv_fetch($stmt);
      if($check=='True'){
        echo "Ya existe un articulo con ese nombre";
      }
      else{
        echo "El articulo fue insertado";
      }
    }
  }
  if($_POST['submit'] == 'Filtrar Cantidad'){
    $cantidad = test_input($_POST["quantity"]);
    $tsql = "EXEC filtrarCantidad @pCantidad = '$cantidad'";
    $stmt = sqlsrv_query( $conn, $tsql); 
    while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
      echo $row['Nombre'];
      echo " |||| Precio:  ";
      echo $row['Precio'];
      echo nl2br("\n");
    }
  }
  if($_POST['submit'] == 'Log Off'){
    header("Location: http://localhost/php_program/Log%20In%20Page.php");
    exit();
  }
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>
</body>
</html>