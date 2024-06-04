--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CREACION DE INDICES.


-------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE ÍNDICE NONUNIQUE-----------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE INDEX IDX_ARH_IdLoc ON A_Recursos_Humanos (IdLoc)
TABLESPACE ADMINISTRACION;

CREATE INDEX IDX_CE_IdEmpleado ON C_Empleado (idEmpleado)
TABLESPACE CANDIDATURA;

CREATE INDEX IDX_CE_NoTarjeta ON C_Empleado (NoTarjeta)
TABLESPACE Candidatura;
