--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2024
--@Descripción: CREACION TABLAS DEL CASO DE ESTUDIO 

Prompt conectando con usuario sys
connect sys/system2 as sysdba

Prompt conectando con el usuario administrador.
connect r_proy_admin/mg

-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE ADMINISTRACION-----------------------------------------------
-------------------------------------CREANDO TABLA A_DIRGENERAL----------------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt CREANDO TABLA A_DIRGENERAL
CREATE TABLE A_DirGeneral(
    IdLoc      number(10,0) not null,
    P_idCC     number(10,0) not null,
    P_idInv    number(10,0) not null,
    P_idMFG    number(10,0) ,
    A_idRH     number(10,0) not null,
    CONSTRAINT PK4 PRIMARY KEY (IdLoc)
)
TABLESPACE Administracion
;

-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE ADMINISTRACION-----------------------------------------------
-------------------------------------CREANDO TABLA A_RECURSOS_HUMANOS----------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt CREANDO TABLA A_RECURSOS_HUMANOS
CREATE TABLE A_Recursos_Humanos(
    IdDpto          number(10,0) not null,
    IdLoc           number(10,0) not null,
    C_idEmpleado    number(10,0) not null,
    CONSTRAINT PK6 PRIMARY KEY (IdDpto, IdLoc)
)
TABLESPACE Administracion
;

-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE CANDIDATURA--------------------------------------------------
-------------------------------------CREANDO TABLA C_EMPLEADO------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt CREANDO TABLA C_EMPLEADO
CREATE TABLE C_Empleado(
    idEmpleado    number(10,0) not null,
    NoTarjeta     number(10,0) not null,
    IdDpto        number(10,0) not null,
    IdQc          number(10,0) not null,
    IdMFG         number(10,0) not null,
    IdLoc         number(10,0) not null,
    Edad          CHAR(3)          NOT NULL,
    Puesto        NVARCHAR2(20)    NOT NULL,
    Genero        CHAR(1),
    CURP          CHAR(18)         NOT NULL,
    Depto         CHAR(10)         NOT NULL,
    RFC           CHAR(13),
    Historial     VARCHAR2(100)    NOT NULL,
    Nombre        VARCHAR2(50),
    CONSTRAINT PK1 PRIMARY KEY (idEmpleado, NoTarjeta, IdDpto, IdQc, IdMFG, IdLoc)
)
TABLESPACE Candidatura
;

-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE CANDIDATURA--------------------------------------------------
-------------------------------------CREANDO TABLA C_PRODUCTO------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt CREANDO TABLA C_PRODUCTO
CREATE TABLE C_Producto(
    idProducto       number(10,0) not null,
    IdMFG            number(10,0) not null,
    IdInv            number(10,0) not null,
    IdQc             number(10,0) not null,
    IdLoc            number(10,0) not null,
    Blob_GuiaProd    BLOB        NOT NULL,
    Nombre           CHAR(10)    NOT NULL,
    Tipo             CHAR(15)    NOT NULL,
    FichaTecnica     RAW(20)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (idProducto, IdMFG, IdInv, IdQc, IdLoc)
)
TABLESPACE Candidatura
;

-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE PROD--------------------------------------------------
-------------------------------------CREANDO P_CONTROL_CALIDAD------------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLE P_Control_Calidad(
    IdQc              number(10,0) not null,
    IdLoc             number(10,0) not null,
    C_idProducto      number(10,0) not null,
    C_idEmpleado      number(10,0) not null,
    PruebaRuido       BLOB    	   NULL,
    ImagenProducto    BLOB         NULL,
    VidP	          BLOB	       NULL,
    CONSTRAINT PK8 PRIMARY KEY (IdQc, IdLoc)
)
TABLESPACE PROD;
-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE PROD---------------------------------------------------------
-------------------------------------CREANDO TABLA P_INVENTARIO-----------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt CREANDO TABLA P_INVENTARIO
CREATE TABLE P_Inventario(
    IdInv           number(10,0) not null,
    IdLoc           number(10,0) not null,
    C_idProducto    number(10,0) not null,
    Fecha           DATE             NOT NULL,
    Procuto         CHAR(10)         NOT NULL,
    Cantidad        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (IdInv, IdLoc)
)
TABLESPACE PROD;

-------------------------------------------------------------------------------------------------------------
-------------------------------------TABLESPACE PROD---------------------------------------------------------
-------------------------------------CREANDO TABLA P_MANUFACTURA-----------------------------------------
-------------------------------------------------------------------------------------------------------------
Prompt CREANDO TABLA P_MANUFACTURA
CREATE TABLE P_Manufactura(
    IdMFG           number(10,0) not null,
    IdLoc           number(10,0) not null,
    C_idEmpleado    number(10,0) not null,
    C_idProducto    number(10,0) not null,
    Producto        VARCHAR2(10)    NOT NULL,
    Herramientas    CHAR(10)        NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (IdMFG, IdLoc)
)
TABLESPACE PROD;


-------------------------------------------------------------------------------------------------------------
-------------------------------------CONSTRAINTS EXTRA-----------------------------------------
-------------------------------------------------------------------------------------------------------------

-- 
-- TABLE: A_Recursos_Humanos 
--
ALTER TABLE A_Recursos_Humanos ADD CONSTRAINT RefA_DirGeneral32 
    FOREIGN KEY (IdLoc)
    REFERENCES A_DirGeneral(IdLoc)
;

-- 
-- TABLE: C_Empleado 
--
ALTER TABLE C_Empleado ADD CONSTRAINT RefA_Recursos_Humanos23 
    FOREIGN KEY (IdDpto, IdLoc)
    REFERENCES A_Recursos_Humanos(IdDpto, IdLoc)
;
ALTER TABLE C_Empleado ADD CONSTRAINT RefP_Control_Calidad24 
    FOREIGN KEY (IdQc, IdLoc)
    REFERENCES P_Control_Calidad(IdQc, IdLoc)
;
ALTER TABLE C_Empleado ADD CONSTRAINT RefP_Manufactura25 
    FOREIGN KEY (IdMFG, IdLoc)
    REFERENCES P_Manufactura(IdMFG, IdLoc)
;

-- 
-- TABLE: C_Producto 
--

ALTER TABLE C_Producto ADD CONSTRAINT RefP_Manufactura26 
    FOREIGN KEY (IdMFG, IdLoc)
    REFERENCES P_Manufactura(IdMFG, IdLoc)
;
ALTER TABLE C_Producto ADD CONSTRAINT RefP_Inventario27 
    FOREIGN KEY (IdInv, IdLoc)
    REFERENCES P_Inventario(IdInv, IdLoc)
;
ALTER TABLE C_Producto ADD CONSTRAINT RefP_Control_Calidad28 
    FOREIGN KEY (IdQc, IdLoc)
    REFERENCES P_Control_Calidad(IdQc, IdLoc)
;

-- 
-- TABLE: P_Control_Calidad 
--
ALTER TABLE P_Control_Calidad ADD CONSTRAINT RefA_DirGeneral29 
    FOREIGN KEY (IdLoc)
    REFERENCES A_DirGeneral(IdLoc)
;
-- 
-- TABLE: P_Inventario 
--

ALTER TABLE P_Inventario ADD CONSTRAINT RefA_DirGeneral30 
    FOREIGN KEY (IdLoc)
    REFERENCES A_DirGeneral(IdLoc)
;
-- 
-- TABLE: P_Manufactura 
--
ALTER TABLE P_Manufactura ADD CONSTRAINT RefA_DirGeneral31 
    FOREIGN KEY (IdLoc)
    REFERENCES A_DirGeneral(IdLoc)
;
