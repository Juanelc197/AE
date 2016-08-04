-- DECLARE VARIABLE
DECLARE @ErrorMessage VARCHAR(MAX)

--CREATE USERNAME IN INSTANCE OF SQL SERVER
IF NOT EXISTS(SELECT sid, name FROM MASTER..SYSLOGINS WHERE name = 'AlegriaEmbotelladaAppESC')
     BEGIN
	    EXEC sp_addlogin 'AlegriaEmbotelladaAppESC', 'ut335al3gr143mb0t3ll4d4'
	 END
ELSE 
     BEGIN 	 
	    SET @ErrorMessage = 'Username already exist in database' 
		SELECT  @ErrorMessage AS 'Msg'
	 END
GO

--------------------------------------------------------------------------------------------------------------------------

-- CREATE DATABASE
IF EXISTS(SELECT*FROM DBO.SYSDATABASES WHERE NAME = 'dbAlegriaEmbotelladaESC_UAT')
   BEGIN 
        ALTER DATABASE [dbAlegriaEmbotelladaESC_UAT] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		USE master
		DROP DATABASE dbAlegriaEmbotelladaESC_UAT
		CREATE DATABASE dbAlegriaEmbotelladaESC_UAT
	END
ELSE
    BEGIN
	     CREATE DATABASE dbAlegriaEmbotelladaESC_UAT
	END
GO

--------------------------------------------------------------------------------------------------------------------------

--USE DATABASE 
USE dbAlegriaEmbotelladaESC_UAT
GO

--DECLARE VARIABLES 
DECLARE @ErrorMessage VARCHAR (MAX)

--VIEW USERNAMES FOR DATASE ACTUALLY
IF NOT EXISTS(SELECT uid, name, sid FROM SYSUSERS WHERE name = 'dbAlegriaEmbotelladaESC_UAT' AND islogin = 1)
    BEGIN
	  -- CREATE LOGIN 
	  CREATE USER AlegriaEmbotelladaAppESC FOR LOGIN AlegriaEmbotelladaAppESC

	  --ADD ROLES TO USER
	  EXEC sp_addrolemember 'db_owner', 'AlegriaEmbotelladaAppESC'
	  EXEC sp_addrolemember 'db_accessadmin', 'AlegriaEmbotelladaAppESC'
END
ELSE
      BEGIN 
	      SET @ErrorMessage = 'Username already exist in database'
		  SELECT @ErrorMessage AS 'Msg'
	  END

