use TareaProgramada;

INSERT INTO Articulo (Nombre, Precio)
VALUES
('Coca',350);

INSERT INTO Articulo (Nombre, Precio)
VALUES
('Atun',1500);

INSERT INTO Articulo (sNombre, Precio)
VALUES
('Anchoa',1000);

select * from Articulo order by Articulo.nombre;
drop table Ususario

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



DROP PROCEDURE IF EXISTS insertarArticulo;

CREATE PROCEDURE insertarArticulo @pNombre nvarchar(150), @pPrecio int
AS
DECLARE @Cantidad int;
SET  @Cantidad = (select count(*) from  Articulo where Articulo.nombre = @pNombre);
IF (@Cantidad = 0) -- excepcion forzada del programador
	INSERT INTO Articulo (Nombre, Precio) VALUES	(@pNombre,@pPrecio);         
ELSE
	select 'Articulo con nombre duplicado'


	
EXEC insertarArticulo @pNombre = 'Pepinos', @pPrecio = 500


select * from Articulo