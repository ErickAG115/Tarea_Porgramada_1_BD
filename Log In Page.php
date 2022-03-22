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

$user = $password = "";
$found = "false";


?>

<div id="login" class="container">
<h2>Log In Page</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Usuario:<input type="text" name="user" value="<?php echo $user;?>">
    <br><br>
    Password:<input type="password" name="password" value="<?php echo $password;?>">
    <br><br>
    <input type="submit" name="submit" value="Log In">
</form>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = test_input($_POST["user"]);
    $password = test_input($_POST["password"]);
    $tsql = "EXEC retornarUsers";
    $stmt = sqlsrv_query( $conn, $tsql);
    while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
        if($row['UserName']==$user && $row['Password']==$password){
            $found="true";
        }
    }
    if($found=="false"){
        echo "El usuario o password son incorrectos";
    }
    else{
        header("Location: http://localhost/php_program/prueba.php");
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