GO
CREATE TABLE [dbo].[tb_Sucursal](
	[PK_Sucursal] [int] NOT NULL,
	[Nombre_Sucursal] [varchar](40) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Número] [int] NOT NULL,
	[Colonia] [varchar](40) NOT NULL,
	[FK_Promoción] [int] NOT NULL,
	[Municipio_Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Sucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (1, N'OXXO Pasea de la amistad', N'Calle Paseo de la Amistad', 304, N'Monte Real', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (2, N'OXXO Paseo de las Rosas', N'Calle Paseo de las Rosas', 325, N'Monte Real', 2, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (3, N'OXXO Riberas de Girasoles', N'Avenida Raul Salinas Lozano', 52, N'Riberas de Girasoles', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (4, N'OXXO Felipe Carrillo', N'Avenida Raul Salinas Lozano', 714, N'Felipe Carrillo', 8, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (5, N'OXXO Paseo del Real', N'Avenida Raul Salinas Lozano', 847, N'Paseo del Real', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (6, N'OXXO las Torres', N'las Torres', 319, N'Riberas de Girasoles', 7, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (7, N'OXXO del Topo', N'Carretera a General Escobedo', 1405, N'del Topo', 8, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (8, N'OXXO Villas de Escobedo', N'las Torres ', 318, N'Villas de Escobedo', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (9, N'OXXO las Encinas', N'Boulevard Benito Juárez', 601, N'las Encinas', 9, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (10, N'OXXO Pedregal de Escobedo', N'Avenida las Torres', 992, N'Pedregal de Escobedo', 3, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (11, N'OXXO las Malvinas', N'Sierra Madre Occidental', 1100, N'las Malvinas', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (12, N'OXXO Los Pinos', N'Los Pinos', 211, N'Joyas de Anáhuac', 10, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (13, N'OXXO Evaristo Caballero', N'Calle Evaristo Caballero', 3299, N'Andrés Caballero Moreno Agrop', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (14, N'OXXO Nexxus Diamante', N'Calle los Pinos', 500, N'Nexxus Diamante', 6, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (15, N'OXXO el Canadá', N'Carretera A Colombia', 300, N'el Canadá', 10, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (16, N'OXXO Ex Hacienda el Canadá', N'Morelos', 307, N'Ex Hacienda el Canadá', 5, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (17, N'OXXO Balcones de Anáhuac', N'Avenida Sendero Norte', 100, N'Balcones de Anáhuac', 1, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (18, N'OXXO Valle del Canadá', N'Boulevard Lic. José López Portillo', 90, N'Valle del Canadá', 2, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (19, N'OXXO Quebec', N'Valle del Canadá', 91, N'villas del Canadá', 3, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (20, N'OXXO Valle de San Francisco', N'Calle de las Águilas', 602, N'Valle de San Francisco', 20, N'General Escobedo, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (21, N'SIX Fray Bartolomé de las Casas', N'Fray Bartolomé de las Casas', 139, N'Roble Norte', 9, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (22, N'SIX Roble Norte', N'Avenida Manuel L. Barragán', 200, N'Roble Norte', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (23, N'SIX Porfirio Díaz', N'Porfirio Díaz', 527, N'Centro', 6, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (24, N'SIX Riveras de las Puentes', N'Avenida República Mexicana', 100, N'Riveras de las Puentes', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (25, N'SIX Universidad', N'Avenida Universidad', 11, N'Casa Bella', 7, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (26, N'SIX Barragán', N'Calle Stiva', 348, N'Barragán', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (27, N'SIX Valle del Roble', N'Avenida Arturo B. de la Garza', 800, N'Valle del Roble', 9, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (28, N'SIX Roble San Nicolás', N'Calle Jorge González Camarena', 0, N'Roble San Nicolás', 4, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (29, N'SIX Pico Bolívar', N'Avenida Pico Bolívar', 963, N'las Puentes Sector 1', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (30, N'SIX Diego Díaz de Berlanga', N'Avenida Diego Díaz de Berlanga', 1061, N'Jardines de Anáhuac Sector 1', 7, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (31, N'SEVEN 7 El Roble', N'Avenida República Mexicana', 1507, N'El Roble', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (32, N'SEVEN 7 la Nogalera', N'Avenida República Mexicana', 600, N'la Nogalera', 2, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (33, N'SEVEN 7 Viena', N'Calle Viena', 918, N'Futuro Nogalar Sector 1', 4, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (34, N'SEVEN 7 Héroes de México', N'Avenida Zacatecas', 0, N'Héroes de México', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (35, N'SEVEN 7 Valle de las Flores', N'Avenida Montes Berneses', 1100, N'Valle de las Flores', 10, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (36, N'SEVEN 7 Fuentes de Anáhuac', N'Calle Fuente Alegre', 301, N'Fuentes de Anáhuac', 6, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (37, N'SEVEN 7 Santo Domingo', N'Avenida Santo Domingo', 1426, N'Praderas de Santo Domingo', 8, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (38, N'SEVEN 7 Las Puentes Sect 15', N'Avenida Diego Díaz de Berlanga', 661, N'Las Puentes Sect 15', 5, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (39, N'SEVEN 7 Antiguo Nogalar', N'Calle Arroyo', 0, N'Antiguo Nogalar', 10, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (40, N'SEVEN 7 Lagrange', N'Avenida Licenciado Adolfo López Mateos', 205, N'Lagrange', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (41, N'MODELORAMA Torres de Santo Domingo', N'Avenida Camino Al Mezquital', 0, N'Torres de Santo Domingo', 9, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (42, N'MODELORAMA Adolfo López Mateos', N'Calle Adolfo López Mateos', 205, N'Peña Guerra', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (43, N'MODELORAMA Camino A Tlachiquerías', N'Calle Camino A Tlachiquerías', 0, N'Santo Domingo', 3, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (44, N'MODELORAMA Adolfo López Mateos', N'Avenida Licenciado Adolfo López Mateos', 4207, N'Rincón del Oriente', 8, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (45, N'MODELORAMA Rómulo Garza', N'Avenida Rómulo Garza', 601, N'Fidel Velázquez Sector 1', 10, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (46, N'MODELORAMA Casa Blanca', N'Calle Antiguo Camino A Apodaca', 0, N'Casa Blanca', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (47, N'MODELORAMA Villa del Señor', N'Calle Villa del Señor', 1400, N'Luis', 3, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (48, N'MODELORAMA Los Morales', N'Avenida Calzada Unión', 1195, N'Los Morales', 1, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (49, N'MODELORAMA Paseo de los Ángeles', N'Avenida Rómulo Garza', 101, N'Paseo de los Ángeles', 6, N'San Nicolás de los Garza, Nuevo León')
INSERT [dbo].[tb_Sucursal] ([PK_Sucursal], [Nombre_Sucursal], [Calle], [Número], [Colonia], [FK_Promoción], [Municipio_Estado]) VALUES (50, N'MODELORAMA Unión', N'Avenida Unión', 230, N'Los Morales', 4, N'San Nicolás de los Garza, Nuevo León')
/****** Object:  Table [dbo].[tb_Proveedor]    Script Date: 08/04/2016 07:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Proveedor](
	[PK_Proveedor] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Teléfono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Proveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_Proveedor] ([PK_Proveedor], [Nombre], [Teléfono], [email]) VALUES (1, N'CuahutemocMoctezuma', N'1800237832', N'contacto@cuamoc.com')
/****** Object:  Table [dbo].[tb_Login]    Script Date: 08/04/2016 07:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Login](
	[PK_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](16) NOT NULL,
	[PASSWORD] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Login] ON
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (22, N'jesua_alf', N'25648')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (23, N'alf_jona', N'281091')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (31, N'dara_cata', N'1568')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (32, N'rene-salazar', N'151020')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (38, N'juan_est28', N'151020')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (42, N'dani@sandoval', N'1234567')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (45, N'juanlc19', N'juanlc')
INSERT [dbo].[tb_Login] ([PK_Usuario], [UserName], [PASSWORD]) VALUES (46, N'pato1', N'1234zambrano')
SET IDENTITY_INSERT [dbo].[tb_Login] OFF
/****** Object:  Table [dbo].[tb_Consumidor]    Script Date: 08/04/2016 07:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Consumidor](
	[PK_Consumidor] [int] IDENTITY(1,1) NOT NULL,
	[Primer_Nombre] [varchar](15) NOT NULL,
	[Primer_Apellido] [varchar](15) NULL,
	[edad] [int] NOT NULL,
	[email] [varchar](30) NOT NULL,
	[FK_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Consumidor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Consumidor] ON
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (18, N'jesua', N'alfaro', 54, N'juan_alf@msn.com', 22)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (19, N'jonan', N'alfaro', 24, N'elkonan_28@hotmail.com', 23)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (20, N'dara', N'catalina', 18, N'dara_coronado@gmail.com', 31)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (21, N'rene', N'salazar', 18, N'rene_sa@msn.com', 32)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (26, N'Juan', N'Limón', 19, N'juan_es@hotmail.com', 38)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (36, N'Daniel', N'Sandoval', 18, N'dani_sandoval@gmail.com', 42)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (39, N'juan', N'limon', 19, N'juanlc@', 45)
INSERT [dbo].[tb_Consumidor] ([PK_Consumidor], [Primer_Nombre], [Primer_Apellido], [edad], [email], [FK_Usuario]) VALUES (40, N'pato', N'zambrano', 20, N'pato@zambrano', 46)
SET IDENTITY_INSERT [dbo].[tb_Consumidor] OFF
/****** Object:  Table [dbo].[tb_Artículo]    Script Date: 08/04/2016 07:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Artículo](
	[PK_Artículo] [int] NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
	[Existencia] [varchar](2) NOT NULL,
	[Presentacion] [int] NOT NULL,
	[FK_Proveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Artículo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (1, N'Cuah. Moctezuma', N'TEKATE', 12.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (2, N'Cuah. Moctezuma', N'XX', 13.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (3, N'Cuah. Moctezuma', N'Carta Blanca', 13.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (4, N'Cuah.Moctezuma', N'Closter Light', 6.5000, N'13', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (5, N'Cuah. Moctezuma', N'Heineken', 7.5000, N'13', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (6, N'Cuah. Moctezuma', N'Indio', 12.0000, N'13', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (7, N'Cuah. Moctezuma', N'Sol', 12.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (8, N'Cuah.Moctezuma', N'Bohemia', 16.0000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (9, N'Cuah. Moctezuma', N'Coors Light', 12.0000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (10, N'Cuah. Moctezuma', N'Superior', 10.5000, N'1', 355, 1)
/****** Object:  Table [dbo].[tb_Promoción]    Script Date: 08/04/2016 07:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Promoción](
	[PK_Promoción] [int] NOT NULL,
	[Dia_Inicio] [varchar](10) NOT NULL,
	[Dia_Finalización] [varchar](10) NOT NULL,
	[FK_Sucursal] [int] NOT NULL,
	[FK_Artículo] [int] NOT NULL,
	[Descripción] [varchar](100) NOT NULL,
	[Cantidad_Artículo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Promoción] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (1, N'2016-10-01', N'2016-11-30', 1, 1, N'Six TEKATE de 355ml por $75.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (2, N'02-11-2016', N'30-12-2016', 2, 2, N'Six XX de 355ml por $81.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (3, N'27-12-2016', N'30-01-2017', 20, 3, N'Six Carta blanca de 355ml a $81.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (4, N'25-06-2016', N'30-07-2016', 28, 4, N'Six Closter Light de 355ml a $39.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (5, N'29-07-2016', N'30-08-2016', 16, 5, N'Six Heineken de 355ml a $45.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (6, N'15-08-2016', N'30-09-2016', 14, 6, N'Six de Indio de 355ml a $72.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (7, N'20-06-2016', N'30-07-2016', 30, 7, N'Six de Sol de 355ml a $75.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (8, N'23-09-2016', N'30-10-2016', 44, 8, N'Six de Bohemia de 355ml a $96.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (9, N'17-04-2016', N'30-05-2016', 27, 9, N'Six de Coors Light de 355ml a $72.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (10, N'18-08-2016', N'18-09-2016', 39, 10, N'Six de Superior de 355ml a $63.00', 1)
/****** Object:  ForeignKey [id_Proveedor]    Script Date: 08/04/2016 07:36:22 ******/
ALTER TABLE [dbo].[tb_Artículo]  WITH CHECK ADD  CONSTRAINT [id_Proveedor] FOREIGN KEY([FK_Proveedor])
REFERENCES [dbo].[tb_Proveedor] ([PK_Proveedor])
GO
ALTER TABLE [dbo].[tb_Artículo] CHECK CONSTRAINT [id_Proveedor]
GO
/****** Object:  ForeignKey [cod_Usuario]    Script Date: 08/04/2016 07:36:22 ******/
ALTER TABLE [dbo].[tb_Consumidor]  WITH CHECK ADD  CONSTRAINT [cod_Usuario] FOREIGN KEY([FK_Usuario])
REFERENCES [dbo].[tb_Login] ([PK_Usuario])
GO
ALTER TABLE [dbo].[tb_Consumidor] CHECK CONSTRAINT [cod_Usuario]
GO
/****** Object:  ForeignKey [cod_Articulo]    Script Date: 08/04/2016 07:36:22 ******/
ALTER TABLE [dbo].[tb_Promoción]  WITH CHECK ADD  CONSTRAINT [cod_Articulo] FOREIGN KEY([FK_Artículo])
REFERENCES [dbo].[tb_Artículo] ([PK_Artículo])
GO
ALTER TABLE [dbo].[tb_Promoción] CHECK CONSTRAINT [cod_Articulo]
GO
/****** Object:  ForeignKey [cod_sucursal]    Script Date: 08/04/2016 07:36:22 ******/
ALTER TABLE [dbo].[tb_Promoción]  WITH CHECK ADD  CONSTRAINT [cod_sucursal] FOREIGN KEY([FK_Sucursal])
REFERENCES [dbo].[tb_Sucursal] ([PK_Sucursal])
GO
ALTER TABLE [dbo].[tb_Promoción] CHECK CONSTRAINT [cod_sucursal]
GO
