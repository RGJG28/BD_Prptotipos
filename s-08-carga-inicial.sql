--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CARGA INCIAL DE DATOS

/*-------------------------------------------------------------TABLA DIR GENERAL-----------------------------------------------------------------------*/
--INSERT INTO A_DirGeneral (IdLoc, P_idCC, P_idInv, P_idMFG, A_idRH) VALUES (dirgeneral_seq.nextval,controlcalidad_seq.nextval, inventario_seq.nextval, manufactura_seq.nextval, recursoshumanos_seq.nextval);
prompt insertando 4 registros a DIR GENERAL
INSERT INTO A_DirGeneral (IdLoc, P_idCC, P_idInv, P_idMFG, A_idRH) VALUES (dirgeneral_seq.nextval,1,1,1,1);
INSERT INTO A_DirGeneral (IdLoc, P_idCC, P_idInv, P_idMFG, A_idRH) VALUES (dirgeneral_seq.nextval,2,2,2,2);
INSERT INTO A_DirGeneral (IdLoc, P_idCC, P_idInv, P_idMFG, A_idRH) VALUES (dirgeneral_seq.nextval,3,3,3,3);
INSERT INTO A_DirGeneral (IdLoc, P_idCC, P_idInv, P_idMFG, A_idRH) VALUES (dirgeneral_seq.nextval,4,4,4,4);
INSERT INTO A_DirGeneral (IdLoc, P_idCC, P_idInv, P_idMFG, A_idRH) VALUES (dirgeneral_seq.nextval,5,5,5,5);
/*-------------------------------------------------------------TABLA RECURSOS HUMANOS-----------------------------------------------------------------------*/
prompt insertando 5 registros a RECURSOS HUMANOS
INSERT INTO A_Recursos_Humanos (IdDpto, IdLoc, C_idEmpleado) VALUES (recursoshumanos_seq.nextval, 1,1);
INSERT INTO A_Recursos_Humanos (IdDpto, IdLoc, C_idEmpleado) VALUES (recursoshumanos_seq.nextval, 2,2);
INSERT INTO A_Recursos_Humanos (IdDpto, IdLoc, C_idEmpleado) VALUES (recursoshumanos_seq.nextval, 3,3);
INSERT INTO A_Recursos_Humanos (IdDpto, IdLoc, C_idEmpleado) VALUES (recursoshumanos_seq.nextval, 4,4);
INSERT INTO A_Recursos_Humanos (IdDpto, IdLoc, C_idEmpleado) VALUES (recursoshumanos_seq.currval, 5,5);
/*-------------------------------------------------------------TABLA CONTROL CALIDAD-----------------------------------------------------------------------*/
prompt insertando 5 registros a CONTROL CALIDAD
INSERT INTO P_Control_Calidad (IdQc, IdLoc, C_idProducto, C_idEmpleado) VALUES (controlcalidad_seq.nextval, 1, 1,1);
INSERT INTO P_Control_Calidad (IdQc, IdLoc, C_idProducto, C_idEmpleado) VALUES (controlcalidad_seq.nextval, 2, 2,2);
INSERT INTO P_Control_Calidad (IdQc, IdLoc, C_idProducto, C_idEmpleado) VALUES (controlcalidad_seq.nextval, 3, 3,3);
INSERT INTO P_Control_Calidad (IdQc, IdLoc, C_idProducto, C_idEmpleado) VALUES (controlcalidad_seq.nextval, 4, 4,4);
INSERT INTO P_Control_Calidad (IdQc, IdLoc, C_idProducto, C_idEmpleado) VALUES (controlcalidad_seq.nextval, 5, 5,5);
/*-------------------------------------------------------------TABLA INVENTARIO-----------------------------------------------------------------------*/
prompt insertando 5 registros a INVENTARIO
INSERT INTO P_Inventario (IdInv, IdLoc, C_idProducto, Fecha, Procuto, Cantidad) VALUES (inventario_seq.nextval, 1, 1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'ProductoA', 100);
INSERT INTO P_Inventario (IdInv, IdLoc, C_idProducto, Fecha, Procuto, Cantidad) VALUES (inventario_seq.nextval, 2, 2, TO_DATE('2023-08-05', 'YYYY-MM-DD'), 'ProductoB', 20);
INSERT INTO P_Inventario (IdInv, IdLoc, C_idProducto, Fecha, Procuto, Cantidad) VALUES (inventario_seq.nextval, 3, 3, TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'ProductoC', 10);
INSERT INTO P_Inventario (IdInv, IdLoc, C_idProducto, Fecha, Procuto, Cantidad) VALUES (inventario_seq.nextval, 4, 4, TO_DATE('2023-12-24', 'YYYY-MM-DD'), 'ProductoD', 110);
INSERT INTO P_Inventario (IdInv, IdLoc, C_idProducto, Fecha, Procuto, Cantidad) VALUES (inventario_seq.nextval, 5, 5, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'ProductoE', 28);
/*-------------------------------------------------------------TABLA MANUFACTURA-----------------------------------------------------------------------*/
prompt insertando 5 registros a MANUFACTURA
INSERT INTO P_Manufactura (IdMFG, IdLoc, C_idEmpleado, C_idProducto, Producto, Herramientas)VALUES (manufactura_seq.nextval, 1,1,1, 'ProductoA', 'HerramA');
INSERT INTO P_Manufactura (IdMFG, IdLoc, C_idEmpleado, C_idProducto, Producto, Herramientas)VALUES (manufactura_seq.nextval, 2,2,2, 'ProductoB', 'HerramB');
INSERT INTO P_Manufactura (IdMFG, IdLoc, C_idEmpleado, C_idProducto, Producto, Herramientas)VALUES (manufactura_seq.nextval, 3,3,3, 'ProductoC', 'HerramC');
INSERT INTO P_Manufactura (IdMFG, IdLoc, C_idEmpleado, C_idProducto, Producto, Herramientas)VALUES (manufactura_seq.nextval, 4,4,4, 'ProductoD', 'HerramD');
INSERT INTO P_Manufactura (IdMFG, IdLoc, C_idEmpleado, C_idProducto, Producto, Herramientas)VALUES (manufactura_seq.nextval, 5,5,5, 'ProductoE', 'HerramE');




