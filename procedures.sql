use TareaProgramada;

INSERT INTO Articulo (id,Nombre, Precio)
VALUES
(1,'Coca',350);

INSERT INTO Articulo (id,Nombre, Precio)
VALUES
(2,'Atun',1500);

INSERT INTO Articulo (id,Nombre, Precio)
VALUES
(3,'Anchoa',1000);

select * from Articulo order by Articulo.nombre;


--------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS filtrarNombre;

CREATE PROCEDURE filtrarNombre @pNombre nvarchar(150)
AS
IF (@pNombre = '') -- excepcion forzada del programador
	select * from Articulo order by Articulo.nombre;            
ELSE
	select * from Articulo where Articulo.nombre like '%'+@pNombre+'%';


	
EXEC filtrarNombre @pNombre = 'O'

--------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS filtrarCantidad;

CREATE PROCEDURE filtrarCantidad @pCantidad int
AS
IF (@pCantidad = 0) -- excepcion forzada del programador
	select * from Articulo order by Articulo.nombre;            
ELSE
	select TOP(@pCantidad) * from Articulo ;


	
EXEC filtrarCantidad @pCantidad = 1