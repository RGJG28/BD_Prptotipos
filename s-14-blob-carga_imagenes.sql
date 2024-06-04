-- Conectando con usuario sys
connect sys/system2 as sysdba;

-- Creando Objeto Directory para imágenes de productos
create or replace directory fotos_dir as '/tmp/bd-unam/proy-final-blobs/IMAGENES_PRODUCTOS';

-- Otorgando Permisos de lectura
grant read on directory fotos_dir to r_proy_admin;

-- Conectando con usuario r_proy_admin/mg
connect r_proy_admin/mg;

-- CREANDO PROCEDIMIENTO
-- Creando Procedimiento
CREATE OR REPLACE PROCEDURE cargar_imagen(
    p_IdQc IN NUMBER,
    p_IdLoc IN NUMBER,
    p_Imagen IN VARCHAR2
)
IS
    v_blob BLOB;
    v_bfile BFILE;
BEGIN
    -- Abriendo el archivo de imagen
    v_bfile := BFILENAME('FOTOS_DIR', p_Imagen);
    DBMS_LOB.OPEN(v_bfile, DBMS_LOB.LOB_READONLY);

    -- Cargando la imagen en la variable BLOB
    DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
    DBMS_LOB.LOADFROMFILE(v_blob, v_bfile, DBMS_LOB.GETLENGTH(v_bfile));

    -- Actualizando la tabla con la imagen
    UPDATE P_Control_Calidad
    SET ImagenProducto = v_blob
    WHERE IdQc = p_IdQc AND IdLoc = p_IdLoc;

    -- Cerrando el archivo
    DBMS_LOB.CLOSE(v_bfile);

    COMMIT;
END;
/
show errors