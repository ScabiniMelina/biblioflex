USE biblioflex;

INSERT INTO biblioteca (nombre, direccion, codigo_postal, telefono, email, capacidad_maxima, fecha_apertura) VALUES 
('New York Public Library', '476 5th Ave', '10018', '+1 (917) 275-6975', 'info@nypl.org', 2000, '1895-05-23'),
('Library of Congress', '101 Independence Ave SE', '20540', '+1 (202) 707-5000', 'info@loc.gov', 5000, '1800-04-24'),
('British Library', '96 Euston Rd', 'NW1 2DB', '+44 (0)330 333 1144', 'enquiries@bl.uk', 1500, '1973-11-25'),
('Boston Public Library', '700 Boylston St', '02116', '+1 (617) 536-5400', 'ask@bpl.org', 1200, '1848-03-20'),
('Los Angeles Public Library', '630 W 5th St', '90071', '+1 (213) 228-7000', 'contactus@lapl.org', 2500, '1872-06-01'),
('Chicago Public Library', '400 S State St', '60605', '+1 (312) 747-4300', 'cpl@cpl.org', 1800, '1873-01-01'),
('Seattle Public Library', '1000 4th Ave', '98104', '+1 (206) 386-4636', 'ask@spl.org', 1700, '1890-03-26'),
('San Francisco Public Library', '100 Larkin St', '94102', '+1 (415) 557-4400', 'info@sfpl.org', 1400, '1879-06-09'),
('Toronto Public Library', '789 Yonge St', 'M4W 2G8', '+1 (416) 393-7131', 'info@tpl.ca', 2200, '1883-03-06'),
('National Library of Australia', 'Parkes Pl W', '2600', '+61 (02) 6262 1111', 'info@nla.gov.au', 3000, '1901-01-01');


INSERT INTO libro (id_isbn_libro, titulo, editorial, fecha_publicacion) VALUES 
('9780061120084', 'To Kill a Mockingbird', 'HarperCollins Publishers', '1960-07-11'),
('9780143039433', 'The Great Gatsby', 'Penguin Books', '1925-04-10'),
('9780743273565', 'The Catcher in the Rye', 'Little, Brown and Company', '1951-07-16'),
('9780307594002', '1984', 'Houghton Mifflin Harcourt', '1949-06-08'),
('9780547928227', 'The Hobbit', 'Houghton Mifflin Harcourt', '1937-09-21'),
('9780618260300', 'Pride and Prejudice', 'Houghton Mifflin Harcourt', '1813-01-28'),
('9780060256654', 'Where the Wild Things Are', 'HarperCollins Publishers', '1963-04-02');


INSERT INTO persona (nombre, apellido, fecha_nacimiento, nacionalidad, genero) VALUES 
('John', 'Doe', '1985-04-15', 'USA', 'Masculino'),
('Jane', 'Smith', '1990-09-25', 'USA', 'Femenino'),
('David', 'Johnson', '1980-02-28', 'UK', 'Masculino'),
('Emily', 'Brown', '1977-11-10', 'USA', 'Femenino'),
('Michael', 'Wilson', '1988-06-30', 'Canada', 'Masculino'),
('Sophia', 'Taylor', '1983-03-20', 'Australia', 'Femenino'),
('Daniel', 'Anderson', '1975-08-05', 'USA', 'Masculino'),
('Olivia', 'Martinez', '1981-01-12', 'Spain', 'Femenino'),
('William', 'Garcia', '1986-07-22', 'USA', 'Masculino'),
('Ava', 'Rodriguez', '1979-09-03', 'Mexico', 'Femenino'),
('Emma', 'Lee', '1976-04-18', 'UK', 'Femenino'),
('Alexander', 'Lopez', '1984-12-08', 'Spain', 'Masculino'),
('Mia', 'Harris', '1991-02-25', 'Canada', 'Femenino'),
('James', 'Miller', '1980-11-28', 'USA', 'Masculino'),
('Charlotte', 'Clark', '1977-07-15', 'Australia', 'Femenino'),
('Benjamin', 'Young', '1989-05-05', 'UK', 'Masculino'),
('Amelia', 'Evans', '1982-03-30', 'USA', 'Femenino'),
('Logan', 'Gonzalez', '1978-08-20', 'Mexico', 'Masculino'),
('Ethan', 'King', '1985-10-12', 'Canada', 'Masculino'),
('Liam', 'Wright', '1983-09-05', 'Australia', 'Masculino'),
('Mary', 'Johnson', '1981-06-12', 'USA', 'Femenino'),
('Christopher', 'Williams', '1979-09-08', 'UK', 'Masculino'),
('Ashley', 'Brown', '1987-03-25', 'USA', 'Femenino'),
('Matthew', 'Jones', '1984-12-30', 'Australia', 'Masculino'),
('Jessica', 'Garcia', '1983-07-19', 'Mexico', 'Femenino'),
('Daniel', 'Martinez', '1982-02-16', 'Spain', 'Masculino'),
('Jennifer', 'Rodriguez', '1978-11-10', 'USA', 'Femenino'),
('James', 'Hernandez', '1980-08-05', 'UK', 'Masculino'),
('Emily', 'Lopez', '1985-04-20', 'Canada', 'Femenino'),
('Michael', 'Clark', '1986-01-15', 'Australia', 'Masculino'),
('Ava', 'Adams', '1979-10-25', 'USA', 'Femenino'),
('Matthew', 'Wright', '1982-08-28', 'UK', 'Masculino'),
('Olivia', 'King', '1984-03-15', 'Canada', 'Femenino'),
('Noah', 'Evans', '1986-12-10', 'Australia', 'Masculino'),
('Sophia', 'Gonzalez', '1988-05-20', 'Mexico', 'Femenino'),
('William', 'Young', '1980-09-28', 'Spain', 'Masculino'),
('Isabella', 'Taylor', '1977-11-01', 'USA', 'Femenino'),
('Alexander', 'Miller', '1983-06-15', 'UK', 'Masculino'),
('Sophia', 'Wright', '1981-04-20', 'Canada', 'Femenino'),
('Michael', 'Garcia', '1979-08-10', 'Australia', 'Masculino');


