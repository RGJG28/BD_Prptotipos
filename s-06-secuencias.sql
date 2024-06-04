--@Autor(es): JIMENEZ GARCIA RODRIGO GAUDENCIO
--@Fecha creación: 02/06/2023
--@Descripción: CREACION DE SECUENCIAS

--Utilizaremos las secuencias para generar tosdos los id de forma unica y consecutiva.

connect r_proy_admin/mg
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA DIRGENERAL--------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE dirgeneral_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA RECURSOS_HUMANOS-----------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE recursoshumanos_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA EMPLEADO-------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE empleado_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA PRODCUTO-------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE producto_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA CONTROL_CALIDAD------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE controlcalidad_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA INVENTARIO-----------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE inventario_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------CREACION DE SECUENCIA PARA MANUFACTURA----------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE manufactura_seq
  start WITH 1   --La secuencia iniciara en 1.
  increment by 1 --La secuencia incrementa de 1 en 1.
  nominvalue     --No se necesita un valor minimo ya que la secuencia no es ciclica.
  nomaxvalue     --No se establece un valor maximo para la secuencia.
  nocycle        --La secuencia no se repetira al alcanzar un valor maximo
  cache 10       --Se almacenan 10 valores de la secuencia en memoria (para mejor desempeño en una carga "masiva" de datos)
  order          --Se garantiza que los valores se generen en el orden solicitado
;
