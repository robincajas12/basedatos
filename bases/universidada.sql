#Base de datos
-- Elimina la base de datos si ya existe
DROP DATABASE IF EXISTS universidad;

-- Crea la base de datos
CREATE DATABASE universidad;

-- Conéctate a la base de datos
\c universidad;

-- Crea la tabla departamento
CREATE TABLE departamento (
    id SERIAL PRIMARY KEY,  -- SERIAL es el equivalente a AUTO_INCREMENT en PostgreSQL
    nombre VARCHAR(50) NOT NULL
);

-- Crea la tabla persona
CREATE TABLE persona (
    id SERIAL PRIMARY KEY,  -- SERIAL es el equivalente a AUTO_INCREMENT en PostgreSQL
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('H', 'M')),  -- Simulación de ENUM con CHECK
    tipo VARCHAR(10) CHECK (tipo IN ('profesor', 'alumno'))  -- Simulación de ENUM con CHECK
);

-- Crea la tabla profesor
CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- Crea la tabla grado
CREATE TABLE grado (
    id SERIAL PRIMARY KEY,  -- SERIAL es el equivalente a AUTO_INCREMENT en PostgreSQL
    nombre VARCHAR(100) NOT NULL
);

-- Crea la tabla asignatura
CREATE TABLE asignatura (
    id SERIAL PRIMARY KEY,  -- SERIAL es el equivalente a AUTO_INCREMENT en PostgreSQL
    nombre VARCHAR(100) NOT NULL,
    creditos NUMERIC(5, 2) NOT NULL,  -- NUMERIC para manejar créditos con precisión
    tipo VARCHAR(10) CHECK (tipo IN ('básica', 'obligatoria', 'optativa')),  -- Simulación de ENUM con CHECK
    curso SMALLINT NOT NULL,  -- SMALLINT es el equivalente a TINYINT en PostgreSQL
    cuatrimestre SMALLINT NOT NULL,  -- SMALLINT es el equivalente a TINYINT en PostgreSQL
    id_profesor INT,
    id_grado INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_grado) REFERENCES grado(id)
);

-- Crea la tabla curso_escolar
CREATE TABLE curso_escolar (
    id SERIAL PRIMARY KEY,  -- SERIAL es el equivalente a AUTO_INCREMENT en PostgreSQL
    anyo_inicio INT NOT NULL,  -- INT para simular YEAR
    anyo_fin INT NOT NULL  -- INT para simular YEAR
);

-- Crea la tabla alumno_se_matricula_asignatura
CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);