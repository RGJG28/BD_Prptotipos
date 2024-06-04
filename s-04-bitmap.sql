--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CREACION BITMAP

Prompt conectando con el usuario administrador.
connect r_proy_admin/mg

CREATE BITMAP INDEX idx_bitmap_IdLoc
ON C_Producto (IdLoc);
