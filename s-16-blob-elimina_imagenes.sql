CREATE OR REPLACE PROCEDURE eliminar_imagen(
    p_IdQc IN NUMBER,
    p_IdLoc IN NUMBER
)
IS
BEGIN
    -- Actualizando la tabla para eliminar la imagen
    UPDATE P_Control_Calidad
    SET ImagenProducto = EMPTY_BLOB()
    WHERE IdQc = p_IdQc AND IdLoc = p_IdLoc;

    COMMIT;
END;
/
show errors