--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: education_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education_level (
    id integer NOT NULL,
    level character varying(255) NOT NULL
);


ALTER TABLE public.education_level OWNER TO postgres;

--
-- Name: education_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_level_id_seq OWNER TO postgres;

--
-- Name: education_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_level_id_seq OWNED BY public.education_level.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    salary double precision NOT NULL,
    age integer NOT NULL,
    years_of_experience double precision NOT NULL,
    gender_id integer NOT NULL,
    education_level_id integer NOT NULL,
    job_title_id integer NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gender (
    id integer NOT NULL,
    gender character varying(45) NOT NULL
);


ALTER TABLE public.gender OWNER TO postgres;

--
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gender_id_seq OWNER TO postgres;

--
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gender_id_seq OWNED BY public.gender.id;


--
-- Name: job_title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_title (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.job_title OWNER TO postgres;

--
-- Name: job_title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_title_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_title_id_seq OWNER TO postgres;

--
-- Name: job_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_title_id_seq OWNED BY public.job_title.id;


--
-- Name: education_level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_level ALTER COLUMN id SET DEFAULT nextval('public.education_level_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);


--
-- Name: job_title id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_title ALTER COLUMN id SET DEFAULT nextval('public.job_title_id_seq'::regclass);

--
-- Name: education_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_level_id_seq', 1, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, true);


--
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gender_id_seq', 1, true);


--
-- Name: job_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_title_id_seq', 1, true);


--
-- Name: education_level education_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_level
    ADD CONSTRAINT education_level_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- Name: job_title job_title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_title
    ADD CONSTRAINT job_title_pkey PRIMARY KEY (id);


--
-- Name: fk_employee_education_level1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_employee_education_level1_idx ON public.employee USING btree (education_level_id);


--
-- Name: fk_employee_gender_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_employee_gender_idx ON public.employee USING btree (gender_id);


--
-- Name: fk_employee_job_title1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_employee_job_title1_idx ON public.employee USING btree (job_title_id);


--
-- Name: gender_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "gender_UNIQUE" ON public.gender USING btree (gender);


--
-- Name: level_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "level_UNIQUE" ON public.education_level USING btree (level);


--
-- Name: title_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "title_UNIQUE" ON public.job_title USING btree (title);


--
-- Name: employee fk_employee_education_level1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_education_level1 FOREIGN KEY (education_level_id) REFERENCES public.education_level(id);


--
-- Name: employee fk_employee_gender; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_gender FOREIGN KEY (gender_id) REFERENCES public.gender(id);


--
-- Name: employee fk_employee_job_title1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_job_title1 FOREIGN KEY (job_title_id) REFERENCES public.job_title(id);


CREATE USER app_user WITH PASSWORD 'qwerty';
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;
GRANT USAGE, SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA public TO app_user;

--
-- PostgreSQL database dump complete
--
