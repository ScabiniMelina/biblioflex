USE biblioflex;

-- PARA EL PROCEDIMIENTO buscar_libros_en_biblioteca:
-- BUSCA LIBROS DISPONIBLES EN UNA BIBLIOTECA, FILTRANDO POR TÍTULO, AUTOR Y EDITORIAL. AGRUPANDOLOS POR EDICION DEL LIBRO (ISBN) EN CADA BIBLIOTECA
-- SE UTILIZA PARA ENCONTRAR LIBROS QUE PUEDEN SER AGREGADOS A UN PRÉSTAMO.

DROP PROCEDURE IF EXISTS buscar_libros_en_biblioteca;
DELIMITER //
CREATE PROCEDURE buscar_libros_en_biblioteca(
    IN id_biblioteca INT, 
    IN titulo_libro VARCHAR(255),
    IN autor_libro VARCHAR(255),
    IN editorial_libro VARCHAR(255)
)
BEGIN
    SELECT libro.id_isbn_libro, libro.titulo, libro.editorial, libro.fecha_publicacion, count(1) as stock, biblioteca.nombre  AS nombre_biblioteca, CONCAT(persona.nombre, ' ', persona.apellido) AS autor
    FROM libro
    INNER JOIN inventario_libro ON libro.id_isbn_libro = inventario_libro.id_isbn_libro
    INNER JOIN libro_autor ON libro_autor.id_isbn_libro = inventario_libro.id_isbn_libro
    INNER JOIN persona ON persona.id_persona = libro_autor.id_persona
    INNER JOIN biblioteca ON inventario_libro.id_biblioteca = biblioteca.id_biblioteca
    WHERE inventario_libro.id_biblioteca = id_biblioteca
        AND (titulo_libro IS NULL OR libro.titulo LIKE CONCAT('%', titulo_libro, '%'))
        AND (autor_libro IS NULL OR libro.id_isbn_libro IN (SELECT id_isbn_libro FROM libro_autor WHERE id_persona IN (SELECT id_persona FROM persona WHERE CONCAT(nombre, ' ', apellido) LIKE CONCAT('%', autor_libro, '%'))))
        AND (editorial_libro IS NULL OR libro.editorial LIKE CONCAT('%', editorial_libro, '%'))
    GROUP BY libro.id_isbn_libro, biblioteca.id_biblioteca, autor
    HAVING stock > 0;
END //

DELIMITER ;


-- DUDAS: 1. COMO PUEDO HACER PARA HACER UN PROCEDIMIENTO PARA REGISTRAR MUCHOS LIBROS EN UN SOLO LLAMADO AL PROCEDIMIENTO??LISTADO DE LIBROS A PRESTAR SEPARADOS POR COMA?? WHILE??? ES POSIBLE QUE SE VALIDE SI SI ALGUN LIBRO ES CANDIDATO A PRESTAMO SE 2. NO SE DEBERIA GENERAR EL PRESTAMO SI NO ES HAY UN LIBRO VALIDO PARA PRESTAR(NO ESTA EN LA BIBLIOTECA Y NO ESTA SIENDO OCUPADO POR OTRO USUARIO)
-- PARA EL PROCEDIMIENTO registrar_libro_en_prestamo:
-- ESTE PROCEDIMIENTO REGISTRA LA ENTRADA DE UN LIBRO EN UN PRÉSTAMO.
-- SE VALIDA SI EL LIBRO ESTÁ DISPONIBLE EN LA BIBLIOTECA Y NO ESTÁ PRESTADO A OTRO SOCIO.

DROP PROCEDURE IF EXISTS registrar_libro_en_prestamo;
DELIMITER //
CREATE PROCEDURE registrar_libro_en_prestamo(
    IN p_id_prestamo INT,
    IN p_id_libro INT,
    IN p_id_biblioteca INT
)
BEGIN
   
    DECLARE existe_libro_en_biblioteca BOOLEAN;
    DECLARE existe_libro_en_prestamo BOOLEAN;
 
    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 1) VERIFICAR SI EL LIBRO SE ENCUENTRA EN LA BIBLIOTECA.
    SET  existe_libro_en_biblioteca =  EXISTS(SELECT 1 FROM inventario_libro WHERE id_libro = p_id_libro AND id_biblioteca = p_id_biblioteca);

    IF NOT existe_libro_en_biblioteca THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<NO EXISTE ESE LIBRO EN LA BIBLIOTECA>>.';
    END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 2) VERIFICAR QUE EL LIBRO NO SE ENCUENTRA PRESTADO
    SELECT EXISTS(SELECT 1 FROM libro_prestado  WHERE fecha_devolucion IS NULL AND libro_prestado.id_prestamo = p_id_libro) INTO existe_libro_en_prestamo;
    IF existe_libro_en_prestamo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<ESE LIBRO YA SE ENCUENTRA EN PRESTAMO POR OTRO SOCIO>>.';
    END IF;

    -- INSERTAR LIBRO PRESTADO EN EL PRESTAMO
    INSERT INTO libro_prestado (id_prestamo, id_libro, fecha_devolucion)
    VALUES (p_id_prestamo, p_id_libro, NULL);

    SELECT '<<LIBRO AGREGADO EN PRESTAMO>>.' AS mensaje;
       
