USE biblioflex;

-- VISTA_LIBROS_EN_PRESTAMO:
-- 1) MUESTRA LOS LIBROS ACTUALMENTE EN PRÉSTAMO Y LOS QUE ESTAN POR VENCER.
-- 2) MUESTRA EL ID DEL PRÉSTAMO, EL ID DEL LIBRO, EL TÍTULO DEL LIBRO, EL NOMBRE COMPLETO DEL SOCIO QUE LO TIENE PRESTADO, EL ESTADO DEL PRÉSTAMO (SI ESTÁ VENCIDO O NO), LOS DIAS DE VENCIDO O RESTANTES PARA VENCER, Y EL NOMBRE DE LA BIBLIOTECA A LA QUE PERTENECE EL LIBRO.
-- 3) SE FILTRAN LOS PRÉSTAMOS DONDE LA FECHA DE DEVOLUCIÓN ES NULA, LO QUE INDICA QUE EL LIBRO AÚN NO HA SIDO DEVUELTO.

CREATE OR REPLACE VIEW vista_libros_en_prestamo AS
SELECT prestamo.id_prestamo, inventario_libro.id_libro, titulo AS libro, CONCAT(socio.id_socio," ", persona.nombre," ", persona.apellido) AS socio, prestamo_esta_vencido(prestamo.fecha_esperada_devolucion) AS estado, prestamo.fecha_esperada_devolucion, CONCAT(biblioteca.id_biblioteca," ",biblioteca.nombre) AS biblioteca
FROM libro_prestado 
	INNER JOIN prestamo ON prestamo.id_prestamo = libro_prestado.id_prestamo 
    INNER JOIN socio ON socio.id_socio = prestamo.id_socio 
    INNER JOIN persona ON persona.id_persona = socio.id_persona
    INNER JOIN inventario_libro ON inventario_libro.id_libro = libro_prestado.id_libro
    INNER JOIN libro ON libro.id_isbn_libro = inventario_libro.id_isbn_libro
    INNER JOIN biblioteca ON biblioteca.id_biblioteca = prestamo.id_biblioteca
    WHERE libro_prestado.fecha_devolucion IS NULL
    ORDER BY biblioteca.id_biblioteca;


-- VISTA_HISTORIAL_PRESTAMOS_POR_PERSONA:
-- 1) MUESTRA EL HISTORIAL DE TODOS LOS PRESTAMOS REALIZADOS POR UN SOCIO.
-- 2) MUESTRA EL TÍTULO DEL LIBRO PRESTADO, LA FECHA DE PRÉSTAMO, EL NOMBRE COMPLETO DEL SOCIO, LA CANTIDAD DE DÍAS QUE EL LIBRO ESTUVO PRESTADO, Y EL ESTADO DEL PRÉSTAMO.

CREATE OR REPLACE VIEW vista_historial_prestamos_por_persona AS
SELECT titulo AS nombre_libro, prestamo.fecha_prestamo, libro_prestado.fecha_devolucion, CONCAT( socio.id_socio," ",persona.nombre," ", persona.apellido) AS socio,cantidad_dias_prestado(prestamo.fecha_prestamo,libro_prestado.fecha_devolucion) AS dias_prestado, prestamo_esta_vencido(prestamo.fecha_esperada_devolucion) AS estado, obtener_estado_devolucion(libro_prestado.fecha_devolucion) AS estado_devolucion FROM libro_prestado 
	INNER JOIN prestamo ON prestamo.id_prestamo = libro_prestado.id_prestamo 
	INNER JOIN socio ON socio.id_socio = prestamo.id_socio 
    INNER JOIN persona ON persona.id_persona = socio.id_persona
    INNER JOIN inventario_libro ON inventario_libro.id_libro = libro_prestado.id_libro
    INNER JOIN libro ON libro.id_isbn_libro = inventario_libro.id_isbn_libro
    ORDER BY persona.id_persona;

