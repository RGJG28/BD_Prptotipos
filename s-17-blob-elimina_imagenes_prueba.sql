set serveroutput on
BEGIN
    eliminar_imagen(2, 2);
    commit;
END;
/
show errors