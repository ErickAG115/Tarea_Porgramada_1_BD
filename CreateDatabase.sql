USE [master]
GO
/****** Object:  Database [TareaProgramada]    Script Date: 22/03/2022 23:59:29 ******/
CREATE DATABASE [TareaProgramada]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tarea programada', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\Tarea programada.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tarea programada_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\Tarea programada_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TareaProgramada] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TareaProgramada].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TareaProgramada] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TareaProgramada] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TareaProgramada] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TareaProgramada] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TareaProgramada] SET ARITHABORT OFF 
GO
ALTER DATABASE [TareaProgramada] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TareaProgramada] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TareaProgramada] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TareaProgramada] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TareaProgramada] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TareaProgramada] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TareaProgramada] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TareaProgramada] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TareaProgramada] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TareaProgramada] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TareaProgramada] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TareaProgramada] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TareaProgramada] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TareaProgramada] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TareaProgramada] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TareaProgramada] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TareaProgramada] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TareaProgramada] SET RECOVERY FULL 
GO
ALTER DATABASE [TareaProgramada] SET  MULTI_USER 
GO
ALTER DATABASE [TareaProgramada] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TareaProgramada] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TareaProgramada] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TareaProgramada] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TareaProgramada] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TareaProgramada] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TareaProgramada', N'ON'
GO
ALTER DATABASE [TareaProgramada] SET QUERY_STORE = OFF
GO
USE [TareaProgramada]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 22/03/2022 23:59:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/03/2022 23:59:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](16) NOT NULL,
	[Password] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[filtrarCantidad]    Script Date: 22/03/2022 23:59:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[filtrarCantidad] @pCantidad int
AS
IF (@pCantidad = 0) -- excepcion forzada del programador
	select * from Articulo order by Articulo.nombre;            
ELSE
	select TOP(@pCantidad) * from Articulo ;
GO
/****** Object:  StoredProcedure [dbo].[filtrarNombre]    Script Date: 22/03/2022 23:59:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[filtrarNombre] @pNombre nvarchar(150)
AS
IF (@pNombre = '') -- excepcion forzada del programador
	select * from Articulo order by Articulo.nombre;            
ELSE
	select * from Articulo where Articulo.nombre like '%'+@pNombre+'%';
GO
/****** Object:  StoredProcedure [dbo].[insertarArticulo]    Script Date: 22/03/2022 23:59:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarArticulo] @pNombre nvarchar(150), @pPrecio int
AS
DECLARE @Cantidad int;
SET  @Cantidad = (select count(*) from  Articulo where Articulo.nombre = @pNombre);
IF (@Cantidad = 0) -- excepcion forzada del programador
	INSERT INTO Articulo (Nombre, Precio) VALUES	(@pNombre,@pPrecio);         
ELSE
	select 'Articulo con nombre duplicado'
GO
USE [master]
GO
ALTER DATABASE [TareaProgramada] SET  READ_WRITE 
GO
