--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creaci�n: 02/06/2024
--@Descripci�n: CREACION DE INDICES.


-------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE �NDICE NONUNIQUE-----------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE INDEX IDX_ARH_IdLoc ON A_Recursos_Humanos (IdLoc)
TABLESPACE ADMINISTRACION;

CREATE INDEX IDX_CE_IdEmpleado ON C_Empleado (idEmpleado)
TABLESPACE CANDIDATURA;

CREATE INDEX IDX_CE_NoTarjeta ON C_Empleado (NoTarjeta)
TABLESPACE Candidatura;
