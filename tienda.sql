--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.4

-- Started on 2025-02-04 20:30:53

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
-- TOC entry 5 (class 2615 OID 41339)
-- Name: tienda; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tienda;


ALTER SCHEMA tienda OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 41341)
-- Name: fabricante; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.fabricante (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE tienda.fabricante OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41340)
-- Name: fabricante_id_seq; Type: SEQUENCE; Schema: tienda; Owner: postgres
--

CREATE SEQUENCE tienda.fabricante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tienda.fabricante_id_seq OWNER TO postgres;

--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 215
-- Name: fabricante_id_seq; Type: SEQUENCE OWNED BY; Schema: tienda; Owner: postgres
--

ALTER SEQUENCE tienda.fabricante_id_seq OWNED BY tienda.fabricante.id;


--
-- TOC entry 218 (class 1259 OID 41356)
-- Name: producto; Type: TABLE; Schema: tienda; Owner: postgres
--

CREATE TABLE tienda.producto (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio double precision NOT NULL,
    id_fabricante bigint NOT NULL
);


ALTER TABLE tienda.producto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41355)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: tienda; Owner: postgres
--

CREATE SEQUENCE tienda.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tienda.producto_id_seq OWNER TO postgres;

--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 217
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: tienda; Owner: postgres
--

ALTER SEQUENCE tienda.producto_id_seq OWNED BY tienda.producto.id;


--
-- TOC entry 4126 (class 2604 OID 41344)
-- Name: fabricante id; Type: DEFAULT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.fabricante ALTER COLUMN id SET DEFAULT nextval('tienda.fabricante_id_seq'::regclass);


--
-- TOC entry 4127 (class 2604 OID 41359)
-- Name: producto id; Type: DEFAULT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.producto ALTER COLUMN id SET DEFAULT nextval('tienda.producto_id_seq'::regclass);


--
-- TOC entry 4278 (class 0 OID 41341)
-- Dependencies: 216
-- Data for Name: fabricante; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

INSERT INTO tienda.fabricante (id, nombre) VALUES (1, 'Asus');
INSERT INTO tienda.fabricante (id, nombre) VALUES (2, 'Lenovo');
INSERT INTO tienda.fabricante (id, nombre) VALUES (3, 'Hewlett-Packard');
INSERT INTO tienda.fabricante (id, nombre) VALUES (4, 'Samsung');
INSERT INTO tienda.fabricante (id, nombre) VALUES (5, 'Seagate');
INSERT INTO tienda.fabricante (id, nombre) VALUES (6, 'Crucial');
INSERT INTO tienda.fabricante (id, nombre) VALUES (7, 'Gigabyte');
INSERT INTO tienda.fabricante (id, nombre) VALUES (8, 'Huawei');
INSERT INTO tienda.fabricante (id, nombre) VALUES (9, 'Xiaomi');


--
-- TOC entry 4280 (class 0 OID 41356)
-- Dependencies: 218
-- Data for Name: producto; Type: TABLE DATA; Schema: tienda; Owner: postgres
--

INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (8, 'Portátil Yoga 520', 559, 2);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO tienda.producto (id, nombre, precio, id_fabricante) VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 215
-- Name: fabricante_id_seq; Type: SEQUENCE SET; Schema: tienda; Owner: postgres
--

SELECT pg_catalog.setval('tienda.fabricante_id_seq', 9, true);


--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 217
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: tienda; Owner: postgres
--

SELECT pg_catalog.setval('tienda.producto_id_seq', 11, true);


--
-- TOC entry 4129 (class 2606 OID 41354)
-- Name: fabricante pk_fabricante; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.fabricante
    ADD CONSTRAINT pk_fabricante PRIMARY KEY (id);


--
-- TOC entry 4132 (class 2606 OID 41369)
-- Name: producto pk_producto; Type: CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.producto
    ADD CONSTRAINT pk_producto PRIMARY KEY (id);


--
-- TOC entry 4130 (class 1259 OID 41370)
-- Name: idx_id_fabricante; Type: INDEX; Schema: tienda; Owner: postgres
--

CREATE INDEX idx_id_fabricante ON tienda.producto USING btree (id_fabricante);


--
-- TOC entry 4133 (class 2606 OID 41371)
-- Name: producto producto_ibfk_1; Type: FK CONSTRAINT; Schema: tienda; Owner: postgres
--

ALTER TABLE ONLY tienda.producto
    ADD CONSTRAINT producto_ibfk_1 FOREIGN KEY (id_fabricante) REFERENCES tienda.fabricante(id);


--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA tienda; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA tienda FROM postgres;
GRANT ALL ON SCHEMA tienda TO "DBA_Locales" WITH GRANT OPTION;
GRANT USAGE ON SCHEMA tienda TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON SCHEMA tienda TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE fabricante; Type: ACL; Schema: tienda; Owner: postgres
--

REVOKE ALL ON TABLE tienda.fabricante FROM postgres;
GRANT SELECT ON TABLE tienda.fabricante TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE tienda.fabricante TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE tienda.fabricante TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE producto; Type: ACL; Schema: tienda; Owner: postgres
--

REVOKE ALL ON TABLE tienda.producto FROM postgres;
GRANT SELECT ON TABLE tienda.producto TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE tienda.producto TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON TABLE tienda.producto TO "DBA" WITH GRANT OPTION;


-- Completed on 2025-02-04 20:30:54

--
-- PostgreSQL database dump complete
--

