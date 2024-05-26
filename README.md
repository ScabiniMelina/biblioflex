<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final - Biblioflex</center>
@Alumno Melina Scabini

@Comision 53180

@Tutor Santiago Gonzalez y Carla Palermo

@Docente Anderson Torres


---

### **Consignas:**
- La base de datos debe contener al menos:
    * ~ 15 tablas, entre las cuales debe haber al menos 1 tabla de hechos,  2 tablas transaccionales.
    * ~ 5 vistas.
    * ~ 2 stored procedure.
    * ~ 2  trigger.
    * ~ 2 funciones
    
- El documento debe contener:
    - Introducción
    - Objetivo
    - Situación problemática
    - Modelo de negocio
    - Diagrama de entidad relació
    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas

---

## Tematica del proyecto

## Modelo de negocio

## Diagrama entidad relacion (DER)
<img src="[https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp](https://github.com/ScabiniMelina/biblioflex/blob/main/presentation/Flowchart%20(1).jpg)" style="width: 100% ; aspect-ratio:16/9">

## Listado de tablas y descripcion

### libro

| Campo             | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|-------------------|----------------|---------------|----------------|---------|----------|--------|
| id_isbn_libro     | VARCHAR(13)    | PK            |                |         | X        | X      |
| titulo            | VARCHAR(100)   |               |                |         | X        |        |
| editorial         | VARCHAR(100)   |               |                |         | X        |        |
| fecha_publicacion | DATE           |               |                |         |          |        |

### persona

| Campo            | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|------------------|----------------|---------------|----------------|---------|----------|--------|
| id_persona       | INT            | PK            | X              |         | X        | X      |
| nombre           | VARCHAR(255)   |               |                |         | X        |        |
| apellido         | VARCHAR(255)   |               |                |         | X        |        |
| fecha_nacimiento | DATE           |               |                |         |          |        |
| genero           | VARCHAR(50)    |               |                |         |          |        |

### socio

| Campo       | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|-------------|----------------|---------------|----------------|---------|----------|--------|
| id_socio    | INT            | PK            | X              |         | X        | X      |
| id_persona  | INT            | FK            |                |         | X        |        |
| correo      | VARCHAR(255)   |               |                |         | X        | X      |
| telefono    | VARCHAR(20)    |               |                |         | X        |        |

### libro_autor

| Campo         | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|---------------|----------------|---------------|----------------|---------|----------|--------|
| id_libro_autor| INT            | PK            | X              |         |          |        |
| id_isbn_libro | VARCHAR(13)    | FK            |                |         | X        |        |
| id_persona    | INT            | FK            |                |         | X        |        |

### biblioteca

| Campo           | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|-----------------|----------------|---------------|----------------|---------|----------|--------|
| id_biblioteca   | INT            | PK            | X              |         | X        | X      |
| nombre          | VARCHAR(255)   |               |                |         | X        |        |
| direccion       | VARCHAR(255)   |               |                |         | X        |        |
| codigo_postal   | VARCHAR(20)    |               |                |         |          |        |
| telefono        | VARCHAR(20)    |               |                |         |          |        |
| email           | VARCHAR(255)   |               |                |         | X        | X      |
| capacidad_maxima| INT            |               |                |         |          |        |
| fecha_apertura  | DATE           |               |                |         |          |        |

### empleado

| Campo         | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|---------------|----------------|---------------|----------------|---------|----------|--------|
| id_empleado   | INT            | PK            | X              |         | X        | X      |
| id_biblioteca | INT            | FK            |                |         | X        |        |
| id_persona    | INT            | FK            |                |         | X        |        |
| id_cargo      | INT            |               |                |         | X        |        |

### inventario_libro

| Campo           | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|-----------------|----------------|---------------|----------------|---------|----------|--------|
| id_libro        | INT            | PK            | X              |         | X        | X      |
| id_biblioteca   | INT            | FK            |                |         | X        |        |
| id_isbn_libro   | VARCHAR(13)    | FK            |                |         | X        |        |

### prestamo

