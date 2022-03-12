use TareaProgramada;

INSERT INTO Usuario (UserName,password)
SELECT
   MY_XML.Usuarios.query('Nombre').value('.', 'VARCHAR(16)'),
   MY_XML.Usuarios.query('Password').value('.', 'VARCHAR(16)')

FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'D:\Semestre V\Bases\Primera Tarea Programada\DatosTarea1.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Datos/Usuarios/Usuario') AS MY_XML (Usuarios);

select * from Usuario

DELETE FROM Usuario WHERE id<100;

