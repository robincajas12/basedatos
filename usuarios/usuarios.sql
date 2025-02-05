
CREATE ROLE DBAs;
CREATE ROLE SoloLectura;
CREATE ROLE LecturaEscritura;
CREATE ROLE Eliminador;


CREATE USER dba_empleados WITH PASSWORD 'dba_empleados' IN ROLE DBAs;
CREATE USER dba_jardineria WITH PASSWORD 'dba_jardineria' IN ROLE DBAs;
CREATE USER dba_tienda WITH PASSWORD 'dba_tienda' IN ROLE DBAs;
CREATE USER dba_universidada WITH PASSWORD 'dba_universidada' IN ROLE DBAs;
CREATE USER dba_universidadb WITH PASSWORD 'dba_universidadb' IN ROLE DBAs;
CREATE USER dba_ventas WITH PASSWORD 'dba_ventas' IN ROLE DBAs;


CREATE USER lector_empleados WITH PASSWORD 'lector_empleados' IN ROLE SoloLectura;
CREATE USER lector_jardineria WITH PASSWORD 'lector_jardineria' IN ROLE SoloLectura;
CREATE USER lector_tienda WITH PASSWORD 'lector_tienda' IN ROLE SoloLectura;
CREATE USER lector_universidada WITH PASSWORD 'lector_universidada' IN ROLE SoloLectura;
CREATE USER lector_universidadb WITH PASSWORD 'lector_universidadb' IN ROLE SoloLectura;
CREATE USER lector_ventas WITH PASSWORD 'lector_ventas' IN ROLE SoloLectura;


CREATE USER editor_empleados WITH PASSWORD 'editor_empleados' IN ROLE LecturaEscritura;
CREATE USER editor_jardineria WITH PASSWORD 'editor_jardineria' IN ROLE LecturaEscritura;
CREATE USER editor_tienda WITH PASSWORD 'editor_tienda' IN ROLE LecturaEscritura;
CREATE USER editor_universidada WITH PASSWORD 'editor_universidada' IN ROLE LecturaEscritura;
CREATE USER editor_universidadb WITH PASSWORD 'editor_universidadb' IN ROLE LecturaEscritura;
CREATE USER editor_ventas WITH PASSWORD 'editor_ventas' IN ROLE LecturaEscritura;

CREATE USER eliminador_empleados WITH PASSWORD 'eliminador_empleados' IN ROLE Eliminador;
CREATE USER eliminador_jardineria WITH PASSWORD 'eliminador_jardineria' IN ROLE Eliminador;
CREATE USER eliminador_tienda WITH PASSWORD 'eliminador_tienda' IN ROLE Eliminador;
CREATE USER eliminador_universidada WITH PASSWORD 'eliminador_universidada' IN ROLE Eliminador;
CREATE USER eliminador_universidadb WITH PASSWORD 'eliminador_universidadb' IN ROLE Eliminador;
CREATE USER eliminador_ventas WITH PASSWORD 'eliminador_ventas' IN ROLE Eliminador;

CREATE ROLE empleados_group;
GRANT DBAs TO empleados_group;
GRANT SoloLectura TO empleados_group;
GRANT LecturaEscritura TO empleados_group;

CREATE ROLE jardineria_group;
GRANT DBAs TO jardineria_group;
GRANT SoloLectura TO jardineria_group;
GRANT LecturaEscritura TO jardineria_group;

CREATE ROLE tienda_group;
GRANT DBAs TO tienda_group;
GRANT SoloLectura TO tienda_group;
GRANT LecturaEscritura TO tienda_group;

CREATE ROLE universidada_group;
GRANT DBAs TO universidada_group;
GRANT SoloLectura TO universidada_group;
GRANT LecturaEscritura TO universidada_group;

CREATE ROLE universidadb_group;
GRANT DBAs TO universidadb_group;
GRANT SoloLectura TO universidadb_group;
GRANT LecturaEscritura TO universidadb_group;

CREATE ROLE ventas_group;
GRANT DBAs TO ventas_group;
GRANT SoloLectura TO ventas_group;
GRANT LecturaEscritura TO ventas_group;

GRANT empleados_group TO dba_empleados, lector_empleados, editor_empleados, eliminador_empleados;
GRANT jardineria_group TO dba_jardineria, lector_jardineria, editor_jardineria, eliminador_jardineria;
GRANT tienda_group TO dba_tienda, lector_tienda, editor_tienda, eliminador_tienda;
GRANT universidada_group TO dba_universidada, lector_universidada, editor_universidada, eliminador_universidada;
GRANT universidadb_group TO dba_universidadb, lector_universidadb, editor_universidadb, eliminador_universidadb;
GRANT ventas_group TO dba_ventas, lector_ventas, editor_ventas, eliminador_ventas;

-- Crear las bases de datos (si aún no existen)
CREATE DATABASE gestionempleados;
CREATE DATABASE jardineria;
CREATE DATABASE tienda;
CREATE DATABASE universidada;
CREATE DATABASE universidadb;
CREATE DATABASE ventas;

\c gestionempleados
GRANT ALL PRIVILEGES ON DATABASE gestionempleados TO dba_empleados;
GRANT CONNECT ON DATABASE gestionempleados TO lector_empleados, editor_empleados, eliminador_empleados;

\c jardineria
GRANT ALL PRIVILEGES ON DATABASE jardineria TO dba_jardineria;
GRANT CONNECT ON DATABASE jardineria TO lector_jardineria, editor_jardineria, eliminador_jardineria;

\c tienda
GRANT ALL PRIVILEGES ON DATABASE tienda TO dba_tienda;
GRANT CONNECT ON DATABASE tienda TO lector_tienda, editor_tienda, eliminador_tienda;

\c universidada
GRANT ALL PRIVILEGES ON DATABASE universidada TO dba_universidada;
GRANT CONNECT ON DATABASE universidada TO lector_universidada, editor_universidada, eliminador_universidada;

\c universidadb
GRANT ALL PRIVILEGES ON DATABASE universidadb TO dba_universidadb;
GRANT CONNECT ON DATABASE universidadb TO lector_universidadb, editor_universidadb, eliminador_universidadb;

\c ventas
GRANT ALL PRIVILEGES ON DATABASE ventas TO dba_ventas;
GRANT CONNECT ON DATABASE ventas TO lector_ventas, editor_ventas, eliminador_ventas;

