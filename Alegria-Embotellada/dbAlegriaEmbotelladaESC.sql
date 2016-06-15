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