-- VISTA_ESTADISTICA_POR_BIBLIOTECA:
-- PROPORCIONA ESTADÍSTICAS DE RECUENTO SOBRE LAS BIBLIOTECAS.
-- MUESTRA EL ID DE LA BIBLIOTECA, EL NOMBRE DE LA BIBLIOTECA, LA CANTIDAD DE EMPLEADOS, LA CANTIDAD DE LIBROS, LA CANTIDAD DE PRÉSTAMOS Y LA CANTIDAD DE MULTAS POR BIBLIOTECA.

CREATE OR REPLACE VIEW vista_estadistica_por_biblioteca AS
SELECT biblioteca.id_biblioteca, biblioteca.nombre AS biblioteca, 
       COUNT(DISTINCT empleado.id_empleado) AS cantidad_empleados,
       COUNT(DISTINCT inventario_libro.id_libro) AS cantidad_libros,
       COUNT(DISTINCT prestamo.id_prestamo) AS cantidad_prestamos,
       COUNT(DISTINCT multa.id_multa) AS cantidad_multas
FROM biblioteca
INNER JOIN empleado ON  empleado.id_biblioteca = biblioteca.id_biblioteca
INNER JOIN inventario_libro ON biblioteca.id_biblioteca = inventario_libro.id_biblioteca
INNER JOIN prestamo ON prestamo.id_biblioteca = biblioteca.id_biblioteca 
INNER JOIN multa ON  multa.id_prestamo = prestamo.id_prestamo 
GROUP BY biblioteca.id_biblioteca;

-- VISTA_EMPLEADOS_BIBLIOTECA:
-- OFRECE INFORMACIÓN SOBRE LOS EMPLEADOS DE CADA BIBLIOTECA RELACIONANDO DATOS DE EMPLEADOS, PERSONAS, CARGOS Y BIBLIOTECAS PARA MOSTRAR QUIÉNES TRABAJAN EN CADA BIBLIOTECA Y EN QUÉ ROLES.

CREATE OR REPLACE VIEW vista_empleados_biblioteca AS
SELECT empleado.id_empleado, CONCAT( persona.nombre," ", persona.apellido) AS empleado, cargo_empleado.nombre_cargo AS cargo, biblioteca.nombre AS biblioteca
FROM empleado
INNER JOIN persona ON persona.id_persona = empleado.id_persona
INNER JOIN cargo_empleado ON empleado.id_cargo = cargo_empleado.id_cargo
INNER JOIN biblioteca ON biblioteca.id_biblioteca = empleado.id_biblioteca;

-- VISTA_MULTAS_PENDIENTES_SOCIOS:
-- MUESTRA A LOS SOCIOS QUE TIENEN MULTAS PENDIENTES SIN PAGAR.
-- MUESTRA EL ID DEL SOCIO, SU NOMBRE COMPLETO, SU CORREO ELECTRÓNICO, LA SUMA TOTAL DE LAS MULTAS PENDIENTES Y EL ID DE LA BIBLIOTECA A LA QUE PERTENECEN.

CREATE OR REPLACE VIEW vista_multas_pendientes_socios AS
SELECT prestamo.id_socio,CONCAT( persona.nombre," ", persona.apellido) AS socio, socio.correo, SUM(multa.monto_multa) AS suma_multas_pendientes
FROM prestamo 
INNER JOIN libro_prestado ON libro_prestado.id_prestamo = prestamo.id_prestamo
INNER JOIN multa  ON multa.id_prestamo = prestamo.id_prestamo
INNER JOIN socio ON socio.id_socio = prestamo.id_socio 
INNER JOIN persona ON persona.id_persona = socio.id_persona
INNER JOIN biblioteca ON biblioteca.id_biblioteca = prestamo.id_biblioteca
WHERE ( multa.estado_multa = FALSE)
GROUP BY prestamo.id_socio;


SELECT * FROM vista_libros_en_prestamo;
SELECT * FROM vista_historial_prestamos_por_persona;
SELECT * FROM vista_estadistica_por_biblioteca;
SELECT * FROM vista_empleados_biblioteca;
SELECT * FROM vista_multas_pendientes_socios;
