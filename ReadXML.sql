use [Tarea programada]

DECLARE @xmlData XML

SET @xmlData = (
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\eastorga\Documents\GitHub\Tarea_Porgramada_1_BD\DatosTarea1.xml', SINGLE_BLOB) 
		AS xmlData
		);


INSERT INTO dbo.Articulo(Nombre, Precio)
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)'),
	T.Item.value('@Precio', 'MONEY')
FROM @xmlData.nodes('Datos/Articulos/Articulo') as T(Item)

INSERT INTO dbo.Usuario(UserName, Password)
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(16)'),
	T.Item.value('@Password', 'VARCHAR(16)')
FROM @xmlData.nodes('Datos/Usuarios/Usuario') as T(Item)