INSERT INTO persona (nombre, apellido, fecha_nacimiento, nacionalidad, genero) VALUES 
('Emily', 'Johnson', '1988-03-15', 'USA', 'Femenino'),
('Sophia', 'Martinez', '1985-09-10', 'Spain', 'Femenino'),
('Daniel', 'Garcia', '1983-12-25', 'Mexico', 'Masculino'),
('Olivia', 'Lee', '1979-07-05', 'UK', 'Femenino'),
('William', 'Rodriguez', '1982-11-18', 'Canada', 'Masculino'),
('Emma', 'Clark', '1986-02-28', 'Australia', 'Femenino'),
('Alexander', 'Hernandez', '1984-06-10', 'USA', 'Masculino'),
('Ava', 'Evans', '1981-04-20', 'Spain', 'Femenino'),
('James', 'Gonzalez', '1977-08-15', 'Mexico', 'Masculino');


INSERT INTO persona (nombre, apellido, fecha_nacimiento, nacionalidad, genero) VALUES 
('Samantha', 'Johnson', '1988-07-20', 'USA', 'Femenino'),
('William', 'Smith', '1992-05-15', 'USA', 'Masculino'),
('Isabella', 'Martinez', '1985-09-28', 'Spain', 'Femenino'),
('Alexander', 'Garcia', '1979-11-10', 'Mexico', 'Masculino'),
('Olivia', 'Jones', '1983-03-05', 'Canada', 'Femenino'),
('James', 'Rodriguez', '1976-06-30', 'USA', 'Masculino');

INSERT INTO socio (id_persona, correo, telefono) VALUES
(1, 'correo1@example.com', '234567891'),
(2, 'correo2@example.com', '234567890'),
(3, 'correo3@example.com', '345678901'),
(4, 'correo4@example.com', '456789012'),
(5, 'correo5@example.com', '567890123'),
(6, 'correo6@example.com', '678901234'),
(7, 'correo7@example.com', '789012345'),
(8, 'correo8@example.com', '890123456'),
(9, 'correo9@example.com', '901234567'),
(10, 'correo10@example.com', '012345678'),
(11, 'correo11@example.com', '111111111'),
(12, 'correo12@example.com', '222222222'),
(13, 'correo13@example.com', '333333333'),
(14, 'correo14@example.com', '444444444'),
(15, 'correo15@example.com', '555555555');

INSERT INTO libro_autor (id_persona, id_isbn_libro) VALUES 
(1,'9780061120084'),
(9, '9780061120084'),
(19,'9780061120084'), 
(29, '9780061120084'),
(39, '9780061120084'), 
(2, '9780143039433'), 
(12, '9780143039433'), 
(22, '9780143039433'), 
(32, '9780143039433'), 
(42, '9780143039433'), 
(3, '9780743273565'),
(13, '9780743273565'),
(4, '9780307594002'), 
(5, '9780547928227'),
(6, '9780618260300'), 
(7, '9780060256654'), 
(17, '9780060256654');


