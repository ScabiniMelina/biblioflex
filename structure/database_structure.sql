CREATE DATABASE IF NOT EXISTS biblioflex;
USE biblioflex;

CREATE TABLE IF NOT EXISTS libro (
    id_isbn_libro VARCHAR(13) PRIMARY KEY NOT NULL UNIQUE,
    titulo VARCHAR(255) NOT NULL,
    editorial VARCHAR(255) NOT NULL,
    fecha_publicacion DATE
);

CREATE TABLE IF NOT EXISTS persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(100),
    genero VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS socio (
	id_socio INT AUTO_INCREMENT NOT NULL UNIQUE ,
    id_persona INT,
	correo VARCHAR(255) NOT NULL UNIQUE,
	telefono VARCHAR(20) NOT NULL 
);

CREATE TABLE IF NOT EXISTS libro_autor (
    id_libro_autor INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    id_isbn_libro VARCHAR(13) NOT NULL
);

CREATE TABLE IF NOT EXISTS biblioteca (
    id_biblioteca INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(255) NOT NULL UNIQUE,
    capacidad_maxima INT,
    fecha_apertura DATE
);

CREATE TABLE IF NOT EXISTS empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_biblioteca INT NOT NULL,
    id_persona INT NOT NULL,
    id_cargo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS inventario_libro (
    id_libro INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_biblioteca INT NOT NULL,
    id_isbn_libro VARCHAR(13) NOT NULL
);

CREATE TABLE IF NOT EXISTS prestamo (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_socio INT NOT NULL,
    id_biblioteca INT NOT NULL,
    fecha_prestamo DATE DEFAULT (CURRENT_DATE),
    fecha_esperada_devolucion DATE
);

CREATE TABLE IF NOT EXISTS libro_prestado (
    id_prestamo INT,
    id_libro INT NOT NULL,
    fecha_devolucion DATE,
    PRIMARY KEY (id_prestamo, id_libro)
);

CREATE TABLE IF NOT EXISTS multa (
    id_multa INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
    id_prestamo INT NOT NULL,
    monto_multa DECIMAL(10, 2),
    fecha_registro DATE DEFAULT (CURRENT_DATE) NOT NULL,
    estado_multa  BOOLEAN
);

CREATE TABLE IF NOT EXISTS cargo_empleado (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cargo VARCHAR(100) UNIQUE
);

ALTER TABLE libro_autor
    ADD CONSTRAINT fk_id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
    ADD CONSTRAINT fk_id_isbn_libro FOREIGN KEY (id_isbn_libro) REFERENCES libro(id_isbn_libro);
    
ALTER TABLE socio
    ADD CONSTRAINT fk_id_socio_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);

ALTER TABLE empleado
    ADD CONSTRAINT fk_id_biblioteca FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id_biblioteca),
    ADD CONSTRAINT fk_id_persona_empleado FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
	ADD CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo) REFERENCES cargo_empleado (id_cargo);

ALTER TABLE inventario_libro
    ADD CONSTRAINT fk_id_biblioteca_inventario FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id_biblioteca),
    ADD CONSTRAINT fk_id_isbn_libro_inventario FOREIGN KEY (id_isbn_libro) REFERENCES libro(id_isbn_libro);

ALTER TABLE prestamo
    ADD CONSTRAINT fk_id_socio_prestamo FOREIGN KEY (id_socio) REFERENCES socio(id_socio),
    ADD CONSTRAINT fk_id_biblioteca_prestamo FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id_biblioteca);

ALTER TABLE libro_prestado
	ADD CONSTRAINT fk_id_libro_inventario_libro FOREIGN KEY (id_libro) REFERENCES inventario_libro(id_libro),
    ADD CONSTRAINT fk_id_prestamo_libro_prestado FOREIGN KEY (id_prestamo) REFERENCES prestamo(id_prestamo);

ALTER TABLE multa
    ADD CONSTRAINT fk_id_prestamo_multa FOREIGN KEY (id_prestamo) REFERENCES prestamo(id_prestamo);



CREATE TABLE IF NOT EXISTS stg_cambios_empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    tipo_operacion ENUM('Contratación', 'Despido'),
    fecha_hora DATE DEFAULT (CURRENT_DATE)
);