--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.4

-- Started on 2025-02-04 20:28:12

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
-- TOC entry 5 (class 2615 OID 41416)
-- Name: ventas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ventas;


ALTER SCHEMA ventas OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 41418)
-- Name: cliente; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    ciudad character varying(100),
    categoria bigint
);


ALTER TABLE ventas.cliente OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41417)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 215
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.cliente_id_seq OWNED BY ventas.cliente.id;


--
-- TOC entry 218 (class 1259 OID 41433)
-- Name: comercial; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.comercial (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    comision real
);


ALTER TABLE ventas.comercial OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41432)
-- Name: comercial_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.comercial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.comercial_id_seq OWNER TO postgres;

--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 217
-- Name: comercial_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.comercial_id_seq OWNED BY ventas.comercial.id;


--
-- TOC entry 220 (class 1259 OID 41448)
-- Name: pedido; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.pedido (
    id integer NOT NULL,
    total double precision NOT NULL,
    fecha date,
    id_cliente bigint NOT NULL,
    id_comercial bigint NOT NULL
);


ALTER TABLE ventas.pedido OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41447)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.pedido_id_seq OWNER TO postgres;

--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 219
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.pedido_id_seq OWNED BY ventas.pedido.id;


--
-- TOC entry 4131 (class 2604 OID 41421)
-- Name: cliente id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cliente ALTER COLUMN id SET DEFAULT nextval('ventas.cliente_id_seq'::regclass);


--
-- TOC entry 4132 (class 2604 OID 41436)
-- Name: comercial id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.comercial ALTER COLUMN id SET DEFAULT nextval('ventas.comercial_id_seq'::regclass);


--
-- TOC entry 4133 (class 2604 OID 41451)
-- Name: pedido id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido ALTER COLUMN id SET DEFAULT nextval('ventas.pedido_id_seq'::regclass);


--
-- TOC entry 4288 (class 0 OID 41418)
-- Dependencies: 216
-- Data for Name: cliente; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO ventas.cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES (10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);


--
-- TOC entry 4290 (class 0 OID 41433)
-- Dependencies: 218
-- Data for Name: comercial; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (3, 'Diego', 'Flores', 'Salas', 0.11);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (4, 'Marta', 'Herrera', 'Gil', 0.14);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (5, 'Antonio', 'Carretero', 'Ortega', 0.12);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (6, 'Manuel', 'Domínguez', 'Hernández', 0.13);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (7, 'Antonio', 'Vega', 'Hernández', 0.11);
INSERT INTO ventas.comercial (id, nombre, apellido1, apellido2, comision) VALUES (8, 'Alfredo', 'Ruiz', 'Flores', 0.05);


--
-- TOC entry 4292 (class 0 OID 41448)
-- Dependencies: 220
-- Data for Name: pedido; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (1, 150.5, '2017-10-05', 5, 2);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (2, 270.65, '2016-09-10', 1, 5);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (3, 65.26, '2017-10-05', 2, 1);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (4, 110.5, '2016-08-17', 8, 3);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (5, 948.5, '2017-09-10', 5, 2);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (7, 5760, '2015-09-10', 2, 1);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (10, 250.45, '2015-06-27', 8, 2);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (11, 75.29, '2016-08-17', 3, 7);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (13, 545.75, '2019-01-25', 6, 1);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (14, 145.82, '2017-02-02', 6, 1);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (15, 370.85, '2019-03-11', 1, 5);
INSERT INTO ventas.pedido (id, total, fecha, id_cliente, id_comercial) VALUES (16, 2389.23, '2019-03-11', 1, 5);


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 215
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.cliente_id_seq', 10, true);


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 217
-- Name: comercial_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.comercial_id_seq', 8, true);


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 219
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.pedido_id_seq', 16, true);


--
-- TOC entry 4135 (class 2606 OID 41431)
-- Name: cliente pk_cliente; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (id);


--
-- TOC entry 4137 (class 2606 OID 41446)
-- Name: comercial pk_comercial; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.comercial
    ADD CONSTRAINT pk_comercial PRIMARY KEY (id);


--
-- TOC entry 4141 (class 2606 OID 41461)
-- Name: pedido pk_pedido; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pk_pedido PRIMARY KEY (id);


--
-- TOC entry 4138 (class 1259 OID 41462)
-- Name: idx_id_cliente; Type: INDEX; Schema: ventas; Owner: postgres
--

CREATE INDEX idx_id_cliente ON ventas.pedido USING btree (id_cliente);


--
-- TOC entry 4139 (class 1259 OID 41463)
-- Name: idx_id_comercial; Type: INDEX; Schema: ventas; Owner: postgres
--

CREATE INDEX idx_id_comercial ON ventas.pedido USING btree (id_comercial);


--
-- TOC entry 4142 (class 2606 OID 41464)
-- Name: pedido pedido_ibfk_1; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES ventas.cliente(id);


--
-- TOC entry 4143 (class 2606 OID 41469)
-- Name: pedido pedido_ibfk_2; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_ibfk_2 FOREIGN KEY (id_comercial) REFERENCES ventas.comercial(id);


--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA ventas; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA ventas FROM postgres;
GRANT USAGE ON SCHEMA ventas TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON SCHEMA ventas TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON SCHEMA ventas TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE cliente; Type: ACL; Schema: ventas; Owner: postgres
--

REVOKE ALL ON TABLE ventas.cliente FROM postgres;
GRANT SELECT ON TABLE ventas.cliente TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE ventas.cliente TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE ventas.cliente TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE comercial; Type: ACL; Schema: ventas; Owner: postgres
--

REVOKE ALL ON TABLE ventas.comercial FROM postgres;
GRANT SELECT ON TABLE ventas.comercial TO "Usuarios_R";
GRANT ALL ON TABLE ventas.comercial TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE ventas.comercial TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE pedido; Type: ACL; Schema: ventas; Owner: postgres
--

REVOKE ALL ON TABLE ventas.pedido FROM postgres;
GRANT SELECT ON TABLE ventas.pedido TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE ventas.pedido TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE ventas.pedido TO "DBA" WITH GRANT OPTION;


-- Completed on 2025-02-04 20:28:13

--
-- PostgreSQL database dump complete
--

