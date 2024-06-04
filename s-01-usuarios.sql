--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CREACION DE USUARIOS Y PERMISOS NECESARIOS PARA EL CASO DE ESTUDIOS.

--ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-------------------------------------------------------------------------------------------------------------
----------------------------------------------CREANDO USUARIO------------------------------------------------
-------------------------------------------------------------------------------------------------------------

Prompt crear usuario invitado
--drop user R_proy_invitado cascade;
CREATE USER r_proy_invitado IDENTIFIED BY mg
    QUOTA UNLIMITED ON users; 


Prompt crear usuario admin
--drop user R_proy_admin cascade;
CREATE USER r_proy_admin IDENTIFIED BY mg 
--DEFAULT TABLESPACE users 
QUOTA UNLIMITED ON users;
GRANT CREATE SESSION, CREATE TABLE, CREATE TABLESPACE, ALTER DATABASE, DBA TO r_proy_admin;


-------------------------------------------------------------------------------------------------------------
-----------------------------------------------CREANDO ROLES-------------------------------------------------
-------------------------------------------------------------------------------------------------------------

Prompt creando rol_admin 

--drop role rol_admin;
create role rol_admin;
grant create session,create table,create tablespace ,create any table,create cluster,create any index, create sequence ,create synonym, create public synonym ,create view,create trigger, create procedure to rol_admin;
 
Prompt creando rol_invitado 

--drop role rol_invitado;
create role rol_invitado;
grant create session, create synonym to rol_invitado;
-------------------------------------------------------------------------------------------------------------
----------------------------------------------ASIGNANDO ROLES------------------------------------------------
-------------------------------------------------------------------------------------------------------------

grant rol_invitado to r_proy_invitado;
grant read, write on directory tmp_dir to r_proy_invitado;
grant rol_admin to r_proy_admin;
grant read, write on directory tmp_dir to r_proy_admin;


prompt creando directorio tmp_dir
create or replace directory tmp_dir as '/tmp/bd-unam/proy-final-csv';

prompt creando el directorio /tmp/bd-unam en caso de no existir
!mkdir -p /tmp/bases