| Campo                    | Tipo de Dato   | Tipo de Clave | Auto Increment | Default           | Not Null | Unique |
|--------------------------|----------------|---------------|----------------|-------------------|----------|--------|
| id_prestamo              | INT            | PK            | X              |                   | X        | X      |
| id_socio                 | INT            | FK            |                |                   | X        |        |
| id_biblioteca            | INT            | FK            |                |                   | X        |        |
| fecha_prestamo           | DATE           |               |                | (CURRENT_DATE)    |          |        |
| fecha_esperada_devolucion| DATE           |               |                |                   |          |        |

### libro_prestado

| Campo           | Tipo de Dato   | Tipo de Clave                  | Auto Increment | Default | Not Null | Unique |
|-----------------|----------------|--------------------------------|----------------|---------|----------|--------|
| id_libro_prestado | INT          | PKC (id_prestamo, id_libro)    | X              |         |          |        |
| id_prestamo       | INT          | FK                             |                |         | X        |        |
| id_libro          | INT          | FK                             |                |         | X        |        |
| fecha_devolucion  | DATE         |                                |                |         |          |        |

### multa

| Campo         | Tipo de Dato   | Tipo de Clave | Auto Increment | Default           | Not Null | Unique |
|---------------|----------------|---------------|----------------|-------------------|----------|--------|
| id_multa      | INT            | PK            | X              |                   | X        | X      |
| id_prestamo   | INT            | FK            |                |                   | X        |        |
| monto_multa   | DECIMAL(10,2)  |               |                |                   |          |        |
| fecha_registro| DATE           |               |                | (CURRENT_DATE)    | X        |        |
| estado_multa  | BOOLEAN        |               |                |                   |          |        |

### cargo_empleado

| Campo         | Tipo de Dato   | Tipo de Clave | Auto Increment | Default | Not Null | Unique |
|---------------|----------------|---------------|----------------|---------|----------|--------|
| id_cargo      | INT            | PK            | X              |         |          |        |
| nombre_cargo  | VARCHAR(100)   | FK            |                |         | X        |        |


### Estructura e ingesta de datos

### Objetos de la base de datos

- [Estructura completa de la base de datos](https://github.com/ScabiniMelina/biblioflex/blob/main/structure/database_structure.sql)
- [Inserción de datos](https://github.com/ScabiniMelina/biblioflex/blob/main/structure/population.sql)
- [Vistas](https://github.com/ScabiniMelina/biblioflex/blob/main/objects/2_views.sql)
- [Funciones](https://github.com/ScabiniMelina/biblioflex/blob/main/objects/1_functions.sql)
- [Stored Procedures](https://github.com/ScabiniMelina/biblioflex/blob/main/objects/3_store_procedures.sql)
- [Triggers](https://github.com/ScabiniMelina/biblioflex/blob/main/objects/4_triggers.sql)
- [Roles y permisos](https://github.com/ScabiniMelina/biblioflex/blob/main/objects/5_roles_users.sql)
- [Back up de la base de datos](https://github.com/ScabiniMelina/biblioflex/blob/main/backups/Dump20240526%20(1).sql)

## Herramientas y tecnologias usadas
1. **Curso CoderHouse**
   - El curso proporcionó bases para el manejo de SQL aplicado a la creación y administración de bases de datos relacionales. Analizando desde la ejecución de consultas básicas hasta el dominio de funciones, triggers y stored procedures, cada clase ha contribuido a ampliar el conjunto de habilidades con el uso de buenas practicas. Además, se han explorado temas como la gestión de objetos de base de datos, el manejo de transacciones y técnicas de respaldo y restauración.

2. **workbench  y terminal**
   - Por medio de Workbench como herramienta de interfaz gráfica para el manejo y administración de bases de datos relacionales junto al uso de la terminal se pudo llevar a cabo este proyecto.

3. **SQL**
  - Se seleccionó como la tecnología principal para diseñar y gestionar la base de datos relacional que almacena información sobre un sistema de gestión bibliotecaria.


## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
