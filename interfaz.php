<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php


$serverName = 'ERICK';
$connectionInfo = array('Database'=>'Tarea programada');
$conn = sqlsrv_connect($serverName, $connectionInfo);

// define variables and set to empty values
$nameErr = $emailErr = $genderErr = $websiteErr = "";
$name = $email = $gender = $comment = $website = "";


?>
<div id="login" class="container">
<h2>Information Post</h2>
<p><span class="error">* required field</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
  <input  id = "hello" type="text" name="name" value="<?php echo $name;?>">
  <span class="error">* <?php echo $nameErr;?></span>
  <input type="submit" name="submit" value="Filtrar Nombre">
  <br><br>
  <input type="number" name="email" value="<?php echo $email;?>">
  <span class="error">* <?php echo $emailErr;?></span>
  <input type="submit" name="submit" value="Filtrar Cantidad">
  <br><br>
  <input type="text" name="website" value="<?php echo $website;?>">
  <span class="error"><?php echo $websiteErr;?></span>
  <br><br>
</form>
<script type="text/javascript">
  function hide(){
  document.getElementById("hello").style.display = "none";
  }
</script>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if($_POST['submit'] == 'Filtrar Nombre'){
    $name = test_input($_POST["name"]);
    $tsql = "EXEC filtrarNombre @pNombre = '$name'";
    $stmt = sqlsrv_query( $conn, $tsql); 
    while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
      echo $row['Nombre'];
      echo "  ";
      echo $row['Precio'];
      echo nl2br("\n");
    }

  }
  if($_POST['submit'] == 'Filtrar Cantidad'){
    $email = test_input($_POST["email"]);
    $tsql = "EXEC filtrarCantidad @pCantidad = '$email'";
    $stmt = sqlsrv_query( $conn, $tsql); 
    while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
      echo $row['Nombre'];
      echo "  ";
      echo $row['Precio'];
      echo nl2br("\n");
    }
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