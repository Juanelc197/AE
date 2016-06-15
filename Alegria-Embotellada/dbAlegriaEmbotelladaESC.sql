/**************************************************************************************************************************
Nombre Script:    dbAlegriaEmbotelladaESC
Description:   Script to creation of database
version:    1.0 
Historia de Modificación:   IS   -   Fecha     -  Descripcion Cambio
                           ----      ---------    ------------------------------------------------------------- 
						   JAC       13/06/2016   Creación del script de Base de Datos dbAlegriaEmbotelladaESC
						   DESM      15/06/2016   Se creó el usuario para el servidor
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