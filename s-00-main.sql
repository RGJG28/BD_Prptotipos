--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creaciÃ³n: 02/06/2024
--@DescripciÃ³n: SCRIPT-PRINCIPAL.

clear screen
connect sys/system2 as sysdba;


-------------------------------------------------------------------------------------------------------------
----------------------------------------------ELIMINACIÓN DE USUARIOS------------------------------------------------
-------------------------------------------------------------------------------------------------------------
--alter session set "_ORACLE_SCRIPT"=true;

set serveroutput on
declare
  v_count number(1,0);
begin 
  select count(*) into v_count
  from dba_users
  where username = 'JP_PROY_INVITADO' OR username = 'R_PROY_ADMIN';
  if v_count > 0 then
    execute immediate 'drop user R_PROY_INVITADO cascade';
    execute immediate 'drop user R_PROY_ADMIN cascade';
    dbms_output.put_line('Usuarios eliminados'); 
  else
    dbms_output.put_line('Los usuarios no requieren ser eliminados');
  end if;

-------------------------------------------------------------------------------------------------------------
----------------------------------------------ELIMINACIÓN DE ROLES------------------------------------------------
-------------------------------------------------------------------------------------------------------------

  select count(*) into v_count
  from dba_roles
  where role = 'ROL_INVITADO' OR role = 'ROL_ADMIN';
  if v_count > 0 then
    execute immediate 'drop role ROL_INVITADO';
    execute immediate 'drop role ROL_ADMIN';
    dbms_output.put_line('Roles eliminados'); 
  else
    dbms_output.put_line('Los roles no requieren ser eliminados');
  end if;
end;
/
set serveroutput off


-------------------------------------------------------------------------------------------------------------
----------------------------------------------INVOCACIÃ“N DE SCRIPTS------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt Creando usuarios
@@s-01-usuarios.sql
@@s-02-tablespaces.sql
@@s-03-entidades.sql
@@s-04-bitmap.sql
@@s-05-cluster.sql
@@s-06-secuencias.sql
@@s-07-indices.sql
@@s-08-carga-inicial.sql
@@s-09-carga2.sql