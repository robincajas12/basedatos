--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.4

-- Started on 2025-02-04 20:33:55

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
-- TOC entry 5 (class 2615 OID 41475)
-- Name: universidad; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA universidad;


ALTER SCHEMA universidad OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 41566)
-- Name: alumno_se_matricula_asignatura; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.alumno_se_matricula_asignatura (
    id_alumno bigint NOT NULL,
    id_asignatura bigint NOT NULL,
    id_curso_escolar bigint NOT NULL
);


ALTER TABLE universidad.alumno_se_matricula_asignatura OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41535)
-- Name: asignatura; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.asignatura (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    creditos real NOT NULL,
    tipo character varying(11) NOT NULL,
    curso smallint NOT NULL,
    cuatrimestre smallint NOT NULL,
    id_profesor bigint,
    id_grado bigint NOT NULL
);


ALTER TABLE universidad.asignatura OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 41534)
-- Name: asignatura_id_seq; Type: SEQUENCE; Schema: universidad; Owner: postgres
--

CREATE SEQUENCE universidad.asignatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE universidad.asignatura_id_seq OWNER TO postgres;

--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 222
-- Name: asignatura_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: postgres
--

ALTER SEQUENCE universidad.asignatura_id_seq OWNED BY universidad.asignatura.id;


--
-- TOC entry 225 (class 1259 OID 41552)
-- Name: curso_escolar; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.curso_escolar (
    id integer NOT NULL,
    anyo_inicio smallint NOT NULL,
    anyo_fin smallint NOT NULL
);


ALTER TABLE universidad.curso_escolar OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 41551)
-- Name: curso_escolar_id_seq; Type: SEQUENCE; Schema: universidad; Owner: postgres
--

CREATE SEQUENCE universidad.curso_escolar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE universidad.curso_escolar_id_seq OWNER TO postgres;

--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 224
-- Name: curso_escolar_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: postgres
--

ALTER SEQUENCE universidad.curso_escolar_id_seq OWNED BY universidad.curso_escolar.id;


--
-- TOC entry 218 (class 1259 OID 41493)
-- Name: departamento; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.departamento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE universidad.departamento OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41492)
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: universidad; Owner: postgres
--

CREATE SEQUENCE universidad.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE universidad.departamento_id_seq OWNER TO postgres;

--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 217
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: postgres
--

ALTER SEQUENCE universidad.departamento_id_seq OWNED BY universidad.departamento.id;


--
-- TOC entry 221 (class 1259 OID 41520)
-- Name: grado; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.grado (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE universidad.grado OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41519)
-- Name: grado_id_seq; Type: SEQUENCE; Schema: universidad; Owner: postgres
--

CREATE SEQUENCE universidad.grado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE universidad.grado_id_seq OWNER TO postgres;

--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 220
-- Name: grado_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: postgres
--

ALTER SEQUENCE universidad.grado_id_seq OWNED BY universidad.grado.id;


--
-- TOC entry 216 (class 1259 OID 41477)
-- Name: persona; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.persona (
    id integer NOT NULL,
    nif character varying(9),
    nombre character varying(25) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50),
    ciudad character varying(25) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9),
    fecha_nacimiento date NOT NULL,
    sexo character varying(1) NOT NULL,
    tipo character varying(8) NOT NULL
);


ALTER TABLE universidad.persona OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41476)
-- Name: persona_id_seq; Type: SEQUENCE; Schema: universidad; Owner: postgres
--

CREATE SEQUENCE universidad.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE universidad.persona_id_seq OWNER TO postgres;

--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 215
-- Name: persona_id_seq; Type: SEQUENCE OWNED BY; Schema: universidad; Owner: postgres
--

ALTER SEQUENCE universidad.persona_id_seq OWNED BY universidad.persona.id;


--
-- TOC entry 219 (class 1259 OID 41507)
-- Name: profesor; Type: TABLE; Schema: universidad; Owner: postgres
--

CREATE TABLE universidad.profesor (
    id_profesor bigint NOT NULL,
    id_departamento bigint NOT NULL
);


ALTER TABLE universidad.profesor OWNER TO postgres;

