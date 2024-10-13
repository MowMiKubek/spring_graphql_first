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

CREATE TYPE public.coffee_size AS ENUM (
    'SHORT',
    'TALL',
    'GRANDE',
    'VENTI'
);


ALTER TYPE public.coffee_size OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.coffee (
                               id integer NOT NULL,
                               name character varying(50) NOT NULL,
                               size public.coffee_size DEFAULT 'SHORT'::public.coffee_size NOT NULL
);


ALTER TABLE public.coffee OWNER TO postgres;

CREATE SEQUENCE public.coffee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coffee_id_seq OWNER TO postgres;

ALTER SEQUENCE public.coffee_id_seq OWNED BY public.coffee.id;


CREATE TABLE public.customers (
                                  id integer NOT NULL,
                                  name character varying(50) NOT NULL,
                                  password character varying(50) NOT NULL,
                                  coffee_id integer
);


ALTER TABLE public.customers OWNER TO postgres;

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


ALTER TABLE ONLY public.coffee ALTER COLUMN id SET DEFAULT nextval('public.coffee_id_seq'::regclass);


ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


COPY public.coffee (id, name, size) FROM stdin;
1       Caffè Americano GRANDE
2       Caffè Lattee    VENTI
3       Caffè Caramel Macchiato TALL
\.

COPY public.customers (id, name, password, coffee_id) FROM stdin;
1       Jakub   password        1
2       Maciej  password        2
3       Karol   password        1
\.


SELECT pg_catalog.setval('public.coffee_id_seq', 3, true);


SELECT pg_catalog.setval('public.customers_id_seq', 3, true);

ALTER TABLE ONLY public.coffee
    ADD CONSTRAINT coffee_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT coffee_fk FOREIGN KEY (coffee_id) REFERENCES public.coffee(id);
