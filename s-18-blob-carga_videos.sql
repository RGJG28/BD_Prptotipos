-- Conectando con el usuario sys
connect sys/system2 as sysdba;
-- Granting permissions (assuming a user with create any directory privilege)
GRANT CREATE ANY DIRECTORY TO r_proy_admin;

-- Creando Objeto Directory para videos de control de calidad
CREATE OR REPLACE DIRECTORY videos_dir AS '/tmp/bd-unam/proy-final-blobs/VIDEOS';

-- Otorgando Permisos de lectura
GRANT READ ON DIRECTORY videos_dir TO r_proy_admin;

-- Conectando con el usuario r_proy_admin/mg
CONNECT r_proy_admin/mg;

-- Habilitando la salida del servidor para mensajes
SET SERVEROUTPUT ON;

-- Creando el Procedimiento
CREATE OR REPLACE PROCEDURE cargar_video(
  p_IdQc IN NUMBER,
  p_IdLoc IN NUMBER,
  p_Video IN VARCHAR2
)
IS
  v_blob BLOB;
  v_bfile BFILE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Abriendo el archivo de video...');
  v_bfile := BFILENAME('VIDEOS_DIR', p_Video);
  DBMS_OUTPUT.PUT_LINE('Archivo de video asignado: ' || p_Video);
  DBMS_LOB.OPEN(v_bfile, DBMS_LOB.LOB_READONLY);
  DBMS_OUTPUT.PUT_LINE('Archivo de video abierto.');

  DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
  DBMS_OUTPUT.PUT_LINE('BLOB temporal creado.');
  DBMS_LOB.LOADFROMFILE(v_blob, v_bfile, DBMS_LOB.GETLENGTH(v_bfile));
  DBMS_OUTPUT.PUT_LINE('Video cargado en BLOB.');

  UPDATE P_Control_Calidad
  SET VidP = v_blob
  WHERE IdQc = p_IdQc AND IdLoc = p_IdLoc;
  DBMS_OUTPUT.PUT_LINE('Tabla actualizada con el video.');

  DBMS_LOB.CLOSE(v_bfile);
  DBMS_OUTPUT.PUT_LINE('Archivo de video cerrado.');

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Transacción completada.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN  -- Specific error handling
    DBMS_OUTPUT.PUT_LINE('No se encontró ningún registro para actualizar.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    ROLLBACK;
END;
/
show errors