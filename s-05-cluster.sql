--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CREACION BITMAP

Prompt conectando con el usuario administrador.
connect r_proy_admin/mg

--Clúster random
CREATE CLUSTER EmployeeProductCluster (
IdLoc CHAR(12))
SIZE 512
TABLESPACE PROD;