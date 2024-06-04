set serveroutput on
BEGIN
    cargar_imagen(2, 2, 'imagen_2_2.jpeg');
    commit;
END;
/
show errors