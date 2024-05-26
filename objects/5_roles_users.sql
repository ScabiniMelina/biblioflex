USE mysql;

CREATE USER 'socio'@'localhost' IDENTIFIED BY 'password_socio';
CREATE USER 'empleado'@'localhost' IDENTIFIED BY 'password_empleado';
CREATE USER 'desarrollador'@'localhost' IDENTIFIED BY 'password_desarrollador';
CREATE USER 'coderhouse'@'localhost' IDENTIFIED BY 'coderhouse';

GRANT ALL PRIVILEGES ON biblioflex.* TO 'desarrollador'@'localhost';
GRANT ALL PRIVILEGES ON biblioflex.* TO 'coderhouse'@'localhost';
GRANT ALL PRIVILEGES ON biblioflex.* TO 'empleado'@'localhost'; -- + Administrar biblioteca y empleados

GRANT SELECT ON biblioflex.libro TO 'socio'@'localhost';
GRANT SELECT ON biblioflex.inventario_libro TO 'socio'@'localhost';
GRANT SELECT ON biblioflex.prestamo TO 'socio'@'localhost';
GRANT SELECT ON biblioflex.libro_prestado TO 'socio'@'localhost';
GRANT SELECT ON biblioflex.vista_libros_en_prestamo TO 'socio'@'localhost';
GRANT SELECT ON biblioflex.vista_historial_prestamos_por_persona TO 'socio'@'localhost';
GRANT SELECT ON biblioflex.vista_multas_pendientes_socios TO 'socio'@'localhost';
GRANT EXECUTE ON FUNCTION biblioflex.prestamo_esta_vencido TO 'socio'@'localhost';
GRANT EXECUTE ON FUNCTION biblioflex.cantidad_dias_prestado TO 'socio'@'localhost';
GRANT EXECUTE ON FUNCTION biblioflex.obtener_estado_devolucion TO 'socio'@'localhost';

