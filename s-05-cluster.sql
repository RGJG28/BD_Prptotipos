--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creaci�n: 02/06/2024
--@Descripci�n: CREACION BITMAP

Prompt conectando con el usuario administrador.
connect r_proy_admin/mg

--Cl�ster random
CREATE CLUSTER EmployeeProductCluster (
IdLoc CHAR(12))
SIZE 512
TABLESPACE PROD;