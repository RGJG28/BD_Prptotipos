--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creaci�n: 02/06/2024
--@Descripci�n: CREACION BITMAP

Prompt conectando con el usuario administrador.
connect r_proy_admin/mg

CREATE BITMAP INDEX idx_bitmap_IdLoc
ON C_Producto (IdLoc);