END //
DELIMITER ;

-- PARA EL PROCEDIMIENTO registrar_prestamo:
-- ESTE PROCEDIMIENTO REGISTRA UN PRÉSTAMO COMPLETO
-- SE VALIDAN LAS CONDICIONES DEL SOCIO ANTES DE REGISTRAR EL PRÉSTAMO.
DROP PROCEDURE IF EXISTS registrar_prestamo;
DELIMITER //
CREATE PROCEDURE registrar_prestamo(
    IN p_id_socio INT,
    IN p_id_biblioteca INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_devolucion_propuesta DATE
)
BEGIN
    DECLARE existe_socio BOOLEAN;
    DECLARE existe_multas_impagas BOOLEAN;
    DECLARE existe_prestamo_vencido BOOLEAN;
    DECLARE id_prestamo INT;


    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 1) VERIFICAR SI EL SOCIO ESTÁ REGISTRADO
    SELECT EXISTS(SELECT 1 FROM socio WHERE id_socio = p_id_socio) INTO existe_socio;
    IF NOT existe_socio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<SOCIO INEXISTENTE>>.';
    END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 2A) FECHA DE DEVOLUCION PROPUESTA NO INGRESADA > COLOCAMOS LA FECHA INICIO + 14 DIAS. 2B) FECHA DE DEVOLUCION PROPUESTA ES MENOR A LA FECHA DE INCIO > COLOCAMOS LA FECHA DE HOY + 14 DIAS.
    
    IF p_fecha_inicio IS NULL THEN 
	 SET p_fecha_inicio = CURDATE();
	END IF;

    IF p_fecha_devolucion_propuesta IS NULL OR p_fecha_devolucion_propuesta < p_fecha_inicio THEN  
		SET p_fecha_devolucion_propuesta = DATE_ADD(p_fecha_inicio, INTERVAL 14 DAY);
	END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 3) VERIFICAR QUE EL USUARIO NO TENGA MULTAS
    SELECT EXISTS(SELECT 1 FROM multa JOIN prestamo ON prestamo.id_prestamo = multa.id_prestamo  WHERE multa.estado_multa = 0 AND prestamo.id_socio = p_id_socio ) INTO existe_multas_impagas;

    IF existe_multas_impagas THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "ERROR: <<SOCIO CON MULTAS ADEUDADAS>>. ";
    END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 4) VERIFICAR QUE EL USUARIO NO TENGA PRESTAMOS VENCIDOS PENDIENTES
    SELECT EXISTS(SELECT 1 FROM libro_prestado 
	JOIN prestamo ON prestamo.id_prestamo = libro_prestado.id_prestamo 
    WHERE libro_prestado.fecha_devolucion IS NULL AND CURRENT_DATE > prestamo.fecha_esperada_devolucion AND prestamo.id_socio = p_id_socio) INTO existe_prestamo_vencido;


    IF existe_prestamo_vencido THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<SOCIO CON PRESTAMOS VENCIDOS PENDIENTES>>.';
    END IF;

    -- INSERTAR PRESTAMO
    INSERT INTO prestamo (id_socio, id_biblioteca, fecha_prestamo, fecha_esperada_devolucion)
    VALUES (p_id_socio, p_id_biblioteca, p_fecha_inicio,  p_fecha_devolucion_propuesta);
    -- OBTENER ID PRESTAMO RECIEN INSERTADO
    SET id_prestamo = LAST_INSERT_ID();

    SELECT CONCAT('<<PRESTAMO REGISTRADO EXITOSAMENTE>>.',id_prestamo) AS mensaje;
       
END //
DELIMITER ;