Prompt Conectando con usuario sys
connect sys/system2 as sysdba

Prompt Creando Objeto Directory para imagenes de productos
create or replace directory fotos_dir as '/tmp/bd-unam/proy-final-blobs/IMAGENES_PRODUCTOS';

Prompt Otorgando Permisos de lectura
grant read on directory fotos_dir to r_proy_admin;

connect r_proy_admin/mg;

set serveroutput on
--CREANDO PROCEDIMIENTO
Prompt Creando Procedimiento.
create or replace procedure sp_actualiza_imagen_producto(
  p_idqc number,
  p_idloc number
) is

v_bfile          bfile;
v_imagen         blob;
v_dest_offset    number := 1;
v_length_archivo number;
v_length_blob    number;
v_src_offset     number := 1;

begin
  
  dbms_output.put_line('Leyendo imagen.');
  
  --abriendo archivo
  v_bfile := bfilename('FOTOS_DIR','imagen_'||p_idqc||'_'||p_idloc||'.jpeg');
  v_length_archivo := dbms_lob.getlength(v_bfile);
  
  if dbms_lob.fileexists(v_bfile) <> 1 then
    dbms_output.put_line('No se encontró el archivo: imagen_'||p_idqc||'_'||p_idloc||'.jpeg');
    return;
  end if;
  
  dbms_lob.fileopen(v_bfile,dbms_lob.lob_readonly);
  if dbms_lob.isopen(v_bfile) <> 1 then
    dbms_output.put_line('No se pudo abrir el archivo: imagen_'||p_idqc||'_'||p_idloc||'.jpeg');
    return;
  end if;
  
  --Obteniendo referencia (puntero) de la columna ImagenProducto en modo exclusivo
  select ImagenProducto into v_imagen
  from P_Control_Calidad
  where IdQc = p_idqc and IdLoc = p_idloc
  for update;
  
  -- Truncar el BLOB si es necesario
  if v_length_archivo < dbms_lob.getlength(v_imagen) then
    dbms_output.put_line('Se tiene que truncar');
    dbms_lob.trim(v_imagen, v_length_archivo);
  end if;

  -- Cargar la imagen
  dbms_lob.loadblobfromfile(
    dest_lob    =>  v_imagen,
    src_bfile   =>  v_bfile,
    amount      =>  v_length_archivo,
    dest_offset =>  v_dest_offset,
    src_offset  =>  v_src_offset
  );
  
  --NO olvidar cerrar el archivo!
  dbms_lob.close(v_bfile);
  
  v_length_blob := dbms_lob.getlength(v_imagen);
  
  if v_length_archivo <> v_length_blob then
    raise_application_error(-20001, 
      'ERROR: La imagen no se cargó completamente, se esperaba: '
      ||v_length_archivo
      ||' y se cargaron únicamente: '
      ||v_length_blob);
  else
    dbms_output.put_line('Carga exitosa.');
  end if;
  
end;
/

