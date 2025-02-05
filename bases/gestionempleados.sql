--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.4

-- Started on 2025-02-04 20:28:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 41377)
-- Name: empleados; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA empleados;


ALTER SCHEMA empleados OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 41379)
-- Name: departamento; Type: TABLE; Schema: empleados; Owner: postgres
--

CREATE TABLE empleados.departamento (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    presupuesto double precision NOT NULL,
    gastos double precision NOT NULL
);


ALTER TABLE empleados.departamento OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41378)
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: empleados; Owner: postgres
--

CREATE SEQUENCE empleados.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empleados.departamento_id_seq OWNER TO postgres;



ALTER SEQUENCE empleados.departamento_id_seq OWNED BY empleados.departamento.id;



CREATE TABLE empleados.empleado (
    id integer NOT NULL,
    nif character varying(9) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    id_departamento bigint
);


ALTER TABLE empleados.empleado OWNER TO postgres;


CREATE SEQUENCE empleados.empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empleados.empleado_id_seq OWNER TO postgres;

ALTER SEQUENCE empleados.empleado_id_seq OWNED BY empleados.empleado.id;



ALTER TABLE ONLY empleados.departamento ALTER COLUMN id SET DEFAULT nextval('empleados.departamento_id_seq'::regclass);



ALTER TABLE ONLY empleados.empleado ALTER COLUMN id SET DEFAULT nextval('empleados.empleado_id_seq'::regclass);




INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (1, 'Desarrollo', 120000, 6000);
INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (2, 'Sistemas', 150000, 21000);
INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (3, 'Recursos Humanos', 280000, 25000);
INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (4, 'Contabilidad', 110000, 3000);
INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (5, 'I+D', 375000, 380000);
INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (6, 'Proyectos', 0, 0);
INSERT INTO empleados.departamento (id, nombre, presupuesto, gastos) VALUES (7, 'Publicidad', 0, 1000);


INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (10, '46384486H', 'Diego', 'Flores', 'Salas', 5);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (11, '67389283A', 'Marta', 'Herrera', 'Gil', 1);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (12, '41234836R', 'Irene', 'Salas', 'Flores', NULL);
INSERT INTO empleados.empleado (id, nif, nombre, apellido1, apellido2, id_departamento) VALUES (13, '82635162B', 'Juan Antonio', 'Sáez', 'Guerrero', NULL);


--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 215
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: empleados; Owner: postgres
--

SELECT pg_catalog.setval('empleados.departamento_id_seq', 7, true);


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 217
-- Name: empleado_id_seq; Type: SEQUENCE SET; Schema: empleados; Owner: postgres
--

SELECT pg_catalog.setval('empleados.empleado_id_seq', 13, true);


--
-- TOC entry 4129 (class 2606 OID 41392)
-- Name: departamento pk_departamento; Type: CONSTRAINT; Schema: empleados; Owner: postgres
--

ALTER TABLE ONLY empleados.departamento
    ADD CONSTRAINT pk_departamento PRIMARY KEY (id);


--
-- TOC entry 4133 (class 2606 OID 41407)
-- Name: empleado pk_empleado; Type: CONSTRAINT; Schema: empleados; Owner: postgres
--

ALTER TABLE ONLY empleados.empleado
    ADD CONSTRAINT pk_empleado PRIMARY KEY (id);


--
-- TOC entry 4130 (class 1259 OID 41409)
-- Name: idx_id_departamento; Type: INDEX; Schema: empleados; Owner: postgres
--

CREATE INDEX idx_id_departamento ON empleados.empleado USING btree (id_departamento);


--
-- TOC entry 4131 (class 1259 OID 41408)
-- Name: idx_nif; Type: INDEX; Schema: empleados; Owner: postgres
--

CREATE UNIQUE INDEX idx_nif ON empleados.empleado USING btree (nif);


--
-- TOC entry 4134 (class 2606 OID 41410)
-- Name: empleado empleado_ibfk_1; Type: FK CONSTRAINT; Schema: empleados; Owner: postgres
--

ALTER TABLE ONLY empleados.empleado
    ADD CONSTRAINT empleado_ibfk_1 FOREIGN KEY (id_departamento) REFERENCES empleados.departamento(id);


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA empleados; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA empleados FROM postgres;
GRANT USAGE ON SCHEMA empleados TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON SCHEMA empleados TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON SCHEMA empleados TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE departamento; Type: ACL; Schema: empleados; Owner: postgres
--

REVOKE ALL ON TABLE empleados.departamento FROM postgres;
GRANT SELECT ON TABLE empleados.departamento TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE empleados.departamento TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE empleados.departamento TO "DBA";


--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE empleado; Type: ACL; Schema: empleados; Owner: postgres
--

REVOKE ALL ON TABLE empleados.empleado FROM postgres;
GRANT SELECT ON TABLE empleados.empleado TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE empleados.empleado TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE empleados.empleado TO "DBA" WITH GRANT OPTION;


-- Completed on 2025-02-04 20:28:47

--
-- PostgreSQL database dump complete
--

