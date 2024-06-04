set serveroutput on

begin
  sp_actualiza_imagen_producto(1,1);
  commit;
end;
/
show errors