INSERT INTO cargo_empleado (nombre_cargo) VALUES
('Bibliotecario'),
('Asistente de Biblioteca'),
('Encargado de Adquisiciones'),
('Gerente de Biblioteca'),
('Asistente de Investigación'),
('Conserje'),
('Administrador de Sistemas'),
('Técnico de Biblioteca'),
('Coordinador de Programas'),
('Especialista en Conservación'),
('Bibliotecólogo'),
('Arquitecto de Información'),
('Bibliotecario de Referencia'),
('Bibliotecario Infantil'),
('Bibliotecario Digital'),
('Bibliotecario Escolar'),
('Bibliotecario Universitario'),
('Bibliotecario de Archivos'),
('Bibliotecario de Museos');


INSERT INTO empleado (id_biblioteca, id_persona, id_cargo) VALUES 
(1, 1, 1),  
(1, 2, 1),   
(1, 2, 1),   
(2, 2, 2),   
(2, 3, 2),  
(2, 3, 2),  
(2, 3, 3),   
(4, 4, 3),   
(5, 5, 3),  
(7, 6, 4),   
(1, 7, 4),  
(2, 12, 5),  
(3, 13, 5),  
(4, 4, 1),   
(5, 15, 1),   
(6, 16, 1),   
(7, 17, 2),   
(8, 18, 2),   
(9, 19, 1),   
(10, 20, 4);   


INSERT INTO inventario_libro (id_biblioteca, id_isbn_libro) VALUES
(1, '9780061120084'),
(1, '9780143039433'),
(1, '9780743273565'),
(1, '9780307594002'),
(1, '9780061120084'),
(1, '9780143039433'),
(1, '9780743273565'),
(1, '9780307594002'),
(1, '9780061120084'),
(1, '9780143039433'),
(1, '9780743273565'),
(1, '9780307594002'),
(1, '9780547928227'),
(1, '9780618260300'),
(1, '9780060256654'),
(2, '9780061120084'),
(2, '9780143039433'),
(2, '9780743273565'),
(2, '9780307594002'),
(2, '9780547928227'),
(2, '9780618260300'),
(2, '9780060256654'),
(3, '9780061120084'),
(3, '9780143039433'),
(3, '9780743273565'),
(3, '9780307594002'),
(3, '9780547928227'),
(3, '9780618260300'),
(3, '9780060256654'),
(4, '9780061120084'),
(4, '9780143039433'),
(4, '9780743273565'),
(4, '9780307594002'),
(4, '9780547928227'),
(4, '9780618260300'),
(4, '9780060256654'),
(5, '9780061120084'),
(5, '9780143039433'),
(5, '9780743273565'),
(5, '9780307594002'),
(5, '9780547928227'),
(5, '9780618260300'),
(5, '9780060256654'),
(6, '9780061120084'),
(6, '9780143039433'),
(6, '9780743273565'),
(6, '9780307594002'),
(6, '9780547928227'),
(6, '9780618260300'),
(6, '9780060256654'),
(7, '9780061120084'),
(7, '9780143039433'),
(7, '9780743273565'),
(7, '9780307594002'),
(7, '9780547928227'),
(7, '9780618260300'),
(7, '9780060256654'),
(8, '9780061120084'),
(8, '9780143039433'),
(8, '9780743273565'),
(8, '9780307594002'),
(8, '9780547928227'),
(8, '9780618260300'),
(8, '9780060256654'),
(9, '9780061120084'),
(9, '9780143039433'),
(9, '9780743273565'),
(9, '9780307594002'),
(9, '9780547928227'),
(9, '9780618260300'),
(9, '9780060256654'),
(1, '9780061120084'),
(1, '9780143039433'),
(1, '9780743273565'),
(1, '9780307594002'),
(8, '9780547928227'),
(9, '9780618260300'),
(10, '9780060256654');