--
-- TOC entry 4152 (class 2604 OID 41538)
-- Name: asignatura id; Type: DEFAULT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.asignatura ALTER COLUMN id SET DEFAULT nextval('universidad.asignatura_id_seq'::regclass);


--
-- TOC entry 4153 (class 2604 OID 41555)
-- Name: curso_escolar id; Type: DEFAULT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.curso_escolar ALTER COLUMN id SET DEFAULT nextval('universidad.curso_escolar_id_seq'::regclass);


--
-- TOC entry 4150 (class 2604 OID 41496)
-- Name: departamento id; Type: DEFAULT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.departamento ALTER COLUMN id SET DEFAULT nextval('universidad.departamento_id_seq'::regclass);


--
-- TOC entry 4151 (class 2604 OID 41523)
-- Name: grado id; Type: DEFAULT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.grado ALTER COLUMN id SET DEFAULT nextval('universidad.grado_id_seq'::regclass);


--
-- TOC entry 4149 (class 2604 OID 41480)
-- Name: persona id; Type: DEFAULT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.persona ALTER COLUMN id SET DEFAULT nextval('universidad.persona_id_seq'::regclass);


--
-- TOC entry 4335 (class 0 OID 41566)
-- Dependencies: 226
-- Data for Name: alumno_se_matricula_asignatura; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (1, 1, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (2, 1, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (4, 1, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 1, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 1, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 1, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (1, 2, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (2, 2, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (4, 2, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 2, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 2, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 2, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (1, 3, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (2, 3, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (4, 3, 1);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 3, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 3, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 3, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 4, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 4, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 4, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 5, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 5, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 5, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 6, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 6, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 6, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 7, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 7, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 7, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 8, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 8, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 8, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 9, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 9, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 9, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (19, 10, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (23, 10, 5);
INSERT INTO universidad.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES (24, 10, 5);


--
-- TOC entry 4332 (class 0 OID 41535)
-- Dependencies: 223
-- Data for Name: asignatura; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (3, 'Física para informática', 6, 'básica', 1, 1, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (6, 'Estadística', 6, 'básica', 1, 2, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO universidad.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);


--
-- TOC entry 4334 (class 0 OID 41552)
-- Dependencies: 225
-- Data for Name: curso_escolar; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.curso_escolar (id, anyo_inicio, anyo_fin) VALUES (1, 2014, 2015);
INSERT INTO universidad.curso_escolar (id, anyo_inicio, anyo_fin) VALUES (2, 2015, 2016);
INSERT INTO universidad.curso_escolar (id, anyo_inicio, anyo_fin) VALUES (3, 2016, 2017);
INSERT INTO universidad.curso_escolar (id, anyo_inicio, anyo_fin) VALUES (4, 2017, 2018);
INSERT INTO universidad.curso_escolar (id, anyo_inicio, anyo_fin) VALUES (5, 2018, 2019);


--
-- TOC entry 4327 (class 0 OID 41493)
-- Dependencies: 218
-- Data for Name: departamento; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.departamento (id, nombre) VALUES (1, 'Informática');
INSERT INTO universidad.departamento (id, nombre) VALUES (2, 'Matemáticas');
INSERT INTO universidad.departamento (id, nombre) VALUES (3, 'Economía y Empresa');
INSERT INTO universidad.departamento (id, nombre) VALUES (4, 'Educación');
INSERT INTO universidad.departamento (id, nombre) VALUES (5, 'Agronomía');
INSERT INTO universidad.departamento (id, nombre) VALUES (6, 'Química y Física');
INSERT INTO universidad.departamento (id, nombre) VALUES (7, 'Filología');
INSERT INTO universidad.departamento (id, nombre) VALUES (8, 'Derecho');
INSERT INTO universidad.departamento (id, nombre) VALUES (9, 'Biología y Geología');


--
-- TOC entry 4330 (class 0 OID 41520)
-- Dependencies: 221
-- Data for Name: grado; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.grado (id, nombre) VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO universidad.grado (id, nombre) VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO universidad.grado (id, nombre) VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO universidad.grado (id, nombre) VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO universidad.grado (id, nombre) VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO universidad.grado (id, nombre) VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO universidad.grado (id, nombre) VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO universidad.grado (id, nombre) VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO universidad.grado (id, nombre) VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO universidad.grado (id, nombre) VALUES (10, 'Grado en Química (Plan 2009)');


--
-- TOC entry 4325 (class 0 OID 41477)
-- Dependencies: 216
-- Data for Name: persona; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno');
INSERT INTO universidad.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno');


--
-- TOC entry 4328 (class 0 OID 41507)
-- Dependencies: 219
-- Data for Name: profesor; Type: TABLE DATA; Schema: universidad; Owner: postgres
--

INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (3, 1);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (14, 1);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (5, 2);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (15, 2);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (8, 3);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (16, 3);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (10, 4);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (12, 4);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (17, 4);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (18, 5);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (13, 6);
INSERT INTO universidad.profesor (id_profesor, id_departamento) VALUES (20, 6);


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 222
-- Name: asignatura_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: postgres
--

SELECT pg_catalog.setval('universidad.asignatura_id_seq', 83, true);


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 224
-- Name: curso_escolar_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: postgres
--

SELECT pg_catalog.setval('universidad.curso_escolar_id_seq', 5, true);


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 217
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: postgres
--

SELECT pg_catalog.setval('universidad.departamento_id_seq', 9, true);


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 220
-- Name: grado_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: postgres
--

SELECT pg_catalog.setval('universidad.grado_id_seq', 10, true);


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 215
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: universidad; Owner: postgres
--

SELECT pg_catalog.setval('universidad.persona_id_seq', 24, true);


--
-- TOC entry 4173 (class 2606 OID 41576)
-- Name: alumno_se_matricula_asignatura pk_alumno_se_matricula_asignatura; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.alumno_se_matricula_asignatura
    ADD CONSTRAINT pk_alumno_se_matricula_asignatura PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar);


--
-- TOC entry 4167 (class 2606 OID 41548)
-- Name: asignatura pk_asignatura; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.asignatura
    ADD CONSTRAINT pk_asignatura PRIMARY KEY (id);


--
-- TOC entry 4169 (class 2606 OID 41565)
-- Name: curso_escolar pk_curso_escolar; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.curso_escolar
    ADD CONSTRAINT pk_curso_escolar PRIMARY KEY (id);


--
-- TOC entry 4158 (class 2606 OID 41506)
-- Name: departamento pk_departamento; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.departamento
    ADD CONSTRAINT pk_departamento PRIMARY KEY (id);


--
-- TOC entry 4163 (class 2606 OID 41533)
-- Name: grado pk_grado; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.grado
    ADD CONSTRAINT pk_grado PRIMARY KEY (id);


--
-- TOC entry 4156 (class 2606 OID 41490)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (id);


--
-- TOC entry 4161 (class 2606 OID 41517)
-- Name: profesor pk_profesor; Type: CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.profesor
    ADD CONSTRAINT pk_profesor PRIMARY KEY (id_profesor);


--
-- TOC entry 4170 (class 1259 OID 41577)
-- Name: idx_id_asignatura; Type: INDEX; Schema: universidad; Owner: postgres
--

CREATE INDEX idx_id_asignatura ON universidad.alumno_se_matricula_asignatura USING btree (id_asignatura);


--
-- TOC entry 4171 (class 1259 OID 41578)
-- Name: idx_id_curso_escolar; Type: INDEX; Schema: universidad; Owner: postgres
--

CREATE INDEX idx_id_curso_escolar ON universidad.alumno_se_matricula_asignatura USING btree (id_curso_escolar);


--
-- TOC entry 4159 (class 1259 OID 41518)
-- Name: idx_id_departamento; Type: INDEX; Schema: universidad; Owner: postgres
--

CREATE INDEX idx_id_departamento ON universidad.profesor USING btree (id_departamento);


--
-- TOC entry 4164 (class 1259 OID 41550)
-- Name: idx_id_grado; Type: INDEX; Schema: universidad; Owner: postgres
--

CREATE INDEX idx_id_grado ON universidad.asignatura USING btree (id_grado);


--
-- TOC entry 4165 (class 1259 OID 41549)
-- Name: idx_id_profesor; Type: INDEX; Schema: universidad; Owner: postgres
--

CREATE INDEX idx_id_profesor ON universidad.asignatura USING btree (id_profesor);


--
-- TOC entry 4154 (class 1259 OID 41491)
-- Name: idx_nif; Type: INDEX; Schema: universidad; Owner: postgres
--

CREATE UNIQUE INDEX idx_nif ON universidad.persona USING btree (nif);


--
-- TOC entry 4178 (class 2606 OID 41599)
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_ibfk_1; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_ibfk_1 FOREIGN KEY (id_alumno) REFERENCES universidad.persona(id);


--
-- TOC entry 4179 (class 2606 OID 41604)
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_ibfk_2; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_ibfk_2 FOREIGN KEY (id_asignatura) REFERENCES universidad.asignatura(id);


--
-- TOC entry 4180 (class 2606 OID 41609)
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_ibfk_3; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_ibfk_3 FOREIGN KEY (id_curso_escolar) REFERENCES universidad.curso_escolar(id);


--
-- TOC entry 4176 (class 2606 OID 41589)
-- Name: asignatura asignatura_ibfk_1; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.asignatura
    ADD CONSTRAINT asignatura_ibfk_1 FOREIGN KEY (id_profesor) REFERENCES universidad.profesor(id_profesor);


--
-- TOC entry 4177 (class 2606 OID 41594)
-- Name: asignatura asignatura_ibfk_2; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.asignatura
    ADD CONSTRAINT asignatura_ibfk_2 FOREIGN KEY (id_grado) REFERENCES universidad.grado(id);


--
-- TOC entry 4174 (class 2606 OID 41579)
-- Name: profesor profesor_ibfk_1; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.profesor
    ADD CONSTRAINT profesor_ibfk_1 FOREIGN KEY (id_profesor) REFERENCES universidad.persona(id);


--
-- TOC entry 4175 (class 2606 OID 41584)
-- Name: profesor profesor_ibfk_2; Type: FK CONSTRAINT; Schema: universidad; Owner: postgres
--

ALTER TABLE ONLY universidad.profesor
    ADD CONSTRAINT profesor_ibfk_2 FOREIGN KEY (id_departamento) REFERENCES universidad.departamento(id);


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA universidad; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA universidad FROM postgres;
GRANT USAGE ON SCHEMA universidad TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON SCHEMA universidad TO "DBA_Locales" WITH GRANT OPTION;
GRANT ALL ON SCHEMA universidad TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE alumno_se_matricula_asignatura; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.alumno_se_matricula_asignatura FROM postgres;
GRANT ALL ON TABLE universidad.alumno_se_matricula_asignatura TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.alumno_se_matricula_asignatura TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.alumno_se_matricula_asignatura TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE asignatura; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.asignatura FROM postgres;
GRANT ALL ON TABLE universidad.asignatura TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.asignatura TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.asignatura TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE curso_escolar; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.curso_escolar FROM postgres;
GRANT ALL ON TABLE universidad.curso_escolar TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.curso_escolar TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.curso_escolar TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE departamento; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.departamento FROM postgres;
GRANT ALL ON TABLE universidad.departamento TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.departamento TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.departamento TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE grado; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.grado FROM postgres;
GRANT ALL ON TABLE universidad.grado TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.grado TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.grado TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE persona; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.persona FROM postgres;
GRANT ALL ON TABLE universidad.persona TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.persona TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.persona TO "DBA" WITH GRANT OPTION;


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE profesor; Type: ACL; Schema: universidad; Owner: postgres
--

REVOKE ALL ON TABLE universidad.profesor FROM postgres;
GRANT ALL ON TABLE universidad.profesor TO "DBA_Locales" WITH GRANT OPTION;
GRANT SELECT ON TABLE universidad.profesor TO "Usuarios_R" WITH GRANT OPTION;
GRANT ALL ON TABLE universidad.profesor TO "DBA";


-- Completed on 2025-02-04 20:33:56

--
-- PostgreSQL database dump complete
--

