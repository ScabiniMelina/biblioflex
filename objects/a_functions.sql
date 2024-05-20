USE biblioflex;

-- FUNCTION: PARA VERIFICAR SI UN PRÉSTAMO ESTÁ VENCIDO Y DESDE CUANTO TIEMPO O CUANTOS DIAS RESTAN PARA VENCER.

DELIMITER ;
DROP FUNCTION IF EXISTS prestamo_esta_vencido;
DELIMITER //
CREATE FUNCTION prestamo_esta_vencido (
    fecha_esperada_devolucion DATE 
) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE fecha_actual DATE; 
    DECLARE devolucion_vencida BOOLEAN; 
    DECLARE dias_restantes INT; 
    
    -- OBTENER LA FECHA ACTUAL
    SELECT CURRENT_DATE() INTO fecha_actual;
    
    -- COMPROBAR SI LA DEVOLUCIÓN ESTÁ VENCIDA
    IF fecha_esperada_devolucion > fecha_actual THEN
        SET devolucion_vencida = FALSE; 
    ELSE
        SET devolucion_vencida = TRUE;
    END IF;
    
    -- CALCULAR LOS DÍAS RESTANTES O PASADOS DESDE LA FECHA DE DEVOLUCIÓN ESPERADA
    SET dias_restantes = DATEDIFF(fecha_actual, fecha_esperada_devolucion);
    
    -- RETORNAR EL RESULTADO FORMATEADO
    IF devolucion_vencida = TRUE THEN
        RETURN CONCAT('VENCIDO (', dias_restantes, ' DÍAS)'); -- EL PRÉSTAMO ESTÁ VENCIDO
    ELSE
        RETURN CONCAT('RESTAN (', dias_restantes*-1, ' DÍAS)'); -- QUEDAN DÍAS PARA EL VENCIMIENTO DEL PRÉSTAMO
    END IF;
END//
DELIMITER ;

-- FUNCTION: PARA CALCULAR LA CANTIDAD DE DÍAS QUE UN LIBRO HA SIDO PRESTADO
DROP FUNCTION IF EXISTS cantidad_dias_prestado;
DELIMITER //
CREATE FUNCTION cantidad_dias_prestado (
    fecha_prestamo DATE, 
    fecha_devolucion DATE 
) RETURNS INT
DETERMINISTIC
BEGIN
    -- VERIFICAR SI LA FECHA DE PRÉSTAMO ES NULA
    IF fecha_prestamo IS NULL THEN
        RETURN NULL; 
    END IF;
    
    -- VERIFICAR SI LA FECHA DE DEVOLUCIÓN ES NULA, EN CASO AFIRMATIVO, SE ASUME LA FECHA ACTUAL
    IF fecha_devolucion IS NULL THEN
        SELECT CURRENT_DATE() INTO fecha_devolucion; 
    END IF;
    
    -- CALCULAR LA CANTIDAD DE DÍAS PRESTADO Y RETORNAR EL RESULTADO
    RETURN DATEDIFF(fecha_devolucion, fecha_prestamo); 
END//
DELIMITER ;

-- FUNCTION: SI LA FECHA ES NULL MUESTRA QUE UN LIBRO FUE DEVUELTO O NO
DROP FUNCTION IF EXISTS obtener_estado_devolucion;
DELIMITER //
CREATE FUNCTION obtener_estado_devolucion(fecha_devolucion DATE)
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    IF fecha_devolucion IS NULL THEN
        RETURN 'NO DEVUELTO';
    ELSE
        RETURN 'DEVUELTO';
    END IF;
END//
DELIMITER ;
