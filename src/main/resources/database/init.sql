--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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
-- Name: coffee_size; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.coffee_size AS ENUM (
    'SHORT',
    'TALL',
    'GRANDE',
    'VENTI'
);


ALTER TYPE public.coffee_size OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coffee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coffee (
                               id integer NOT NULL,
                               name character varying(50) NOT NULL,
                               size public.coffee_size DEFAULT 'SHORT'::public.coffee_size NOT NULL
);


ALTER TABLE public.coffee OWNER TO postgres;

--
-- Name: coffee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coffee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coffee_id_seq OWNER TO postgres;

--
-- Name: coffee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coffee_id_seq OWNED BY public.coffee.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
                                  id integer NOT NULL,
                                  name character varying(50) NOT NULL,
                                  password character varying(50) NOT NULL,
                                  coffee_id integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: coffee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee ALTER COLUMN id SET DEFAULT nextval('public.coffee_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Data for Name: coffee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coffee (id, name, size) FROM stdin;
1	Caffè Americano	GRANDE
2	Caffè Lattee	VENTI
3	Caffè Caramel Macchiato	TALL
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, password, coffee_id) FROM stdin;
1	Jakub	password	1
2	Maciej	password	2
3	Karol	password	1
\.


--
-- Name: coffee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coffee_id_seq', 3, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- Name: coffee coffee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee
    ADD CONSTRAINT coffee_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers coffee_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT coffee_fk FOREIGN KEY (coffee_id) REFERENCES public.coffee(id);


--
-- PostgreSQL database dump complete
--

