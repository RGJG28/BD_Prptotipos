--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CREACION TABLESPACES DEL CASO DE ESTUDIO 

--Prompt conectando con usuario sys
--connect sys/system as sysdba
--ALTER SESSION SET "_ORACLE_SCRIPT" = true;
--Prompt conectando con el usuario administrador.
connect r_proy_admin/mg
show user;

DECLARE
  v_count NUMBER(1,0);
BEGIN 
  -- Verificar si los tablespaces existen
  SELECT COUNT(*) INTO v_count
  FROM dba_tablespaces
  WHERE tablespace_name IN ('PROD', 'CANDIDATURA', 'ADMINISTRACION');
  
  -- Si existen, eliminarlos
  IF v_count > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLESPACE PROD INCLUDING CONTENTS AND DATAFILES';
    EXECUTE IMMEDIATE 'DROP TABLESPACE CANDIDATURA INCLUDING CONTENTS AND DATAFILES';
    EXECUTE IMMEDIATE 'DROP TABLESPACE ADMINISTRACION INCLUDING CONTENTS AND DATAFILES';
    DBMS_OUTPUT.PUT_LINE('Tablespaces eliminados'); 
  ELSE
    DBMS_OUTPUT.PUT_LINE('Los tablespaces no existen');
  END IF;
END;
/
-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE ADMINISTRACION-----------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLESPACE ADMINISTRACION
    DATAFILE 'admin2.dbf' 
    SIZE 200M AUTOEXTEND OFF 
    EXTENT MANAGEMENT LOCAL 
    LOGGING
    ONLINE 
    PERMANENT;
-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE CANDIDATURA-----------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLESPACE CANDIDATURA
    DATAFILE 'cand.dbf' 
    SIZE 200M AUTOEXTEND OFF
    EXTENT MANAGEMENT local
    LOGGING
    ONLINE
    PERMANENT;
-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE PROD---------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLESPACE PROD
    DATAFILE 'prod.dbf' 
    SIZE 300M AUTOEXTEND OFF
    EXTENT MANAGEMENT local
    LOGGING
    ONLINE
    PERMANENT;