-- Conectando con el usuario sys
connect sys/system2 as sysdba;

-- Creando Objeto Directory para archivos de audio
CREATE OR REPLACE DIRECTORY audios_dir AS '/tmp/bd-unam/proy-final-blobs/AUDIOS';

-- Otorgando Permisos de lectura
GRANT READ ON DIRECTORY audios_dir TO r_proy_admin;

-- Conectando con el usuario r_proy_admin
CONNECT r_proy_admin/mg;
-- Habilitando la salida del servidor para mensajes
SET SERVEROUTPUT ON;

-- Creando el Procedimiento
CREATE OR REPLACE PROCEDURE cargar_audio(
    p_IdQc IN NUMBER,
    p_IdLoc IN NUMBER,
    p_Audio IN VARCHAR2
)
IS
    v_blob BLOB;
    v_bfile BFILE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Abriendo el archivo de audio...');
    v_bfile := BFILENAME('AUDIOS_DIR', p_Audio);
    DBMS_OUTPUT.PUT_LINE('Archivo de audio asignado: ' || p_Audio);
    
    -- Intentar abrir el archivo de audio
    DBMS_LOB.OPEN(v_bfile, DBMS_LOB.LOB_READONLY);
    DBMS_OUTPUT.PUT_LINE('Archivo de audio abierto.');

    -- Crear BLOB temporal y cargar el audio en la variable BLOB
    DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
    DBMS_OUTPUT.PUT_LINE('BLOB temporal creado.');
    
    DBMS_LOB.LOADFROMFILE(v_blob, v_bfile, DBMS_LOB.GETLENGTH(v_bfile));
    DBMS_OUTPUT.PUT_LINE('Audio cargado en BLOB.');

    -- Actualizar la tabla con el audio
    UPDATE P_Control_Calidad
    SET pruebaruido = v_blob
    WHERE IdQc = p_IdQc AND IdLoc = p_IdLoc;
    DBMS_OUTPUT.PUT_LINE('Tabla actualizada con el audio.');

    -- Cerrar el archivo
    DBMS_LOB.CLOSE(v_bfile);
    DBMS_OUTPUT.PUT_LINE('Archivo de audio cerrado.');

    -- Realizar commit
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transacción completada.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