INSERT INTO prestamo (id_socio, id_biblioteca, fecha_prestamo, fecha_esperada_devolucion) VALUES 
(1, 1, '2024-04-11', '2024-04-25'),
(1, 1, '2024-04-12', '2024-04-26'),
(2, 1, '2024-04-13', '2024-04-27'),
(2, 3, '2024-04-14', '2024-04-28'),
(3, 3, '2024-04-15', '2024-04-29'),
(4, 3, '2024-04-16', '2024-04-30'),
(5, 4, '2024-04-17', '2024-05-01'),
(6, 4, '2024-04-18', '2024-05-02'),
(7, 2, '2024-04-19', '2024-05-03'),
(8, 1, '2024-04-20', '2024-05-04'),
(9, 1, '2024-04-21', '2024-05-05'),
(12, 2, '2024-04-22', '2024-05-06'),
(3, 3, '2024-04-23', '2024-05-07'),
(10, 2, '2024-04-24', '2024-05-08'),
(11, 4, '2024-04-25', '2024-05-09'),
(12, 4, '2024-04-26', '2024-05-10'),
(8, 7, '2024-04-27', '2024-05-11'),
(13, 8, '2024-04-28', '2024-05-12'),
(13, 9, '2024-04-29', '2024-05-13'),
(1, 10, '2024-04-30', '2024-05-14'),
(14, 1, '2024-05-01', '2024-05-15'),
(1, 2, '2024-05-02', '2024-05-16'),
(3, 3, '2024-05-03', '2024-05-17'),
(4, 4, '2024-05-04', '2024-05-18'),
(5, 5, '2024-05-05', '2024-05-19'),
(6, 6, '2024-05-06', '2024-05-20'),
(7, 7, '2024-05-07', '2024-05-21'),
(3, 8, '2024-05-08', '2024-05-22'),
(3, 9, '2024-05-09', '2024-05-23'),
(4, 10, '2024-05-10', '2024-05-24');



INSERT INTO libro_prestado (id_prestamo, id_libro,fecha_devolucion) VALUES 
(1, 1,'2024-05-01'),
(1, 2,'2024-05-01'),
(1, 3,'2024-05-01'),
(2, 16,'2024-04-30'),
(2, 5,'2024-04-30'),
(3, 6, NULL),
(4, 7,'2024-04-30'),
(4, 8,'2024-04-30'),
(4, 9, NULL),
(5, 10,NULL),
(5, 11,NULL),
(5, 12,NULL),
(6, 13,'2024-05-01'),
(7, 14, '2024-05-01'),
(7, 15, '2024-05-01'),
(8, 16,NULL),
(8, 17,NULL),
(8, 18,NULL),
(8, 19,NULL),
(9, 20,NULL),
(9, 21,NULL),
(10, 22,'2024-04-28'),
(10, 23,'2024-04-28'),
(10, 24,'2024-04-28'),
(11, 25,NULL),
(11, 26,NULL),
(11, 27,NULL),
(12, 28,NULL),
(13, 32,NULL),
(13, 33,NULL),
(14, 34,NULL),
(14, 35,NULL),
(15, 36,'2024-04-27'),
(15, 37,'2024-04-27'),
(15, 38,'2024-04-27'),
(15, 39,'2024-04-27'),
(16, 40,NULL),
(16, 1,NULL),
(16, 2,NULL),
(17, 3,NULL),
(17, 4,NULL),
(17, 5,NULL),
(17, 6,NULL),
(18, 7,NULL),
(18, 8,NULL),
(18, 9,NULL),
(19, 10,'2024-05-10'),
(19, 11,'2024-05-10'),
(19, 12,'2024-05-10'),
(19, 13,'2024-05-10'),
(20, 14,'2024-05-10'),
(20, 15,'2024-05-10'),
(20, 16,'2024-05-10'),
(20, 17,'2024-05-10'),
(21, 18,'2024-05-10'),
(21, 19,'2024-05-10'),
(21, 20,'2024-05-10'),
(22, 21,'2024-05-10'),
(22, 22,'2024-05-10'),
(22, 23, NULL),
(23, 24, NULL),
(23, 25, NULL),
(24, 26,'2024-06-02'),
(24, 27,'2024-06-02'),
(25, 28,'2024-06-02'),
(25, 29,'2024-06-02'),
(25, 30,'2024-06-02'),
(26, 31,'2024-06-02'),
(26, 32, NULL),
(26, 33, NULL),
(27, 34, NULL),
(27, 35, NULL),
(27, 36, NULL),
(27, 37, NULL);


INSERT INTO multa (id_prestamo, monto_multa, fecha_registro, estado_multa)
VALUES 
(1, 2, '2024-04-30', 0),
(2, 6, '2024-05-01', 0),
(3, 0, '2024-04-30', 1),
(4, 0, '2024-05-01', 1),
(15, 0, '2024-05-03', 1),
(26, 0, '2024-05-04', 1),
(7, 0, '2024-05-05', 1),
(8, 2, '2024-04-30', 0),
(9, 0, '2024-05-01', 1),
(10, 0, '2024-05-08', 1);
