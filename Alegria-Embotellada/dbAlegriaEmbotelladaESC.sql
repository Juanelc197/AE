/**************************************************************************************************************************
Nombre Script:    dbAlegriaEmbotelladaESC
Description:   Script to creation of database
version:    1.0 
Historia de Modificación:   IS   -   Fecha     -  Descripcion Cambio
                           ----      ---------    ------------------------------------------------------------- 
						   JAC       13/06/2016   Creación del script de Base de Datos dbAlegriaEmbotelladaESC
						   DESM      15/06/2016   Se creó el usuario para el servidor
						   DESM      15/06/2016   Se creó la Base de Datos
						   DESM      15/06/2016   Se creó el usuario para la Base de Datos
						   JAC       27/0672016   Se Creó Las Tablas De La Base de Datos
****************************************************************************************************************************/
USE master
GO 

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

--CREATE TABLES IN DATABASE
BEGIN TRY	
	BEGIN TRAN
		IF EXISTS(SELECT * FROM DBO.SYSDATABASES WHERE NAME = 'dbAlegriaEmbotelladaESC_UAT')
			BEGIN		
			IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
							WHERE TABLE_SCHEMA = 'dbo' 
							AND  TABLE_NAME = 'tb_Login'))
							BEGIN
						SELECT 'Table Login already exists' AS 'Msg'
					END
					ELSE
						BEGIN
				CREATE TABLE tb_Login
              (PK_Usuario INT not null PRIMARY KEY IDENTITY(1,1),
               UserName VARCHAR (16)not null UNIQUE,
               PASSWORD VARCHAR (16) not null,
               FK_Consumidor INT not null )
               END
			   IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
							WHERE TABLE_SCHEMA = 'dbo' 
							AND  TABLE_NAME = 'tb_Consumidor'))
							BEGIN
						SELECT 'Table Consumidor already exists' AS 'Msg'
					END
					ELSE
						BEGIN
			    CREATE TABLE tb_Consumidor(
               PK_Consumidor INT not null PRIMARY KEY IDENTITY(1,1),
               Primer_Nombre VARCHAR(15)not null, 
               Primer_Apellido VARCHAR(15) null,
               edad INT not null,
               email VARCHAR (30) not null UNIQUE, )
			   END
			    IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
							WHERE TABLE_SCHEMA = 'dbo' 
							AND  TABLE_NAME = 'tb_Sucursal'))
							BEGIN
						SELECT 'Table Sucursal already exists' AS 'Msg'
					END
					ELSE
						BEGIN
			   CREATE TABLE tb_Sucursal
              (PK_Sucursal INT  not null,
               Nombre_Sucursal VARCHAR(50) not null,
               Calle VARCHAR(50) not null,
               Número int not null,
               Colonia VARCHAR(50) not null,
               FK_Promoción int not null,
                primary key (PK_Sucursal))
				END
				 IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
							WHERE TABLE_SCHEMA = 'dbo' 
							AND  TABLE_NAME = 'tb_Promoción'))
							BEGIN
						SELECT 'Table Promoción already exists' AS 'Msg'
					END
					ELSE
						BEGIN
				CREATE TABLE tb_Promoción
               (PK_Promoción INT not null,
               Dia_Inicio VARCHAR(10)not null,
                Dia_Finalización VARCHAR (10) not null,
                FK_Sucursal INT not null,
                FK_Artículo INT not null,
                Descripción VARCHAR (100) not null,
                Cantidad_Artículo INT not null
                PRIMARY KEY (PK_Promoción))
				END
				 IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
							WHERE TABLE_SCHEMA = 'dbo' 
							AND  TABLE_NAME = 'tb_Artículo'))
							BEGIN
						SELECT 'Table Artículo already exists' AS 'Msg'
					END
					ELSE
						BEGIN
				CREATE TABLE tb_Artículo
               (PK_Artículo INT  not null,
                Nombre VARCHAR (50) not null,
                Marca VARCHAR (40) not null,
                Precio MONEY not null,
                Existencia VARCHAR (2) not null,
                Presentacion INT not null,
                FK_Proveedor INT not null
                PRIMARY KEY (PK_Artículo))
				END
				 IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
							WHERE TABLE_SCHEMA = 'dbo' 
							AND  TABLE_NAME = 'tb_Proveedor'))
							BEGIN
						SELECT 'Table Proveedor already exists' AS 'Msg'
					END
					ELSE
						BEGIN
				 CREATE TABLE tb_Proveedor
                (PK_Proveedor INT not null,
                 Nombre VARCHAR (20) not null,
                 Teléfono VARCHAR (20) null,
                 email VARCHAR (50) null,
                PRIMARY KEY (PK_Proveedor))
                END
                
				 ALTER TABLE  tb_Promoción  ADD CONSTRAINT id_Promoción FOREIGN KEY (FK_Promoción)
				 REFERENCES tb_Sucursal (PK_Promoción) 
				 ALTER TABLE tb_Login   ADD CONSTRAINT cod_Consumidor FOREIGN KEY (FK_Consumidor)
				 REFERENCES tb_Consumidor(PK_Consumidor)
				 ALTER TABLE  tb_Promoción  ADD CONSTRAINT id_Promoción FOREIGN KEY (FK_Promoción)
				 REFERENCES tb_Sucursal (PK_Promoción)
				 ALTER TABLE  tb_Promoción  ADD CONSTRAINT cod_sucursal FOREIGN KEY (FK_Sucursal)
				 REFERENCES tb_Sucursal (PK_Sucursal)
				 ALTER TABLE  tb_Promoción  ADD CONSTRAINT cod_Articulo FOREIGN KEY (FK_Artículo)
				 REFERENCES tb_Artículo (PK_Artículo)
				 ALTER TABLE tb_Artículo   ADD CONSTRAINT id_Proveedor FOREIGN KEY (FK_Proveedor)
				 REFERENCES tb_Proveedor (PK_Proveedor)
				COMMIT	
				
			END
			ELSE
				BEGIN
					
					ROLLBACK
					
					SET @Errormessage = 'Database not exist'
					RAISERROR(@Errormessage,16,1);
				END
END TRY
BEGIN CATCH
	
	SELECT  @Errormessage = 'Error: ' + CAST(ERROR_NUMBER() AS NVARCHAR) + ' -> ' + ERROR_MESSAGE() + '. Error Line: *' + CAST(ERROR_LINE() AS VARCHAR(50)) + '*.'; 
	
	--SELECT  @Errormessage AS Msg;
	
	RAISERROR(@Errormessage,16,1);
	
	IF(@@TRANCOUNT > 0)
		ROLLBACK
		
END CATCH
