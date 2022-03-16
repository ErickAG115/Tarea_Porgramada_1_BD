<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initioal-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>Place Holder</title>

    </head>

    <?php
        $serverName = 'ERICK';
        $connectionInfo = array('Database'=>'Tarea programada');
        $conn = sqlsrv_connect($serverName, $connectionInfo);
        if( $conn ) {
            echo "Connection established.<br />";
       }else{
            echo "Connection could not be established.<br />";
            die( print_r( sqlsrv_errors(), true));
       }
       $tsql = "SELECT * FROM Articulo";
       $stmt = sqlsrv_query( $conn, $tsql);  

       if ($stmt){
        while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
            echo $row['id'].", ".$row['Nombre'].", ".$row['Precio']."<br />";
        }
       }
       else{    
           echo "Error in statement execution.\n";    
           die( print_r( sqlsrv_errors(), true));    
       } 
    ?>

    <body>
        <div>
            <div id="login" class="container">
                <div class="row">
                    <div class="col-md-5">

                        <div class="card">
                            <div class="card-header">
                                Log in info
                            </div>
                            <div class="card-body">
                                <form action="javascript:void(0)" method="post">
                                    <div class="mb-3">
                                        <label for="" class="form-label">Nombre:</label>
                                        <input type="text"
                                            class="form-control" name="Usuario" id="usuario" placeholder="Usuario">
            
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Password:</label>
                                        <input type="password"
                                            class="form-control" name="Password" id="password" placeholder="Password">
                                    </div>
            
                                    <button onclick="GoToP2()" type="submit" class="btn btn-success">Log In</button>

                                    <script type="text/javascript">
                                        function GoToP2(){
                                            document.getElementById("login").style.display = "none";
                                            document.getElementById("info").style.display = "block";
                                        }
                                    </script>
            
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div id="info" class="container" style="display: none">
            <div class="row">
                <div class="col-md-7">
                    <div class="col-md-7">
                        <button type="submit" class="btn btn-success">Filtrar por Nombre</button>
                        <input type="text"
                                class="form-control" name="NameFilter" id="NameFilter" placeholder="Nombre">
                    </div>
                    <div class="col-md-7">
                        <button  type="submit" class="btn btn-success">Filtrar por Cantidad</button>
                        <input type="text"
                                class="form-control" name="AmountFilter" id="AmountFilter" placeholder="Cantidad">
                    </div>
                    <div class="col-md-7">
                        <button type="submit" class="btn btn-success">Insertar Articulo</button>
                        <input type="text"
                                class="form-control" name="ArticleName" id="ArticleName" placeholder="Nombre">
                        <input type="text"
                                class="form-control" name="ArticleAmount" id="ArticleAmount" placeholder="Cantidad">
                    </div>
                    <div class="col-md-7">
                        <button onclick="GoToP1()" type="submit" class="btn btn-success">Log Off</button>

                        <script type="text/javascript">
                            function GoToP1(){
                                document.getElementById("info").style.display = "none";
                                document.getElementById("login").style.display = "block";
                            }
                        </script>

                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre de Articulo</th>
                                <th>Precio</th>
                            </tr>
                                <?php
                                $tsql = "SELECT * FROM Articulo";
                                $stmt = sqlsrv_query( $conn, $tsql); 
                                while( $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
                                ?>
                                    <tr>
                                        <td><?php echo $row['id']?></td>
                                        <td><?php echo $row['Nombre']?></td>
                                        <td><?php echo $row['Precio']?></td>
                                    </tr>

                                <?php
                                }
                                ?>
                        </thead>
                    </table>
                </div>

            </div>
        </div>
    </body>
</html>