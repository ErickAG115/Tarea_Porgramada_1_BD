use [Tarea programada];

--------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS filtrarNombre;

CREATE PROCEDURE filtrarNombre @pNombre nvarchar(150)
AS BEGIN

IF (@pNombre = '') -- excepcion forzada del programador
	select * from Articulo order by Articulo.nombre;            
ELSE
	select * from Articulo where Articulo.nombre like '%'+@pNombre+'%';

END
GO
	
EXEC filtrarNombre @pNombre = ''

--------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS filtrarCantidad;

CREATE PROCEDURE filtrarCantidad @pCantidad int
AS BEGIN
IF (@pCantidad = 0) -- excepcion forzada del programador
	select * from Articulo order by Articulo.nombre;            
ELSE
	select TOP(@pCantidad) * from Articulo ;

END
GO


	
EXEC filtrarCantidad @pCantidad = 1



DROP PROCEDURE IF EXISTS insertarArticulo;

CREATE PROCEDURE insertarArticulo @pNombre nvarchar(150), @pPrecio int
AS BEGIN
DECLARE @Cantidad int;
SET  @Cantidad = (select count(*) from  Articulo where Articulo.nombre = @pNombre);
IF (@Cantidad = 0) -- excepcion forzada del programador
	INSERT INTO Articulo (Nombre, Precio) VALUES	(@pNombre,@pPrecio);         
ELSE
	select 'Articulo con nombre duplicado'

END
GO

