/*-------------------------------------------------------------TABLA EMPLEADO-----------------------------------------------------------------------*/
prompt insertando 5 registros a EMPLEADO
INSERT INTO C_Empleado (idEmpleado, NoTarjeta, IdDpto, IdQc, IdMFG, IdLoc, Edad, Puesto, Genero, CURP, Depto, RFC, Historial, Nombre)
VALUES (empleado_seq.nextval, 7010, 1, 1, 1, 1, '30', 'Ingeniero', 'M', 'CURP12345678901231', 'DEP001', 'RFC123456781', 'Buendesempeño', 'JuanPerez');

INSERT INTO C_Empleado (idEmpleado, NoTarjeta, IdDpto, IdQc, IdMFG, IdLoc, Edad, Puesto, Genero, CURP, Depto, RFC, Historial, Nombre)
VALUES (empleado_seq.nextval, 7011, 2, 2, 2, 2, '31', 'Ingeniero', 'M', 'CURP12345678901232', 'DEP002', 'RFC123456782', 'Mediodesempeño', 'AlbertoRamos');

INSERT INTO C_Empleado (idEmpleado, NoTarjeta, IdDpto, IdQc, IdMFG, IdLoc, Edad, Puesto, Genero, CURP, Depto, RFC, Historial, Nombre)
VALUES (empleado_seq.nextval, 7012, 3, 3, 3, 3, '32', 'Ingeniero', 'M', 'CURP12345678901233', 'DEP002', 'RFC123456783', 'Buendesempeño', 'KevinAlvarez');

INSERT INTO C_Empleado (idEmpleado, NoTarjeta, IdDpto, IdQc, IdMFG, IdLoc, Edad, Puesto, Genero, CURP, Depto, RFC, Historial, Nombre)
VALUES (empleado_seq.nextval, 7013, 4, 4, 4, 4, '28', 'Ingeniero', 'F', 'CURP12345678901234', 'DEP001', 'RFC123456784', 'Maldesempeño', 'ItzelCastro');

INSERT INTO C_Empleado (idEmpleado, NoTarjeta, IdDpto, IdQc, IdMFG, IdLoc, Edad, Puesto, Genero, CURP, Depto, RFC, Historial, Nombre)
VALUES (empleado_seq.nextval, 7014, 4, 5, 5,5, '23', 'Ingeniero', 'F', 'CURP12345678901235', 'DEP001', 'RFC123456785', 'Buendesempeño', 'LuisaGomez');
/*-------------------------------------------------------------TABLA PRODUCTO-----------------------------------------------------------------------*/
prompt insertando 5 registros a PRODCUTO
INSERT INTO C_Producto (idProducto, IdMFG, IdInv, IdQc, IdLoc, Blob_GuiaProd, Nombre, Tipo, FichaTecnica)
VALUES (1, 1, 1, 1, 1, utl_raw.cast_to_raw('GuiaProductoA'), 'ProductoC', 'TipoA', utl_raw.cast_to_raw('FichaTecnicaA'));

INSERT INTO C_Producto (idProducto, IdMFG, IdInv, IdQc, IdLoc, Blob_GuiaProd, Nombre, Tipo, FichaTecnica)
VALUES (2, 2, 2, 2, 2, utl_raw.cast_to_raw('GuiaProductoB'), 'ProductoD', 'TipoB', utl_raw.cast_to_raw('FichaTecnicaB'));

INSERT INTO C_Producto (idProducto, IdMFG, IdInv, IdQc, IdLoc, Blob_GuiaProd, Nombre, Tipo, FichaTecnica)
VALUES (3, 3, 3, 3, 3, utl_raw.cast_to_raw('GuiaProductoC'), 'ProductoE', 'TipoC', utl_raw.cast_to_raw('FichaTecnicaC'));

INSERT INTO C_Producto (idProducto, IdMFG, IdInv, IdQc, IdLoc, Blob_GuiaProd, Nombre, Tipo, FichaTecnica)
VALUES (4, 4, 4, 4, 4, utl_raw.cast_to_raw('GuiaProductoD'), 'ProductoF', 'TipoD', utl_raw.cast_to_raw('FichaTecnicaD'));

INSERT INTO C_Producto (idProducto, IdMFG, IdInv, IdQc, IdLoc, Blob_GuiaProd, Nombre, Tipo, FichaTecnica)
VALUES (5, 5, 5, 5, 5, utl_raw.cast_to_raw('GuiaProductoE'), 'ProductoG', 'TipoE', utl_raw.cast_to_raw('FichaTecnicaE'));