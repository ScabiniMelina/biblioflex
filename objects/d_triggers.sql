USE biblioflex;
DELIMITER //
CREATE TABLE IF NOT EXISTS stg_cambios_empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    tipo_operacion ENUM('Contratación', 'Despido'),
    fecha_hora DATE DEFAULT (CURRENT_DATE)
);
DELIMITER ;


DROP TRIGGER IF EXISTS tr_empleado_update;
-- TRIGGER: AGREGA EN LA TABLA EN TABLA DE STAGE INFORMACION DE NUEVAS CONTRATACIONES
DELIMITER //
CREATE TRIGGER tr_empleado_update BEFORE INSERT ON empleado
FOR EACH ROW
BEGIN
    DECLARE v_nombre VARCHAR(255);
    DECLARE v_apellido VARCHAR(255);
    
    -- OBTIENE EL NOMBRE Y APELLIDO DE LA PERSONA CONTRATADA
    SELECT nombre, apellido INTO v_nombre, v_apellido
    FROM persona
    WHERE id_persona = NEW.id_persona;
    
    -- INSERTA LA INFORMACIÓN EN LA TABLA DE CAMBIOS DE EMPLEADOS
    INSERT INTO stg_cambios_empleados (id_empleado,id_persona, nombre, apellido, tipo_operacion)
    VALUES (NEW.id_empleado,NEW.id_persona,v_nombre, v_apellido, 'Contratación');
END//
DELIMITER ;

-- TRIGER: AGREGA EN LA TABLA EN TABLA DE STAGE INFORMACION DE NUEVOS DESPIDOS

DROP TRIGGER IF EXISTS tr_empleado_delete;
DELIMITER //
CREATE TRIGGER tr_empleado_delete AFTER DELETE ON empleado
FOR EACH ROW
BEGIN
    DECLARE v_nombre VARCHAR(255);
    DECLARE v_apellido VARCHAR(255);
    
    -- OBTIENE EL NOMBRE Y APELLIDO DE LA PERSONA DESPEDIDA
    SELECT nombre, apellido INTO v_nombre, v_apellido
    FROM persona
    WHERE id_persona = OLD.id_persona;
    
    -- INSERTA LA INFORMACIÓN EN LA TABLA DE CAMBIOS DE EMPLEADOS
	INSERT INTO stg_cambios_empleados (id_empleado,id_persona, nombre, apellido, tipo_operacion)
    VALUES (OLD.id_empleado, OLD.id_persona,v_nombre, v_apellido, 'Despido');
END//
DELIMITER ;


DROP TRIGGER IF EXISTS validar_fecha_nacimiento;
-- TRIGGER PARA VALIDAR QUE LA FECHA DE NACIMIENTO NO SEA MAYOR A LA FECHA ACTUAL
DELIMITER //
CREATE TRIGGER validar_fecha_nacimiento
BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    DECLARE fecha_actual DATE;
    DECLARE mensaje_error VARCHAR(255);
    
    SET fecha_actual = CURDATE();   
    IF NEW.fecha_nacimiento > fecha_actual THEN       
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<FECHA NACIMIENTO MAYOR FECHA ACTUAL>>';
    END IF;
END //
DELIMITER ;


DROP TRIGGER IF EXISTS tr_validar_fecha_prestamo;
-- TRIGGER PARA VALIDAR QUE LA FECHA DE PRESTAMO NO SEA MAYOR A LA FECHA ACTUAL
DELIMITER //
CREATE TRIGGER tr_validar_fecha_prestamo
BEFORE INSERT ON prestamo
FOR EACH ROW
BEGIN
    DECLARE fecha_actual DATE;
    DECLARE mensaje_error VARCHAR(255);
    SET fecha_actual = CURDATE();   
    IF NEW.fecha_prestamo > fecha_actual THEN       
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<FECHA PRESTAMO MAYOR FECHA ACTUAL>>';
    END IF;
END //
DELIMITER ;

-- TRIGGERS: AL ACTUALIZAR LA FECHA DE DEVOLUCION DE UN LIBRO PRESTADO, SE GENERA LA MULTA EN BASE A LOS DIAS VENCIDOS

DROP TRIGGER IF EXISTS tr_generar_multa_por_vencimiento;
DELIMITER //
CREATE TRIGGER tr_generar_multa_por_vencimiento
BEFORE UPDATE ON libro_prestado
FOR EACH ROW
BEGIN
    DECLARE dias_vencidos INT;
    DECLARE multa_existente INT;
	IF OLD.fecha_devolucion != NEW.fecha_devolucion THEN
		SELECT DATEDIFF(NEW.fecha_devolucion, prestamo.fecha_esperada_devolucion) INTO dias_vencidos
		FROM prestamo 
		WHERE prestamo.id_prestamo = NEW.id_prestamo;
		
        SELECT COUNT(*) INTO multa_existente
		FROM multa
		WHERE id_prestamo = NEW.id_prestamo;
        
		IF dias_vencidos > 0 THEN
            IF multa_existente > 0 THEN
                UPDATE multa
                SET monto_multa = dias_vencidos * 5.00,
                    fecha_registro = CURRENT_DATE
                WHERE id_prestamo = NEW.id_prestamo;
            ELSE
                INSERT INTO multa (id_prestamo, monto_multa, fecha_registro, estado_multa)
                VALUES (NEW.id_prestamo, dias_vencidos * 5.00, CURRENT_DATE, FALSE);
            END IF;
		END IF;
    END IF;
END//
DELIMITER ;